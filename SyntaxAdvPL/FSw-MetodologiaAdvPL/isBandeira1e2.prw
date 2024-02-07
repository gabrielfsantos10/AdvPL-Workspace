/*/{Protheus.doc} isBandeira1
    
    Verifica se o horario inicial definido é referente à bandeira 1

    @author Victor Hugo
    @since 26/12/2013

    @return Logico indica se o horario definido é bandeira 1
    /*/
Method isBandeira1() class Viagem
    
    Local nHorario := ::getHorario()

Return (nHorario >= 6 .and. nHorario <= 22)


/*/{Protheus.doc} isBandeira2

    Verifica se o horario inicial definido é referente à bandeira 2

    @author Victor Hugo
    @since 26/12/2013

    @return return_var, return_type, return_description
    /*/
Method isBandeira2() class Viagem
    
Return !::isBandeira2()
