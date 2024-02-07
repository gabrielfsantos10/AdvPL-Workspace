//Bibliotecas
#Include 'TOTVS.ch'
#Include 'FWMVCDef.ch'
 
/*---- AxCadastro do MVC - Modelo 2 - 1 tabela com 2 grids ------------*/ 
 
Static cTitulo    := "Pedidos de Compra"
Static cCamposChv := "C7_NUM"
 
 
User Function xMVC04()
 
    Local aArea  := GetArea()    
    Local oBrowse
 
    oBrowse := FWMBrowse():New()
    oBrowse:SetAlias("SC7")
    oBrowse:SetDescription(cTitulo)
    oBrowse:Activate()
 
    RestArea(aArea)
 
Return Nil
 
Static Function MenuDef()
 
    Local aRotina := {}
 
    ADD OPTION aRotina TITLE "Visualizar" ACTION "VIEWDEF.xMVC04" OPERATION 1 ACCESS 0
    ADD OPTION aRotina TITLE "Incluir"    ACTION "VIEWDEF.xMVC04" OPERATION 2 ACCESS 0  
    ADD OPTION aRotina TITLE "Alterar"    ACTION "VIEWDEF.xMVC04" OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE "Excluir"    ACTION "VIEWDEF.xMVC04" OPERATION 5 ACCESS 0
 
Return aRotina
 
Static Function ModelDef()
 
    Local oModel      := NIL    
    Local oStruCab    := FWFormStruct(1, 'SC7' ,{|cCampo| Alltrim(cCampo) $ cCamposChv})
    Local oStruGrid   := fModStruct() //FWFormStruct(1, 'SC7')
 
    oModel := MPFormModel():New('xMVC04M')
 
    oModel:AddFields('MdFieldSC7', NIL , oStruCab)
    oModel:AddGrid('MdGridSC7', 'MdFieldSC7' , oStruGrid, ,)
 
 
    oModel:SetRelation('MdGridSC7', {;
                       {'C7_FILIAL', 'xFilial("SC7")'},;
                       {'C7_ITEM','C7_ITEM'};
                       }, SC7->(IndexKey(1)))
 
 
    //oModel:SetRelation("MdGridSC7",{{"C7_FILIAL","xFilial('SC7')"},{"C7_ITEM","C7_ITEM"}},SC7->(IndexKey(1)))
 
 
    oModel:GetModel("MdGridSC7"):SetMaxLine(9999)    
    oModel:SetDescription("Pedidos de Venda")
    oModel:SetPrimaryKey({"C7_FILIAL", "C7_NUM"})
 
Return oModel
 
Static Function ViewDef()
 
    Local oView     := NIL
    Local oModel    := FWLoadModel('xMVC04')
    Local oStruCab  := FWFormStruct(2, "SC7" , {|cCampo| Alltrim(cCampo) $ cCamposChv} )
    Local oStruGrid := fViewStruct() //FWFormStruct(2, "SC7", {|cCampo| !(Alltrim(cCampo) $ cCamposChv)})
 
    oStruCab:SetNoFolder()
 
    oView:= FWFormView():New()
    oView:SetModel(oModel)
 
    oView:AddField('VIEW_SC7', oStruCab , 'MdFieldSC7')   
    oView:AddGrid('GRID_SC7', oStruGrid , 'MdGridSC7')
 
    oView:CreateHorizontalBox('TELA', 25)
    oView:CreateHorizontalBox('GRID', 75)
 
    oView:SetOwnerView('VIEW_SC7', 'TELA')
    oView:SetOwnerView('GRID_SC7', 'GRID')
    oView:EnableControlBar(.T.)
 
    oView:AddIncrementField('GRID_SC7', 'C7_ITEM')
 
Return oView
 
 
 
//Função chamada para montar o modelo de dados da Grid (retorna todos os campos)
Static Function fModStruct()
    Local oStruct
    oStruct := FWFormStruct(1, 'SC7')
Return oStruct
 
//Função chamada para montar a visualização de dados da Grid (retorna os campos, excetuando os campos chave)
Static Function fViewStruct()
    Local oStruct
    oStruct := FWFormStruct(2, "SC7", {|cCampo| !(Alltrim(cCampo) $ cCamposChv)})
Return oStruct
