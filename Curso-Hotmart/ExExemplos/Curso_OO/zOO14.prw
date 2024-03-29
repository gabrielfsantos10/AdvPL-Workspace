//Bibliotecas
#Include 'TOTVS.ch'

/*/{Protheus.doc} User Function zOO14
Funcao com tela customizada usando a classe TDialog que foi gerado pelo PDialogMaker
@type  Function
@author Atilio
@since 16/06/2022 
@see https://atiliosistemas.com/portfolio/pdialogmaker/
@obs Obrigado por usar um aplicativo da Atilio Sistemas
/*/

User Function zOO14()
    Local aArea         := FWGetArea()
    Local nCorFundo     := RGB(238, 238, 238)
    Local nJanAltura    := 228
    Local nJanLargur    := 318 
    Local cJanTitulo    := 'Exemplo TListBox'
    Local lDimPixels    := .T. 
    Local lCentraliz    := .T. 
    Local nObjLinha     := 0
    Local nObjColun     := 0
    Local nObjLargu     := 0
    Local nObjAltur     := 0
    Private cFontNome   := 'Tahoma'
    Private oFontPadrao := TFont():New(cFontNome, , -12)
    Private oDialogPvt 
    Private bBlocoIni   := {|| /*fSuaFuncao()*/ } //Aqui voce pode acionar funcoes customizadas que irao ser acionadas ao abrir a dialog 
    //objeto0 
    Private oLisObj0 
    Private nLisObj0    := 0  
    Private aLisObj0    := {'YouTube', 'Instagram', 'Twitter', 'Facebook', 'e-Mail'}  
    //objeto1 
    Private oBtnObj1 
    Private cBtnObj1    := 'Confirmar'  
    Private bBtnObj1    := {|| MsgYesNo('Voc� nos segue via "' + aLisObj0[oLisObj0:nAt] + '"?', 'D�vida')}  
    
    //Cria a dialog
    oDialogPvt := TDialog():New(0, 0, nJanAltura, nJanLargur, cJanTitulo, , , , , , nCorFundo, , , lDimPixels)
    
        //objeto0 - usando a classe TListBox
        nObjLinha := 6
        nObjColun := 8
        nObjLargu := 142
        nObjAltur := 80
        oLisObj0  := TListBox():New(nObjLinha, nObjColun, {|u| Iif(PCount() > 0 , nLisObj0 := u, nLisObj0)}, aLisObj0, nObjLargu, nObjAltur, /*bChange*/, oDialogPvt, /*bValid*/, , , lDimPixels, , /*bLDBLClick*/, oFontPadrao)

        //objeto1 - usando a classe TButton
        nObjLinha := 95
        nObjColun := 8
        nObjLargu := 65
        nObjAltur := 15
        oBtnObj1  := TButton():New(nObjLinha, nObjColun, cBtnObj1, oDialogPvt, bBtnObj1, nObjLargu, nObjAltur, , oFontPadrao, , lDimPixels)

    
    //Ativa e exibe a janela
    oDialogPvt:Activate(, , , lCentraliz, , , bBlocoIni)
    
    FWRestArea(aArea)
Return
