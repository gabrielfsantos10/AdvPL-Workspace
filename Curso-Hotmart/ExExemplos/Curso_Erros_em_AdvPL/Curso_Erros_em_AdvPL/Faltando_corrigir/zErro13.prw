//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro13
Simulando o erro Invalid typecast
@type  Function
@author Atilio
@since 20/04/2020
@version version
@example u_zErro13()
/*/

User Function zErro13()
    Local aArea := GetArea()
    Local lOk

    For lOk := .T. To 10
        
    Next

    RestArea(aArea)
Return