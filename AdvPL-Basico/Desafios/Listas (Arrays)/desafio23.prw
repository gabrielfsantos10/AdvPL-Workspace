//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
User Function dsf23()

//Variaveis locais
Local nListas
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nListas := u_Alturas()
//mostra o total ao final dos cadastro
Return

User Function Alturas()

    Local aVetor := ARRAY(30)
    Local i := 0
    Local nMedia := 0
    Local nTotal := 0
    Local nQtdInferiores := 0

    for i := 1 to 5
        aVetor[i] := { val(FWINPUTBOX("Idade: ", " ")), val(FWINPUTBOX("Altura: ", " ")) }

        nTotal := nTotal + aVetor[i][2] //soma a segunda posicao que � a nota
    next

    //media da altura de todos os alunos
    nMedia := nTotal / 5

    for i := 1 to 5
        //valida as idades
        if aVetor[i][1] > 13
            if aVetor[i][2] < nMedia
                nQtdInferiores := nQtdInferiores + 1
            endif            
        endif
    next
    
    FWAlertSuccess("Quantidade de alunos com mais de 13 anos, que possuem altura menor que a m�dia: " + cValToChar(nQtdInferiores), " ")
Return
