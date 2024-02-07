//Bibliotecas
#Include "Totvs.ch"
#Include "FWMVCDef.ch"

//Variveis Estaticas
Static cTitulo := "Teste de Cadastro"
Static cAliasMVC := "SZ9"

User Function zCFG01()
	Local aArea   := FWGetArea()
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

	FWRestArea(aArea)
Return Nil


Static Function MenuDef()
	Local aRotina := {}

	//Adicionando opcoes do menu
	ADD OPTION aRotina TITLE "Visualizar" ACTION "VIEWDEF.zCFG01" OPERATION 1 ACCESS 0
	ADD OPTION aRotina TITLE "Incluir" ACTION "VIEWDEF.zCFG01" OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE "Alterar" ACTION "VIEWDEF.zCFG01" OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE "Excluir" ACTION "VIEWDEF.zCFG01" OPERATION 5 ACCESS 0
	ADD OPTION aRotina TITLE "Copiar" ACTION "VIEWDEF.zCFG01" OPERATION 9 ACCESS 0

Return aRotina


Static Function ModelDef()
	Local oStruct := FWFormStruct(1, cAliasMVC)
	Local oModel
	Local bPre := Nil
	Local bPos := Nil
	Local bCancel := Nil

	//Cria o modelo de dados para cadastro
	oModel := MPFormModel():New("zCFG01M", bPre, bPos, /*bCommit*/, bCancel)
	oModel:AddFields("SZ9MASTER", /*cOwner*/, oStruct)
	oModel:SetDescription("Modelo de dados - " + cTitulo)
	oModel:GetModel("SZ9MASTER"):SetDescription( "Dados de - " + cTitulo)
	oModel:SetPrimaryKey({})
Return oModel


Static Function ViewDef()
	Local oModel := FWLoadModel("zCFG01")
	Local oStruct := FWFormStruct(2, cAliasMVC)
	Local oView

	//Cria a visualizacao do cadastro
	oView := FWFormView():New()
	oView:SetModel(oModel)
	oView:AddField("VIEW_SZ9", oStruct, "SZ9MASTER")
	oView:CreateHorizontalBox("TELA" , 100 )
	oView:SetOwnerView("VIEW_SZ9", "TELA")

Return oView
