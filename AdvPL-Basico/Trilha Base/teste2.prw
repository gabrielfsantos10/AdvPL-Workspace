#include "totvs.ch"

/*/{Protheus.doc} test2
    (long_description)
    @type Function
    @author user
    @since 12/05/2022
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/

/*/
---------------OBSERVA��ES
Os tipos da vari�veis sao definidos de acordo com a primeira letra

aVariavel := tipo array
nVariavel := tipo number
� poss�vel converter uma vari�vel de number pra caracter(string)

Exemplo:
nExemplo := 1  -> Num�rica
nExemplo := '1'  -> Caracter j� convertida (Por�m n�o � recomend�vel, ja que a nomea��o da variavel ter� o 'n'no come�o)

escopos das variaveis (globais, locais, publicas etc.)
/*/

user Function test2()
    MsgYesNo("Oi, voc� est� bem?", "Pergunta 01")
Return
