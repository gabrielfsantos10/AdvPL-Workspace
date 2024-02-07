#INCLUDE "Protheus.ch"
#INCLUDE "FwMvcDef.ch"


//User Function Principal
User Function MVCCAD()
    Local oBrowse := FwLoadBrw("MVCCAD")

    oBrowse:Activate()
    
Return


//Respons�vel por criar o Browse(Tela inicial)
Static Function BrowseDef()
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias("SZ9")
    oBrowse:SetDescription("Tela MVC - MODELO 1 - CADASTRO TABELA SZ9")

    //Legenda
    oBrowse:AddLegend("SZ9->Z9_STATUS  ==  '1'", "GREEN", "Cadastro Ativo")
    oBrowse:AddLegend("SZ9->Z9_STATUS  ==  '2'", "RED", "Cadastro Inativo")

    oBrowse:SetOnlyField({"Z9_CODIGO", "Z9_NOME", "Z9_SEXO", "Z9_STATUS"})

    //Oculta detalhes inferiores
    oBrowse:DisableDetails()

    oBrowse:Activate()

Return oBrowse


//Respons�vel pela camada de controle
Static Function MenuDef()
    Local aMenu := {}

    //configura a op��o do menu e chama a viewdef.nomeDaUserFunction
    ADD OPTION aMenu TITLE "Pesquisar"  ACTION "PesqBrw" OPERATION 1 ACCESS 0
    ADD OPTION aMenu TITLE "Visualizar" ACTION "VIEWDEF.MVCCAD" OPERATION 2 ACCESS 0
    ADD OPTION aMenu TITLE "Incluir"    ACTION "VIEWDEF.MVCCAD" OPERATION 3 ACCESS 0
    ADD OPTION aMenu TITLE "Alterar"    ACTION "VIEWDEF.MVCCAD" OPERATION 4 ACCESS 0
    ADD OPTION aMenu TITLE "Excluir"    ACTION "VIEWDEF.MVCCAD" OPERATION 5 ACCESS 0
    ADD OPTION aMenu TITLE "Copiar"     ACTION "VIEWDEF.MVCCAD" OPERATION 9 ACCESS 0
    ADD OPTION aMenu TITLE "Imprimir"   ACTION "VIEWDEF.MVCCAD" OPERATION 8 ACCESS 0

Return aMenu


//Respons�vel pela camada de modelo de dados
Static Function ModelDef()
    Local oModel     := NIL
    Local oStructSZ9 := FWFormStruct(1, "SZ9")

    oModel := MPFormModel():New("MVCCADM", /*bPre*/, /*bPos*/, /*bCommit*/, /*bCancel*/)

    oModel:AddFields("FORMSZ9", ,oStructSZ9)

    oModel:SetPrimaryKey({"Z9_FILIAL", "Z9_CODIGO"})

    oModel:SetDescription("Modelo de dados MVCCAD")

    oModel:GetModel("FORMSZ9"):SetDescription("Formul�rio de cadastro SZ9")
Return oModel


//Respons�vel pela camada de vis�o (O que � exibido na tela)
Static Function ViewDef()
    Local oView      := NIL
    Local oModel     := FWLoadModel("MVCCAD")
    Local oStructSZ9 := FWFormStruct(2, "SZ9")

    oView := FWFormView():New()

    //Passando o modelo de dados para a vis�o, assim trabalhando juntos
    oView:SetModel(oModel)

    oView:AddField("VIEWSZ9", oStructSZ9, "FORMSZ9")

    //Criando uma caixa horizontal, ocupando 100% da tela
    oView:CreateHorizontalBox("TELASZ9", 100)

    oView:EnableTitleView("VIEWSZ9", "VISUALIZA��O COM MVC")

    oView:SetCloseOnOk({|| .T.})

    oView:SetOwnerView("VIEWSZ9", "TELASZ9")

Return oView
