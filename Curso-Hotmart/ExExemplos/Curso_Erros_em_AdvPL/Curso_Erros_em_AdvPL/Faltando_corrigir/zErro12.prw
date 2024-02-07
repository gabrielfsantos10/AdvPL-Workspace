//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro12
Simulando o erro Invalid property
@type  Function
@author Atilio
@since 20/04/2020
@version version
@example u_zErro12()
/*/

User Function zErro12()
    Local aArea := GetArea()
    Private oFont := TFont():New()
    
    oFont:AtributoAAA := "Teste"

    RestArea(aArea)    
Return