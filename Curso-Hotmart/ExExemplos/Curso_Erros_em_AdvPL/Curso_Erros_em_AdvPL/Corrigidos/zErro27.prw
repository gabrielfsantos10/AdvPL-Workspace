//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro27
Simulando o erro Variable redefined
@type  Function
@author Atilio
@since 20/04/2020
@version version
@example u_zErro27()
/*/

User Function zErro27()
    Local aArea  := GetArea()
    Local nVar   := 0
    Local cNome  := ""
    
    nVar++
    Alert(cNome + " " + cValToChar(nVar))

    RestArea(aArea)
Return
