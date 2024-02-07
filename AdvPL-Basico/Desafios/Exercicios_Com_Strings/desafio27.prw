//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
User Function dsf27()

//Variaveis locais
Local cStrings
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

cStrings := u_NomeInverso()
//mostra o total ao final dos cadastro
Return

User Function NomeInverso()

      Local cNome := ""
      Local i := 0
      Local cMsg := ""

      cNome := FWINPUTBOX("Digite o seu nome: ", "Preencha o campo")

      //inverte a string de tr�s para frente
      For i := Len(cNome) To 1 Step -1
            cMsg += SubStr(cNome,i,1)
      Next i

      //Upper: � utilizado para transformar uma string toda em mai�scula
      FWAlertSuccess(Upper(cMsg), "Nome ao contr�rio mai�sculo")
Return
