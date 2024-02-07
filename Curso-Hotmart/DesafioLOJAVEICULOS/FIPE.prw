#include 'totvs.ch'


user function getFIPE(cIdMarca)
    local aArea:= getArea()
    local cRet := ''

    default cIdMarca:= ''

    cIdMarca := allTrim(cIdMarca)
    cRet     := tbFIPEX(cIdMarca)

    // FWMsgRun(,{||cRet:= viaCEPX(cCep)},'VIACEP', 'Consultando...')

    restArea(aArea)

return cRet


Static Function tbFIPEX(cIdMarca)
    Local cServer   := "parallelum.com.br/"                                 // URL (IP) DO SERVIDOR
    Local cURI      := "fipe/api/v1/carros/marcas/" + cIdMarca + "/modelos" // URI DO SERVIÇO REST
    Local oRest     := FwRest():New("http://" + cServer)                    // CLIENTE PARA CONSUMO REST
    Local aHeader   := {}                                                   // CABEÇALHO DA REQUISIÇÃO

    Local jJson

    // PREENCHE CABEÇALHO DA REQUISIÇÃO
    AAdd(aHeader, "Content-Type: application/json; charset=UTF-8")
    AAdd(aHeader, "Accept: application/json")
    AAdd(aHeader, "User-Agent: Chrome/65.0 (compatible; Protheus " + GetBuild() + ")")

    // INFORMA O RECURSO
    oRest:SetPath(cURI)

    // REALIZA O MÉTODO GET E VALIDA O RETORNO
    If (oRest:Get(aHeader))

        jJson := JsonObject():New()
        cParserError := jJson:fromJson(oRest:getResult())


        oModel := FWModelActive()
        // FWFldPut('ZA2_MODELO',  '1=' + jJson['modelos'][1]['nome'] + ';2=' + jJson['modelos'][2]['nome'])
        FWFldPut('ZA2_MODELO',  1=jJson['modelos'][1]['nome'])

        FWAlertSuccess("Valores alterados com sucesso", "BUSCA POR VEÍCULOS")
    Else
        Alert("Erro no preenchimento dos dados: " + oRest:GetLastError())
    EndIf

    Return .T.
