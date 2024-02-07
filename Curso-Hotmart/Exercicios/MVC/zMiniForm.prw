//Bibliotecas
#Include "Protheus.ch"
 
/*/{Protheus.doc} zMiniForm
Funcao Mini Formulas, para executar formulas
@author Atilio
@since 17/12/2017
@version 1.0
@type function
@obs Assim como o formulas foi bloqueado no Protheus 12, cuidado ao deixar exposto no menu o Mini Formulas
/*/
 
User Function zMiniForm()
    Local aArea := GetArea()
    //Variaveis da tela
    Private oDlgForm
    Private oGrpForm
    Private oGetForm
    Private cGetForm := Space(250)
    Private oGrpAco
    Private oBtnExec
    Private oInibErro, lInibErro := .F.
    //Tamanho da Janela
    Private nJanLarg := 500
    Private nJanAltu := 120
    Private nTamBtn  := 048
 
    //Criando a janela
    DEFINE MSDIALOG oDlgForm TITLE "zMiniForm - Execucao de Formulas" FROM 000, 000  TO nJanAltu, nJanLarg COLORS 0, 16777215 PIXEL
        //Grupo Formula com o Get
        @ 003, 003  GROUP oGrpForm TO 30, (nJanLarg/2)-1        PROMPT "Formula: " OF oDlgForm COLOR 0, 16777215 PIXEL
            @ 010, 006  MSGET oGetForm VAR cGetForm SIZE (nJanLarg/2)-9, 013 OF oDlgForm COLORS 0, 16777215 PIXEL
         
        //Grupo Acoes com o Botao
        @ (nJanAltu/2)-30, 003 GROUP oGrpAco TO (nJanAltu/2)-3, (nJanLarg/2)-1 PROMPT "Acoes: " OF oDlgForm COLOR 0, 16777215 PIXEL
            @ (nJanAltu/2)-18, 006 CHECKBOX oInibErro VAR lInibErro PROMPT "Inibe Error Log (utilizar Begin Sequence)" SIZE 200, 010 OF oDlgForm COLORS 0, 16777215 PIXEL
            @ (nJanAltu/2)-24, (nJanLarg/2) - (nTamBtn + 6) BUTTON oBtnExec PROMPT "Executar" SIZE nTamBtn, 018 OF oDlgForm ACTION(fExecuta()) PIXEL
         
    //Ativando a janela
    ACTIVATE MSDIALOG oDlgForm CENTERED
     
    RestArea(aArea)
Return
 
/*---------------------------------------*
 | Func.: fExecuta                       |
 | Desc.: Executa a formula digitada     |
 *---------------------------------------*/
 
Static Function fExecuta()
    Local aArea    := GetArea()
    Local cFormula := Alltrim(cGetForm)
    Local cError   := ""
    Local bError   := Nil
     
    //Se tiver conteudo digitado
    If ! Empty(cFormula)
        //Se tiver habilitado para inibir erros
        If lInibErro
            bError   := ErrorBlock({ |oError| cError := oError:Description})
 
            //Inicio a utilizacao da tentativa
            Begin Sequence
                &(cFormula)
            End Sequence
             
            //Restaurando bloco de erro do sistema
            ErrorBlock(bError)
             
            //Se houve erro, sera mostrado ao usuario
            If ! Empty(cError)
                MsgStop("Houve um erro na formula digitada: "+CRLF+CRLF+cError, "Atencao")
            EndIf
 
        //Senão, simplesmente executa a fórmula conforme ela foi digitada
        Else
            &(cFormula)
        EndIf
    EndIf
     
    RestArea(aArea)
Return
