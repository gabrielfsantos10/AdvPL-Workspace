#INCLUDE "Protheus.ch"
#INCLUDE "FwMvcDef.ch"


//User Function Principal
User Function MVCATR()
    Local oBrowse := FwLoadBrw("MVCATR")

    oBrowse:Activate()
    
Return


//Responsável por criar o Browse(Tela inicial)
Static Function BrowseDef()
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias("ZZ2")
    oBrowse:SetDescription("MVC - CADASTRO DE ATORES")

    //Legenda
    // oBrowse:AddLegend("ZZ2->ZZ2_COD",)

    oBrowse:SetOnlyField({"ZZ2_NOME", "ZZ2_IDADE", "ZZ2_SEXO", "ZZ2_NACION"})

    //Oculta detalhes inferiores
    oBrowse:DisableDetails()

    oBrowse:Activate()

Return oBrowse


//Responsável pela camada de controle
Static Function MenuDef()
    Local aMenu := {}

    //configura a opção do menu e chama a viewdef.nomeDaUserFunction
    ADD OPTION aMenu TITLE "Pesquisar"  ACTION "PesqBrw" OPERATION 1 ACCESS 0
    ADD OPTION aMenu TITLE "Visualizar" ACTION "VIEWDEF.MVCATR" OPERATION 2 ACCESS 0
    ADD OPTION aMenu TITLE "Incluir"    ACTION "VIEWDEF.MVCATR" OPERATION 3 ACCESS 0
    ADD OPTION aMenu TITLE "Alterar"    ACTION "VIEWDEF.MVCATR" OPERATION 4 ACCESS 0
    ADD OPTION aMenu TITLE "Excluir"    ACTION "VIEWDEF.MVCATR" OPERATION 5 ACCESS 0
    ADD OPTION aMenu TITLE "Copiar"     ACTION "VIEWDEF.MVCATR" OPERATION 9 ACCESS 0
    ADD OPTION aMenu TITLE "Imprimir"   ACTION "VIEWDEF.MVCATR" OPERATION 8 ACCESS 0

Return aMenu


//Responsável pela camada de modelo de dados
Static Function ModelDef()
    Local oModel     := NIL
    Local oStructZZ2 := FWFormStruct(1, "ZZ2")

    oModel := MPFormModel():New("MVCATRM", /*bPre*/, /*bPos*/, /*bCommit*/, /*bCancel*/)

    oModel:AddFields("FORMZZ2", ,oStructZZ2)

    oModel:SetPrimaryKey({"ZZ2_FILIAL", "ZZ2_COD"})

    oModel:SetDescription("Modelo de dados MVCATR")

    oModel:GetModel("FORMZZ2"):SetDescription("Formulário de cadastro ZZ2")
Return oModel


//Responsável pela camada de visão (O que é exibido na tela)
Static Function ViewDef()
    Local oView      := NIL
    Local oModel     := FWLoadModel("MVCATR")
    Local oStructZZ2 := FWFormStruct(2, "ZZ2")

    oView := FWFormView():New()

    //Passando o modelo de dados para a visão, assim trabalhando juntos
    oView:SetModel(oModel)

    oView:AddField("VIEWZZ2", oStructZZ2, "FORMZZ2")

    //Criando uma caixa horizontal, ocupando 100% da tela
    oView:CreateHorizontalBox("TELAZZ2", 100)

    oView:EnableTitleView("VIEWZZ2", "VISUALIZAÇÃO COM MVC")

    oView:SetCloseOnOk({|| .T.})

    oView:SetOwnerView("VIEWZZ2", "TELAZZ2")

Return oView
