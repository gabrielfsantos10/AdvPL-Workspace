//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa03D
Exemplo de Boas Práticas - Local e Private
@author Atilio
@since 12/10/2020
@version 1.0
@type function
/*/

User Function zBoa03D()
	Local aArea := GetArea()
	Local cNome := "Daniel"
	
	//Mostrando a mensagem de que está na User Function
	MsgInfo("1 = O nome é " + cNome, "Atenção")
	
	//Chamando uma função de Teste
	fFuncaoTst()
	
	//Mostrando a mensagem de que está na User Function
	MsgInfo("2 = O nome é " + cNome, "Atenção")
	
	RestArea(aArea)
Return

/*/{Protheus.doc} fFuncaoTst
Função Auxiliar de Teste
@author Atilio
@since 12/10/2020
@version 1.0
@type function
/*/

Static Function fFuncaoTst()
	Local cNome := "Atilio"
	MsgInfo("X = Estou na Static Function fFuncaoTst, nome é " + cNome + "!", "Atenção")
Return
