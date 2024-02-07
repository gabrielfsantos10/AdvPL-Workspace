//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcaoo principal, chamada para a execução da rotina de notas dos alunos
User Function desaf03()

//Variaveis locais
Local nAumento
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

nAumento := u_calculaAumento()
FWAlertSuccess("Novo sal�rio:"+STR(nAumento) ,"Reajuste salarial")
Return

User Function calculaAumento()

Local nSalario
Local nReajuste
Local nNovoS

nSalario := val(fGetInf("Insira o sal�rio: ", 5, "@E 9999,99"))
nReajuste := val(fGetInf("Insira o reajuste: ", 5, "@E 99"))
nReajuste := (nReajuste / 100) * nSalario

nNovoS := nSalario + nReajuste

Return(nNovoS)


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
