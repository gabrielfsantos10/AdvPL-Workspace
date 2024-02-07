//Incluir Bibliotecas
#Include "Totvs.ch"

//Come�o da fun��o
User Function zBoa05D()
	
	//Declarar as vari�veis
	Local cQuerySA2 := ""
	Local nTotal := 0
	Local nBloqueados := 0
	
	//Montar uma consulta de fornecedores
	cQuerySA2 := " SELECT " + CRLF
	cQuerySA2 += " 	A2_COD, " + CRLF
	cQuerySA2 += " 	A2_NOME, " + CRLF
	cQuerySA2 += " 	A2_MSBLQL " + CRLF
	cQuerySA2 += " FROM " + CRLF
	cQuerySA2 += " 	" + RetSQLName('SA2') + " SA2 " + CRLF
	cQuerySA2 += " WHERE " + CRLF
	cQuerySA2 += " 	A2_FILIAL = '" + FWxFilial('SA2') + "' " + CRLF
	cQuerySA2 += " 	AND SA2.D_E_L_E_T_ = ' ' " + CRLF
	cQuerySA2 += " ORDER BY " + CRLF
	cQuerySA2 += " 	A2_COD " + CRLF
	PLSQuery(cQuerySA2, "QRY_SA2")
	
	//Percorre todos os registros
	While ! QRY_SA2->(EoF())
	
		//Incrementa uma vari�vel de total de fornecedores
		nTotal++
	
		//Se estiver bloqueado, incrementaremos uma vari�vel
		If QRY_SA2->A2_MSBLQL == '1'
			nBloqueados++
		EndIf
		
	//Encerra o la�o
	EndDo
	QRY_SA2->(DbCloseArea())
	
	//Mostra o n�mero de fornecedores e quantos est�o bloqueados
	MsgInfo("Total de fornecedores: " + cValToChar(nTotal) + "; bloqueados: " + cValToChar(nBloqueados), "Aten��o")

//Encerra a fun��o
Return
