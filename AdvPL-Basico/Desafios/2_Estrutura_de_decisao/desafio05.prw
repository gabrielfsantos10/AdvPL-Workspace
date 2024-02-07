//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
User Function dsf05()

//Variaveis locais
Local nVerMedias
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nVerMedias := u_VerificaNotas()
//mostra o total ao final dos cadastro
Return

User Function VerificaNotas()

Local nNotas:=0
Local i
Local nSoma:=0
Local nMedia:=0

for i := 1 to 2
    nNotas := val(FWInputBox("Nota "+CValToChar(i)+":", ""))
    nSoma := nSoma + nNotas
NEXT
    nMedia := nSoma / 2

    Do Case
        Case nMedia >= 7
            //Imprimir Resultado do Aluno Aprovado
            FWAlertInfo("M�dia Final: "+CValToChar(nMedia)+" - APROVADO!!!","Resultado")

        Case nMedia == 10
            //Imprimir Resultado do Aluno Aprovado
            FWAlertInfo("M�dia Final: "+CValToChar(nMedia)+" - APROVADO COM DISTIN��O!!!","Resultado")

        Case nMedia < 7
            //Imprimir Resultado do Aluno em Recuperação
            FWAlertInfo("M�dia Final: "+CValToChar(nMedia)+" - REPROVADO!!!","Resultado")
    EndCase

Return
