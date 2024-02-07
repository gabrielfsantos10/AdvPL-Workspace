//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro21
Simulando o erro String size overflow
@type  Function
@author Atilio
@since 20/04/2020
@version version
@example u_zErro21()
/*/

User Function zErro21()
    Local aArea        := GetArea()
    Private cMsg       := Space(5000)
    Private nVez       := 0

    Alert(cMsg)

    RestArea(aArea)
Return
