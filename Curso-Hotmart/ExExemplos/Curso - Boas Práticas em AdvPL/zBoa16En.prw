//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa16En
Good Practice Example - Use of English or Portuguese?
@author Atilio
@since 02/11/2020
@version 1.0
@type function
/*/

User Function zBoa16En()
	Local aArea   := GetArea()
	Local cQrySA2
	Local nCurrent
	Local cMessage
	
	//Selecting suppliers via cQrySA2 directly in the database
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

    //Running cQrySA2
	PLSQuery(cQrySA2, "QRY_SA2")
	
	//As long as there is data from cQrySA2
	nCurrent := 0
	While ! QRY_SA2->(EoF())
		nCurrent++
		
		QRY_SA2->(DbSkip())
	EndDo
	QRY_SA2->(DbCloseaArea())
	
	cMessage := cValToChar(nCurrent) + " supplier(s) found!"
	MsgInfo(cMessage, "Atenção")
	
	RestaArea(aArea)
Return
