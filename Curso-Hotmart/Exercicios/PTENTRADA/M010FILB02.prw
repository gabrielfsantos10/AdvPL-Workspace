//Bibliotecas
#Include "TOTVS.ch"


User Function MA010BUT()
    Local aArea   := FWGetArea()
    Local aBotoes := {}

    aAdd(aBotoes, {'BITMAP', {|| u_zPEbar()}, "* Atualizar Descrição","* Descrição"} )

    FWRestArea(aArea)
Return aBotoes


User Function zPEbar()
    Local aArea      := FWGetArea()
    Local cMensagem  := ""

    //Se a pergunta for confirmada
    If FWAlertYesNo("Confirma a alteração da Descrição?", "Continua")

        //A operação abaixo de buscar com GDFieldGet, é o mesmo que: aCols[nLinha][nPosDatEnt]
        cMensagem += "Era " + SB1->B1_DESC

        //A operação abaixo de atualizar com GDFieldPut, é o mesmo que: aCols[nLinha][nPosDatEnt] := Date()
        SB1->B1_DESC := "ATUALIZADO POR PT DE ENTRADA"
        // GDFieldPut("B1_DESC", "ATUALIZADO POR PT DE ENTRADA", 1)

        //Se tiver mensagem, exibe em tela
        If ! Empty(cMensagem)
            ShowLog(cMensagem)
        EndIf

        //Atualiza a tela
        GetDRefresh()
    EndIf

    FWRestArea(aArea)
Return
