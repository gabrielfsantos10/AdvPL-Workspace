//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
User Function dsf01()

//Variaveis locais
Local nHospedagem
Private nTotal
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nHospedagem := u_CalculaValorHosp()
//mostra o total ao final dos cadastro
nTotal:= FWAlertInfo("Valor a pagar: "+CValToChar(nTotal),"Hospedagem")
Return

User Function CalculaValorHosp()

Local cPessoas
Local nIdade := 0
Local nSoma := 0

//atribuindo valores padroes as variaveis
while cPessoas != 'PARE'
    cPessoas := FWInputBox("Nome: ", "")
    nIdade := val(FWInputBox("Idade: ", ""))

    Do Case
		Case nIdade <= 4
            //caso for menor que 4 anos possui gratuidade
            FWAlertInfo(cPessoas+" possui gratuidade!","Hospedagem")
            nSoma := nSoma + 0
		Case nIdade >= 80
            //caso for maior que 80 anos paga meia
			FWAlertInfo(cPessoas+" paga meia!","Hospedagem")
            nSoma := nSoma + 50
		Otherwise
			// outras idades paga normalmente
            FWAlertInfo(cPessoas+" paga valor padr�o!","Hospedagem")
            nSoma := nSoma + 100
    EndCase
    nTotal := nSoma
ENDDO

Return
