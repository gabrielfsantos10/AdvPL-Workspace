//Bibliotecas
#Include "TOTVS.ch"

User Function zT001()
    Local aArea := GetArea()
  
    fMontaTela()
  
    RestArea(aArea)
Return
  
Static Function fMontaTela()
    Local nLargBtn := 50
    Local cCssBtn  := ""

    //Objetos e componentes
    Private oPanGrid
    Private oDialogWindow
    Private oDlgAux
    
    //Cabeçalho
    Private oSayModulo, cSayModulo := 'PROJETOS'
    Private oSayTitulo, cSayTitulo := 'Cadastro, alteração e exclusão de projetos'
    Private oSaySubTit, cSaySubTit := 'Exemplo de criação de telas em AdvPL'
    
    //Tamanho da janela - RETORNA A ALTURA E LARGURA DISPONÍVEIS PARA SEREM UTILIZADOS
    // DESSA FORMA É GARANTIDO QUE A TELA SERÁ MONTADA CORRETAMENTE COM OS COMPONENTES
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
  
    //Campos da Temporária
    aAdd(aCampos, { "CODIGO" , "C", TamSX3("BM_GRUPO")[1], 0 })
    aAdd(aCampos, { "DESCRI" , "C", TamSX3("BM_DESC")[1],  0 })
  
    //Cria a tabela temporária
    oTempTable:= FWTemporaryTable():New(cAliasTmp)
    oTempTable:SetFields( aCampos )
    oTempTable:Create()
  
    //Busca as colunas do browse
    aColunas := fCriaCols()
  
    //Popula a tabela temporária
    Processa({|| fPopula()}, "Processando...")
  
    //Cria a janela
    DEFINE MSDIALOG oDialogWindow TITLE "Cadastro, alteração e exclusão de projetos"  FROM 0, 0 TO nJanAltu, nJanLarg PIXEL
  
        //Títulos e SubTítulos
        oSayModulo := TSay():New(004, 003, {|| cSayModulo}, oDialogWindow, "", oFontMod,  , , , .T.,  RGB(149, 179, 215), , 200, 30, , , , , , .F., , )
        oSayTitulo := TSay():New(004, 0105, {|| cSayTitulo}, oDialogWindow, "", oFontSub,  , , , .T., RGB(031, 073, 125), , 200, 30, , , , , , .F., , )
        oSaySubTit := TSay():New(014, 0105, {|| cSaySubTit}, oDialogWindow, "", oFontSubN, , , , .T., RGB(031, 073, 125), , 300, 30, , , , , , .F., , )
  
        //Criando os botões
        cCssBtn := "QPushButton { font-family: Arial, Helvetica, sans-serif;" +;
                                    " font-size: 16px;" +;
                                    " font-weight: bold;" +;
                                    " color: #FFFFFF; " +;
                                    " background: qlineargradient(x1:0, y1:0, x2:0, y2:1," +;
                                    " stop:0 #28a745, stop:1 #218838);" +;  // Gradiente de cima para baixo em tons de verde
                                    " border-radius: 5px;" +;
                                    " box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5); }" +;  // Adiciona uma sombra
                    "QPushButton:hover { border: 2px solid #218838;" +;
                                        " background: qlineargradient(x1:0, y1:0, x2:0, y2:1," +;
                                        " stop:0 #218838, stop:1 #1e7e34); }" +;  // Gradiente mais escuro no hover em tons de verde
                    "QPushButton:pressed { color: #8EDC91;" +;
                                            " border: 1px solid;" +;
                                            " background: qlineargradient(x1:0, y1:0, x2:0, y2:1," +;
                                            " stop:0 #8EDC91, stop:1 #28a745); }"
  
        cCssBtn02 := "QPushButton { font-family: Arial, Helvetica, sans-serif;" +;
                                    " font-size: 16px;" +;
                                    " color: #FFFFFF; " +;
                                    " background: qlineargradient(x1:0, y1:0, x2:0, y2:1," +;
                                    " stop:0 #dc3545, stop:1 #a52a35);" +;  // Gradiente de cima para baixo
                                    " border-radius: 5px;" +;
                                    " box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5); }" +;  // Adiciona uma sombra
                    "QPushButton:hover { border: 2px solid #B52D3B;" +;
                                        " background: qlineargradient(x1:0, y1:0, x2:0, y2:1," +;
                                        " stop:0 #B52D3B, stop:1 #8c2230); }" +;  // Gradiente mais escuro no hover
                    "QPushButton:pressed { color: #FF4A4A;" +;
                                            " border: 1px solid;" +;
                                            " background: qlineargradient(x1:0, y1:0, x2:0, y2:1," +;
                                            " stop:0 #FF8484, stop:1 #dc3545); }"

        oBtnSalvar := TButton():New(006, (nJanLarg/2-060)-((nLargBtn+3)*1), "Salvar",  oDialogWindow, {|| alert("Botão Teste")}, nLargBtn, 018, , oFontBtn, , .T., , , , , , )
        oBtnSalvar:SetCSS(cCssBtn)
        oBtnSair  := TButton():New(006, (nJanLarg/2-001)-((nLargBtn+2)*1), "Fechar", oDialogWindow, {|| oDialogWindow:End()},  nLargBtn, 018, , oFontBtn, , .T., , , , , , )
        oBtnSair:SetCSS(cCssBtn02)
  
        //Cria a grid
        oPanGrid := tPanel():New(027, 001, "", oDialogWindow, , , , RGB(000,000,000), RGB(254,254,254), (nJanLarg/2)-1, (nJanAltu/2)-3)
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
    Activate MsDialog oDialogWindow Centered
    oTempTable:Delete()
Return
  
Static Function fCriaCols()
    Local nAtual   := 0 
    Local aColunas := {}
    Local aEstrut  := {}
    Local oColumn
      
    //Adicionando campos que serão mostrados na tela
    //[1] - Campo da Temporaria
    //[2] - Titulo
    //[3] - Tipo
    //[4] - Tamanho
    //[5] - Decimais
    //[6] - Máscara
    aAdd(aEstrut, {"CODIGO", "Código",                "C", TamSX3('BM_GRUPO')[01],   0, ""})
    aAdd(aEstrut, {"DESCRI", "Descrição",             "C", TamSX3('BM_DESC')[01],    0, ""})
  
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
  
    //Define o tamanho da régua
    Count To nTotal
    ProcRegua(nTotal)
    SBM->(DbGoTop())
  
    //Enquanto houver itens
    While ! SBM->(EoF())
        //Incrementa a régua
        nAtual++
        IncProc("Adicionando registro " + cValToChar(nAtual) + " de " + cValToChar(nTotal) + "...")
  
        //Grava na temporária
        RecLock(cAliasTmp, .T.)
            (cAliasTmp)->CODIGO := SBM->BM_GRUPO
            (cAliasTmp)->DESCRI := SBM->BM_DESC
        (cAliasTmp)->(MsUnlock())
  
        SBM->(DbSkip())
    EndDo
Return
