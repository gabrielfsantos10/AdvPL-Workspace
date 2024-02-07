#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"



User Function zBoaP002()
    Local aArea      := GetArea()
    // Local cFilSA1    := FWxFilial('SA1')
    Local cCodSA1    := '0001'
    Local cCidadeSA1 := 'LIMEIRA'
    Local cAlias     := ''

    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT" TABLES "SA1"

    cAlias := GETNEXTALIAS()

    DbSelectArea(&(cAlias))
    cAlias->(DbSetOrder(3))

    if cAlias->(DbSeek(cCodSA1 + cCidadeSA1))
        MSGINFO( 'REGISTRO ENCONTRADO!', 'SUCESSO' )
    else
        MSGALERT( 'REGISTRO NÃO ENCONTRADO!', 'FALHA' )
    endif

    RestArea(aArea)
Return
