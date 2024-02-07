//Bibliotecas
#Include "TOTVS.ch"
  
/*/{Protheus.doc} User Function zOO05
Demonstra��o de como usar matem�tica para criar telas
@type Function
@author Atilio
@since 28/05/2021
@version 1.0
@see https://terminaldeinformacao.com/2021/05/20/pulo-do-gato-para-criar-telas-em-advpl/
/*/
  
User Function zOO05()
    Local aArea := GetArea()
  
    fMontaTela()
  
    RestArea(aArea)
Return
  
Static Function fMontaTela()
    Local nLargBtn      := 50
    //Objetos e componentes
    Private oPanGrid
    Private oDlgPulo
    //Cabe�alho
    Private oSayModulo, cSayModulo := 'TST'
    Private oSayTitulo, cSayTitulo := 'Pulo do Gato na Montagem de Dialogs'
    Private oSaySubTit, cSaySubTit := 'Exemplo usando Matem�tica'
    //Tamanho da janela
    Private aSize := MsAdvSize(.F.)
    Private nJanLarg := aSize[5]
    Private nJanAltu := aSize[6]
    //Fontes
    Private cFontUti    := "Tahoma"
    Private oFontMod    := TFont():New(cFontUti, , -38)
    Private oFontSub    := TFont():New(cFontUti, , -20)
    Private oFontSubN   := TFont():New(cFontUti, , -20, , .T.)
    Private oFontBtn    := TFont():New(cFontUti, , -14)
    Private oFontSay    := TFont():New(cFontUti, , -12)
    //Grid
    Private aCampos := {}
    Private cAliasTmp := "TST_" + RetCodUsr()
    Private aColunas := {}
  
    //Campos da Tempor�ria
    aAdd(aCampos, { "CODIGO" , "C", TamSX3("BM_GRUPO")[1], 0 })
    aAdd(aCampos, { "DESCRI" , "C", TamSX3("BM_DESC")[1],  0 })
  
    //Cria a tabela tempor�ria
    oTempTable:= FWTemporaryTable():New(cAliasTmp)
    oTempTable:SetFields( aCampos )
    oTempTable:Create()
  
    //Busca as colunas do browse
    aColunas := fCriaCols()
  
    //Popula a tabela tempor�ria
    Processa({|| fPopula()}, "Processando...")
  
    //Cria a janela
    DEFINE MSDIALOG oDlgPulo TITLE "Exemplo de Pulo do Gato"  FROM 0, 0 TO nJanAltu, nJanLarg PIXEL
  
        //T�tulos e SubT�tulos
        oSayModulo := TSay():New(004, 003, {|| cSayModulo}, oDlgPulo, "", oFontMod,  , , , .T., RGB(149, 179, 215), , 200, 30, , , , , , .F., , )
        oSayTitulo := TSay():New(004, 045, {|| cSayTitulo}, oDlgPulo, "", oFontSub,  , , , .T., RGB(031, 073, 125), , 200, 30, , , , , , .F., , )
        oSaySubTit := TSay():New(014, 045, {|| cSaySubTit}, oDlgPulo, "", oFontSubN, , , , .T., RGB(031, 073, 125), , 300, 30, , , , , , .F., , )
  
        //Criando os bot�es
        oBtnSair := TButton():New(006, (nJanLarg/2-001)-((nLargBtn+2)*1), "Fechar",     oDlgPulo, {|| oDlgPulo:End()},  nLargBtn, 018, , oFontBtn, , .T., , , , , , )
  
        //Cria a grid
        oPanGrid := tPanel():New(027, 001, "", oDlgPulo, , , , RGB(000,000,000), RGB(254,254,254), (nJanLarg/2)-1, (nJanAltu/2)-3)
        oGetGrid := FWBrowse():New()
        oGetGrid:SetDataTable()
        oGetGrid:SetInsert(.F.)
        oGetGrid:SetDelete(.F., { || .F. })
        oGetGrid:SetAlias(cAliasTmp)
        oGetGrid:DisableReport()
        oGetGrid:DisableFilter()
        oGetGrid:DisableConfig()
        oGetGrid:DisableReport()
        oGetGrid:DisableSeek()
        oGetGrid:DisableSaveConfig()
        oGetGrid:SetFontBrowse(oFontSay)
        oGetGrid:SetColumns(aColunas)
        oGetGrid:SetOwner(oPanGrid)
        oGetGrid:Activate()
    Activate MsDialog oDlgPulo Centered
    oTempTable:Delete()
Return
  
Static Function fCriaCols()
    Local nAtual   := 0 
    Local aColunas := {}
    Local aEstrut  := {}
    Local oColumn
      
    //Adicionando campos que ser�o mostrados na tela
    //[1] - Campo da Temporaria
    //[2] - Titulo
    //[3] - Tipo
    //[4] - Tamanho
    //[5] - Decimais
    //[6] - M�scara
    aAdd(aEstrut, {"CODIGO", "C�digo",                "C", TamSX3('BM_GRUPO')[01],   0, ""})
    aAdd(aEstrut, {"DESCRI", "Descri��o",             "C", TamSX3('BM_DESC')[01],    0, ""})
  
    //Percorrendo todos os campos da estrutura
    For nAtual := 1 To Len(aEstrut)
        //Cria a coluna
        oColumn := FWBrwColumn():New()
        oColumn:SetData(&("{|| (cAliasTmp)->" + aEstrut[nAtual][1] +"}"))
        oColumn:SetTitle(aEstrut[nAtual][2])
        oColumn:SetType(aEstrut[nAtual][3])
        oColumn:SetSize(aEstrut[nAtual][4])
        oColumn:SetDecimal(aEstrut[nAtual][5])
        oColumn:SetPicture(aEstrut[nAtual][6])
        oColumn:bHeaderClick := &("{|| fOrdena('" + aEstrut[nAtual][1] + "') }")
  
        //Adiciona a coluna
        aAdd(aColunas, oColumn)
    Next
Return aColunas
  
Static Function fPopula()
    Local nAtual := 0
    Local nTotal := 0
  
    DbSelectArea("SBM")
    SBM->(DbSetOrder(1))
    SBM->(DbGoTop())
  
    //Define o tamanho da r�gua
    Count To nTotal
    ProcRegua(nTotal)
    SBM->(DbGoTop())
  
    //Enquanto houver itens
    While ! SBM->(EoF())
        //Incrementa a r�gua
        nAtual++
        IncProc("Adicionando registro " + cValToChar(nAtual) + " de " + cValToChar(nTotal) + "...")
  
        //Grava na tempor�ria
        RecLock(cAliasTmp, .T.)
            (cAliasTmp)->CODIGO := SBM->BM_GRUPO
            (cAliasTmp)->DESCRI := SBM->BM_DESC
        (cAliasTmp)->(MsUnlock())
  
        SBM->(DbSkip())
    EndDo
Return
