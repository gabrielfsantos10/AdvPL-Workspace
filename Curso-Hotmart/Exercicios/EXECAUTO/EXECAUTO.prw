#include 'Totvs.ch'

user function EXECSA1()

    Local aDados     := {}
    Local lMsErroAuto

    AAdd(aDados, {"A1_COD", "999999", NIL})
    AAdd(aDados, {"A1_LOJA", "01", NIL})
    AAdd(aDados, {"A1_NOME", "CLIENTE EXECAUTO", NIL})
    AAdd(aDados, {"A1_NREDUZ", "CLEXECAUTO", NIL})
    AAdd(aDados, {"A1_END", "TESTE", NIL})
    AAdd(aDados, {"A1_TIPO", "F", NIL})
    AAdd(aDados, {"A1_EST", "SP", NIL})
    AAdd(aDados, {"A1_COD_MUN", "50308", NIL})
    AAdd(aDados, {"A1_DDD", "11", NIL})
    AAdd(aDados, {"A1_TEL", "989783544", NIL})
    AAdd(aDados, {"A1_NATUREZ", "22022024", NIL})
    AAdd(aDados, {"A1_CONTA", "2202202401", NIL})

    lMsErroAuto := .F.

    MSExecAuto({|x,y| Mata030(x,y)}, aDados, 3)

    // Se deu erro (lMsErroAuto := .T.), mostra mensagem
    if lMsErroAuto
        MsgInfo('Erro no EXECAUTO', 'ERRO')

        DisarmTransaction()
    endif

return
