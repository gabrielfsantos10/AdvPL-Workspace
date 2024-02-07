//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"


/*/{Protheus.doc} Notas

Rotina de Cálculo de Notas para o Treinamento na Universidade Totvs:

"PROGRAMAÇÃO PARA NÃO PROGRAMADORES"

@author rodrigo.carvalheiro
@since 09/2021
@version 1.0
/*/



//Função principal, chamada para a execução da rotina de notas dos alunos
User Function Notas()
//Variáveis locais
Local cAluno 
Local dInsc
Local lAtivo
Local nNotaA
Local nNOtaB
Local nNotaC
Local nMediaRet

//Variáveis Privates, escopo necessário para serem lidas na função Media()
Private nQtdNotas
Private nNotaTot

//Preparar ambiente na filial selecionada
//Necessário quando a função é chamada diretamente do SmartClient e não do menu dentro do Protheus
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

//incrementando os valores das notas e informa��es do aluno
cAluno := "Gabriel"
dInsc := SToD("18/05/2022")
//.T. - True
//.F. - False
lAtivo := .T.

nNotaA := 7
nNotaB := 8
nNotaC := 6
nQtdNotas := 3

nNotaTot := nNotaA + nNotaB + nNotaC
//Chamada da função para calcular a média das notas
nMediaRet := u_media()

if (lAtivo)
    Do Case
        Case nMediaRet >= 7
            FWAlertInfo("Aluno: "+cAluno+" - Nota Final: "+STR(nMediaRet,5,2)+" - APROVADO "," Resultado")
        
        Case nMediaRet < 7
            FWAlertInfo("Aluno: "+cAluno+" - Nota Final: "+STR(nMediaRet,5,2)+" - REPROVADO "," Resultado")
    EndCase
else
    FWAlertInfo("Aluno: "+cAluno+" N�o possui matricula!!","ERROR")
     
endif

RESET ENVIRONMENT
Return

//Função responsável pelo cálculo da média das notas do aluno
User Function Media()

Local nMedia

nMedia :=  nNotaTot / nQtdNotas

Return(nMedia)
