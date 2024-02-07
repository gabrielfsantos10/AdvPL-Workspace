//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa16Pt
Exemplo de Boas Práticas - Utilização do inglês ou português?
@author Atilio
@since 02/11/2020
@version 1.0
@type function
/*/

User Function zBoa16Pt()
	Local aArea   := GetArea()
	Local cConsSA2
	Local nAtual
	Local cMensagem
	
	//Selecionando os fornecedores via cConsSA2 diretamente no banco de dados
	cConsSA2 := " SELECT TOP 100 " + CRLF
	cConsSA2 += " 	A2_COD, " + CRLF
	cConsSA2 += " 	A2_LOJA, " + CRLF
	cConsSA2 += " 	A2_NOME " + CRLF
	cConsSA2 += " FROM " + CRLF
	cConsSA2 += " 	" + RetSQLName('SA2') + " SA2 " + CRLF
	cConsSA2 += " WHERE " + CRLF
	cConsSA2 += " 	A2_FILIAL = '" + FWxFilial('SA2') + "' " + CRLF
	cConsSA2 += " 	AND A2_MSBLQL != '1' " + CRLF
	cConsSA2 += " 	AND SA2.D_E_L_E_T_ = ' ' " + CRLF
	cConsSA2 += " ORDER BY " + CRLF
	cConsSA2 += " 	A2_COD " + CRLF

    //Executando a cConsSA2
	PLSQuery(cConsSA2, "QRY_SA2")
	
	//Enquanto houver dados da cConsSA2
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
