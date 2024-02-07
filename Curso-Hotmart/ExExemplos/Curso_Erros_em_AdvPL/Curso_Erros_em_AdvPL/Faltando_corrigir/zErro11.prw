//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro11
Simulando o erro Invalid field name in alias
@type  Function
@author Atilio
@since 20/04/2020
@version version
@example u_zErro11()
/*/

User Function zErro11()
    Local aArea := GetArea()
    
    DbSelectArea('SB1')
    Alert(SB1->B1_X_DOCF)

    RestArea(aArea)    
Return