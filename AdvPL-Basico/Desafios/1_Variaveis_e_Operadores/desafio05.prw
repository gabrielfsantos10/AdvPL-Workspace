//Includes sÃ£o os dicinonÃ¡rios do Framework da Linguagem ADVPL para "traduÃ§Ã£o" do fonte que criamos, no momento da compilaÃ§Ã£o
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execuÃ§Ã£o da rotina de notas dos alunos
User Function dsf05()

//Variaveis locais
Local nOrdem
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nOrdem := u_OrdemCrescente()
Return

User Function OrdemCrescente()

Local aNumeros := Array(3)
Local i

for i:= 1 to 3
    aNumeros[i] := val(fGetInf("Digite o"+CValToChar(i)+"º número: ", 5, "@E 9"))
NEXT

if aNumeros[3] > aNumeros[1]
    if aNumeros[1] > aNumeros[2]
        FWAlertSuccess("A ordem crescente é: "+CValToChar(aNumeros[2])+" "+CValToChar(aNumeros[1])+" "+CValToChar(aNumeros[3]),"Resultado")
   
    else
        if aNumeros[2] < aNumeros[3]
            FWAlertSuccess("A ordem crescente é: "+CValToChar(aNumeros[1])+" "+CValToChar(aNumeros[2])+" "+CValToChar(aNumeros[3]),"Resultado")            
        Endif    
    Endif
Endif

if aNumeros[1] > aNumeros[2]
    if aNumeros[2] > aNumeros[3]
        FWAlertSuccess("A ordem crescente é: "+CValToChar(aNumeros[3])+" "+CValToChar(aNumeros[2])+" "+CValToChar(aNumeros[1]),"Resultado")
    else
        if aNumeros[3] < aNumeros[1]
            FWAlertSuccess("A ordem crescente é: "+CValToChar(aNumeros[2])+" "+CValToChar(aNumeros[3])+" "+CValToChar(aNumeros[3]),"Resultado")            
        Endif    
    Endif
Endif

if aNumeros[1] < aNumeros[2]
    if aNumeros[3] < aNumeros[1]
        FWAlertSuccess("A ordem crescente é: "+CValToChar(aNumeros[3])+" "+CValToChar(aNumeros[1])+" "+CValToChar(aNumeros[2]),"Resultado")
    else
        if aNumeros[3] < aNumeros[2]
            FWAlertSuccess("A ordem crescente é: "+CValToChar(aNumeros[1])+" "+CValToChar(aNumeros[3])+" "+CValToChar(aNumeros[2]),"Resultado")            
        Endif    
    Endif
Endif

Return

Static Function fGetInf(cTitulo,nTam,cPicture)

Local oDlg
Local cGetVar := space(nTam)
Local oGet
Local oBtn1,oBtn2
Local lOk := .F. 

DEFINE DIALOG oDlg TITLE (cTitulo) ;
    FROM 0,0 TO 100,500 PIXEL

@ 05,05 GET oGet VAR cGetVar  PICTURE (cPicture) SIZE (nTam*4),12 OF oDlg PIXEL 

@ 25,05  BUTTON oBtn1 PROMPT "Confirmar" SIZE 40,15  ACTION (lOk := .T. , oDlg:End()) OF oDlg PIXEL 

@ 25,50  BUTTON oBtn2 PROMPT "Voltar" SIZE 40,15  ACTION (oDlg:End()) OF oDlg PIXEL 

ACTIVATE DIALOG oDlg CENTER


If !lOk
   cGetVar := space(nTam)
Endif

Return cGetVar
