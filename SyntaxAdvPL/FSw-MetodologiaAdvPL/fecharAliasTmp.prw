//Sintomas
Method leAlgumaInformacao() class AlgumaClasse
    
    Local cAliasTmp := GetNextAlias()
    Local cQuery    := getQuery()

    TCQUERY cQuery NEW ALIAS &cAliasTmp

    (cAlias)->(DBGoTop())
    while !(cAlias)->(Eof())

        fazAlgumaCoisa(cAlias)
        
        (cAlias)->(dbSkip())
    endDo

Return


//Solu��o
Method leAlgumaInformacao() class AlgumaClasse
    
    Local cAliasTmp := GetNextAlias()
    Local cQuery    := getQuery()

    TCQUERY cQuery NEW ALIAS &cAliasTmp

    (cAlias)->(DBGoTop())
    while !(cAlias)->(Eof())

        fazAlgumaCoisa(cAlias)
        
        (cAlias)->(dbSkip())
    endDo

    (cAlias)->(dbCloseArea())

Return
