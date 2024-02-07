#Include "TOTVS.ch"

// FUN��O PARA CONSUMO DO SERVI�O REST
User Function ViaCep1()
    Local cCep      := "01001000"                           // CEP A SER CONSULTADO
    Local cServer   := "viacep.com.br"                      // URL (IP) DO SERVIDOR
    Local cURI      := "/ws/" + cCep + "/json"              // URI DO SERVI�O REST
    Local oRest     := FwRest():New("http://" + cServer)    // CLIENTE PARA CONSUMO REST
    Local aHeader   := {}                                   // CABE�ALHO DA REQUISI��O

    Local jJson

    // PREENCHE CABE�ALHO DA REQUISI��O
    AAdd(aHeader, "Content-Type: application/json; charset=UTF-8")
    AAdd(aHeader, "Accept: application/json")
    AAdd(aHeader, "User-Agent: Chrome/65.0 (compatible; Protheus " + GetBuild() + ")")

    // INFORMA O RECURSO
    oRest:SetPath(cURI)

    // REALIZA O M�TODO GET E VALIDA O RETORNO
    If (oRest:Get(aHeader))

        jJson := JsonObject():New()
        cParserError := jJson:fromJson(oRest:getResult())

        msgInfo(cValToChar(jJson['uf']), "Sucesso")
    Else
        Alert("GET: " + oRest:GetLastError())
    EndIf

    Return (NIL)

