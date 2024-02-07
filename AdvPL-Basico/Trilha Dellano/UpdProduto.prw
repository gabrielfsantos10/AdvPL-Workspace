#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

User Function UpdProduto()
    Local aUpdate := {}
    Local nLinha  := 0 

    dbSelectArea("SB1")
    dbSetOrder(1)
    dbGoTop()

    Aadd(aUpdate, {"PA","M3","0001"})
    Aadd(aUpdate, {"PA","KG","0002"})
    Aadd(aUpdate, {"EM","M3","0003"})
    Aadd(aUpdate, {"EM","KG","01587"})

    while SB1->(!eOf())

        nLinha := AScan(aUpdate, AllTrim(aUpdate[3]) == AllTrim(SB1->B1_COD))

        if nLinha != 0
            RecLock("SB1", .F.)
                SB1->B1_TIPO := aUpdate[nLinha][1]
                SB1->B1_UM   := aUpdate[nLinha][2]            
            MsUnlock()
        endif
        
        SB1->(dbSkip())
    enddo

    getProduto()
    
Return

Static Function getProduto()

    Local aProdutos := {}

    dbSelectArea("SB1")
    dbSetOrder(1)
    dbGoTop()
    
    while SB1->(!eOf())
        if AllTrim(SB1->B1_TIPO) == 'PA' .AND. AllTrim(SB1->B1_UM) == 'M3' .OR. ;
           AllTrim(SB1->B1_TIPO) == 'EM' .AND. AllTrim(SB1->B1_UM) == 'KG'

            Aadd(aProdutos, {SB1->B1_TIPO,SB1->B1_UM,SB1->B1_COD})

        endif
        SB1->(dbSkip())
    enddo
Return
