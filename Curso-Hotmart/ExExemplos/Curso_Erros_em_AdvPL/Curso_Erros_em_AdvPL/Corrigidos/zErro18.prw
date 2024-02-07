//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro18
Simulando o erro Statement unbalanced function in
@type  Function
@author Atilio
@since 20/04/2020
@version version
@example u_zErro18()
/*/

User Function zErro18()
    Local aArea        := GetArea()
    Local cNome        := "Daniel"

    fMostrar(cNome)
    RestArea(aArea)
Return

Static Function fMostrar(cNome)
    Alert(cNome)
Return