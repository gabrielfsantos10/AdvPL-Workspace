//Sintomas
Static Function verificaAlgumaCoisa(cOpcao)

    if (nOpcao == "valor da op��o 1")
        fazAlgumaCoisa()
    elseif (nOpcao == "valor da op��o 2")
        fazOutraCoisa()
    elseif (nOpcao == "valor da op��o 3")
        executaAlgo()
    endif

Return


//Solu��o
#include "protheus.ch"

#define VALOR_OPCAO_1  1
#define VALOR_OPCAO_2  2
#define VALOR_OPCAO_3  3


Static Function verificaAlgumaCoisa(nOpcao)
    
    if (nOpcao == VALOR_OPCAO_1)
        fazAlgumaCoisa()
    elseif (nOpcao == VALOR_OPCAO_2)
        fazOutraCoisa()
    elseif (nOpcao == VALOR_OPCAO_3)
        executaAlgo()
    endif

Return
