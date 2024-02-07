//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa09D
Exemplo de Boas Práticas - A importância de uso de referência
@author Atilio
@since 02/11/2020
@version 1.0
@type function
/*/

User Function zBoa09D()
	Local aArea   := GetArea()
	Local cQrySA2
	Local cQrySF1
	Local nAtual
	Local cMensagem
	
	//Selecionando os fornecedores via cQrySA2 diretamente no banco de dados
	cQrySA2 := " SELECT TOP 100 " + CRLF
	cQrySA2 += " 	A2_COD, " + CRLF
	cQrySA2 += " 	A2_LOJA, " + CRLF
	cQrySA2 += " 	A2_NOME " + CRLF
	cQrySA2 += " FROM " + CRLF
	cQrySA2 += " 	" + RetSQLName('SA2') + " SA2 " + CRLF
	cQrySA2 += " WHERE " + CRLF
	cQrySA2 += " 	A2_FILIAL = '" + FWxFilial('SA2') + "' " + CRLF
	cQrySA2 += " 	AND A2_MSBLQL != '1' " + CRLF
	cQrySA2 += " 	AND SA2.D_E_L_E_T_ = ' ' " + CRLF
	cQrySA2 += " ORDER BY " + CRLF
	cQrySA2 += " 	A2_COD " + CRLF

    //Executando a cQrySA2
	PLSQuery(cQrySA2, "QRY_SA2")
	
	//Enquanto houver dados da cQrySA2
	nAtual := 0
	While ! QRY_SA2->(EoF())
		
		cQrySF1 := " SELECT " + CRLF
		cQrySF1 += " 	F1_DOC, " + CRLF
		cQrySF1 += " 	F1_SERIE " + CRLF
		cQrySF1 += " FROM " + CRLF
		cQrySF1 += " 	" + RetSQLName('SF1') + " SF1 " + CRLF
		cQrySF1 += " WHERE " + CRLF
		cQrySF1 += " 	F1_FILIAL = '" + FWxFilial('SF1') + "' " + CRLF
		cQrySF1 += " 	AND F1_FORNECE = '" + QRY_SA2->A2_COD + "' " + CRLF
		cQrySF1 += " 	AND F1_LOJA = '" + QRY_SA2->A2_LOJA + "' " + CRLF
		cQrySF1 += " 	AND SF1.D_E_L_E_T_ = ' ' " + CRLF
		cQrySF1 += " ORDER BY " + CRLF
		cQrySF1 += " 	F1_DTDIGIT " + CRLF
		PLSQuery(cQrySF1, "QRY_SF1")
		
		While ! QRY_SF1->(EoF())
			nAtual++
		
			QRY_SF1->(DbSkip())
		EndDo
		QRY_SF1->(DbCloseArea())
		
		QRY_SA2->(DbSkip())
	EndDo
	QRY_SA2->(DbCloseaArea())
	
	cMensagem := cValToChar(nAtual) + " nota(s) encontrada(s)!"
	MsgInfo(cMensagem, "Atenção")
	
	RestaArea(aArea)
Return
