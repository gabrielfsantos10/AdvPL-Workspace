//Sintomas
Local cQuery := getQuery()

TCQUERY cQuery NEW ALIAS "TMP"

//Solu��o
Local cAliasTmp := GetNextAlias()
Local cQuery    := getQuery()

TCQUERY cQuery NEW ALIAS &cAliasTmp
