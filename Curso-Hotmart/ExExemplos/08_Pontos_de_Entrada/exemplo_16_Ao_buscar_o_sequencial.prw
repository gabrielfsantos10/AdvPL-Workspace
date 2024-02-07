//Bibliotecas
#Include "Totvs.ch"
#Include "TopConn.ch"
 
/*/{Protheus.doc} CriaSXE
Ponto de Entrada para controlar a numera��o
@author Atilio
@since 17/10/2019
@version 1.0
@return cCodRet, C�digo de retorno que entrar� no lugar do chamado pelo License
@type function
@see https://tdn.totvs.com/pages/releaseview.action?pageId=6815179
@obs Esse p.e. � chamado na primeira vez de pegar a numera��o na tabela
/*/
 
User Function CriaSXE()
    Local aArea      := GetArea()
    Local cAliasX    := ParamIXB[1] //cAlias - Nome da tabela;
    Local cCpoSX8X   := ParamIXB[2] //cCpoSX8 - Nome do campo que ser� utilizado para verificar o pr�ximo sequencial;
    Local cCodRet    := Nil
    Local cQryMax    := ""
    Local cUltimo    := ""
     
    //Se for a tabela SU7 (Operadores - TMKA090)
    If cAliasX == "SU7"
         
        //Montando a query, pegando o �ltimo
        cUltimo := PadR("O", TamSX3('U7_COD')[1], "0")
        cQryMax := " SELECT " + CRLF
        cQryMax += "     ISNULL(MAX(" + cCpoSX8X + "), '" + cUltimo + "') AS ULTIMO " + CRLF 
        cQryMax += " FROM  " + CRLF
        cQryMax += "     " + RetSQLName('SU7') + " SU7 " + CRLF
        cQryMax += " WHERE  " + CRLF
        cQryMax += "     U7_FILIAL = '" + FWxFilial('SU7') + "' " + CRLF
        cQryMax += "     AND LEFT(U7_COD, 1) = 'O' " + CRLF
        cQryMax += "     AND SU7.D_E_L_E_T_ = ' ' " + CRLF
        TCQuery cQryMax New Alias "QRY_MAX"
         
        //Se tiver dados e se n�o tiver vazio
        If ! QRY_MAX->(EoF()) .And. ! Empty(QRY_MAX->ULTIMO)
            cCodRet := Soma1(QRY_MAX->ULTIMO)
        EndIf
        QRY_MAX->(DbCloseArea())
         
    EndIf
     
    RestArea(aArea)
Return cCodRet
