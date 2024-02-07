//Bibliotecas
#Include "Totvs.ch"

//Constantes
#Define STR_NOME "Daniel"
#Define STR_SITE "terminaldeinformacao.com"
#Define STR_CIDADE "Bauru"
#Define POS_NOME 1
#Define POS_SITE 2
#Define POS_CIDADE 3

/*/{Protheus.doc} zBoa01D
Exemplo de Boas Práticas - Nomenclatura de Constantes
@author Atilio
@since 12/10/2020
@version 1.0
@type function
/*/

User Function zBoa01D()
	Local aArea        := GetArea()
	
	MsgInfo("Nome = " + STR_NOME, "Atencao")
	
	RestArea(aArea)
Return
