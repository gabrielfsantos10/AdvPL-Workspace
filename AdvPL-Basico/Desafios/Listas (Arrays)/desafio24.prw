//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
User Function dsf24()

//Variaveis locais
Local nListas
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nListas := u_Temperaturas()
//mostra o total ao final dos cadastro
Return

User Function Temperaturas()

    Local aVetor := ARRAY(12, 2)
    aVetor[1][1] := "Janeiro"
    aVetor[2][1] := "Fevereiro"
    aVetor[3][1] := "Mar�o"
    aVetor[4][1] := "Abril"
    aVetor[5][1] := "Maio"
    aVetor[6][1] := "junho"
    aVetor[7][1] := "Julho"
    aVetor[8][1] := "Agosto"
    aVetor[9][1] := "Setembro"
    aVetor[10][1] := "Outubro"
    aVetor[11][1] := "Novembro"
    aVetor[12][1] := "Dezembro"
    Local i := 0
    Local nMedia := 0
    Local nTotal := 0
    Local cMsg := ""

    for i := 1 to 12
        aVetor[i][2] := val(FWINPUTBOX("Temperatura do m�s: ", " "))

        nTotal := nTotal + aVetor[i][2]
    next

    //media da altura de todos os alunos
    nMedia := nTotal / 12

    for i := 1 to 12
        if aVetor[i][2] > nMedia
            cMsg += cValToChar(i) + " - " + aVetor[i][1] + CHR(13)+CHR(10)
        endif
    next
    
    FWAlertSuccess(cMSg, "Meses acima da m�dia anual")
Return
