//Includes sÃ£o os dicinonÃ¡rios do Framework da Linguagem ADVPL para "traduÃ§Ã£o" do fonte que criamos, no momento da compilaÃ§Ã£o
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execuÃ§Ã£o da rotina de notas dos alunos
User Function dsf25()

//Variaveis locais
Local nListas
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nListas := u_Investigacao()
//mostra o total ao final dos cadastro
Return

User Function Investigacao()

    Local aVetor := ARRAY(5, 2)
    aVetor[1][1] := "Telefonou para a vítima?"
    aVetor[2][1] := "Esteve no local do crime?"
    aVetor[3][1] := "Mora perto da vítima?"
    aVetor[4][1] := "Devia para a vítima?"
    aVetor[5][1] := "Já trabalhou com a vítima?"
    Local i := 0
    Local nRespondeuSim := 0

    for i := 1 to 5
        aVetor[i][2] := FWINPUTBOX(aVetor[i][1], "Responda com S ou N")

        if aVetor[i][2] == "S"
            nRespondeuSim += 1
        endif
    next

    Do Case
		Case nRespondeuSim == 2
            FWAlertError("SUSPEITO!", "Resultado da investigação")
		Case (nRespondeuSim == 3) .or. (nRespondeuSim == 4)
            FWAlertError("CÚMPLICE!", "Resultado da investigação")
		Case nRespondeuSim == 5
            FWAlertError("ASSASSINO!", "Resultado da investigação")
		Otherwise
            FWAlertError("INOCENTE!", "Resultado da investigação")
	EndCase
Return
