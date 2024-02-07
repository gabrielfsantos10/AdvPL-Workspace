//Bibliotecas
#Include "TOTVS.ch"

/*/{Protheus.doc} User Function MT410TOK
Ponto de Entrada na valida��o ao clicar no bot�o Confirmar
@type  Function
@author Atilio
@since 03/08/2023
@see https://tdn.totvs.com/pages/releaseview.action?pageId=6784353
/*/

User Function MT410TOK()
    Local aArea      := FWGetArea()
    Local lContinua  := .T.
    Local cVendedor  := ""
    Local cTipoPed   := ""

    //Pega o campo de vendedor e de tipo de pedido
    cVendedor := M->C5_VEND1
    cTipoPed  := M->C5_TIPO

    //Se for um pedido normal (tipo N) e o n�o tiver vendedor preenchido
    If cTipoPed == "N" .And. Empty(cVendedor)
        ExibeHelp("Help_MT410TOK", "Para pedido do tipo Normal (N), � obrigat�rio preencher o campo de c�digo do vendedor!", "Preencha a informa��o no campo C5_VEND1")
        lContinua := .F.
    EndIf

    FWRestArea(aArea)
Return lContinua
