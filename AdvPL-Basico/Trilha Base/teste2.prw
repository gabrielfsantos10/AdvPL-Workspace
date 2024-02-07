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
---------------OBSERVAÇÕES
Os tipos da variáveis sao definidos de acordo com a primeira letra

aVariavel := tipo array
nVariavel := tipo number
É possível converter uma variável de number pra caracter(string)

Exemplo:
nExemplo := 1  -> Numérica
nExemplo := '1'  -> Caracter já convertida (Porém não é recomendável, ja que a nomeação da variavel terá o 'n'no começo)

escopos das variaveis (globais, locais, publicas etc.)
/*/

user Function test2()
    MsgYesNo("Oi, você está bem?", "Pergunta 01")
Return
