//Bibliotecas
#Include "Totvs.ch"
#Include "FWMVCDef.ch"

//Variveis Estaticas
Static cTitulo := "Cadastro de Atores"
Static cTabPai := "ZZ1"
Static cTabFilho := "ZZ2"


User Function MVCATO()
	Local aArea   := GetArea()
	Local oBrowse
	Private aRotina := {}

	//Definicao do menu
	aRotina := MenuDef()

	//Instanciando o browse
	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias(cTabPai)
	oBrowse:SetDescription(cTitulo)
	oBrowse:DisableDetails()

	//Ativa a Browse
	oBrowse:Activate()

	RestArea(aArea)
Return Nil


Static Function MenuDef()
	Local aRotina := {}

	//Adicionando opcoes do menu
	ADD OPTION aRotina TITLE "Visualizar" ACTION "VIEWDEF.MVCATO" OPERATION 1 ACCESS 0
	ADD OPTION aRotina TITLE "Incluir" ACTION "VIEWDEF.MVCATO" OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE "Alterar" ACTION "VIEWDEF.MVCATO" OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE "Excluir" ACTION "VIEWDEF.MVCATO" OPERATION 5 ACCESS 0

Return aRotina

User Function MVCATO2()
Return MenuDef()


Static Function ModelDef()
	Local oStruPai := FWFormStruct(1, cTabPai)
	Local oStruFilho := FWFormStruct(1, cTabFilho)
	Local aRelation := {}
	Local oModel
	Local bPre := Nil
	Local bPos := Nil
	Local bCommit := Nil
	Local bCancel := Nil


	//Cria o modelo de dados para cadastro
	oModel := MPFormModel():New("MVCATO2M", bPre, bPos, bCommit, bCancel)
	oModel:AddFields("ZZ2MASTER", /*cOwner*/, oStruPai)
	oModel:AddGrid("ZZ2DETAIL","ZZ2MASTER",oStruFilho,/*bLinePre*/, /*bLinePost*/,/*bPre - Grid Inteiro*/,/*bPos - Grid Inteiro*/,/*bLoad - Carga do modelo manualmente*/)
	oModel:SetDescription("Modelo de dados - " + cTitulo)
	oModel:GetModel("ZZ2MASTER"):SetDescription( "Dados de - " + cTitulo)
	oModel:GetModel("ZZ2DETAIL"):SetDescription( "Grid de - " + cTitulo)
	oModel:SetPrimaryKey({})

	//Fazendo o relacionamento
	aAdd(aRelation, {"ZZ2_FILIAL", "FWxFilial('ZZ2')"} )
	aAdd(aRelation, {"ZZ2_CD", "ZZ2_CD"})
	oModel:SetRelation("ZZ2DETAIL", aRelation, ZZ2->(IndexKey(1)))
	
	//Definindo campos unicos da linha
	oModel:GetModel("ZZ2DETAIL"):SetUniqueLine({'ZZ2_MUSICA'})

Return oModel


Static Function ViewDef()
	Local oModel := FWLoadModel("MVCATO2")
	Local oStruPai := FWFormStruct(2, cTabPai)
	Local oStruFilho := FWFormStruct(2, cTabFilho)
	Local oView

	//Cria a visualizacao do cadastro
	oView := FWFormView():New()
	oView:SetModel(oModel)
	oView:AddField("VIEW_ZZ2", oStruPai, "ZZ2MASTER")
	oView:AddGrid("VIEW_ZZ2",  oStruFilho,  "ZZ2DETAIL")

	//Partes da tela
	oView:CreateHorizontalBox("CABEC", 30)
	oView:CreateHorizontalBox("GRID", 70)
	oView:SetOwnerView("VIEW_ZZ2", "CABEC")
	oView:SetOwnerView("VIEW_ZZ2", "GRID")

	//Titulos
	oView:EnableTitleView("VIEW_ZZ2", "Cabecalho - ZZ2 (CDs)")
	oView:EnableTitleView("VIEW_ZZ2", "Grid - ZZ2 (Musicas dos CDs)")

	//Removendo campos
	oStruFilho:RemoveField("ZZ2_CD")

	//Adicionando campo incremental na grid
	oView:AddIncrementField("VIEW_ZZ2", "ZZ2_ITEM")

Return oView
