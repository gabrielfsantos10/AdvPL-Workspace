//Includes s�o os dicinon�rios do Framework da Linguagem ADVPL para "tradu��o" do fonte que criamos, no momento da compila��o
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "TOPCONN.CH"



/*/{Protheus.doc} Notas

Rotina de C�lculo de Notas para o Treinamento na Universidade Totvs:

"PROGRAMA��O PARA N�O PROGRAMADORES"

@author rodrigo.carvalheiro
@since 09/2021
@version 1.3
/*/




//Fun��o principal, chamada para a execu��o da rotina de notas dos alunos
User Function Notas()


//Vari�veis locais
Local aAluno
Local nOpc



//Vari�veis Privates, escopo necess�rio para serem lidas na fun��o Media()
Private nQtdNotas
Private nNotaTot := 0
Private aNotas := {}




//Executa fun��o da tela de escolha da intera��o
nOpc := fGetEsc()


//Estrutra de decis�o para executar a escolha feita pelo usu�rio
//Inclus�o
If nOpc == 1

    //Alimenta o array aAluno com os dados do aluno
    aAluno := fAluno()

    //Chamada da fun��o para gravar o aluno
    GrvAluno(aAluno)

    //Excuta a fun�ao fNotas para alimentar o array aNotas (private) com as notas digitadas
    fNotas()

    MostraMedia(aAluno)

ElseIf nOpc == 2
//Consulta o aluno

    SelAluno() 
    
    cAluno := SB1->SB1_COD
    aAluno := NtQuery(cAluno)
    
    MostraMedia(aAluno)

elseIf nOpc == 3
//Exclus�o
    
    SelAluno() 

    DelNotas(SB1->SB1_COD)

    RecLock("SB1",.F.)		
    SB1->(DBDELETE())
    SB1->(MsUnLock())
   
    FWAlertInfo("Aluno Deletado!")

Endif

Return




/*
Transformamos o trecho abaixo em uma nova fun��o, para ser chamada de forma gen�rica pela consulta e exclus�o.
Fun��o para calcular e exibir o resultado das m�dias
*/
Static Function MostraMedia(aAluno)

local nMediaRet

//Chamada da fun��o para calcular a m�dia das notas
nMediaRet := media()

//Case para Imprimir resultado da m�dia do Aluno
Do Case

Case nMediaRet == 10
    //Imprimir Resultado do Aluno Aprovado
    FWAlertInfo("Aluno: "+aAluno[1]+"  -  Nota Final: "+STR(nMediaRet,5,2)+"  - Aprovado com Nota M�xima! ","Resultado")

Case nMediaRet >= 7
    //Imprimir Resultado do Aluno Aprovado
    FWAlertInfo("Aluno: "+aAluno[1]+"  -  Nota Final: "+STR(nMediaRet,5,2)+"  -  Aprovado! ","Resultado")

Case nMediaRet >= 5
    //Imprimir Resultado do Aluno em Recupera��o
    FWAlertInfo("Aluno: "+aAluno[1]+"  -  Nota Final: "+STR(nMediaRet,5,2)+"  -  Recupera��o! ","Resultado")

OTHERWISE
    //Imprimir Resultado do Aluno Reprovado
    FWAlertInfo("Aluno: "+aAluno[1]+"  -  Nota Final: "+STR(nMediaRet,5,2)+"  -  Reprovado! ","Resultado")

EndCase

Return





//Fun��o respons�vel pelo c�lculo da m�dia das notas do aluno
Static Function Media()

Local nMedia
Local nCont


//Armazena em nQtdNotas o valor a quantidade de itens que o array aNotas possui
nQtdNotas := len(aNotas)


If nQtdNotas > 0

    For nCont:=1 To len(aNotas)
        nNotaTot += aNotas[nCont]
    Next nCont

    nMedia := nNotaTot / nQtdNotas

EndIf

Return(nMedia)




//Fun��o respons�vel pela leitura das informa��es do Aluno
Static Function fAluno()

Local cAluno := SPACE(20)
Local dInsc := CTOD(" ")
Local aReturn

cAluno := fGetInf("Insira o nome do aluno",cAluno)
dInsc := fGetInf("Insira a data de Inscri��o",dInsc)
aReturn := {cAluno,dInsc}

Return(aReturn)





//Fun��o respons�vel pela leitura das notas
Static Function fNotas()

// Tipagem de vari�veis: https://tdn.totvs.com/display/tec/Tipagem+de+Dados
Local nNota as Numeric


While (.T.)
    
    nNota := 0
    nNota := fGetInf("Insira a Nota da Prova.",nNota)
    if nNota == 0
        Exit
    EndIf
    aadd(aNotas,nNota)

    GrvNotas(nNota)

EndDo


Return



//Fun��o utilizada para grava��o do cadastro do aluno
Static Function GrvAluno(aAluno)


//Seleciona a tabela e �ndice a serem utilizados
DbSelectArea("SB1")
DbSetOrder(1)

