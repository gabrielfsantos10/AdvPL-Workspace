//Includes são os dicinonários do Framework da Linguagem ADVPL para "tradução" do fonte que criamos, no momento da compilação
#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TBICONN.CH"

//Funcao principal, chamada para a execução da rotina de notas dos alunos
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

      //Valida��o de tamanho de string
      if (Len(cString1) > Len(cString2)) .or. (Len(cString1) < Len(cString2))
            cMsg += "As duas strings s�o de tamanhos diferentes!" + CRLF + CRLF
      else
            cMsg += "As duas strings s�o de tamanhos iguais!" + CRLF + CRLF
      ENDIF

      if cString1 == cString2
            cMsg += "As duas strings possuem conte�do igual!" + CRLF + CRLF
      else
            cMsg += "As duas strings possuem conte�do diferente!" + CRLF + CRLF
      endif

      FWAlertError(cMsg, "Manipula��o de Strings")
Return
