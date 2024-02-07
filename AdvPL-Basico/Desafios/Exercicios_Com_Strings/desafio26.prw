//Includes sÃ£o os dicinonÃ¡rios do Framework da Linguagem ADVPL para "traduÃ§Ã£o" do fonte que criamos, no momento da compilaÃ§Ã£o
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execuÃ§Ã£o da rotina de notas dos alunos
User Function dsf26()

//Variaveis locais
Local cStrings
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

cStrings := u_ComparaTamanho()
//mostra o total ao final dos cadastro
Return

User Function ComparaTamanho()

      Local cString1 := ""
      Local cString2 := ""
      Local cMsg := ""

      cString1 := FWINPUTBOX("Digite a String 1: ", "Preencha o campo")
      cString2 := FWINPUTBOX("Digite a String 2: ", "Preencha o campo")

      cMsg := cString1 + "   Tamanho: " + cValToChar(Len(cString1)) + CRLF
      cMsg += cString2 + "   Tamanho: " + cValToChar(Len(cString2)) + CRLF + CRLF

      //Validação de tamanho de string
      if (Len(cString1) > Len(cString2)) .or. (Len(cString1) < Len(cString2))
            cMsg += "As duas strings são de tamanhos diferentes!" + CRLF + CRLF
      else
            cMsg += "As duas strings são de tamanhos iguais!" + CRLF + CRLF
      ENDIF

      if cString1 == cString2
            cMsg += "As duas strings possuem conteúdo igual!" + CRLF + CRLF
      else
            cMsg += "As duas strings possuem conteúdo diferente!" + CRLF + CRLF
      endif

      FWAlertError(cMsg, "Manipulação de Strings")
Return
