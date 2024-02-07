//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro15
Simulando o erro Local declaration follows executable statement
@type  Function
@author Atilio
@since 20/04/2020
@version version
@example u_zErro15()
/*/

User Function zErro15()
    Local aArea        := GetArea()
    Local cNome        := "Daniel"
    Private cSobreNome := "Atilio"
    Local cNomeInt     := cNome + " " + cSobreNome

    Alert(cNomeInt)

    RestArea(aArea)
Return