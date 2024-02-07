/*/{Protheus.doc} calculaValor

    Calcula o valor de uma viagem

    @author Victor Hugo
    @since 26/12/2013
    @return Numerico valor da viagem
    /*/
Method calculaValor() class Viagem

    Local nValor := 0

    if ::isBandeira1()
        nValor := (nDistancia * VALOR_BANDEIRA_1)
    else
        nValor := (nDistancia * VALOR_BANDEIRA_2)
    endif

Return nValor
