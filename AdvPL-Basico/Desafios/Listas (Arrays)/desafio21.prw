//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
User Function dsf21()

//Variaveis locais
Local nListas

nListas      := u_ContaConsoantes()
//mostra o total ao final dos cadastro
Return

User Function ContaConsoantes()

    Local aVetor := ARRAY(5)
    Local i      := 0

    for i := 1 to 5
        aVetor[i]    := FWINPUTBOX("Digite o caracter "+cValToChar(i)+":", " ")
    next

    for i := 1 to 5
        if (aVetor[i] >= CHR(65)) .and. (aVetor[i] <= CHR(90))
            FWAlertSuccess("Letra mai�scula: "+ aVetor[i], "Letras mai�sculas")
        ENDIF
    next

Return
