/*
    Leitura do Arquivo
*/

Static Function leArquivo(oFile)
    
    Local nRegLidos := 0
    Local cProduto  := ""
    Local oSql      := IpSqlObject():newIpSqlObject()

    oFile:goTop()
    while !oFile:isEof()
        
        cProduto := oFile:readline(7, 15)

        if !oSql:exists("SB1", "B1_FILIAL = '%SB1.FILIAL%' AND B1_COD = '" + cProduto + "'")
            if cadastraProduto(cProduto)
                nRegLidos++
            endif
        endif

        oFile:skipLine()
    endDo

    oFile:close()

Return nRegLidos
