//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
User Function dsf18()

//Variaveis locais
Local nFrutas
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nFrutas := u_PostoGasolina()
//mostra o total ao final dos cadastro
Return

User Function PostoGasolina()

    Local cCombustivel := ""
    Local nLitros := 0
    Local nValor := 0
    Local nDesconto := 0

    while (cCombustivel != "A") .and. (cCombustivel != "G")
        cCombustivel := FWINPUTBOX("Digite o tipo de combustivel: [G/A]", " ")        
    end

    nLitros := val(FWINPUTBOX("Digite os litros: ", " "))        

    if cCombustivel == 'A'
        if nLitros <= 20
            nValor := nLitros * 1.90 //valor total sem desconto
            nDesconto := (3/100) * nValor
            nValor := nValor - nDesconto //valor total com desconto
        else
            nValor := nLitros * 1.90 //valor total sem desconto
            nDesconto := (5/100) * nValor
            nValor := nValor - nDesconto //valor total com desconto
        endif
    else
        if nLitros <= 20
            nValor := nLitros * 2.50 //valor total sem desconto
            nDesconto := (4/100) * nValor
            nValor := nValor - nDesconto //valor total com desconto
        else
            nValor := nLitros * 2.50 //valor total sem desconto
            nDesconto := (6/100) * nValor
            nValor := nValor - nDesconto //valor total com desconto
        endif
    endif
   
    FWAlertSuccess("Valor total com desconto: " + CValToChar(nValor), "Calculo de desconto")
Return
