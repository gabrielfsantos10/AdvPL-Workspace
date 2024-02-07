//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa12D
Exemplo de Boas Práticas - Alltrim no DbSeek
@author Atilio
@since 02/11/2020
@version 1.0
@type function
/*/

User Function zBoa12D()
	Local aArea   := GetArea()
	Local cFilSB1 := FWxFilial('SB1')
	Local cCodSB1 := PadR('P00001', TamSX3('B1_COD')[1])
	Local cDesSB1 := PadR('MAÇÃ', TamSX3('B1_DESC')[1])
	
	DbSelectArea('SB1')
	SB1->(DbSetOrder(3)) //B1_FILIAL+B1_DESC+B1_COD
	
	If SB1->(DbSeek(cFilSB1 + cDesSB1 + cCodSB1))
		Alert('Produto encontrado')
	EndIf
	
	RestaArea(aArea)
Return
