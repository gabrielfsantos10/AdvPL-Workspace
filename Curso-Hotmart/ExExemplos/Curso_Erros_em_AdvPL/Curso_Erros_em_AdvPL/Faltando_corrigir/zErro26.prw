//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro26
Simulando o erro Variable does not exist
@type  Function
@author Atilio
@since 20/04/2020
@version version
@example u_zErro26()
/*/

User Function zErro26()
    Local aArea  := GetArea()
    
    nVar++
    Alert(nVar)

    RestArea(aArea)
Return
