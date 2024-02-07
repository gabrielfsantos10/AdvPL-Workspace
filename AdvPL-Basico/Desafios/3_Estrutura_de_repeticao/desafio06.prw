//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
User Function df06()

//Variaveis locais
Local nDescontos
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nDescontos := u_MostraDesconto()
Return

User Function MostraDesconto()

Local nValorDaCompra:= 0
Local i:=0
Local nCalculaDesconto:=0
Local nValorAcumula:=0

nValorDaCompra := val(FWInputBox("Valor da compra: ", ""))

if nValorDaCompra > 500
    while nValorAcumula != nValorDaCompra
        nValorAcumula := nValorAcumula + 100    
        i:= i +1
    ENDDO

    nCalculaDesconto:= nValorDaCompra * (1-(i/100))
    FWAlertSuccess("valor da compra: "+CValToChar(nValorDaCompra)+"porcentagem de desconto: "+CValToChar(i)+"Valor final: "+CValToChar(nCalculaDesconto),"Resultado")

ENDIF
if nValorDaCompra < 500
    FWAlertSuccess("valor da compra: "+CValToChar(nValorDaCompra)+"N�o possui desconto! "+"Valor final: "+CValToChar(nValorDaCompra),"Resultado")
ENDIF
if nValorDaCompra == 500
        nCalculaDesconto:= nValorDaCompra * (1-(i/100))
    FWAlertSuccess("valor da compra: "+CValToChar(nValorDaCompra)+"porcentagem de desconto: 1 %"+"Valor final: "+CValToChar(nCalculaDesconto),"Resultado")
ENDIF    
Return
