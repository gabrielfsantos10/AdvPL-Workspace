#Include "TOTVS.ch"

// FUNÇÃO PARA CONSUMO DO SERVIÇO REST
User Function CFipe1()
    Local cMarca    := "23"                                                   // MARCA POR ID
    Local cServer   := "parallelum.com.br/"                           // URL (IP) DO SERVIDOR
    Local cURI      := "fipe/api/v1/carros/marcas/" + cMarca + "/modelos"    // URI DO SERVIÇO REST
    Local oRest     := FwRest():New("http://" + cServer)                      // CLIENTE PARA CONSUMO REST
    Local aHeader   := {}                                                     // CABEÇALHO DA REQUISIÇÃO
    Local cModelo   := ''
    Local jJson

    // PREENCHE CABEÇALHO DA REQUISIÇÃO
    AAdd(aHeader, "Content-Type: application/json; charset=UTF-8")
    AAdd(aHeader, "Accept: application/json")
    AAdd(aHeader, "User-Agent: Chrome/65.0 (compatible; Protheus " + GetBuild() + ")")

    // INFORMA O RECURSO]
    oRest:SetPath(cURI)

    // REALIZA O MÉTODO GET E VALIDA O RETORNO
    If (oRest:Get(aHeader))

        jJson := JsonObject():New()
        cParserError := jJson:fromJson(oRest:getResult())

        for cModelo := 1 to 10
            msgInfo(cValToChar(jJson['modelos'][cModelo]['nome']), "Sucesso")        
        next
    Else
        Alert("GET: " + oRest:GetLastError())
    EndIf

    Return (NIL)

