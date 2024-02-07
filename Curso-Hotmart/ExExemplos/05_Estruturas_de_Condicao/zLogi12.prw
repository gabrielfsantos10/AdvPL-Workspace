//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zLogi12
Exemplo de estrutura de condicao com Iif
@author Atilio
@since 29/02/2020
@version 1.0
@type function
/*/

User Function zLogi12()
	Local aArea    := GetArea()
    Local nMesAtu  := Month(Date())
    Local nMesAniv := 7
    Local cMsg     := ""

    cMsg := Iif(nMesAtu == nMesAniv, "ANIVERSARIANTE", "AINDA NAO")
    //Alert(cMsg)

    /*
    If nMesAtu == nMesAniv
        cMsg := "ANIVERSARIANTE"
    Else
        cMsg := "AINDA NAO"
    EndIf

    nValor := Iif(A == B, Iif(B == C, 7, Iif(C == D, 4, 9)), 3)
    If A == B
        If B == C
            nValor := 7
        Else
            If C == D
                nValor := 4
            Else
                nValor := 9
            EndIf
        EndIf
    Else
        nValor := 3
    EndIf
    */  

    RestArea(aArea)
Return