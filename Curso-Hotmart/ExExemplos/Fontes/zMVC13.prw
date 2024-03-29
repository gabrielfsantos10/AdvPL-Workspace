//Bibliotecas
#Include "Totvs.ch"
#Include "FWMVCDef.ch"

//Variveis Estaticas
Static cTitulo := "Cadastro de CDs"
Static cTabPai := "ZD2"
Static cTabFilho := "ZD3"

/*/{Protheus.doc} User Function zMVC13
CDs (com valida��es no bPre, bPos, bCancel e bLinePos)
@author Daniel Atilio
@since 28/02/2022
@version 1.0
@type function
@obs Codigo gerado automaticamente pelo Autumn Code Maker
@see http://autumncodemaker.com
/*/

User Function zMVC13()
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

/*/{Protheus.doc} MenuDef
Menu de opcoes na funcao zMVC13
@author Daniel Atilio
@since 28/02/2022
@version 1.0
@type function
@obs Codigo gerado automaticamente pelo Autumn Code Maker
@see http://autumncodemaker.com
/*/

Static Function MenuDef()
	Local aRotina := {}

	//Adicionando opcoes do menu
	ADD OPTION aRotina TITLE "Visualizar" ACTION "VIEWDEF.zMVC13" OPERATION 1 ACCESS 0
	ADD OPTION aRotina TITLE "Incluir" ACTION "VIEWDEF.zMVC13" OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE "Alterar" ACTION "VIEWDEF.zMVC13" OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE "Excluir" ACTION "VIEWDEF.zMVC13" OPERATION 5 ACCESS 0

Return aRotina

/*/{Protheus.doc} ModelDef
Modelo de dados na funcao zMVC13
@author Daniel Atilio
@since 28/02/2022
@version 1.0
@type function
@obs Codigo gerado automaticamente pelo Autumn Code Maker
@see http://autumncodemaker.com
/*/

Static Function ModelDef()
	Local oStruPai := FWFormStruct(1, cTabPai)
	Local oStruFilho := FWFormStruct(1, cTabFilho)
	Local aRelation := {}
	Local oModel
	Local bPre := {|| u_z13bPre()}
	Local bPos := {|| u_z13bPos()}
	Local bCommit := Nil
	Local bCancel := Nil
    Local bLinePos := {|oMdl| u_z13bLinP(oModel)}

	//Cria o modelo de dados para cadastro
	oModel := MPFormModel():New("zMVC13M", bPre, bPos, bCommit, bCancel)
	oModel:AddFields("ZD2MASTER", /*cOwner*/, oStruPai)
	oModel:AddGrid("ZD3DETAIL","ZD2MASTER",oStruFilho,/*bLinePre*/, bLinePos,/*bPre - Grid Inteiro*/,/*bPos - Grid Inteiro*/,/*bLoad - Carga do modelo manualmente*/)
	oModel:SetDescription("Modelo de dados - " + cTitulo)
	oModel:GetModel("ZD2MASTER"):SetDescription( "Dados de - " + cTitulo)
	oModel:GetModel("ZD3DETAIL"):SetDescription( "Grid de - " + cTitulo)
	oModel:SetPrimaryKey({})

	//Fazendo o relacionamento
	aAdd(aRelation, {"ZD3_FILIAL", "FWxFilial('ZD3')"} )
	aAdd(aRelation, {"ZD3_CD", "ZD2_CD"})
	oModel:SetRelation("ZD3DETAIL", aRelation, ZD3->(IndexKey(1)))
	
	//Definindo campos unicos da linha
	oModel:GetModel("ZD3DETAIL"):SetUniqueLine({'ZD3_MUSICA'})

Return oModel

/*/{Protheus.doc} ViewDef
Visualizacao de dados na funcao zMVC13
@author Daniel Atilio
@since 28/02/2022
@version 1.0
@type function
@obs Codigo gerado automaticamente pelo Autumn Code Maker
@see http://autumncodemaker.com
/*/

Static Function ViewDef()
	Local oModel := FWLoadModel("zMVC13")
	Local oStruPai := FWFormStruct(2, cTabPai)
	Local oStruFilho := FWFormStruct(2, cTabFilho)
	Local oView

	//Cria a visualizacao do cadastro
	oView := FWFormView():New()
	oView:SetModel(oModel)
	oView:AddField("VIEW_ZD2", oStruPai, "ZD2MASTER")
	oView:AddGrid("VIEW_ZD3",  oStruFilho,  "ZD3DETAIL")

	//Partes da tela
	oView:CreateHorizontalBox("CABEC", 30)
	oView:CreateHorizontalBox("GRID", 70)
	oView:SetOwnerView("VIEW_ZD2", "CABEC")
	oView:SetOwnerView("VIEW_ZD3", "GRID")

	//Titulos
	oView:EnableTitleView("VIEW_ZD2", "Cabecalho - ZD2 (CDs)")
	oView:EnableTitleView("VIEW_ZD3", "Grid - ZD3 (Musicas dos CDs)")

	//Removendo campos
	oStruFilho:RemoveField("ZD3_CD")

	//Adicionando campo incremental na grid
	oView:AddIncrementField("VIEW_ZD3", "ZD3_ITEM")

Return oView

/*/{Protheus.doc} z13bPre
Fun��o chamada na cria��o do Modelo de Dados (pr�-valida��o)
@type function
@author Atilio
@since 28/02/2022
@version 1.0
/*/
 
User Function z13bPre()
    Local oModelPad  := FWModelActive()
    Local lRet       := .T.
     
    oModelPad:GetModel('ZD2MASTER'):GetStruct():SetProperty('ZD2_NOMECD',   MODEL_FIELD_WHEN,    FwBuildFeature(STRUCT_FEATURE_WHEN,    'INCLUI'))
Return lRet
 
/*/{Protheus.doc} z13bPos
Fun��o chamada no clique do bot�o Ok do Modelo de Dados (p�s-valida��o)
@type function
@author Atilio
@since 28/02/2022
@version 1.0
/*/
 
User Function z13bPos()
    Local oModelPad  := FWModelActive()
    Local cNomeCD    := oModelPad:GetValue('ZD2MASTER', 'ZD2_NOMECD')
    Local lRet       := .T.
     
    //Se o nome do CD estiver vazio
    If Empty(cNomeCD) .Or. Len(Alltrim(cNomeCD)) < 3
        Help(, , "Help", , "Nome do CD inv�lido!", 1, 0, , , , , , {"Insira um nome v�lido que tenha mais que 3 caracteres"})
        lRet := .F.
    EndIf
     
Return lRet

/*/{Protheus.doc} z13bLinP
Fun��o chamada ao trocar de linha na grid (bloco bLinePos)
@type function
@author Atilio
@since 28/02/2022
@version 1.0
/*/

User Function z13bLinP(oModel)
    Local oModelZD3  := oModel:GetModel('ZD3DETAIL')
    Local nOperation := oModel:GetOperation()
    Local lRet       := .T.
    Local cMusica    := oModelZD3:GetValue("ZD3_MUSICA")

    //Se n�o for exclus�o e nem visualiza��o
    If 	nOperation != MODEL_OPERATION_DELETE .And. nOperation != MODEL_OPERATION_VIEW

        //Se a m�sica tiver vazia, ou for menor que 3    
        If Empty(cMusica) .Or. Len(Alltrim(cMusica)) < 3
            Help(, , "Help", , "Nome da M�sica inv�lida!", 1, 0, , , , , , {"Insira um nome v�lido que tenha mais que 3 caracteres"})
            lRet := .F.
        EndIf
    EndIf

Return lRet
