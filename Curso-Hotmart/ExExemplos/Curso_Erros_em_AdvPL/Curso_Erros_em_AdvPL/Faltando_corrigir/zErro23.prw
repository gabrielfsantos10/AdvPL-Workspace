//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro23
Simulando o erro Too few parameters calling
@type  Function
@author Atilio
@since 20/04/2020
@version version
@example u_zErro23()
/*/

User Function zErro23()
    Local aArea  := GetArea()
    Local cNome  := ""
    
    cNome := "Daniel Atilio"

    MsgInfo()

    RestArea(aArea)
Return
