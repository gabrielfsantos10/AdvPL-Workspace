//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
User Function dsf17()

//Variaveis locais
Local nFrutas
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nFrutas := u_Fruteira()
//mostra o total ao final dos cadastro
Return

User Function Fruteira()

    Local nKgMorango := 0
    Local nKgMaca := 0
    Local nTotalKgs := 0
    Local nPrecoTotal := 0
    Local nDesconto := 0

    nKgMorango := val(FWINPUTBOX("KGs de morango: ", " "))
    nKgMaca := val(FWINPUTBOX("KGs de ma��: ", " "))

    //calculo dos precos
    if (nKgMorango > 5)
       nPrecoTotal := nKgMorango * 2.20
    else
       nPrecoTotal := nKgMorango * 2.50
    endif

    if (nKgMaca > 5)
       nPrecoTotal := nPrecoTotal + (nKgMaca * 2.20)
    else
       nPrecoTotal := nPrecoTotal + (nKgMaca * 2.50)
    endif

    //calculo total dos kilos
    nTotalKgs := nKgMaca + nKgMorango

    if ((nTotalKgs > 8) .or. (nPrecoTotal > 25))
        nDesconto := (10/100) * nPrecoTotal
        nPrecoTotal := nPrecoTotal - nDesconto
    endif

    FWAlertSuccess("Valor total com desconto: " + CValToChar(nPrecoTotal), "Calculo de desconto")
Return
