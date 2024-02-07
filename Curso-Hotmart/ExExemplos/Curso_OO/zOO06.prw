//Bibliotecas
#Include "TOTVS.ch"

/*/{Protheus.doc} User Function zOO06
Fun��o de exemplo, demonstrando a inst�ncia de uma TDialog com EnchoiceBar
@type  Function
@author Atilio
@since 03/05/2022
/*/

User Function zOO06()
    Local nJanAltu   := 200
    Local nJanLarg   := 600
    Local lDimPixels := .T.
    Local lCentraliz := .T.
    Local bBlocoOk   := {|| lOk := .T., oDlgAux:End()}
    Local bBlocoCan  := {|| lOk := .F., oDlgAux:End()}
    Local aOutrasAc  := { {"BMP", {|| Alert("Cliquei no 1")}, "Bot�o 1"}, {"BMP", {|| Alert("Cliquei no 2")}, "Bot�o 2"} }
    Local bBlocoIni  := {|| EnchoiceBar(oDlgAux, bBlocoOk, bBlocoCan, , aOutrasAc)}
    Local cJanTitulo := "Tela usando TDialog com EnchoiceBar"
    Private oDlgAux
    Private lOk      := .F.

    //Cria a dialog
    oDlgAux := TDialog():New(0, 0, nJanAltu, nJanLarg, cJanTitulo, , , , , , /*nCorFundo*/, , , lDimPixels)

    //Ativa e exibe a janela
    oDlgAux:Activate(, , , lCentraliz, , , bBlocoIni)

    //Se o retorno for positivo, foi clicado no bot�o Confirmar ao inv�s do Cancelar
    If lOk
        FWAlertSuccess("Foi clicado no bot�o Confirmar!", "OK")
    EndIf
Return
