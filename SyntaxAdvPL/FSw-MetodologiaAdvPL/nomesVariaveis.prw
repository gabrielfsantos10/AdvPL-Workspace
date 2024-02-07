//Sintomas
Method procCalc() class NomeDaClasse
    
    Local nV1  := ::getV1()
    Local nV2  := ::getV2()
    Local nP   := ::getPerc()
    Local nRet := ((nV1 - nV2) * nP) / 100

Return nRet

//Solução
Method getValorComissao() class NomeDaClasse
    
    Local nVendas     := ::getVendas()
    Local nDevolucoes := ::getDevolucoes()
    Local nPComissao  := ::getPComissao()
    Local nValor      := ((nVendas - nDevolucoes) * nPComissao) / 100

Return nValor
