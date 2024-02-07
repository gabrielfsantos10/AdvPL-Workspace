//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro16
Simulando o erro More parameters used in function call than expected
@type  Function
@author Atilio
@since 20/04/2020
@version version
@example u_zErro16()
/*/

User Function zErro16()
    Local aArea        := GetArea()
    Local cNome        := "Daniel"

    fMostrar(cNome, "Atencao")

    RestArea(aArea)
Return

Static Function fMostrar(cMensagem, cTitulo)
    MsgInfo(cMensagem, cTitulo)
Return