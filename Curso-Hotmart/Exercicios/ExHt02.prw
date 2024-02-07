#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"


USER FUNCTION HtEx02()
    LOCAL cQuery := ""
    LOCAL cAlias := ""
    LOCAL cMsg := ""
    Local cCod := ""
    Local aArea := GetArea()

    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT" TABLES "SA1"

    cCod := FWINPUTBOX("Informe o código do cliente: ", " ")
    cAlias := GETNEXTALIAS()
    

    cQuery := "SELECT A1_NOME "
    cQuery += "FROM "+ RETSQLNAME("SA1") + " AS SA1 "
    cQuery += "WHERE A1_COD = '" + cCod + "' "

    // TCQUERY cQuery ALIAS &(cAlias) new
    PLSQuery(cQuery, cAlias) //Método mais atual de se executar a query

    //enquanto nao for final do arquivo
    WHILE !(&(cAlias)->(EOF()))
        cMsg += &(cAlias)->(A1_NOME) + ", " 
        &(cAlias)->(DBSKIP())
    ENDDO
    
    &(cAlias)->(DBCLOSEAREA())
    FWALERTINFO(cMsg)

    RestArea(aArea)
RETURN
