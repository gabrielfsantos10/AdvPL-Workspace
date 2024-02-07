//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
User Function dsf16()

//Variaveis locais
Local cBissexto
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

cBissexto := u_VerificaAno()
//mostra o total ao final dos cadastro
Return

User Function VerificaAno()

    Local nAno := 0

    nAno := val(FWINPUTBOX("Informe um ano: ", " "))

    if nAno % 4 == 0
        FWAlertSuccess("O ano � bissexto!!", " ")
    else
        FWAlertSuccess("O ano n�o � bissexto!!", " ")
    endif
Return
