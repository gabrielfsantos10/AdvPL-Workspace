//Sintomas
DBSelectArea("SB1")
DBSetOrder(1)
if DBSeek(xFilial("SB1")+cProduto)
    cDescricao := B1_DESC
endif


// Solução
SB1->(DBSetOrder(1))
if SB1->(dbSeek(xFilial("SB1")+cProduto))
    cDescricao := SB1->B1_DESC
endif
