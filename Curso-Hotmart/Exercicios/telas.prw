//Bibliotecas
#Include "TOTVS.ch"

/*/{Protheus.doc} User Function zOO03
Função de exemplo, demonstrando 3 classes (MsDialog, TDialog e FWDialogModal)
@type  Function
@author Atilio
@since 26/04/2022
/*/

User Function zOO03()
    Local aArea := FWGetArea()

    fDialogMS()
    fDialogT()
    fDialogFW()

    FWRestArea(aArea)
Return

Static Function fDialogMS()
    Local oDlgAux
    Local nJanAltu   := 200
    Local nJanLarg   := 400
    Local cJanTitulo := "Tela usando MsDialog 02"

    //Criando a janela
    DEFINE MSDIALOG oDlgAux TITLE cJanTitulo FROM 000, 000  TO nJanAltu, nJanLarg COLORS 70, 16777215 PIXEL
         
    //Ativando a janela
    ACTIVATE MSDIALOG oDlgAux CENTERED
Return

Static Function fDialogT()
    Local oDlgAux
    Local nJanAltu   := 200
    Local nJanLarg   := 400
    Local lDimPixels := .T.
    Local lCentraliz := .T.
    Local bBlocoIni  := {||}
    Local cJanTitulo := "Tela usando TDialog 02"
    Local nCorFundo  := "7700FF"

    //Cria a dialog
    oDlgAux := TDialog():New(0, 0, nJanAltu, nJanLarg, cJanTitulo, , , , , , nCorFundo, , , lDimPixels)

    //Ativa e exibe a janela
    oDlgAux:Activate(, , , lCentraliz, , , bBlocoIni)
Return

Static Function fDialogFW()
    Local oDlgAux
    Local nJanAltu   := 100
    Local nJanLarg   := 200
    Local bBlocoTst  := {|| FWAlertInfo("Clicou no botão escrito 'Teste'", "Botão Teste")}
    Local cJanTitulo := "Tela usando FWDialogModal 02"

    //Instancia a classe, criando uma janela
    oDlgAux := FWDialogModal():New()
    oDlgAux:SetTitle(cJanTitulo)
    oDlgAux:SetSize(nJanAltu, nJanLarg)
    oDlgAux:EnableFormBar(.T.)
    oDlgAux:CreateDialog()
    oDlgAux:CreateFormBar()
    oDlgAux:AddButton("Teste", bBlocoTst, "Teste", , .T., .F., .T., )

    //Aqui antes de abrir a tela, caso você queira usar essa classe, pode usar o método oDlgAux:GetPanelMain()
    //   e instanciar os objetos apontando para esse painel
    oDlgAux:Activate()
Return
