//Includes sÃ£o os dicinonÃ¡rios do Framework da Linguagem ADVPL para "traduÃ§Ã£o" do fonte que criamos, no momento da compilaÃ§Ã£o
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execuÃ§Ã£o da rotina de notas dos alunos
User Function dsf02()

//Variaveis locais
Local nVerificaNum
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nVerificaNum := u_NegativoPosit()
//mostra o total ao final dos cadastro
Return

User Function NegativoPosit()

Local nNumero := 0

//atribuindo valores padroes as variaveis
nNumero := val(FWInputBox("Número: ", ""))

if nNumero > 0
    FWAlertInfo("O número "+CValToChar(nNumero)+" é POSITIVO!","Verificando")
else
    FWAlertInfo("O número "+CValToChar(nNumero)+" é NEGATIVO!","Verificando")
ENDIF

Return
