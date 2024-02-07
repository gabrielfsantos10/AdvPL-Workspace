//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
User Function dsf25()

//Variaveis locais
Local nListas
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nListas := u_Investigacao()
//mostra o total ao final dos cadastro
Return

User Function Investigacao()

    Local aVetor := ARRAY(5, 2)
    aVetor[1][1] := "Telefonou para a v�tima?"
    aVetor[2][1] := "Esteve no local do crime?"
    aVetor[3][1] := "Mora perto da v�tima?"
    aVetor[4][1] := "Devia para a v�tima?"
    aVetor[5][1] := "J� trabalhou com a v�tima?"
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
            FWAlertError("SUSPEITO!", "Resultado da investiga��o")
		Case (nRespondeuSim == 3) .or. (nRespondeuSim == 4)
            FWAlertError("C�MPLICE!", "Resultado da investiga��o")
		Case nRespondeuSim == 5
            FWAlertError("ASSASSINO!", "Resultado da investiga��o")
		Otherwise
            FWAlertError("INOCENTE!", "Resultado da investiga��o")
	EndCase
Return
