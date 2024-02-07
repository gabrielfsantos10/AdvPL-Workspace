//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa02A
Exemplo de Boas Práticas - Notação Húngara
@author Atilio
@since 12/10/2020
@version 1.0
@type function
/*/

User Function zBoa02A()
	Local Area   := GetArea()
	Local Query
	Local Atual
	Local Mensagem
	
	//Selecionando os fornecedores via query diretamente no banco de dados
	Query := " SELECT TOP 100 " + CRLF
	Query += " 	A2_COD, " + CRLF
	Query += " 	A2_NOME " + CRLF
	Query += " FROM " + CRLF
	Query += " 	" + RetSQLName('SA2') + " SA2 " + CRLF
	Query += " WHERE " + CRLF
	Query += " 	A2_FILIAL = '" + FWxFilial('SA2') + "' " + CRLF
	Query += " 	AND A2_MSBLQL != '1' " + CRLF
	Query += " 	AND SA2.D_E_L_E_T_ = ' ' " + CRLF
	Query += " ORDER BY " + CRLF
	Query += " 	A2_COD " + CRLF

    //Executando a query
	PLSQuery(Query, "QRY_SA2")
	
	//Enquanto houver dados da query
	Atual := 0
	While ! QRY_SA2->(EoF())
		Atual++
		
		QRY_SA2->(DbSkip())
	EndDo
	QRY_SA2->(DbCloseArea())
	
	Mensagem := cValToChar(Atual) + " fornecedor(es) encontrado(s)!"
	MsgInfo(Mensagem, "Atenção")
	
	RestArea(Area)
Return
