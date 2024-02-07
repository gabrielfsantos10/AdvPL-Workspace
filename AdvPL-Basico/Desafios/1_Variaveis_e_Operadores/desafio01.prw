//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
User Function desafio01()

//Variaveis locais
Local nTroca
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nTroca := u_trocaValor()
Return

User Function trocaValor()

Local nA
Local nB
Local nAux

//atribuindo valores padroes as variaveis
nA := 10
nB := 20

//trocando os valores
nAux := nA
nA := nB
nB := nAux

FWAlertInfo("Variavel A:"+STR(nA)+ "  -  Variavel B:"+STR(nB) ,"Valores trocados")
Return(nA,nB)
