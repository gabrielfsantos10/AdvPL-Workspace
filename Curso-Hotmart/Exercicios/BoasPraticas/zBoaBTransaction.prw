#INCLUDE 'totvs.ch'


User Function zBoaP003()
    Local aArea         := GetArea()
    Local aDados        := {}
    Private lMsErroAuto := .F.

    //add os dados do cadastro de bancos
    AADD( aDados, {"A6_COD", "000"} )
    AADD( aDados, {"A6_AGENCIA", "00000"} )
    AADD( aDados, {"A6_NUMCOM", "0000000000"} )
    AADD( aDados, {"A6_NOME", "BANCO DE TESTE"} )

    Begin Transaction
        MsExecAuto({|x, y| Mata070(x, y)}, aDados)

        if lMsErroAuto
            MostraErro()
            DisarmTransaction()
        else
            MsgInfo("Banco 000 cadastrado com sucesso!", "Atenção")
        endif

    End Transaction

    RestArea(aArea)
Return
