//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro07
Simulando o erro Enddo does not match while / EndIf does not match if
@type  Function
@author Atilio
@since 10/04/2020
@version version
@example u_zErro07()
/*/

User Function zErro07()
    Local aArea := GetArea()
    Local nValor := 10
    
    If nValor > 20
        Alert(nValor)
    EndIf

    RestArea(aArea)    
Return