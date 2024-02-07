//Bibliotecas
#Include "TOTVS.ch"

/*/{Protheus.doc} User Function SDULogin
Ponto de entrada na valida��o do login do APSDU
@type  Function
@author Atilio
@since 25/08/2023
@see https://tdn.totvs.com/display/public/framework/SDULogin+-+Entrada+e+acesso
/*/

User Function SDULogin()
    Local aArea     := FWGetArea()
    Local lContinua := .T.

    //Adiciona um atalho para liberar para abrir o topconn novamente
	SetKey(K_SH_F5, {|| u_zSDUConn() })

    FWRestArea(aArea)
Return lContinua

/*/{Protheus.doc} User Function zSDUConn
Faz com que a conex�o com o TopConn seja atualizada
@type  Function
@author Atilio
@since 25/08/2023
/*/

User Function zSDUConn()
    Local aArea := FWGetArea()

    //Se tiver conex�o ativa
    If Type("nConnect") != "U"

        //Se tiver tabelas abertas, n�o permite prosseguir
        If Len(__aFiles) > 0
            FWAlertError("H� tabela(s) aberta(s), feche toda(s) para prosseguir!", "Aten��o")
        Else

            //Somente se o usu�rio confirmar, desconecta e define a vari�vel como nula
            If FWAlertYesNo("Voc� deseja for�ar a reconex�o com o TopConn?", "Continua?")
                TCUnlink(nConnect)
                nConnect := Nil
            EndIf
        EndIf

    EndIf

    FWRestArea(aArea)
Return
