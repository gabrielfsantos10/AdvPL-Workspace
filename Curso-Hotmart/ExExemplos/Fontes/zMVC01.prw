//Bibliotecas
#Include "Totvs.ch"
#Include "FWMVCDef.ch"
#INCLUDE 'FWBrowse.ch'

//Variveis Estaticas
Static cTitulo := "TABELA"
Static cAliasMVC := "SZ9"


User Function zMVC01()
	Local aArea   := GetArea()
	Local oBrowse
	Private aRotina := {}

	//Definicao do menu
	aRotina := MenuDef()

	//Instanciando o browse
	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias(cAliasMVC)
	oBrowse:SetDescription(cTitulo)
	oBrowse:DisableDetails()

	//Ativa a Browse
	oBrowse:Activate()

	RestArea(aArea)
Return Nil


Static Function MenuDef()
	Local aRotina := {}

	//Adicionando opcoes do menu
	ADD OPTION aRotina TITLE "Visualizar" ACTION "VIEWDEF.zMVC01" OPERATION 1 ACCESS 0
	ADD OPTION aRotina TITLE "Incluir" ACTION "VIEWDEF.zMVC01" OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE "Alterar" ACTION "VIEWDEF.zMVC01" OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE "Excluir" ACTION "VIEWDEF.zMVC01" OPERATION 5 ACCESS 0

Return aRotina

User Function z01Menu()
Return MenuDef()


Static Function ModelDef()
	Local oStruct := FWFormStruct(1, cAliasMVC)
	Local oModel
	Local bPre := Nil
	Local bPos := Nil
	Local bCommit := Nil
	Local bCancel := Nil


	//Cria o modelo de dados para cadastro
	oModel := MPFormModel():New("zMVC01M", bPre, bPos, bCommit, bCancel)
	oModel:AddFields("FORMSZ9", /*cOwner*/, oStruct)
	oModel:SetDescription("Modelo de dados - " + cTitulo)
	oModel:GetModel("FORMSZ9"):SetDescription( "Dados de - " + cTitulo)
	oModel:SetPrimaryKey({})
Return oModel

User Function z01Model()
Return ModelDef()


Static Function ViewDef()
	Local oModel := FWLoadModel("zMVC01")
	Local oStruct := FWFormStruct(2, cAliasMVC)
	Local oView

	//Cria a visualizacao do cadastro
	oView := FWFormView():New()
	oView:SetModel(oModel)
	oView:AddField("VIEWSZ9", oStruct, "FORMSZ9")
	oView:CreateHorizontalBox("TELA" , 100 )
	oView:SetOwnerView("VIEWSZ9", "TELA")

Return oView
