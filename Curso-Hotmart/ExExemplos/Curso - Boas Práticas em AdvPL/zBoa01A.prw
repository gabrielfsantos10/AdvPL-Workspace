//Bibliotecas
#Include "Totvs.ch"

//Constantes
#Define NOME "Daniel"
#Define SITE "terminaldeinformacao.com"
#Define CIDADE "Bauru"
#Define PNOM 1
#Define PSIT 2
#Define CIDP 3

/*/{Protheus.doc} zBoa01A
Exemplo de Boas Práticas - Nomenclatura de Constantes
@author Atilio
@since 12/10/2020
@version 1.0
@type function
/*/

User Function zBoa01A()
	Local aArea        := GetArea()
	
	MsgInfo("Nome = " + NOME, "Atencao")
	
	RestArea(aArea)
Return
