//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa06D
Exemplo de Boas Pr�ticas - Interpretar em Portugu�s
@author Atilio
@since 12/10/2020
@version 1.0
@type function
/*/

User Function zBoa06D()
	Local aArea   := GetArea()
	Local nAtual  := 0
	
	//Vamos iniciar uma query, chamada QRY_SA2, e nessa query est� filtrando o campo A2_MSBLQL diferente de 1
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
	
	//Enquanto n�o for Fim do Arquivo (Eof) no alias QRY_SA2
	While ! QRY_SA2->(EoF())
		//Incrementa a vari�vel
		nAtual++
		
		//Pula para o pr�ximo registro
		QRY_SA2->(DbSkip())
	EndDo
	QRY_SA2->(DbCloseArea())
	
	//Mostra a mensagem
	MsgInfo(cValToChar(nAtual) + " fornecedor(es) encontrado(s)!", "Aten��o")
	
	RestArea(aArea)
Return
