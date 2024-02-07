#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
//p
USER FUNCTION MAIN29()
    LOCAL cDataInicial := ""
    LOCAL cDataFinal := ""
    LOCAL cQuery := ""
    LOCAL cAlias := ""
    LOCAL amsg:= ARRAY(3)
    LOCAL nCont := 0

    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "COM" TABLES "SC6", "SB1"

    cAlias := GETNEXTALIAS()

    cDataInicial := FWINPUTBOX("Insira uma data inicial/ AAAA/MM/DD ", " ")
    cDataFinal := FWINPUTBOX("Insira uma data final/ AAAA/MM/DD ", " ")
    
    cQuery := "SELECT C6_PRODUTO, C6_VALOR, C6_ENTREG, B1_DESC "
    cQuery += "FROM "+ RETSQLNAME("SC6") + " C6"
    cQuery += "INNER JOIN " + RETSQLNAME("SB1") + " B1 "
    cQuery += "ON B1_FILIAL = '"+xFilial("SB1")+"' AND C6_PRODUTO = B1_COD AND B1.D_E_L_E_T_ = ' ' "
    cQuery += "WHERE C6_FILIAL = '"+xFilial("SB1")+"' AND "
    cQuery += "C6_ENTREG BETWEEN '"+ cDataInicial +"' AND '"+ cDataFinal +"' AND C6.D_E_L_E_T_ = ' ' "
    cQuery += "GROUP BY C6_PRODUTO, C6_VALOR, C6_ENTREG, B1
    cQuery += "GROUP BY C6_PRODUTO, C6_VALOR, C6_ENTREG, B1_DESC  "
    cQuery += "ORDER BY C6_VALOR DESC "

    TCQUERY cQuery ALIAS &(cAlias) new

    FOR nCont := 1 to 3
        amsg[nCont] := &(cAlias)->(B1_DESC)
        &(cAlias)->(DBSKIP())    
    NEXT
    FOR nCont := 1 to 3
       FWALERTINFO(amsg[nCont]) 
    next
    &(cAlias)->(DBCLOSEAREA())
RETURN

