//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
User Function des02()

//Variaveis locais
Local nQuadrados
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nQuadrados := u_calculaNumeros()
Return

User Function calculaNumeros()

Local nNumero
Local nQuad

//atribuindo valores padroes as variaveis
for nNumero := 1 to 10
    nQuad := nNumero * nNumero
    FWAlertInfo(STR(nNumero)+" ao quadrado:"+STR(nQuad),"N�meros de 1 a 10 ao quadrado")
next

//    FWAlertInfo("Variavel A:"+STR(nA)+ "  -  Variavel B:"+STR(nB) ,"Valores trocados")

Return(nQuad)
