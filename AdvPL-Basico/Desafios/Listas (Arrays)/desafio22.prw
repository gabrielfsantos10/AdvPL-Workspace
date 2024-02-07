//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
User Function dsf22()

//Variaveis locais
Local nListas
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nListas := u_Medias()
//mostra o total ao final dos cadastro
Return

User Function Medias()

    Local aVetor := ARRAY(40)
    Local i := 0
    Local x := 0
    Local nMedia := 0
    Local nTotal := 0
    Local nQtdAprovados := 0

    //pede 4 notas de 10 alunos
    for x := 1 to 10
        for i := 1 to 4
            aVetor[i] := val(FWINPUTBOX("Nota "+cValToChar(i)+":", " "))
            //Soma total
            nTotal := nTotal + aVetor[i]        
        next
        //calcula a media
        nMedia := nTotal / 4

        if nMedia >= 7
            //soma um aos aprovados
            nQtdAprovados := nQtdAprovados + 1
        ENDIF
    next

    FWAlertSuccess("Quantidade de aprovados: "+ cValToChar(nQtdAprovados), " ")

Return
