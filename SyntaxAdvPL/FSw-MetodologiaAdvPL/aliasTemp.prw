//Sintomas
Local cQuery := getQuery()

TCQUERY cQuery NEW ALIAS "TMP"

//Solução
Local cAliasTmp := GetNextAlias()
Local cQuery    := getQuery()

TCQUERY cQuery NEW ALIAS &cAliasTmp
