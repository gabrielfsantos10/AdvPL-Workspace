#include 'totvs.ch'


user function getCEP(cCep)
    local aArea:= getArea()
    local cRet := ''

    default cCep:= ''

    cCep:= allTrim(cCep)
    cRet:= viaCEPX(cCep)

    // FWMsgRun(,{||cRet:= viaCEPX(cCep)},'VIACEP', 'Consultando...')

    restArea(aArea)

return cRet


Static Function viaCEPX(cCep)
    Local cServer   := "viacep.com.br"                      // URL (IP) DO SERVIDOR
    Local cURI      := "/ws/" + cCep + "/json"              // URI DO SERVIÇO REST
    Local oRest     := FwRest():New("http://" + cServer)    // CLIENTE PARA CONSUMO REST
    Local aHeader   := {}                                   // CABEÇALHO DA REQUISIÇÃO

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
        // MsgInfo(ValType(jJson['uf']), "tipo")
        // MsgInfo(ValType(cValToChar(jJson['uf'])), "tipo")
        // oModel:SetValue('ZA1_LOGRA',  jJson['logradouro'])
        // oModel:SetValue('ZA1_COMPL',  jJson['complemento'])
        // oModel:SetValue('ZA1_BAIRRO', jJson['bairro'])
        // oModel:SetValue('ZA1_LOCALI', jJson['localidade'])
        // oModel:SetValue('ZA1_UF',     jJson['uf'])
        FWFldPut('ZA1_LOGRA',  jJson['logradouro'])
        FWFldPut('ZA1_COMPL',  jJson['complemento'])
        FWFldPut('ZA1_BAIRRO', jJson['bairro'])
        FWFldPut('ZA1_LOCALI', jJson['localidade'])
        FWFldPut('ZA1_UF',     jJson['uf'])

        FWAlertSuccess("Valores alterados com sucesso", "BUSCA POR CEP")
    Else
        Alert("Erro no preenchimento dos dados: " + oRest:GetLastError())
    EndIf

    Return .T.
