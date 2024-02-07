//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro01
Simulando o erro Alias already in use
@type  Function
@author Atilio
@since 10/04/2020
@version version
@example u_zErro01()
/*/

User Function zErro01()
    Local aArea := GetArea()
    Local cQry  := ""
    Local cQry2 := ""

    //Selecionando todos os fornecedores
    cQry := " SELECT " + CRLF
    cQry += "     A2_COD, " + CRLF
    cQry += "     A2_NOME " + CRLF
    cQry += " FROM " + CRLF
    cQry += "     " + RetSQLName('SA2') + " SA2 " + CRLF
    cQry += " WHERE " + CRLF
    cQry += "     A2_FILIAL = '" + FWxFilial('SA2') + "' " + CRLF
    cQry += "     AND SA2.D_E_L_E_T_ = ' ' " + CRLF
    TCQuery cQry New Alias "QRY_SA2"

    //Selecionando dados de fornecedores de SP
    cQry2 := " SELECT " + CRLF
    cQry2 += "     A2_COD, " + CRLF
    cQry2 += "     A2_NOME " + CRLF
    cQry2 += " FROM " + CRLF
    cQry2 += "     " + RetSQLName('SA2') + " SA2 " + CRLF
    cQry2 += " WHERE " + CRLF
    cQry2 += "     A2_FILIAL = '" + FWxFilial('SA2') + "' " + CRLF
    cQry2 += "     AND A2_EST = 'SP' " + CRLF
    cQry2 += "     AND SA2.D_E_L_E_T_ = ' ' " + CRLF
    TCQuery cQry2 New Alias "QRY_SA2B"

    QRY_SA2->(DbCloseArea())
    QRY_SA2B->(DbCloseArea())

    RestArea(aArea)    
Return