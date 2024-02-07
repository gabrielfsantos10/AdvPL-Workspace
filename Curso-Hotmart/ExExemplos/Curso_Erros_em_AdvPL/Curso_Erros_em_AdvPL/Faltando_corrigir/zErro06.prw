//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro06
Simulando o erro Duplicated Function
@type  Function
@author Atilio
@since 10/04/2020
@version version
@example u_zErro05()
/*/

User Function zErro05()
    Local aArea := GetArea()

    Alert('Teste')

    RestArea(aArea)
Return