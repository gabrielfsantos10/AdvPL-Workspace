//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro04
Simulando o erro Array out of bounds
@type  Function
@author Atilio
@since 10/04/2020
@version version
@example u_zErro04()
/*/

User Function zErro04()
    Local aArea := GetArea()
    Local aDados := {}
    Local nPosicao := 4

    //Adicionando elementos no array
    aAdd(aDados, "Daniel")
    aAdd(aDados, "Atilio")
    aAdd(aDados, "Terminal de Informacao")

    //Mostrando o quarto elemento
    If nPosicao <= Len(aDados)
        Alert(aDados[nPosicao])
    EndIf

    RestArea(aArea)    
Return