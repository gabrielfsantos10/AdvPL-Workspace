#INCLUDE 'totvs.ch'


//Boas práticas com constantes - Colocar o tipo ou nome sugestivo antes = "STR_NOME"
#Define STR_NOME "Gabriel Faria"
#Define NUM_IDADE 21
#Define STR_CIDADE "Limeira"
#Define STR_ESTADO "SP"
#Define STR_SEXO "M"
#Define DAT_NASC DATE()


User Function xBoaP001()
    Local aArea := GetArea()
    Local cMsg  := ""

    cMsg := "--- INFORMAÇÕES ---" + CRLF
    cMsg += "NOME: " + STR_NOME + CRLF
    cMsg += "IDADE: " + CVALTOCHAR(NUM_IDADE) + CRLF
    cMsg += "CIDADE: " + STR_CIDADE + CRLF
    cMsg += "ESTADO: " + STR_ESTADO + CRLF
    cMsg += "SEXO: " + STR_SEXO + CRLF
    cMsg += "DT. NASC.: " + CVALTOCHAR(DAT_NASC)

    MSGINFO(cMsg, "Informações do cliente")

    RestArea(aArea)
Return
