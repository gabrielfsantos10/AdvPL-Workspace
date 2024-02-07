//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro10
Simulando o erro InterFunctionCall: cannot find function in AppMap
@type  Function
@author Atilio
@since 10/04/2020
@version version
@example u_zErro10()
/*/

User Function zErro10()
    Local aArea := GetArea()
    
    u_zFuncaoXYZ()

    RestArea(aArea)    
Return