// - 6
//processaProjecao.prw

/*/{Protheus.doc} nomeDaFuncaoClasseOuMetodo

    (Desccrição da função, classe ou método)

    @author Victor Hugo
    @since 20/12/2013

    @param xParam, TipoParam, DescricaoDoParam

    @return TipoRet, DescricaoRet
    /*/
Method processaProjecao(dData, cCodEmp, cCodFil) class ProjecaoFinanceira

    Local lok       := .F.
    default cCodEmp := cEmpAnt
    default cCodFil := cFilAnt

    preparaDados(@self)

    // Executa o processamento...

return lok


// - 7
//processaProjecao.prw

/*/{Protheus.doc} processaProjecao

    Processa a Projeção Financeira

    @author Victor Hugo
    @since 20/12/2013

    @param dData, Data, Data para processamento
    @param cCodEmp, String, Código da empresa (opcional)
    @param cCodFil, String, Código da filial (opcional)

    @return Logico indica se o processamento foi realizado
    /*/
Method processaProjecao(dData, cCodEmp, cCodFil) class ProjecaoFinanceira
    
Return
