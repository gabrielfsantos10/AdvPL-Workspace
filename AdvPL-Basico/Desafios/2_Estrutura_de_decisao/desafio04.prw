//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
User Function dsf04()

//Variaveis locais
Local nSomaPrimos
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nSomaPrimos := u_SomaP()
//mostra o total ao final dos cadastro
Return

User Function SomaP()

Local nNumeros := 0
Local i
Local nSoma := 0

for i := 1 to 50 //500
    if i % 3 = 0 
        nNumeros:= i
        nSoma:= nSoma + nNumeros
    ENDIF
NEXT

    FWAlertSuccess("A soma dos n�meros �mpares multiplos de 3 �: "+CValToChar(nSoma),"Somas")

Return
