#INCLUDE "totvs.ch"


User Function HotmartArray01()
    Local aArray := {}

    aAdd(aArray, "Gabriel")
    aAdd(aArray, "Jo�o")
    aAdd(aArray, "Pedro")
    aAdd(aArray, "Jos�")

    MsgInfo(aArray[1], "Exibi��o do Array")

Return
