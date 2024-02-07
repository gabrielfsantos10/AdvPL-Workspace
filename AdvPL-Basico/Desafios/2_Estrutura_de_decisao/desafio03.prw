//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
User Function dsf03()

//Variaveis locais
Local nVerificaAlturas
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nVerificaAlturas := u_VerAlturas()
//mostra o total ao final dos cadastro
Return

User Function VerAlturas()

Local aAlturas := Array(3)
Local i
Local nMenor, nMaior

aAlturas[1] := val(FWInputBox("Altura: ", ""))
nMenor := aAlturas[1]
nMaior := aAlturas[1]

for i := 2 to 15
    aAlturas[i] := val(FWInputBox("Altura: ", ""))

    if aAlturas[i] <= aAlturas[i-1]
        nMenor:= aAlturas[i]
    ENDIF
    if aAlturas[i] >= aAlturas[i-1]
        nMaior:= aAlturas[i]
    ENDIF
NEXT

    FWAlertInfo("A maior altura �: "+CValToChar(nMaior),"Verificando Altura")
    FWAlertInfo("A menor altura �: "+CValToChar(nMenor),"Verificando Altura")

Return
