#INCLUDE "Protheus.ch"
#INCLUDE "FwMvcDef.ch"


//User Function Principal
User Function MVCZA2()
    Local oBrowse := FwLoadBrw("MVCZA2")

    oBrowse:Activate()
    
Return


//Responsável por criar o Browse(Tela inicial)
Static Function BrowseDef()
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias("ZA2")
    oBrowse:SetDescription("Tela MVC - MODELO 01 - CADASTRO DE VEÍCULOS")

    oBrowse:SetOnlyField({"ZA2_MARCA", "ZA2_MODELO", "ZA2_FABRI", "ZA2_MOTOR", "ZA2_COR", "ZA2_PLACA", "ZA2_VALOR"})

    //Oculta detalhes inferiores
    // oBrowse:DisableDetails()

    oBrowse:Activate()

Return oBrowse


//Responsável pela camada de controle, botões como: "Incluir", "Alterar", "Visualizar" e etc
Static Function MenuDef()
    Local aMenu := {}

    //configura a opção do menu e chama a viewdef.nomeDaUserFunction
    ADD OPTION aMenu TITLE "Pesquisar"  ACTION "PesqBrw" OPERATION 1 ACCESS 0
    ADD OPTION aMenu TITLE "Incluir"    ACTION "VIEWDEF.MVCZA2" OPERATION 3 ACCESS 0
    ADD OPTION aMenu TITLE "Alterar"    ACTION "VIEWDEF.MVCZA2" OPERATION 4 ACCESS 0
    ADD OPTION aMenu TITLE "Excluir"    ACTION "VIEWDEF.MVCZA2" OPERATION 5 ACCESS 0
    ADD OPTION aMenu TITLE "Visualizar" ACTION "VIEWDEF.MVCZA2" OPERATION 2 ACCESS 0
    ADD OPTION aMenu TITLE "Copiar"     ACTION "VIEWDEF.MVCZA2" OPERATION 9 ACCESS 0
    ADD OPTION aMenu TITLE "Imprimir"   ACTION "VIEWDEF.MVCZA2" OPERATION 8 ACCESS 0

Return aMenu


//Responsável pela camada de modelo de dados
Static Function ModelDef()
    Local oModel     := NIL
    Local oStructZA2 := FWFormStruct(1, "ZA2")

    oModel := MPFormModel():New("MVCZA2M", /*bPre*/, /*bPos*/, /*bCommit*/, /*bCancel*/)

    oModel:AddFields("FORMZA2", ,oStructZA2)

    oModel:SetPrimaryKey({"ZA2_FILIAL", "ZA2_MARCA"})

    oModel:SetDescription("Modelo de dados - MVCZA2")

    oModel:GetModel("FORMZA2"):SetDescription("Formulário de cadastro - ZA2")
Return oModel


//Responsável pela camada de visão (O que é exibido na tela)
Static Function ViewDef()
    Local oView      := NIL
    Local oModel     := FWLoadModel("MVCZA2")
    Local oStructZA2 := FWFormStruct(2, "ZA2")

    oView := FWFormView():New()

    //Passando o modelo de dados para a visão, assim trabalhando juntos
    oView:SetModel(oModel)

    oView:AddField("VIEWZA2", oStructZA2, "FORMZA2")

    //Criando uma caixa horizontal, ocupando 100% da tela
    oView:CreateHorizontalBox("TELAZA2", 100)

    oView:EnableTitleView("VIEWZA2", "VISUALIZAÇÃO COM MVC")

    oView:SetCloseOnOk({|| .T.})

    oView:SetOwnerView("VIEWZA2", "TELAZA2")

Return oView
