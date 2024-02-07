//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
User Function dsf29()

//Variaveis locais
Local cStrings
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

cStrings := u_VerificaFrase()
//mostra o total ao final dos cadastro
Return

User Function VerificaFrase()

      Local cFrase := ""
      Local i := 0
      Local cMsg := ""
      Local nContEspacos := 0
      Local nContVogais := 0

      cFrase := Upper(FWINPUTBOX("Digite uma frase: ", "Preencha o campo"))

      //Exibe a string de forma vertical
      For i := 1 To Len(cFrase)
            //pega apenas um caracter
            cMsg := SubStr(cFrase,i,1)

            if cMsg == CHR(32)
                  nContEspacos := nContEspacos + 1
            endif
            if (cMsg == 'A') .or. (cMsg == 'E') .or. (cMsg == 'I') .or. (cMsg == 'O') .or. (cMsg == 'U')
                  nContVogais := nContVogais + 1
            endif
      Next i

      FWAlertSuccess("Quantidade de espa�os: "+ CValToChar(nContEspacos) + CRLF + "Quantidade de vogais: "+ CValToChar(nContVogais), " ")
Return
