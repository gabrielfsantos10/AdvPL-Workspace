#INCLUDE "TOTVS.CH"


USER FUNCTION HtEx05()
	Local aArea       := GetArea()
	Local lDeuCerto   := .F.
	Local oModel
	Local oSA2Mod
	Local aErro       := {}

    //Pegando o modelo de dados, setando a opera��o de inclus�o
	oModel := FWLoadModel("MATA020M")
	oModel:SetOperation(3)
	oModel:Activate()

    //Pegando o model dos campos da SA2
	oSA2Mod:= oModel:getModel("SA2MASTER")
	oSA2Mod:setValue("A2_COD",       cCod        ) // Codigo
	oSA2Mod:setValue("A2_LOJA",      cLoja       ) // Loja
	oSA2Mod:setValue("A2_NOME",      cNome       ) // Nome
	oSA2Mod:setValue("A2_NREDUZ",    cNomeFant   ) // Nome reduz.
	oSA2Mod:setValue("A2_END",       cEndereco   ) // Endereco
	oSA2Mod:setValue("A2_BAIRRO",    cBairro     ) // Bairro
	oSA2Mod:setValue("A2_TIPO",      cTp         ) // Tipo
	oSA2Mod:setValue("A2_EST",       cEST        ) // Estado
	oSA2Mod:setValue("A2_COD_MUN",   cCodMun     ) // Codigo Municipio
	oSA2Mod:setValue("A2_MUN",       cDescMun    ) // Municipio
	oSA2Mod:setValue("A2_CEP",       cCep        ) // CEP
	oSA2Mod:setValue("A2_INSCR",     cIE         ) // Inscricao Estadual
	oSA2Mod:setValue("A2_CGC",       cCNPJ       ) // CNPJ/CPF
	oSA2Mod:setValue("A2_PAIS",      cCodPais    ) // Pais
	oSA2Mod:setValue("A2_EMAIL",     cEMail      ) // E-Mail
	oSA2Mod:setValue("A2_DDD",       cDDD        ) // DDD
	oSA2Mod:setValue("A2_TEL",       cTelefone   ) // Fone
	oSA2Mod:setValue("A2_FAX",       cFax        ) // FAX
	oSA2Mod:setValue("A2_TPESSOA",   cTipPessoa  ) // Tipo Pessoa
	oSA2Mod:setValue("A2_CODPAIS",   cPaisBac    ) // Pais Bacen
	oSA2Mod:setValue("A2_MSBLQL",    cBlqSA      ) // Bloqueado

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
RETURN
