#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"

USER FUNCTION tdesa10()
    LOCAL cQuery := ""
    LOCAL cAlias := ""
    LOCAL cMsg := ""
    LOCAL cCod := ""
    Local nMedia := 0

    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "COM" TABLES "SB1", "SC6"

    cCod := FWINPUTBOX("Informe o código do produto: ", " ")
    cAlias := GETNEXTALIAS()

    cQuery := "SELECT C6_QTDVEN "
    cQuery += "FROM "+ RETSQLNAME("SC6") + " AS SC6 "
    cQuery += "WHERE C6_PRODUTO = '" + cCod + "' "

    TCQUERY cQuery ALIAS &(cAlias) new

    //enquanto nao for final do arquivo
    WHILE !(&(cAlias)->(EOF()))
        nMedia := nMedia + &(cAlias)->(C6_QTDVEN)
        &(cAlias)->(DBSKIP())
    ENDDO

    nMedia := nMedia/3
    cMsg += &(cAlias)->("Média de quantidade: " + CValToChar(nMedia))

    &(cAlias)->(DBCLOSEAREA())
    FWALERTINFO(cMsg)
RETURN
