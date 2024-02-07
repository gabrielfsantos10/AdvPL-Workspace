/*/{Protheus.doc} calculaValor

    Calcula o valor de uma viagem

    @author Victor Hugo
    @since 26/12/2013
    @return Numerico valor da viagem
    /*/
Method calculaValor() class Viagem
    
Return (::getDistancia() * ::getValorBandeira())
