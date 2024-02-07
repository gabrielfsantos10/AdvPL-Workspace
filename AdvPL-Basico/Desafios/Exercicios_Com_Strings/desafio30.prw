#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execuÃ§Ã£o da rotina de notas dos alunos
User Function dsf30()

//Variaveis locais
Local cStrings
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

cStrings := u_NomeEscada()
//mostra o total ao final dos cadastro
Return

User Function NomeEscada()

      Local cNome := ""
      Local i := 0
      Local cMsg := ""

      cNome := FWINPUTBOX("Digite o seu nome: ", "Preencha o campo")

      //Exibe a string de forma vertical
      For i := 1 To Len(cNome)
            cMsg += SubStr(cNome,i,Len(cNome)) + CRLF
      Next i

      //Upper: é utilizado para transformar uma string toda em maiúscula
      FWAlertSuccess(Upper(cMsg), "Palavra em forma de escada")
Return
