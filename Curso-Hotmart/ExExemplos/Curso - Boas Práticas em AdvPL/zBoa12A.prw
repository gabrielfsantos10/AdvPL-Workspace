//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa12A
Exemplo de Boas Práticas - Alltrim no DbSeek
@author Atilio
@since 02/11/2020
@version 1.0
@type function
/*/

User Function zBoa12A()
	Local aArea   := GetArea()
	Local cFilSB1 := FWxFilial('SB1')
	Local cCodSB1 := 'P00001         '
	Local cDesSB1 := 'MAÇÃ                          '
	
	DbSelectArea('SB1')
	SB1->(DbSetOrder(3)) //B1_FILIAL+B1_DESC+B1_COD
	
	If SB1->(DbSeek(Alltrim(cFilSB1) + Alltrim(cDesSB1) + Alltrim(cCodSB1)))
		Alert('Produto encontrado')
	EndIf
	
	RestaArea(aArea)
Return
