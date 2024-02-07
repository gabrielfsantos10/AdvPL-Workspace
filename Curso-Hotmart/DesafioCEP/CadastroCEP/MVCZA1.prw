#INCLUDE "Protheus.ch"
#INCLUDE "FwMvcDef.ch"


//User Function Principal
User Function MVCZA1()
    Local oBrowse := FwLoadBrw("MVCZA1")

    oBrowse:Activate()
    
Return


//Respons�vel por criar o Browse(Tela inicial)
Static Function BrowseDef()
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias("ZA1")
    oBrowse:SetDescription("Tela MVC - MODELO 01 - CADASTRO DE ENDERE�OS")

    oBrowse:SetOnlyField({"ZA1_COD", "ZA1_CEP", "ZA1_LOGRA", "ZA1_COMPL", "ZA1_BAIRRO", "ZA1_LOCALI", "ZA1_UF", "ZA1_CLIENT"})

    //Oculta detalhes inferiores
    // oBrowse:DisableDetails()

    oBrowse:Activate()

Return oBrowse


//Respons�vel pela camada de controle, bot�es como: "Incluir", "Alterar", "Visualizar" e etc
Static Function MenuDef()
    Local aMenu := {}

    //configura a op��o do menu e chama a viewdef.nomeDaUserFunction
    ADD OPTION aMenu TITLE "Pesquisar"  ACTION "PesqBrw" OPERATION 1 ACCESS 0
    ADD OPTION aMenu TITLE "Incluir"    ACTION "VIEWDEF.MVCZA1" OPERATION 3 ACCESS 0
    ADD OPTION aMenu TITLE "Alterar"    ACTION "VIEWDEF.MVCZA1" OPERATION 4 ACCESS 0
    ADD OPTION aMenu TITLE "Excluir"    ACTION "VIEWDEF.MVCZA1" OPERATION 5 ACCESS 0
    ADD OPTION aMenu TITLE "Visualizar" ACTION "VIEWDEF.MVCZA1" OPERATION 2 ACCESS 0
    ADD OPTION aMenu TITLE "Copiar"     ACTION "VIEWDEF.MVCZA1" OPERATION 9 ACCESS 0
    ADD OPTION aMenu TITLE "Imprimir"   ACTION "VIEWDEF.MVCZA1" OPERATION 8 ACCESS 0

Return aMenu


//Respons�vel pela camada de modelo de dados
Static Function ModelDef()
    Local oModel     := NIL
    Local oStructZA1 := FWFormStruct(1, "ZA1")

    oModel := MPFormModel():New("MVCZA1M", /*bPre*/, /*bPos*/, /*bCommit*/, /*bCancel*/)

    oModel:AddFields("FORMZA1", ,oStructZA1)

    oModel:SetPrimaryKey({"ZA1_FILIAL", "ZA1_CODIGO"})

    oModel:SetDescription("Modelo de dados - MVCZA1")

    oModel:GetModel("FORMZA1"):SetDescription("Formul�rio de cadastro - ZA1")
Return oModel


//Respons�vel pela camada de vis�o (O que � exibido na tela)
Static Function ViewDef()
    Local oView      := NIL
    Local oModel     := FWLoadModel("MVCZA1")
    Local oStructZA1 := FWFormStruct(2, "ZA1")

    oView := FWFormView():New()

    //Passando o modelo de dados para a vis�o, assim trabalhando juntos
    oView:SetModel(oModel)

    oView:AddField("VIEWZA1", oStructZA1, "FORMZA1")

    //Criando uma caixa horizontal, ocupando 100% da tela
    oView:CreateHorizontalBox("TELAZA1", 100)

    oView:EnableTitleView("VIEWZA1", "VISUALIZA��O COM MVC")

    oView:SetCloseOnOk({|| .T.})

    oView:SetOwnerView("VIEWZA1", "TELAZA1")

Return oView