//Bloqueia a tabela para grava��o de um novo registro
RecLock("SB1",.T.)		
SB1->SB1_FILIAL := xFilial("SB1")
SB1->SB1_COD    := GETSXENUM("SB1","SB1_COD")
CONFIRMSX8()
SB1->SB1_NOME   := aAluno[1]
SB1->SB1_DTINS  := aAluno[2]		
MsUnLock() //Confirma e finaliza a opera��o

Return





//Fun��o utilizada para grava��o das notas do aluno
Static Function GrvNotas(nNota)


//Seleciona a tabela e �ndice a serem utilizados
DbSelectArea("XNT")
DbSetOrder(1)

//Bloqueia a tabela para grava��o de um novo registro
RecLock("XNT",.T.)		
XNT->XNT_FILIAL := xFilial("XNT")
XNT->XNT_COD    := SB1->SB1_COD
XNT->XNT_NOTA   := nNota
MsUnLock() //Confirma e finaliza a opera��o

Return




// Esta fun��o abre a Tela com o Browse com os alunos cadastrados
Static Function SelAluno()


//Instanciamento da Classe da montagem de tela
oBrowse:=FWMBrowse():New()
oBrowse:SetAlias('SB1')
oBrowse:SetDescription('Cadastro de Aluno')
oBrowse:Activate()


Return()


 


// Esta fun��o abre uma Query em um alias chamado QRY com os dados do aluno para buscar as Notas
Static Function NtQuery(cCodAlu)

Local cQuery
Local aAluno := {}

cQuery := " SELECT *"
cQuery += " FROM SB1990 AS SB1"
 
DbUseArea( .T. , 'TOPCONN' , TcGenQry( ,, cQuery) , "QRY" , .T. , .T. )

IF QRY->(!EOF())

    aAluno := {QRY->SB1_NOME,QRY->SB1_DTINS}

    WHILE QRY->(!EOF())

        aadd(aNotas,QRY->XNT_NOTA)

        QRY->(DBSKIP())

    ENDDO

EndIf

QRY->(DbCloseArea())
 
Return(aAluno)



//Fun��o para deletar as Notas dos Alunos
Static Function DelNotas(cAluno)

    
cQuery := " SELECT R_E_C_N_O_ AS REG"
cQuery += " FROM XNT010 AS XNT"
cQuery += " WHERE XNT_FILIAL = '"+xFilial("XNT")+"'"
cQuery += " AND XNT_COD = '"+cAluno+"'"
cQuery += " AND D_E_L_E_T_ = ' ' "
 
DbUseArea( .T. , 'TOPCONN' , TcGenQry( ,, cQuery) , "QRY" , .T. , .T. )

WHILE QRY->(!EOF())

    XNT->(DBGOTO(QRY->REG))
    RECLOCK("XNT",.F.)
    XNT->(DBDELETE())
    XNT->(MSUNLOCK())
    QRY->(DBSKIP())

ENDDO

QRY->(DBCLOSEAREA())

Return



//Fun��o para escolha de consulta, cadastro ou dele��o do aluno
Static Function fGetEsc()

Local oDlg
Local oBtn1,oBtn2,oBtn3
Local nOpc


DEFINE DIALOG oDlg TITLE ("Escolha op��o que deseja utilizar:") ;
    FROM 0,0 TO 150,300 PIXEL

@ 25,05  BUTTON oBtn1 PROMPT "Incluir Aluno" SIZE 40,15  ACTION (nOpc := 1 , oDlg:End()) OF oDlg PIXEL 

@ 25,50  BUTTON oBtn2 PROMPT "Consultar Aluno" SIZE 50,15  ACTION (nOpc := 2, oDlg:End()) OF oDlg PIXEL 

@ 25,110  BUTTON oBtn3 PROMPT "Excluir Aluno" SIZE 40,15  ACTION (nOpc := 3, oDlg:End()) OF oDlg PIXEL 

ACTIVATE DIALOG oDlg CENTER


Return nOpc




/*
Funcao para Abrir tela para informa��es do usu�rio
Par�metros	
        cTitulo = Titulo
		xVar = Vari�vel para receber o tipo que ser� recebido em tela
Retorno	
*/

Static Function fGetInf(cTitulo,xVar)

Local oDlg
Local oGet
Local nTam := IIF(Valtype(xVar)=="C",LEN(xVar),10)
Local oBtn1,oBtn2
Local lOk := .F. 


DEFINE DIALOG oDlg TITLE (cTitulo) ;
    FROM 0,0 TO 100,500 PIXEL

If VALTYPE(xVar)=="N"
    @ 05,05 GET oGet VAR xVar PICTURE "@E 99.99" SIZE (nTam*4),12 OF oDlg PIXEL 
ELSE
    @ 05,05 GET oGet VAR xVar SIZE (nTam*4),12 OF oDlg PIXEL 
EndIf

@ 25,05  BUTTON oBtn1 PROMPT "Confirmar" SIZE 40,15  ACTION (lOk := .T. , oDlg:End()) OF oDlg PIXEL 

@ 25,50  BUTTON oBtn2 PROMPT "Parar" SIZE 40,15  ACTION (oDlg:End()) OF oDlg PIXEL 

ACTIVATE DIALOG oDlg CENTER


Return xVar
