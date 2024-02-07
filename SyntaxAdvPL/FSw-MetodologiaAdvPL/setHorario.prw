/*/{Protheus.doc} setHorario

    Define o horario inicial da viagem

    @author Victor Hugo
    @since 26/12/2013

    @param nHorario, Numerico, Horario inicial da viagem
    /*/
Method setHorario(nHorario) class Viagem
    
    ::nHorario := nHorario

    if ::isBandeira1()
        ::setValorBandeira(GetMv("ZZ_VLBAND1"))
    else
        ::setValorBandeira(GetMv("ZZ_VLBAND2"))
    endif

Return 
