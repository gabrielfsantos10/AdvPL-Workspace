//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro24
Simulando o erro Type mismatch on
@type  Function
@author Atilio
@since 20/04/2020
@version version
@example u_zErro24()
/*/

User Function zErro24()
    Local aArea  := GetArea()
    Local cNome  := "0"
    
    If cNome == 3
        Alert("igual a 3")
    EndIf

    RestArea(aArea)
Return
