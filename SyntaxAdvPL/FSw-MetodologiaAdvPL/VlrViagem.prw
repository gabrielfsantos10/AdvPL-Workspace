#include "protheus.ch"

/*/{Protheus.doc} VlrViagem

Calcula o valor de uma viagem

@author Victor Hugo
@since 26/12/2013

@param nHorario, Numerico, Horario inicial da viagem
@param nDistancia, Numerico, Distancia percorrida em KM
@param nValorBandeira, Numerico, Valor da bandeira (opcional)

@return Numerico valor da viagem
/*/
User Function VlrViagem(nHorario, nDistancia, nValorBandeira)

    Local oViagem          := Viagem():newViagem(nHorario, nDistancia)
    default nValorBandeira := 0

    if (nValorBandeira > 0)
        oViagem:setValorBandeira(nValorBandeira)
    endif

Return oViagem:calculaValor()
