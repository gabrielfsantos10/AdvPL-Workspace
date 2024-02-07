//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro14
Simulando o erro Local variable never used
@type  Function
@author Atilio
@since 20/04/2020
@version version
@example u_zErro14()
/*/

User Function zErro14()
    Local aArea := GetArea()
    Local cNome := "Daniel"

    Alert(cNome)

    RestArea(aArea)
Return