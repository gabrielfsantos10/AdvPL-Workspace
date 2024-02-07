//Bibliotecas
#Include "TOTVS.ch"
#Include "TopConn.ch"

/*/{Protheus.doc} User Function zErro09
Simulando o erro Incorret syntax near 
@type  Function
@author Atilio
@since 10/04/2020
@version version
@example u_zErro09()
/*/

User Function zErro09()
    Local aArea := GetArea()
    Local cQry  := ""

    //Selecionando todos os fornecedores
    cQry := "SELECT"
    cQry += "    A2_COD,"
    cQry += "    A2_NOME"
    cQry += "FROM"
    cQry += "    " + RetSQLName('SA2') + " SA2"
    cQry += "WHERE"
    cQry += "    A2_FILIAL = '" + FWxFilial('SA2') + "'"
    cQry += "    AND SA2.D_E_L_E_T_ = ' '"
    TCQuery cQry New Alias "QRY_SA2"

    //Se houver dados, mostra a mensagem
    If ! QRY_SA2->(EoF())
        Alert(QRY_SA2->A2_NOME)
    EndIf
    QRY_SA2->(DbCloseArea())

    RestArea(aArea)    
Return