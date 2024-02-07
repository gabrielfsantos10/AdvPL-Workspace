//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro03
Simulando o erro Argument Error
@type  Function
@author Atilio
@since 10/04/2020
@version version
@example u_zErro03()
/*/

User Function zErro03()
    Local aArea := GetArea()
    Local cData := "20200210"

    //Mostrando a data
    Alert( sToD(cData) )

    RestArea(aArea)    
Return