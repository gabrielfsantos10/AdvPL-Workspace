//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
User Function desa04()

//Variaveis locais
Local nPrimo
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nPrimo := u_VerificaPrimo()
Return

User Function VerificaPrimo()

Local nNumero
Local nVerifPrimo

nNumero := val(fGetInf("Digite um n�mero para saber se � primo: ", 5, "@E 99"))

if nNumero > 0
    if (nNumero % nNumero) = 0
        nVerifPrimo := + 1
    Endif
Endif

if nVerifPrimo = 2
    FWAlertSuccess("o n�mero "+CValToChar(nNumero)+" � primo","Resultado")
else
    FWAlertSuccess("o n�mero "+CValToChar(nNumero)+" n�o � primo","Resultado")   
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
