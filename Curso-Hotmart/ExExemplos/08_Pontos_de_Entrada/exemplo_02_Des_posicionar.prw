//Bibliotecas
#Include "TOTVS.ch"

/*/{Protheus.doc} User Function MA035BUT
Fun��o para adicionar bot�es no Outras A��es do Grupo de Produtos
@type  Function
@author Atilio
@since 20/06/2023
@see https://tdn.totvs.com/pages/releaseview.action?pageId=6087601
/*/

User Function MA035BUT()
    Local aArea    := FWGetArea()
    Local aBotoes  := {}

    //Adiciona bot�es no Outras A��es
    aAdd(aBotoes, {'BITMAP', {|| fBotao() }, "* Bot�o Customizado"})

    FWRestArea(aArea)
Return aBotoes

Static Function fBotao()
    Local aArea    := FWGetArea()
    Local aAreaSBM := SBM->(FWGetArea())

    Alert("oi")

    //Pula um registro qualquer
    DbSkip()

    //Posiciona no �ltimo registro
    SBM->(DbGoBottom())

    FWRestArea(aAreaSBM)
    FWRestArea(aArea)
Return
