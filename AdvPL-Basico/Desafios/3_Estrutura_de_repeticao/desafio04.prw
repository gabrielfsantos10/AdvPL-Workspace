//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
User Function df04()

//Variaveis locais
Local nNegativos
Private nQtdNgt := 0
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nNegativos := u_MostraNegativos()
FWAlertSuccess("Quantidade de n�meros negativos: "+CValToChar(nQtdNgt),"Resultado")
Return

User Function MostraNegativos()

Local nNumeros := 0
Local i

for i := 1 to 3
    nNumeros:= val(FWInputBox(CValToChar(i)+"� n�mero: ", ""))

    if nNumeros < 0
        nQtdNgt := nQtdNgt +1
    ENDIF

NEXT
Return
