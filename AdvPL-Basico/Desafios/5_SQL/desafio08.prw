#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"

USER FUNCTION tdesa08()
    LOCAL cQuery := ""
    LOCAL cAlias := ""
    LOCAL cMsg := ""
    Local cTipo := ""

    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "COM" TABLES "SB1", "SC6"

    cTipo := FWINPUTBOX("Informe o tipo do produto: ", " ")
    cAlias := GETNEXTALIAS()

    cQuery := "SELECT B1_TIPO, B1_ZZGRP, B1_COD "
    cQuery += "FROM "+ RETSQLNAME("SB1") + " AS SB1 "
    cQuery += "WHERE B1_TIPO = '" + cTipo + "' "

    TCQUERY cQuery ALIAS &(cAlias) new

    //enquanto nao for final do arquivo
    WHILE !(&(cAlias)->(EOF()))
        cMsg += &(cAlias)->("Cod: " + B1_COD + "Grupo: " + B1_ZZGRP)
        &(cAlias)->(DBSKIP())
    ENDDO

    &(cAlias)->(DBCLOSEAREA())
    FWALERTINFO(cMsg)
RETURN
