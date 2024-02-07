//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
User Function df05()

//Variaveis locais
Local nAsteristicos
Local cAsteristicos := ""

PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nAsteristicos := u_MostraAsteristicos()
FWAlertSuccess(cAsteristicos,"Resultado")
Return

User Function MostraAsteristicos()

Local nNumAst := 0
Local i

nNumAst:= val(FWInputBox("Informe a quantidade de Aster�sticos: ", ""))

for i := 1 to nNumAst
    cAsteristicos:= cAsteristicos + "*"
NEXT
Return
