#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"

USER FUNCTION tdesa12()
    LOCAL cQuery := ""
    LOCAL cAlias := ""
    LOCAL cMsg := ""
    Local cCod := ""

    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "COM" TABLES "SB1", "SC6", "SG1"

    cCod := FWINPUTBOX("Insira o código: ", " ")

    cAlias := GETNEXTALIAS()

    cQuery := "SELECT G1_COD, B1_TIPO, G1_QUANT "
    cQuery += "FROM "+ RETSQLNAME("SG1") + " AS SG1 "
    cQuery += "INNER JOIN SB1990 ON G1_COD = B1_COD "
    cQuery += "WHERE G1_COD = '" + cCod + "' "

    TCQUERY cQuery ALIAS &(cAlias) new
        
    //enquanto nao for final do arquivo
    WHILE !(&(cAlias)->(EOF()))
        cMsg += &(cAlias)->(CValToChar(G1_COD) + " " + B1_TIPO + " " + CValToChar(G1_QUANT))
        &(cAlias)->(DBSKIP())
    ENDDO

    &(cAlias)->(DBCLOSEAREA())
    FWALERTINFO(cMsg)
RETURN
