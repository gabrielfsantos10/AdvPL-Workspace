#INCLUDE "totvs.ch"


User Function HtArray02()
    Local aPessoa := {}
    // Local nAtual
    // Local nPos

    //Array multidimensional - Com 3 colunas
    aAdd(aPessoa, {"Gabriel", STOD("20020211"), "Limeira"})
    aAdd(aPessoa, {"Maria", STOD("20020511"), "Campinas"})
    aAdd(aPessoa, {"João", STOD("20020820"), "Piracicaba"})

    // for nAtual := 1 to Len(aPessoa)
    //     // MSGINFO(aPessoa[nAtual][1] + " nasceu no dia " + dToS(aPessoa[nAtual][2]) + " na cidade de " + aPessoa[nAtual][3], "Pessoas")

    //     //Encontrando elemento no Array
    //     nPos := aScan(aPessoa, {|nAtual| AllTrim(nAtual[1]) == "Maria"})
    //     if nPos > 0
    //         MsgInfo("Maria foi encontrada na linha " + cValToChar(nPos), "Encontrado")
    //     else
    //         MsgAlert("Maria não foi encontrada", "Erro")
    //     EndIf

    // next

    //Excluir elemento no Array - com o aSize ele procura o elemento NIL para apagar
    aDel(aPessoa, 2)
    aSize(aPessoa, Len(aPessoa) - 1)
    MsgInfo("Array com " + cValToChar(Len(aPessoa)) + " linhas")

Return
