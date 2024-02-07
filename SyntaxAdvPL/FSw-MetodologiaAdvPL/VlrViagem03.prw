//VlrViagem.prw

#include "protheus.ch"

/*/{Protheus.doc} VlrViagem

Calcula o valor de uma viagem

@author Victor Hugo
@since 26/12/2013

@param nPar1, Numerico, Horario da viagem
@param nPar2, Numerico, Distancia percorrida

@return Numerico valor da viagem
/*/
User Function VlrViagem(nPar1, nPar2)

    Local nRet := 0

    //Verifica se é bandeira 1 = 6h às 22h
    if (nHorario >= 6 .and. nHorario <= 22)
        nRet := (nPar2 * 2) // Valor da bandeira 1 é: R$ 2,00
    else
        nRet := (nPar2 * 4) // Valor da bandeira 1 é: R$ 4,00
    endif

Return nRet
