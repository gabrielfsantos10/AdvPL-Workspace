#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"

USER FUNCTION MAIN30()
    LOCAL cCOD := ""
    LOCAL cQuery := ""
    LOCAL cAlias := ""
    LOCAL cMSG := ""

    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "COM" TABLES "SB1", "SC6"

    cCOD := FWINPUTBOX("INSIRA UM CODIGO DO PRODUTO", "")
    cAlias := GETNEXTALIAS()

    cQUery := "SELECT B1_COD, C6_NUM "
    cQuery += "FROM " + RETSQLNAME("SB1") + " AS SB1 "
    cQuery += "INNER JOIN SC6990 ON B1_COD = C6_PRODUTO "
    cQuery += "WHERE B1_COD = '"+cCOD+"' AND SB1.D_E_L_E_T_ = '' "

    tcquery cQuery ALIAS &(cAlias) new

    WHILE !(&(cAlias)->(EOF()))
        cMSG += &(cAlias)->(C6_NUM) + ", " 
        &(cAlias)->(DBSKIP())
    ENDDO

    &(cAlias)->(DBCLOSEAREA())
    FWALERTINFO(cMSG)

RETURN
