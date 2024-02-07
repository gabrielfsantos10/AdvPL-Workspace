//Sintomas
Method getValor(cCodigo) class NomeDaClasse

    Local nValor := 0

    ZZ1->(DBSetOrder(1))
    if ZZ1->(DBSeek(xFilial("ZZ1")+cCodigo))
        nValor := ZZ1->ZZ1_VALOR    
    endif

Return nValor

//Solução
Method getValor(cCodigo) class NomeDaClasse

    Local nValor   := 0
    Local aAreaZZ1 := ZZ1->(GetArea())

    ZZ1->(DBSetOrder(1))
    if ZZ1->(DBSeek(xFilial("ZZ1")+cCodigo))
        nValor := ZZ1->ZZ1_VALOR    
    endif

    RestArea(aAreaZZ1)

Return nValor
