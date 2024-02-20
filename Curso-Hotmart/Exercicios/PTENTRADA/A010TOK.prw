//Bibliotecas
#Include "Protheus.ch"


User Function A010TOK()
    Local aArea     := FWGetArea()
    Local lContinua := .T.
    Local cTipo     := ""
    Local cGrupo    := ""

    //Pega o campo de vendedor e de tipo de pedido
    cTipo  := M->B1_TIPO
    cGrupo := M->B1_GRUPO

    //Se for um pedido normal (tipo N) e o não tiver vendedor preenchido
    If cTipo == "EM" .and. Empty(cGrupo)
        ExibeHelp("Help_A010TOK", "Para tipos 'EM'(EMBALAGEM), deve-se preencher o campo 'Grupo'!", "Preencha a informação no campo B1_GRUPO")
        lContinua := .F.
    EndIf

    FWRestArea(aArea)
Return lContinua
