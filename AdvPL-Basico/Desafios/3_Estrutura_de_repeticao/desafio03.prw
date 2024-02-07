//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
User Function df03()

//Variaveis locais
Local nNotas
Private nMedia:=0
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nNotas := u_MostraMedia()
FWAlertSuccess("M�dia final: "+CValToChar(nMedia),"Resultado")
Return

User Function MostraMedia()

Local aNotas := Array(2)
Local i

for i := 1 to 2
    aNotas[i]:= val(FWInputBox(CValToChar(i)+"� nota: ", ""))

    while aNotas[i] < 0 .OR. aNotas[i] >10
        FWAlertError("Nota invalida! Favor digitar novamente...","ERRO")
        //digitando novamente a nota
        aNotas[i]:= val(FWInputBox(CValToChar(i)+"� nota: ", ""))
    ENDDO

NEXT
    nMedia:= (aNotas[1] + aNotas[2]) / 2
Return
