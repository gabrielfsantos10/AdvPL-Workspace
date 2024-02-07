//Bibliotecas
#Include "Totvs.ch"
#Include "FWMVCDef.ch"

/*/{Protheus.doc} User Function zOO22
Grupos de Produtos
@author Daniel Atilio
@since 03/06/2022
@version 1.0
@type function
@obs Codigo gerado automaticamente pelo Autumn Code Maker
@see http://autumncodemaker.com
/*/

User Function zOO22()
	Local aArea := FWGetArea()
	
	//Chama a tela
	fMontaTela()
	
	FWRestArea(aArea)
Return

/*/{Protheus.doc} fMontaTela
Monta a tela com a marca��o de dados
@author Daniel Atilio
@since 03/06/2022
@version 1.0
@type function
@obs Codigo gerado automaticamente pelo Autumn Code Maker
@see http://autumncodemaker.com
/*/

Static Function fMontaTela()
    Local aArea         := GetArea()
    Local aCampos := {}
    Local oTempTable := Nil
    Local aColunas := {}
    Local cFontPad    := 'Tahoma'
    Local oFontGrid   := TFont():New(cFontPad,,-14)
    //Janela e componentes
    Private oDlgMark
    Private oPanGrid
    Private oMarkBrowse
    Private cAliasTmp := GetNextAlias()
    Private aRotina   := MenuDef()
    //Tamanho da janela
    Private aTamanho := MsAdvSize()
    Private nJanLarg := aTamanho[5]
    Private nJanAltu := aTamanho[6]
     
    //Adiciona as colunas que ser�o criadas na tempor�ria
    aAdd(aCampos, { 'OK', 'C', 2, 0}) //Flag para marca��o
    aAdd(aCampos, { 'BM_GRUPO', 'C', 4, 0}) //C�digo
    aAdd(aCampos, { 'BM_DESC', 'C', 30, 0}) //Descri��o

    //Cria a tabela tempor�ria
    oTempTable:= FWTemporaryTable():New(cAliasTmp)
    oTempTable:SetFields( aCampos )
    oTempTable:Create()  

    //Popula a tabela tempor�ria
    Processa({|| fPopula()}, 'Processando...')

    //Adiciona as colunas que ser�o exibidas no FWMarkBrowse
    aColunas := fCriaCols()
     
    //Criando a janela
    DEFINE MSDIALOG oDlgMark TITLE 'Tela para Marca��o de dados - Autumn Code Maker' FROM 000, 000  TO nJanAltu, nJanLarg COLORS 0, 16777215 PIXEL
        //Dados
        oPanGrid := tPanel():New(001, 001, '', oDlgMark, , , , RGB(000,000,000), RGB(254,254,254), (nJanLarg/2)-1,     (nJanAltu/2 - 1))
        oMarkBrowse := FWMarkBrowse():New()
        oMarkBrowse:SetAlias(cAliasTmp)                
        oMarkBrowse:SetDescription('Grupos de Produtos')
        oMarkBrowse:DisableFilter()
        oMarkBrowse:DisableConfig()
        oMarkBrowse:DisableSeek()
        oMarkBrowse:DisableSaveConfig()
        oMarkBrowse:SetFontBrowse(oFontGrid)
        oMarkBrowse:SetFieldMark('OK')
        oMarkBrowse:SetTemporary(.T.)
        oMarkBrowse:SetColumns(aColunas)
        //oMarkBrowse:AllMark() 
        oMarkBrowse:SetOwner(oPanGrid)
        oMarkBrowse:Activate()
    ACTIVATE MsDialog oDlgMark CENTERED
    
    //Deleta a tempor�ria e desativa a tela de marca��o
    oTempTable:Delete()
    oMarkBrowse:DeActivate()
    
    RestArea(aArea)
Return

/*/{Protheus.doc} MenuDef
Bot�es usados no Browse
@author Daniel Atilio
@since 03/06/2022
@version 1.0
@type function
@obs Codigo gerado automaticamente pelo Autumn Code Maker
@see http://autumncodemaker.com
/*/

Static Function MenuDef()
    Local aRotina := {}
     
    //Cria��o das op��es
    ADD OPTION aRotina TITLE 'Continuar'  ACTION 'u_zOO22O'     OPERATION 2 ACCESS 0
Return aRotina

/*/{Protheus.doc} fPopula
Executa a query SQL e popula essa informa��o na tabela tempor�ria usada no browse
@author Daniel Atilio
@since 03/06/2022
@version 1.0
@type function
@obs Codigo gerado automaticamente pelo Autumn Code Maker
@see http://autumncodemaker.com
/*/

