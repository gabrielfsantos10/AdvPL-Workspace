#INCLUDE "Protheus.ch"
#INCLUDE "FwMvcDef.ch"


//User Function Principal
User Function MVCZY1()
    Local oBrowse := FwLoadBrw("MVCZY1")

    oBrowse:Activate()
    
Return


//Responsável por criar o Browse(Tela inicial)
Static Function BrowseDef()
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias("ZY1")
    oBrowse:SetDescription("Tela MVC - MODELO 01 - CADASTRO DE JOGOS")

    oBrowse:SetOnlyField({"ZY1_CODJG", "ZY1_TITULO", "ZY1_PLATAF", "ZY1_GENERO", "ZY1_CLASS", "ZY1_DESENV", "ZY1_ANOLAN", "ZY1_PRCVEN"})

    //Oculta detalhes inferiores
    // oBrowse:DisableDetails()

    oBrowse:Activate()

Return oBrowse


//Responsável pela camada de controle, botões como: "Incluir", "Alterar", "Visualizar" e etc
Static Function MenuDef()
    Local aMenu := {}

    //configura a opção do menu e chama a viewdef.nomeDaUserFunction
    ADD OPTION aMenu TITLE "Pesquisar"  ACTION "PesqBrw" OPERATION 1 ACCESS 0
    ADD OPTION aMenu TITLE "Incluir"    ACTION "VIEWDEF.MVCZY1" OPERATION 3 ACCESS 0
    ADD OPTION aMenu TITLE "Alterar"    ACTION "VIEWDEF.MVCZY1" OPERATION 4 ACCESS 0
    ADD OPTION aMenu TITLE "Excluir"    ACTION "VIEWDEF.MVCZY1" OPERATION 5 ACCESS 0
    ADD OPTION aMenu TITLE "Visualizar" ACTION "VIEWDEF.MVCZY1" OPERATION 2 ACCESS 0
    ADD OPTION aMenu TITLE "Copiar"     ACTION "VIEWDEF.MVCZY1" OPERATION 9 ACCESS 0
    ADD OPTION aMenu TITLE "Imprimir"   ACTION "VIEWDEF.MVCZY1" OPERATION 8 ACCESS 0

Return aMenu


//Responsável pela camada de modelo de dados
Static Function ModelDef()
    Local oModel     := NIL
    Local oStructZY1 := FWFormStruct(1, "ZY1")

    oModel := MPFormModel():New("MVCZY1M", /*bPre*/, /*bPos*/, /*bCommit*/, /*bCancel*/)

    oModel:AddFields("FORMZY1", ,oStructZY1)

    oModel:SetPrimaryKey({"ZY1_FILIAL", "ZY1_CODJG"})

    oModel:SetDescription("Modelo de dados - MVCZY1")

    oModel:GetModel("FORMZY1"):SetDescription("Formulário de cadastro - ZY1")
Return oModel


//Responsável pela camada de visão (O que é exibido na tela)
Static Function ViewDef()
    Local oView      := NIL
    Local oModel     := FWLoadModel("MVCZY1")
    Local oStructZY1 := FWFormStruct(2, "ZY1")

    oView := FWFormView():New()

    //Passando o modelo de dados para a visão, assim trabalhando juntos
    oView:SetModel(oModel)

    oView:AddField("VIEWZY1", oStructZY1, "FORMZY1")

    //Criando uma caixa horizontal, ocupando 100% da tela
    oView:CreateHorizontalBox("TELAZY1", 100)

    oView:EnableTitleView("VIEWZY1", "VISUALIZAÇÃO COM MVC")

    oView:SetCloseOnOk({|| .T.})

    oView:SetOwnerView("VIEWZY1", "TELAZY1")

Return oView
