//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa08
Demonstrando tipos de fun��es em AdvPL
@author Atilio
@since 12/10/2020
@version 1.0
@type function
/*/

User Function zBoa08()
	Local aArea := GetArea()
	
	//Mostrando a mensagem de que est� na User Function
	MsgInfo("Estou na User Function zBoa08!", "Aten��o")
	
	//Chamando a fun��o A
	fFuncA()
	
	RestArea(aArea)
Return

/*/{Protheus.doc} fFuncA
Fun��o Auxiliar A
@author Atilio
@since 12/10/2020
@version 1.0
@type function
/*/

Static Function fFuncA()
	MsgInfo("Estou na Static Function fFuncA!", "Aten��o")
Return
