//Includes s√£o os dicinon√°rios do Framework da Linguagem ADVPL para "tradu√ß√£o" do fonte que criamos, no momento da compila√ß√£o
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execu√ß√£o da rotina de notas dos alunos
User Function dsf14()

//Variaveis locais
Local cDiaSemana
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

cDiaSemana := u_MostraDiaDaSemana()
//mostra o total ao final dos cadastro
Return

User Function MostraDiaDaSemana()

    Local nDia := ""

    nDia := FWINPUTBOX("N˙mero do dia: ", " ")

    Do Case
		Case nDia == "1"
            FWAlertSuccess("O dia da semana È: Domingo","Dias da semana")
		Case nDia == "2"
            FWAlertSuccess("O dia da semana È: Segunda-Feira","Dias da semana")
        Case nDia == "3"
            FWAlertSuccess("O dia da semana È: TerÁa-Feira","Dias da semana")
        Case nDia == "4"
            FWAlertSuccess("O dia da semana È: Quarta-Feira","Dias da semana")
        Case nDia == "5"
            FWAlertSuccess("O dia da semana È: Quinta-Feira","Dias da semana")
        Case nDia == "6"
            FWAlertSuccess("O dia da semana È: Sexta-Feira","Dias da semana")
        Case nDia == "7"
            FWAlertSuccess("O dia da semana È: S·bado","Dias da semana")
		Otherwise
            FWAlertError("Valor inv·lido","ERROR")
	EndCase
Return
