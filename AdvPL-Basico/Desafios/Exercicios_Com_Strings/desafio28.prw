//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
User Function dsf28()

//Variaveis locais
Local cStrings
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

cStrings := u_NomeVertical()
//mostra o total ao final dos cadastro
Return

User Function NomeVertical()

      Local cNome := ""
      Local i := 0
      Local cMsg := ""

      cNome := FWINPUTBOX("Digite o seu nome: ", "Preencha o campo")

      //Exibe a string de forma vertical
      For i := 1 To Len(cNome)
            cMsg += SubStr(cNome,i,1) + CRLF
      Next i

      //Upper: � utilizado para transformar uma string toda em mai�scula
      FWAlertSuccess(Upper(cMsg), "Palavra na vertical")
Return
