#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"

USER FUNCTION tdesa13()
    LOCAL cQuery := ""
    LOCAL cAlias := ""
    LOCAL cMsg := ""

    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "COM" TABLES "SB1", "SC6", "SG1"

    cAlias := GETNEXTALIAS()

    cQuery := "SELECT C6_PRODUTO, C6_DESCRI, C6_PRCVEN "
    cQuery += "FROM "+ RETSQLNAME("SC6") + " AS SC6 "
    cQuery += "INNER JOIN SG1990 ON C6_PRODUTO = G1_COD "
    cQuery += "ORDER BY C6_PRODUTO"

    TCQUERY cQuery ALIAS &(cAlias) new

    //enquanto nao for final do arquivo
    WHILE !(&(cAlias)->(EOF()))
        cMsg += &(cAlias)->("Codigo: " + CValToChar(C6_PRODUTO) + " Nome: " + C6_DESCRI + " Preco: " +  CValToChar(C6_PRCVEN))
        &(cAlias)->(DBSKIP())
    ENDDO

    &(cAlias)->(DBCLOSEAREA())
    FWALERTINFO(cMsg)
RETURN
