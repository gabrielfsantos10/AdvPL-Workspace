//Sintomas
Static Function gravaDados(oObj)
    
    Local cId      := oObj:getId()
    Local nOpcao   := oObj:getOpcao()
    Local aAreaZZ1 := ZZ1->(GetArea())

    if Empty(cId)
        if (nOpcao == VALOR_OPCAO_1)
            ZZ1->(DBSetOrder(1))
            
            if ZZ1->(DBSeek(xFilial("ZZ1")+oObj:getId()))
                ZZ1->(RecLock("ZZ1", .F.))
                    ZZ1->ZZ1_DATADE  := oObj:getDateDe()
                    ZZ1->ZZ1_DATAATE := oObj:getDateAte()
                    //Continua gravando os demais campos...
                ZZ1->(MsUnlock())
            else
                ZZ1->(RecLock("ZZ1", .T.))
                    ZZ1->ZZ1_DATADE  := oObj:getDateDe()
                    ZZ1->ZZ1_DATAATE := oObj:getDateAte()
                    //Continua gravando os demais campos...
                ZZ1->(MsUnlock())
            endif

        else
            ZZ1->(DBSetOrder(2))

            if ZZ1->(DBSeek(xFilial("ZZ1")+oObj:getCodProc()))
                ZZ1->(RecLock("ZZ1", .F.))
                    ZZ1->ZZ1_DATADE  := oObj:getDateDe()
                    ZZ1->ZZ1_DATAATE := oObj:getDateAte()
                    //Continua gravando os demais campos...
                ZZ1->(MsUnlock())
            else
                ZZ1->(RecLock("ZZ1", .T.))
                    ZZ1->ZZ1_DATADE  := oObj:getDateDe()
                    ZZ1->ZZ1_DATAATE := oObj:getDateAte()
                    //Continua gravando os demais campos...
                ZZ1->(MsUnlock())
            endif

        endif
    endif

    RestArea(aAreaZZ1)

Return


//Solução
Static Function gravaDados(oObj)
    
    Local nOrdZZ1  := 0
    Local cKeyZZ1  := ""
    Local cId      := oObj:getId()
    Local nOpcao   := oObj:getOpcao()
    Local aAreaZZ1 := ZZ1->(GetArea())

    if Empty(cId)
        return
    endif

    if (nOpcao == VALOR_OPCAO_1)
        nOrdZZ1 := 1
        cKeyZZ1 := oObj:getId()
    else
        nOrdZZ1 := 2
        cKeyZZ1 := oObj:getCodProc()
    endif

    ZZ1->(DBSetOrder(nOrdZZ1))
    lNovoReg := !ZZ1->(DBSeek(xFilial("ZZ1")+cKeyZZ1))

    ZZ1->(RecLock("ZZ1", lNovoReg))
        ZZ1->ZZ1_DATADE  := oObj:getDateDe()
        ZZ1->ZZ1_DATAATE := oObj:getDateAte()
        //Continua gravando os demais campos...
    ZZ1->(MsUnlock())

    RestArea(aAreaZZ1)

Return
