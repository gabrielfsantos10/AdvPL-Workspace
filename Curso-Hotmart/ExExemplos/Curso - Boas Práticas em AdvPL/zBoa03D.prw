//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa03D
Exemplo de Boas Pr�ticas - Local e Private
@author Atilio
@since 12/10/2020
@version 1.0
@type function
/*/

User Function zBoa03D()
	Local aArea := GetArea()
	Local cNome := "Daniel"
	
	//Mostrando a mensagem de que est� na User Function
	MsgInfo("1 = O nome � " + cNome, "Aten��o")
	
	//Chamando uma fun��o de Teste
	fFuncaoTst()
	
	//Mostrando a mensagem de que est� na User Function
	MsgInfo("2 = O nome � " + cNome, "Aten��o")
	
	RestArea(aArea)
Return

/*/{Protheus.doc} fFuncaoTst
Fun��o Auxiliar de Teste
@author Atilio
@since 12/10/2020
@version 1.0
@type function
/*/

Static Function fFuncaoTst()
	Local cNome := "Atilio"
	MsgInfo("X = Estou na Static Function fFuncaoTst, nome � " + cNome + "!", "Aten��o")
Return
