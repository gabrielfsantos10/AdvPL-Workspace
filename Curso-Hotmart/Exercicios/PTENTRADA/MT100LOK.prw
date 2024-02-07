#INCLUDE "Totvs.ch"
#INCLUDE "Protheus.ch"


User Function MT100LOK()
    Local lRet        := .T.
    Local naColsProd  := aScan(aHeader, {|x| AllTrim(x[2] == "D1_COD")})
    Local cCodProduto := AllTrim(aCols[n, naColsProd])

    if cCodProduto == "VITA.000002"
        lRet := .F.    
        Alert("NÃO PERMITIDA INCLUSÃO DO ITEM - VITA.000002", "ALERTA")
    endif


Return lRet