Static Function fPopula()
    Local cQryDados := ''
    Local nTotal := 0
    Local nAtual := 0

    //Monta a consulta
    cQryDados += "SELECT "		+ CRLF
    cQryDados += " BM_GRUPO, "		+ CRLF
    cQryDados += " BM_DESC "		+ CRLF
    cQryDados += "FROM "		+ CRLF
    cQryDados += " SBM990 SBM "		+ CRLF
    cQryDados += "WHERE "		+ CRLF
    cQryDados += " BM_FILIAL = '01' "		+ CRLF
    cQryDados += " AND BM_MSBLQL != '1' "		+ CRLF
    cQryDados += " AND SBM.D_E_L_E_T_ = ' '"		+ CRLF
    PLSQuery(cQryDados, 'QRYDADTMP')

    //Definindo o tamanho da r�gua
    DbSelectArea('QRYDADTMP')
    Count to nTotal
    ProcRegua(nTotal)
    QRYDADTMP->(DbGoTop())

    //Enquanto houver registros, adiciona na tempor�ria
    While ! QRYDADTMP->(EoF())
        nAtual++
        IncProc('Analisando registro ' + cValToChar(nAtual) + ' de ' + cValToChar(nTotal) + '...')

        RecLock(cAliasTmp, .T.)
            (cAliasTmp)->OK := Space(2)
            (cAliasTmp)->BM_GRUPO := QRYDADTMP->BM_GRUPO
            (cAliasTmp)->BM_DESC := QRYDADTMP->BM_DESC
        (cAliasTmp)->(MsUnlock())

        QRYDADTMP->(DbSkip())
    EndDo
    QRYDADTMP->(DbCloseArea())
    (cAliasTmp)->(DbGoTop())
Return

/*/{Protheus.doc} fCriaCols
Fun��o que gera as colunas usadas no browse (similar ao antigo aHeader)
@author Daniel Atilio
@since 03/06/2022
@version 1.0
@type function
@obs Codigo gerado automaticamente pelo Autumn Code Maker
@see http://autumncodemaker.com
/*/

Static Function fCriaCols()
    Local nAtual       := 0 
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
    aAdd(aEstrut, { 'BM_GRUPO', 'C�digo', 'C', 4, 0, ''})
    aAdd(aEstrut, { 'BM_DESC', 'Descri��o', 'C', 30, 0, ''})

    //Percorrendo todos os campos da estrutura
    For nAtual := 1 To Len(aEstrut)
        //Cria a coluna
        oColumn := FWBrwColumn():New()
        oColumn:SetData(&('{|| ' + cAliasTmp + '->' + aEstrut[nAtual][1] +'}'))
        oColumn:SetTitle(aEstrut[nAtual][2])
        oColumn:SetType(aEstrut[nAtual][3])
        oColumn:SetSize(aEstrut[nAtual][4])
        oColumn:SetDecimal(aEstrut[nAtual][5])
        oColumn:SetPicture(aEstrut[nAtual][6])

        //Adiciona a coluna
        aAdd(aColunas, oColumn)
    Next
Return aColunas

/*/{Protheus.doc} User Function zOO22O
Fun��o acionada pelo bot�o continuar da rotina
@author Daniel Atilio
@since 03/06/2022
@version 1.0
@type function
@obs Codigo gerado automaticamente pelo Autumn Code Maker
@see http://autumncodemaker.com
/*/

User Function zOO22O()
    Processa({|| fProcessa()}, 'Processando...')
Return

/*/{Protheus.doc} fProcessa
Fun��o que percorre os registros da tela
@author Daniel Atilio
@since 03/06/2022
@version 1.0
@type function
@obs Codigo gerado automaticamente pelo Autumn Code Maker
@see http://autumncodemaker.com
/*/

Static Function fProcessa()
    Local aArea     := FWGetArea()
    Local cMarca    := oMarkBrowse:Mark()
    Local nAtual    := 0
    Local nTotal    := 0
    Local nTotMarc := 0
    
    //Define o tamanho da r�gua
    DbSelectArea(cAliasTmp)
    (cAliasTmp)->(DbGoTop())
    Count To nTotal
    ProcRegua(nTotal)
    
    //Percorrendo os registros
    (cAliasTmp)->(DbGoTop())
    While ! (cAliasTmp)->(EoF())
        nAtual++
        IncProc('Analisando registro ' + cValToChar(nAtual) + ' de ' + cValToChar(nTotal) + '...')
    
        //Caso esteja marcado
        If oMarkBrowse:IsMark(cMarca)
            nTotMarc++
            
            /*
            //Aqui dentro voc� pode fazer o seu processamento
            Alert((cAliasTmp)->BM_GRUPO)
            */
        EndIf
         
        (cAliasTmp)->(DbSkip())
    EndDo
    
    //Mostra a mensagem de t�rmino e caso queria fechar a dialog, basta usar o m�todo End()
    FWAlertInfo('Dos [' + cValToChar(nTotal) + '] registros, foram processados [' + cValToChar(nTotMarc) + '] registros', 'Aten��o')
    //oDlgMark:End()

    FWRestArea(aArea)
Return
