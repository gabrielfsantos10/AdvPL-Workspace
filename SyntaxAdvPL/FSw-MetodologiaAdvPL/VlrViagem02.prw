//VlrViagem.prw

#include "protheus.ch"

#define VALOR_BANDEIRA_1    2
#define VALOR_BANDEIRA_2    4

/*/{Protheus.doc} VlrViagem

Calcula o valor de uma viagem

@author Victor Hugo
@since 26/12/2013

@param nHorario, Numerico, Horario inicial da viagem
@param nDistancia, Numerico, Distancia percorrida em KM

@return Numerico valor da viagem
/*/
User Function VlrViagem(nHorario, nDistancia)

    Local nValor  := 0

    if (nHorario >= 6 .and. nHorario <= 22)
        nValor := (nDistancia * VALOR_BANDEIRA_1)
    else
        nValor := (nDistancia * VALOR_BANDEIRA_2)
    endif

Return nValor
