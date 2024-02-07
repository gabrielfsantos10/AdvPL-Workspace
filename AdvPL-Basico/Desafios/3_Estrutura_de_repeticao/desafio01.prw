//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
User Function df01()

//Variaveis locais
Local nTabuadas
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nTabuadas := u_GeraTabuadas()
//mostra o total ao final dos cadastro
Return

User Function GeraTabuadas()

Local nNumeros:=0
Local nResult:=0
Local i

for nNumeros := 1 to 2

    for i := 1 to 2
        nResult := nNumeros * i
        AutoGrLog(CValToChar(nNumeros)+" x "+CValToChar(i)+" = "+CValToChar(nResult),"Tabuada do "+CValToChar(nNumeros))

        MostraErro()
        //FWAlertSuccess(CValToChar(nNumeros)+" x "+CValToChar(i)+" = "+CValToChar(nResult),"Tabuada do "+CValToChar(nNumeros))
    NEXT

NEXT
    
Return
