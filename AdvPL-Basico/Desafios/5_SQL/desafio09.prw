#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"

USER FUNCTION tdesa09()
    LOCAL cQuery := ""
    LOCAL cAlias := ""
    LOCAL cMsg := ""

    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "COM" TABLES "SB1", "SC6"

    cAlias := GETNEXTALIAS()

    cQuery := "SELECT B1_TIPO, B1_ZZGRP "
    cQuery += "FROM "+ RETSQLNAME("SB1") + " AS SB1 "
    cQuery += "WHERE D_E_L_E_T_ = ''"

    TCQUERY cQuery ALIAS &(cAlias) new

    //enquanto nao for final do arquivo
    WHILE !(&(cAlias)->(EOF()))
        cMsg += &(cAlias)->("Tipo: " + B1_TIPO + " Grupo: " + B1_ZZGRP)
        &(cAlias)->(DBSKIP())
    ENDDO

    &(cAlias)->(DBCLOSEAREA())
    FWALERTINFO(cMsg)
RETURN
