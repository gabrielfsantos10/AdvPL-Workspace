//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
User Function dsf19()

//Variaveis locais
Local nListas
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nListas := u_LeVetor()
//mostra o total ao final dos cadastro
Return

User Function LeVetor()

    Local aVetor := ARRAY(5)
    Local i := 0

    for i := 1 to 5
        aVetor[i] := FWINPUTBOX("Digite o valor "+cValToChar(i)+":", " ")
    next
   
    FWAlertSuccess(cValToChar(aVetor[1]) + Chr(13) + Chr(10) + cValToChar(aVetor[2]) + Chr(13) + Chr(10) + cValToChar(aVetor[3]) + Chr(13) + Chr(10) + cValToChar(aVetor[4]) + Chr(13) + Chr(10) + cValToChar(aVetor[5]), "Vetor")
Return
