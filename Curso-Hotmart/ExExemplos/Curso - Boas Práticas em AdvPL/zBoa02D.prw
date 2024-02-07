//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa02D
Exemplo de Boas Práticas - Notação Húngara
@author Atilio
@since 12/10/2020
@version 1.0
@type function
/*/

User Function zBoa02D()
	Local aArea   := GetArea()
	Local cQuery  := ""
	Local nAtual  := 0
	Local cMensagem := ""
	
	//Selecionando os fornecedores via query diretamente no banco de dados
	cQuery := " SELECT TOP 100 " + CRLF
	cQuery += " 	A2_COD, " + CRLF
	cQuery += " 	A2_NOME " + CRLF
	cQuery += " FROM " + CRLF
	cQuery += " 	" + RetSQLName('SA2') + " SA2 " + CRLF
	cQuery += " WHERE " + CRLF
	cQuery += " 	A2_FILIAL = '" + FWxFilial('SA2') + "' " + CRLF
	cQuery += " 	AND A2_MSBLQL != '1' " + CRLF
	cQuery += " 	AND SA2.D_E_L_E_T_ = ' ' " + CRLF
	cQuery += " ORDER BY " + CRLF
	cQuery += " 	A2_COD " + CRLF

    //Executando a query
	PLSQuery(cQuery, "QRY_SA2")
	
	//Enquanto houver dados da query
	While ! QRY_SA2->(EoF())
		nAtual++
		
		QRY_SA2->(DbSkip())
	EndDo
	QRY_SA2->(DbCloseArea())
	
	cMensagem := cValToChar(nAtual) + " fornecedor(es) encontrado(s)!"
	MsgInfo(cMensagem, "Atenção")
	
	RestArea(aArea)
Return
