//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa10
Exemplo de Boas Práticas - Alias de Query
@author Atilio
@since 02/11/2020
@version 1.0
@type function
/*/

User Function zBoa10()
	Local aArea   := GetArea()
	Local cQrySA2
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
		nAtual++
		
		QRY_SA2->(DbSkip())
	EndDo
	QRY_SA2->(DbCloseaArea())
	
	cMensagem := cValToChar(nAtual) + " fornecedor(es) encontrado(s)!"
	MsgInfo(cMensagem, "Atenção")
	
	RestaArea(aArea)
Return
