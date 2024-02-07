//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
User Function dsf20()

//Variaveis locais
Local nListas
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nListas := u_LeVetorInverso()
//mostra o total ao final dos cadastro
Return

User Function LeVetorInverso()

    Local aVetor := ARRAY(5)
    Local i := 0

    for i := 1 to 5
        aVetor[i] := FWINPUTBOX("Digite o valor "+cValToChar(i)+":", " ")
    next

    for i := 5 to 1
        cInverso := cValToChar(cInverso) + " " + cValToChar(aVetor[i]) + " "
    next

    FWAlertSuccess(cValToChar(cInverso), "Ordem inversa")

Return
