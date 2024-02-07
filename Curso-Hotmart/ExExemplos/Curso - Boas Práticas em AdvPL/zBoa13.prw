//Bibliotecas
#Include "Totvs.ch"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"

/*/{Protheus.doc} zBoa13
Exemplo de Boas Pr�ticas - Altera��o de dados
@author Atilio
@since 02/11/2020
@version 1.0
@type function
/*/

User Function zBoa13()
	fExeAutMVC()
	// fExecAuto()
	// fRecLock()
Return

Static Function fExeAutMVC()
	Local aArea     := GetArea()
	Local lDeuCerto := .F.
	Local oModel
	Local oSA2Mod
	Local aErro     := {}

	//Pegando o modelo de dados, setando a opera��o de inclus�o
	oModel := FWLoadModel("MATA020")
	oModel:SetOperation(3)
	oModel:Activate()

	//Pegando o model dos campos da SA2
	oSA2Mod:= oModel:getModel("SA2MASTER")
	oSA2Mod:setValue("A2_COD",       "000002"        ) // Codigo 
	oSA2Mod:setValue("A2_LOJA",      "01"       ) // Loja
	oSA2Mod:setValue("A2_NOME",      "FORNECEDOR MVC"       ) // Nome             
	oSA2Mod:setValue("A2_NREDUZ",    "MVC"   ) // Nome reduz. 
	oSA2Mod:setValue("A2_END",       "RUA TESTE"   ) // Endereco
	oSA2Mod:setValue("A2_BAIRRO",    "TESTE"     ) // Bairro
	oSA2Mod:setValue("A2_TIPO",      "J"         ) // Tipo 
	oSA2Mod:setValue("A2_EST",       "SP"        ) // Estado
	oSA2Mod:setValue("A2_COD_MUN",   "06003"     ) // Codigo Municipio                
	oSA2Mod:setValue("A2_MUN",       "BAURU"    ) // Municipio
	oSA2Mod:setValue("A2_CGC",       "00000000000000"       ) // CNPJ/CPF            

	//Se conseguir validar as informa��es
	If oModel:VldData()

		//Tenta realizar o Commit
		If oModel:CommitData()
			lDeuCerto := .T.

		//Se n�o deu certo, altera a vari�vel para false
		Else
			lDeuCerto := .F.
		EndIf

	//Se n�o conseguir validar as informa��es, altera a vari�vel para false
	Else
		lDeuCerto := .F.
	EndIf

	//Se n�o deu certo a inclus�o, mostra a mensagem de erro
	If ! lDeuCerto
		//Busca o Erro do Modelo de Dados
		aErro := oModel:GetErrorMessage()

		//Monta o Texto que ser� mostrado na tela
		AutoGrLog("Id do formul�rio de origem:"  + ' [' + AllToChar(aErro[01]) + ']')
		AutoGrLog("Id do campo de origem: "      + ' [' + AllToChar(aErro[02]) + ']')
		AutoGrLog("Id do formul�rio de erro: "   + ' [' + AllToChar(aErro[03]) + ']')
		AutoGrLog("Id do campo de erro: "        + ' [' + AllToChar(aErro[04]) + ']')
		AutoGrLog("Id do erro: "                 + ' [' + AllToChar(aErro[05]) + ']')
		AutoGrLog("Mensagem do erro: "           + ' [' + AllToChar(aErro[06]) + ']')
		AutoGrLog("Mensagem da solu��o: "        + ' [' + AllToChar(aErro[07]) + ']')
		AutoGrLog("Valor atribu�do: "            + ' [' + AllToChar(aErro[08]) + ']')
		AutoGrLog("Valor anterior: "             + ' [' + AllToChar(aErro[09]) + ']')

		//Mostra a mensagem de Erro
		MostraErro()
	EndIf

	//Desativa o modelo de dados
	oModel:DeActivate()

	RestArea(aArea)
Return

Static Function fExecAuto()
	Local aArea     := GetArea()
	Local aDados    := {}
	Private lMsErroAuto := .F.

	//Adiciona os dados do cadastro de bancos
	aAdd(aDados, {"A6_COD",     "000",            Nil})
	aAdd(aDados, {"A6_AGENCIA", "00000",          Nil})
	aAdd(aDados, {"A6_NUMCON",  "0000000000",     Nil})
	aAdd(aDados, {"A6_NOME",    "BANCO DE TESTE", Nil})
	
	//Iniciando transa��o
	Begin Transaction
		MSExecAuto({|x, y| Mata070(x, y)}, aDados, 3)

		//Se houve erro, mostra mensagem
		If lMsErroAuto
			MostraErro()
			DisarmTransaction()
		Else
			MsgInfo("Banco 000 cadastrado com sucesso!", "Aten��o")
		EndIf
	End Transaction

	RestArea(aArea)
Return

Static Function fRecLock()
	Local aArea     := GetArea()
	Local cBanco    := "000"
	Local cAgencia  := "00000"
	Local cConta    := "0000000000"
	Local cNomeBco  := "Banco Teste " + dToS(Date())
	
	//Selecionando a tabela de bancos
	DbSelectArea('SA6')
	SA6->(DbSetOrder(1)) //A6_FILIAL+A6_COD+A6_AGENCIA+A6_NUMCON
	
	//Se conseguir posicionar no registro
	If SA6->(DbSeek( FWxFilial('SA6') + cBanco + cAgencia + cConta ))
	
		//Atualizando o nome do banco
		RecLock('SA6', .F.)
			SA6->A6_NOME := cNomeBco
		SA6->(MsUnlock())
	EndIf

	RestArea(aArea)
Return
