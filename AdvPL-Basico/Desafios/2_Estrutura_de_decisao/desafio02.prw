//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
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
nNumero := val(FWInputBox("N�mero: ", ""))

if nNumero > 0
    FWAlertInfo("O n�mero "+CValToChar(nNumero)+" � POSITIVO!","Verificando")
else
    FWAlertInfo("O n�mero "+CValToChar(nNumero)+" � NEGATIVO!","Verificando")
ENDIF

Return
