//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro02
Simulando o erro Alias does not exist
@type  Function
@author Atilio
@since 10/04/2020
@version version
@example u_zErro02()
/*/

User Function zErro02()
    Local aArea := GetArea()
    Local cQry  := ""

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

    //Mostrando o primeiro fornecedor encontrado
    Alert(QRY_SA2->A2_NOME)
    QRY_SA2->(DbCloseArea())

    RestArea(aArea)    
Return