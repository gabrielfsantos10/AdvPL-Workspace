#include "protheus.ch"

/*/{Protheus.doc} VlrViagem

Calcula o valor de uma viagem

@author Victor Hugo
@since 26/12/2013

@param nHorario, Numerico, Horario inicial da viagem
@param nDistancia, Numerico, Distancia percorrida em KM

@return Numerico valor da viagem
/*/
User Function VlrViagem(nHorario, nDistancia)

    Local oViagem := Viagem():newViagem(nHorario, nDistancia)

Return oViagem:calculaValor()
