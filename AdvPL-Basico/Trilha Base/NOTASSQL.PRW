//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "TOPCONN.CH"



/*/{Protheus.doc} Notas

Rotina de Cálculo de Notas para o Treinamento na Universidade Totvs:

"PROGRAMAÇÃO PARA NÃO PROGRAMADORES"

@author rodrigo.carvalheiro
@since 09/2021
@version 1.3
/*/




//Função principal, chamada para a execução da rotina de notas dos alunos
User Function Notas()


//Variáveis locais
Local aAluno
Local nOpc



//Variáveis Privates, escopo necessário para serem lidas na função Media()
Private nQtdNotas
Private nNotaTot := 0
Private aNotas := {}




//Executa função da tela de escolha da interação
nOpc := fGetEsc()


//Estrutra de decisão para executar a escolha feita pelo usuário
//Inclusão
If nOpc == 1

    //Alimenta o array aAluno com os dados do aluno
    aAluno := fAluno()

    //Chamada da função para gravar o aluno
    GrvAluno(aAluno)

    //Excuta a funçao fNotas para alimentar o array aNotas (private) com as notas digitadas
    fNotas()

    MostraMedia(aAluno)

ElseIf nOpc == 2
//Consulta o aluno

    SelAluno() 
    
    cAluno := SB1->SB1_COD
    aAluno := NtQuery(cAluno)
    
    MostraMedia(aAluno)

elseIf nOpc == 3
//Exclusão
    
    SelAluno() 

    DelNotas(SB1->SB1_COD)

    RecLock("SB1",.F.)		
    SB1->(DBDELETE())
    SB1->(MsUnLock())
   
    FWAlertInfo("Aluno Deletado!")

Endif

Return




/*
Transformamos o trecho abaixo em uma nova função, para ser chamada de forma genérica pela consulta e exclusão.
Função para calcular e exibir o resultado das médias
*/
Static Function MostraMedia(aAluno)

local nMediaRet

//Chamada da função para calcular a média das notas
nMediaRet := media()

//Case para Imprimir resultado da média do Aluno
Do Case

Case nMediaRet == 10
    //Imprimir Resultado do Aluno Aprovado
    FWAlertInfo("Aluno: "+aAluno[1]+"  -  Nota Final: "+STR(nMediaRet,5,2)+"  - Aprovado com Nota Máxima! ","Resultado")

Case nMediaRet >= 7
    //Imprimir Resultado do Aluno Aprovado
    FWAlertInfo("Aluno: "+aAluno[1]+"  -  Nota Final: "+STR(nMediaRet,5,2)+"  -  Aprovado! ","Resultado")

Case nMediaRet >= 5
    //Imprimir Resultado do Aluno em Recuperação
    FWAlertInfo("Aluno: "+aAluno[1]+"  -  Nota Final: "+STR(nMediaRet,5,2)+"  -  Recuperação! ","Resultado")

OTHERWISE
    //Imprimir Resultado do Aluno Reprovado
    FWAlertInfo("Aluno: "+aAluno[1]+"  -  Nota Final: "+STR(nMediaRet,5,2)+"  -  Reprovado! ","Resultado")

EndCase

Return





//Função responsável pelo cálculo da média das notas do aluno
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




//Função responsável pela leitura das informações do Aluno
Static Function fAluno()

Local cAluno := SPACE(20)
Local dInsc := CTOD(" ")
Local aReturn

cAluno := fGetInf("Insira o nome do aluno",cAluno)
dInsc := fGetInf("Insira a data de Inscrição",dInsc)
aReturn := {cAluno,dInsc}

Return(aReturn)





//Função responsável pela leitura das notas
Static Function fNotas()

// Tipagem de variáveis: https://tdn.totvs.com/display/tec/Tipagem+de+Dados
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



//Função utilizada para gravação do cadastro do aluno
Static Function GrvAluno(aAluno)


//Seleciona a tabela e índice a serem utilizados
DbSelectArea("SB1")
DbSetOrder(1)

//Bloqueia a tabela para gravação de um novo registro
RecLock("SB1",.T.)		
SB1->SB1_FILIAL := xFilial("SB1")
SB1->SB1_COD    := GETSXENUM("SB1","SB1_COD")
CONFIRMSX8()
SB1->SB1_NOME   := aAluno[1]
SB1->SB1_DTINS  := aAluno[2]		
MsUnLock() //Confirma e finaliza a operação

Return





//Função utilizada para gravação das notas do aluno
Static Function GrvNotas(nNota)


//Seleciona a tabela e índice a serem utilizados
DbSelectArea("XNT")
DbSetOrder(1)

//Bloqueia a tabela para gravação de um novo registro
RecLock("XNT",.T.)		
XNT->XNT_FILIAL := xFilial("XNT")
XNT->XNT_COD    := SB1->SB1_COD
XNT->XNT_NOTA   := nNota
MsUnLock() //Confirma e finaliza a operação

Return




// Esta função abre a Tela com o Browse com os alunos cadastrados
Static Function SelAluno()


//Instanciamento da Classe da montagem de tela
oBrowse:=FWMBrowse():New()
oBrowse:SetAlias('SB1')
oBrowse:SetDescription('Cadastro de Aluno')
oBrowse:Activate()


Return()


 


// Esta função abre uma Query em um alias chamado QRY com os dados do aluno para buscar as Notas
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



//Função para deletar as Notas dos Alunos
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



//Função para escolha de consulta, cadastro ou deleção do aluno
Static Function fGetEsc()

Local oDlg
Local oBtn1,oBtn2,oBtn3
Local nOpc


DEFINE DIALOG oDlg TITLE ("Escolha opção que deseja utilizar:") ;
    FROM 0,0 TO 150,300 PIXEL

@ 25,05  BUTTON oBtn1 PROMPT "Incluir Aluno" SIZE 40,15  ACTION (nOpc := 1 , oDlg:End()) OF oDlg PIXEL 

@ 25,50  BUTTON oBtn2 PROMPT "Consultar Aluno" SIZE 50,15  ACTION (nOpc := 2, oDlg:End()) OF oDlg PIXEL 

@ 25,110  BUTTON oBtn3 PROMPT "Excluir Aluno" SIZE 40,15  ACTION (nOpc := 3, oDlg:End()) OF oDlg PIXEL 

ACTIVATE DIALOG oDlg CENTER


Return nOpc




/*
Funcao para Abrir tela para informações do usuário
Parâmetros	
        cTitulo = Titulo
		xVar = Variável para receber o tipo que será recebido em tela
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
