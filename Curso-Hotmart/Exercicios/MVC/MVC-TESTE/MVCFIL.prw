#INCLUDE "Protheus.ch"
#INCLUDE "FwMvcDef.ch"


//User Function Principal
User Function MVCFIL()
    Local oBrowse := FwLoadBrw("MVCFIL")

    oBrowse:Activate()
    
Return


//Respons�vel por criar o Browse(Tela inicial)
Static Function BrowseDef()
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias("ZZ1")
    oBrowse:SetDescription("MVC - CADASTRO DE FILMES")

    //Legenda
    // oBrowse:AddLegend("ZZ1->ZZ1_COD",)

    oBrowse:SetOnlyField({"ZZ1_COD", "ZZ1_NOME", "ZZ1_GENERO", "ZZ1_ANOLCT"})

    //Oculta detalhes inferiores
    oBrowse:DisableDetails()

    oBrowse:Activate()

Return oBrowse


//Respons�vel pela camada de controle
Static Function MenuDef()
    Local aMenu := {}

    //configura a op��o do menu e chama a viewdef.nomeDaUserFunction
    ADD OPTION aMenu TITLE "Pesquisar"  ACTION "PesqBrw" OPERATION 1 ACCESS 0
    ADD OPTION aMenu TITLE "Visualizar" ACTION "VIEWDEF.MVCFIL" OPERATION 2 ACCESS 0
    ADD OPTION aMenu TITLE "Incluir"    ACTION "VIEWDEF.MVCFIL" OPERATION 3 ACCESS 0
    ADD OPTION aMenu TITLE "Alterar"    ACTION "VIEWDEF.MVCFIL" OPERATION 4 ACCESS 0
    ADD OPTION aMenu TITLE "Excluir"    ACTION "VIEWDEF.MVCFIL" OPERATION 5 ACCESS 0
    ADD OPTION aMenu TITLE "Copiar"     ACTION "VIEWDEF.MVCFIL" OPERATION 9 ACCESS 0
    ADD OPTION aMenu TITLE "Imprimir"   ACTION "VIEWDEF.MVCFIL" OPERATION 8 ACCESS 0

Return aMenu


//Respons�vel pela camada de modelo de dados
Static Function ModelDef()
    Local oModel     := NIL
    Local oStructZZ1 := FWFormStruct(1, "ZZ1")

    oModel := MPFormModel():New("MVCFILM", /*bPre*/, /*bPos*/, /*bCommit*/, /*bCancel*/)

    oModel:AddFields("FORMZZ1", ,oStructZZ1)

    oModel:SetPrimaryKey({"ZZ1_FILIAL", "ZZ1_COD"})

    oModel:SetDescription("Modelo de dados MVCFIL")

    oModel:GetModel("FORMZZ1"):SetDescription("Formul�rio de cadastro ZZ1")
Return oModel


//Respons�vel pela camada de vis�o (O que � exibido na tela)
Static Function ViewDef()
    Local oView      := NIL
    Local oModel     := FWLoadModel("MVCFIL")
    Local oStructZZ1 := FWFormStruct(2, "ZZ1")

    oView := FWFormView():New()

    //Passando o modelo de dados para a vis�o, assim trabalhando juntos
    oView:SetModel(oModel)

    oView:AddField("VIEWZZ1", oStructZZ1, "FORMZZ1")

    //Criando uma caixa horizontal, ocupando 100% da tela
    oView:CreateHorizontalBox("TELAZZ1", 100)

    oView:EnableTitleView("VIEWZZ1", "VISUALIZA��O COM MVC")

    oView:SetCloseOnOk({|| .T.})

    oView:SetOwnerView("VIEWZZ1", "TELAZZ1")

Return oView
