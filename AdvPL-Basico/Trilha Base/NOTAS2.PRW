//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"


/*/{Protheus.doc} Notas

Rotina de Cálculo de Notas para o Treinamento na Universidade Totvs:

"PROGRAMAÇÃO PARA NÃO PROGRAMADORES"

@author rodrigo.carvalheiro
@since 09/2021
@version 1.2
/*/



//Função principal, chamada para a execução da rotina de notas dos alunos
User Function Notas2()


//Variáveis locais
Local nMediaRet
Local aAluno


//Variáveis Privates, escopo necessário para serem lidas na função Media()
Private nQtdNotas
Private nNotaTot := 0
Private aNotas := {}


//Preparar ambiente na filial selecionada
//Necessário quando a função é chamada diretamente do SmartClient e não do menu dentro do Protheus
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT" TABLES "SB1", "SA1"


//Alimenta o array aAluno com os dados do aluno
aAluno := fAluno()


//Alimenta o array aNotas com as notas digitadas
aNotas := fNotas()


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




RESET ENVIRONMENT

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

Local cAluno
Local dInsc
Local aReturn

cAluno := fGetInf("Insira o nome do aluno",50,"!@")
dInsc := fGetInf("Insira a data de Inscrição",8,"@D")
aReturn := {cAluno,dInsc}


Return(aReturn)




//Função responsável pela leitura das notas
Static Function fNotas()

Local nNota

While (.T.)
    
    nNota := val(fGetInf("Insira a Nota. Clique em Voltar para parar.",5,"@E 99,99"))

    if Empty(nNota)

        Return(aNotas)
    
    EndIf

    aadd(aNotas,nNota)

EndDo

Return





/*
Funcao para Abrir tela para informações do usuário
Parâmetros	
        cTitulo = Titulo
		nTam = Tamanho máximo da string de retorno
		cPicture = Máscara de entrada de dados para o objeto GET 
Retorno	
*/

Static Function fGetInf(cTitulo,nTam,cPicture)

Local oDlg
Local cGetVar := space(nTam)
Local oGet
Local oBtn1,oBtn2
Local lOk := .F. 

DEFINE DIALOG oDlg TITLE (cTitulo) ;
    FROM 0,0 TO 100,500 PIXEL

@ 05,05 GET oGet VAR cGetVar  PICTURE (cPicture) SIZE (nTam*4),12 OF oDlg PIXEL 

@ 25,05  BUTTON oBtn1 PROMPT "Confirmar" SIZE 40,15  ACTION (lOk := .T. , oDlg:End()) OF oDlg PIXEL 

@ 25,50  BUTTON oBtn2 PROMPT "Voltar" SIZE 40,15  ACTION (oDlg:End()) OF oDlg PIXEL 

ACTIVATE DIALOG oDlg CENTER


If !lOk
   cGetVar := space(nTam)
Endif

Return cGetVar
