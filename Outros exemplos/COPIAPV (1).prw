#include 'totvs.ch'
#include 'TOPCONN.ch'
/*/{Protheus.doc} CopiaPV
Copia Pedido de uma filial para outra
@type function
@version 12.1.33
@author Tiago Faria
@since 02/07/2022
/*/
user function CopiaPV()
	local aArea         := LJ7GetArea({"SC5","SC6"})
	private cFilialPara := ""
	private cTesPara    := ""
	private lIDOrigem   := SC5->(fieldPos("C5_ZZPVORI")) > 0

	if vldPVJaCopiado() .and. perg()
		FWMsgRun( ,{ || copia() } ,"COPIA PEDIDO FILIAL", "Aguarde, copiando pedido " + SC5->C5_NUM + " para a filial " + alltrim(FwCompanyName(/*cGrpCompany*/,cFilialPara/*cEmpUDFil*/)) + "!"  )
	endif

	Lj7RestArea(aArea)
return

static function copia()
	local aCab          := {}
	local aItens        := {}
	local aItem         := {}
	local cFilBkp       := cFilAnt
	local cCamposC5     := getNewPar("ZZ_C5COPIA","C5_TIPO,C5_LOJACLI,C5_CLIENTE,C5_CONDPAG")
	local cCamposC6     := getNewPar("ZZ_C6COPIA","C6_ITEM,C6_PRODUTO,C6_QTDVEN,C6_PRCVEN,C6_TES")
	private lMsErroAuto := .f.

	aCab := carregaDados("SC5",cCamposC5)
	/*
    aadd(aCab, {"C5_TIPO"   , SC5->C5_TIPO   , nil})
	aadd(aCab, {"C5_LOJACLI", SC5->C5_LOJACLI, nil})
	aadd(aCab, {"C5_CLIENTE", SC5->C5_CLIENTE, nil})
	aadd(aCab, {"C5_CONDPAG", SC5->C5_CONDPAG, nil})
    */
	if lIDOrigem
		aadd(aCab, {"C5_ZZPVORI", SC5->(C5_FILIAL+C5_NUM), nil})
	endif
	aCab := FWVetByDic(aCab, "SC5")

	//C6_FILIAL+C6_NUM+C6_ITEM+C6_PRODUTO
	if Posicione("SC6",1,SC5->(C5_FILIAL+C5_NUM),"!Eof()")
		while SC6->(!Eof()) .and. SC6->(C6_FILIAL+C6_NUM) == SC5->(C5_FILIAL+C5_NUM)
			aItem := carregaDados("SC6",cCamposC6)
            /*
			aadd(aItem, {"C6_QTDVEN" , SC6->C6_QTDVEN , nil})
			aadd(aItem, {"C6_ITEM"   , SC6->C6_ITEM   , nil})
			aadd(aItem, {"C6_PRODUTO", SC6->C6_PRODUTO, nil})
			aadd(aItem, {"C6_PRCVEN" , SC6->C6_PRCVEN , nil})
			aadd(aItem, {"C6_TES"    , cTesPara       , nil})
            */
			aItem := FWVetByDic(aItem, "SC6")

			aAdd(aItens,aItem)
			aItem := {}

			SC6->(dbSkip())
		enddo
	endif
	//MATA410(x,y,z)
	bMata410 := {|x,y,z| MATA410(x,y,z)}

	cFilAnt := cFilialPara

	MSExecAuto(bMata410, aCab, aItens, 3)

	if lMsErroAuto
		mostraErro()
	else
		msgInfo("Pedido " + SC5->C5_NUM + " foi gerado com sucesso na filial " + cFilAnt + "-" + alltrim(FwCompanyName()))
	endif

	cFilAnt := cFilBkp
return
/*/{Protheus.doc} perg
Tela de Parametros
@type function
@version 12.1.33
@author Tiago Faria
@since 02/07/2022
@param lPerg, logical, Indica se deve ou não exibir a tela de parametros
@return logical, se true usuario clicou em OK se false usuario clicou em cancelar
/*/
static function perg(lPerg)
	local lRet      := .t.
	local aParamBox := {}
	local nI        := 0
	local cIDParam  := cFilAnt + "COPIAPV"
	local cBkpMV01  := MV_PAR01
	local cBkpMV02  := MV_PAR02
	default lPerg   := .t.

	aadd(aParamBox, {1, "Filial", space(len(cFilAnt))                      , "@!"                              , "Vazio() .or. (ExistCpo('SM0',cEmpAnt+MV_PAR01) .and. u_VldFilial())", "SM0", "", 40, .T.})
	aadd(aParamBox, {1, "TES"   , space(getSX3Cache("C6_TES","X3_TAMANHO")), getSX3Cache("C6_TES","X3_PICTURE"), "Vazio() .or. (ExistCpo('SF4') .AND. u_TesSAIDA())", "SF4", "", 40, .T.})

	if lPerg
		lRet := ParamBox(aParamBox,"Filtro planilha de resultado",NIL,,,,,,,cIDParam,.T.,.t.)
	else
		for nI := 1 to len(aParambox)
			&("MV_PAR"+strzero(nI,2)) := ParamLoad(__cUserID+"_"+cIDParam,aParamBox,nI,aParamBox[nI,3])
		next nI
	endif

	if lRet
		cFilialPara := MV_PAR01
		cTesPara    := MV_PAR02
		MV_PAR01    := cBkpMV01
		MV_PAR02    := cBkpMV02
	endif

return lRet

user function TesSAIDA()
	local cTES := &(readVar())
	local lRet := .t.

	if cTES < "500"
		msgAlert("Selecione uma TES de saída, TES com código maior que 500")
		lRet := .f.
	endif
return lRet

static function vldPVJaCopiado()
	local lRet   := .t.
	local cAlias := ""
	local cQuery := ""

	if lIDOrigem
		cQuery += "SELECT" + CRLF
		cQuery += "	COUNT(*) AS QTDPV" + CRLF
		cQuery += "FROM" + CRLF
		cQuery += "	" + RetSqlTab('SC5') + CRLF
		cQuery += "WHERE 1=1" + CRLF
		//cQuery += "	AND " + RetSqlFil('SC5') + CRLF
		cQuery += "	AND C5_ZZPVORI = '" + SC5->(C5_FILIAL+C5_NUM) + "'" + CRLF
		cQuery += "	AND " + RetSqlDel('SC5') + CRLF

		TcQuery cQuery new Alias (cAlias := getNextAlias())

		if (cAlias)->(QTDPV) > 0
			MsgAlert("Pedido não poderá ser copiado para outra filial, pois já foi copiado!")
			lRet := .f.
		endif

		(cAlias)->(dbCloseArea())
	endif
return lRet

user function VldFilial()
	local cFilDig := &(readVar())
	local lRet := .t.

	if cFilDig == cFilAnt
		msgAlert("Não é possível copiar um pedido para a mesma filial logada")
		lRet := .f.
	endif
return lRet

static function carregaDados(cTabela,cCamposCopiar)
	local aCampos := strToKarr(cCamposCopiar,",")
	local nCampo  := 0
	local aAuto   := {}
	local xValor  := nil
	default cCamposCopiar := ""

	for nCampo := 1 to len(aCampos)
		cCampo := aCampos[nCampo]

		if (cTabela)->(fieldPos(cCampo)) == 0
			loop
		endif

		xValor := (cTabela)->(&cCampo)

		aadd(aAuto,{cCampo,xValor,nil})
	next nCampo
return aAuto
