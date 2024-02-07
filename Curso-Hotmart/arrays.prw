#INCLUDE "totvs.ch"


User Function HotmartArray01()
    Local aArray := {}

    aAdd(aArray, "Gabriel")
    aAdd(aArray, "João")
    aAdd(aArray, "Pedro")
    aAdd(aArray, "José")

    MsgInfo(aArray[1], "Exibição do Array")

Return
