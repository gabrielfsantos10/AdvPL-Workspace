#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"

USER FUNCTION tdesa11()
    LOCAL cQuery := ""
    LOCAL cAlias := ""
    LOCAL cMsg := ""
    Local nMedia := 0
    Local cDataInicial := ""
    Local cDataFinal := ""

    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "COM" TABLES "SB1", "SC6"

    cDataInicial := FWINPUTBOX("Insira uma data inicial/ AAAA/MM/DD ", " ")
    cDataFinal := FWINPUTBOX("Insira uma data final/ AAAA/MM/DD ", " ")

    cAlias := GETNEXTALIAS()

    cQuery := "SELECT C6_QTDVEN "
    cQuery += "FROM "+ RETSQLNAME("SC6") + " AS SC6 "
    cQuery += "WHERE C6_PRODUTO = '0004' AND "
    cQuery += "C6_ENTREG BETWEEN '"+ cDataInicial +"' AND '"+ cDataFinal +"' "

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
