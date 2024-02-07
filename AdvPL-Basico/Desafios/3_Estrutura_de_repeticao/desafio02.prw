//Includes s√£o os dicinon√°rios do Framework da Linguagem ADVPL para "tradu√ß√£o" do fonte que criamos, no momento da compila√ß√£o
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execu√ß√£o da rotina de notas dos alunos
User Function df02()

//Variaveis locais
Local nDivisao
Private nResult:=0
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nDivisao := u_DivideNums()
FWAlertSuccess("Resultado da divis„o: "+CValToChar(nResult),"Resultado")
Return

User Function DivideNums()

Local aNumeros := Array(2)
Local i

for i := 1 to 2
    aNumeros[i]:= val(FWInputBox(CValToChar(i)+"∫ n˙mero: ", ""))

    while aNumeros[i] == 0
        FWAlertError("Valor invalido! Favor digitar novamente...","ERRO")
        //digitando novamente o valor
        aNumeros[i]:= val(FWInputBox(CValToChar(i)+"∫ n˙mero: ", ""))
    ENDDO

NEXT
    nResult:= aNumeros[1] / aNumeros[2]
Return
