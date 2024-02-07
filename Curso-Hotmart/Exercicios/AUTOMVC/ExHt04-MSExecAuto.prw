#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"


USER FUNCTION HtEx04()
    Local aArea       := GetArea()
    Local aDados      := {}
    Local lMsErroAuto := .F.

    AADD(aDados, {"A1_COD", "0003", Nil})
    AADD(aDados, {"A1_LOJA", "03", Nil})
    AADD(aDados, {"A1_NOME", "GABRIEL FARIA 04", Nil})
    AADD(aDados, {"A1_PESSOA", "F", Nil})
    AADD(aDados, {"A1_END", "AV LUIS VAZ DE CAMÕES", Nil})
    AADD(aDados, {"A1_NREDUZ", "GABRIEL 03", Nil})
    AADD(aDados, {"A1_TIPO", "L", Nil})
    AADD(aDados, {"A1_EST", "SP", Nil})
    AADD(aDados, {"A1_MUN", "LIMEIRA", Nil})

    Begin Transaction
        MSExecAuto({|x, y| Mata030(x, y)}, aDados, 3)
        // MSExecAuto({|x,y| Mata030(x,y)},aVetor,3)

        //Se houver erro, mostra a mensagem
        if lMsErroAuto
            MostraErro()
            DisarmTransaction()
        else
            MSGINFO("Cliente cadastrado com sucesso!", "CADASTRO")
        endif

    End Transaction

    RestArea(aArea)
RETURN
