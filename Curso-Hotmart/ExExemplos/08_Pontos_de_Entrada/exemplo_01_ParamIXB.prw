//Bibliotecas
#Include "TOTVS.ch"

/*/{Protheus.doc} User Function zTstFunc
Fun��o de teste demonstrando como criar um ponto de entrada com ExecBlock
@type  Function
@author Atilio
@since 20/06/2023
/*/

User Function zTstFunc()
    Local aArea    := FWGetArea()
    Local nValor   := 50
    Local dData    := sToD("20240101")
    Local cNome    := "Gabriel"
    Local lRetorno := .F.

    //Se o ponto de entrada estiver compilado no RPO
    If ExistBlock("zTstPE")

        //Aciona a execu��o dela
        lRetorno := ExecBlock("zTstPE", /*lVarEnv*/, /*lSet*/, {nValor, dData, cNome})

        //Se o usu�rio confirmou, mostra uma mensagem
        If lRetorno
            FWAlertSuccess("Usu�rio confirmou a opera��o!", "Aten��o")
        EndIf
    EndIf

    FWRestArea(aArea)
Return

/*/{Protheus.doc} User Function zTstPE
Exemplo do ponto de entrada criado
@type  Function
@author Atilio
@since 20/06/2023
/*/

User Function zTstPE()
    Local aArea       := FWGetArea()
    Local aParametros := ParamIXB
    Local cNomePE     := ParamIXB[3] //ou aParametros[3]
    Local lRet        := .F.

    //Mostra mensagem para confirmar
    lRet := FWAlertYesNo("A data que veio � " + dToC(aParametros[2]) + ", e o nome � " + cNomePE, "Confirma P.E. ?")

    FWRestArea(aArea)
Return lRet
