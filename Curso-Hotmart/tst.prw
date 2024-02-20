#include "protheus.ch"

#include "tbiconn.ch"



#define enter chr(13) + chr(10)



function u_MyMata410()



	local aCabec  := {}

	local aItens  := {}

	local nOpc  := 3

	local lAltItem    := .f. //ativar para teste de alteração

	local i

	local cDoc



	private lMsErroAuto      := .f.

	private lAutoErrNoFile      := .t.



//criando pedido de venda com desconto 



	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"



//cDoc := GetSxeNum("SC5","C5_NUM")  



// - Caso queira controlar manualmente a numeração 

	cDoc := "000002"



//RollBackSx8() 



// -------------------------------------------- 

// inclusão do cabeçalho do pedido de venda 

//--------------------------------------------- 

//aAdd(aCabec,{"C5_NUM"       ,"cDoc"                , nil}) 

	aAdd(aCabec,{"C5_TIPO"    ,"N"            , nil})

	aAdd(aCabec,{"C5_CLIENTE"    ,"000001"                      , nil})

	aAdd(aCabec,{"C5_LOJACLI"    ,"01"                    , nil})

	aAdd(aCabec,{"C5_TIPOCLI"    ,"F"                        , nil})

	aAdd(aCabec,{"C5_CONDPAG"    ,"001"            , nil})

	aAdd(aCabec,{"C5_TABELA"  ,"001"            , nil})

	aAdd(aCabec,{"C5_DESC1"  ,5                , nil})

	aAdd(aCabec,{"C5_EMISSAO"    ,dDataBase              , nil})



//for nx := 2 to 30 

	aLinha := {}



	//-------------------------------------------------

	//inclusão dos itens do pedido de venda

	//-------------------------------------------------

	if lAltItem

		aadd(aLinha,{"LINPOS"  ,"C6_ITEM"      , StrZero(nX,2)})

		aadd(aLinha,{"AUTDELETA"    ,"N"        , nil})

	endIf



	aAdd(aLinha,{"C6_ITEM"  ,StrZero(1,2)      , nil})

	aAdd(aLinha,{"C6_PRODUTO"    ,"000001         "    , nil})

	aAdd(aLinha,{"C6_QTDVEN"  ,10      , nil})

	aAdd(aLinha,{"C6_PRCVEN"  ,2.13        , nil})

	aAdd(aLinha,{"C6_PRUNIT"  ,2.24        , nil})

	aAdd(aLinha,{"C6_VALOR"  ,21.3        , nil})

	aAdd(aLinha,{"C6_TES"  ,"501"        , nil})

	//aAdd(aLinha,{"C6_DESCONT"    ,4      , nil})



	aadd(aItens,aLinha)

//next nx 



	aInfo := getUserInfoArray()



	for i := 1 to Len(aInfo)

		conout("ThreadID : " + cValtoChar(aInfo[i][3]) + " Program : " + aInfo[i][5] + " Obs : " + aInfo[i][11])

	next



	MATA410(aCabec,aItens,nOpc)



	if lMsErroAuto

		if isBlind()

			aLog := getAutoGRLog()

			cRet := "ERRO" + enter

			for i := 1 to len(aLog)

				cRet += aLog[i] + enter

			next i

			conout(cRet)

		else

			mostraErro()

		endIf

	else

		cRet := (enter + "Operação realizada com sucesso " + enter + "Numero do pedido manipulado : " + SC5->C5_NUM)



		if isBlind()

			conout(enter + "Operação realizada com sucesso " + enter + "Numero do pedido manipulado : " + SC5->C5_NUM)

		else

			msgInfo("Operação realizada com sucesso " + enter + "Numero do pedido manipulado : " + SC5->C5_NUM)

		endIf

	endIf



	RESET ENVIRONMENT



return cRet
