//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa04D
Exemplo de Boas Práticas - Indentação
@author Atilio
@since 12/10/2020
@version 1.0
@type function
/*/

User Function zBoa04D()
	Local aArea   := GetArea()
	Local nAtual  := 0
	
	BeginSql Alias "QRY_SA2"
		SELECT    
			A2_COD,
			A2_NOME
		FROM
			%table:SA2% SA2 
		WHERE
			A2_FILIAL  = %xFilial:SA2%
			AND A2_MSBLQL != '1'
			AND SA2.%notDel%
	EndSql
	
	While ! QRY_SA2->(EoF())
		nAtual++
		QRY_SA2->(DbSkip())
	EndDo
	QRY_SA2->(DbCloseArea())
	
	MsgInfo(cValToChar(nAtual) + " fornecedor(es) encontrado(s)!", "Atenção")
	
	RestArea(aArea)
Return
