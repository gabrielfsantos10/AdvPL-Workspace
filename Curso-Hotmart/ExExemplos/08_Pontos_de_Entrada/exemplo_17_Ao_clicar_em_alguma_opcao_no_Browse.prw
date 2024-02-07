//Bibliotecas
#Include "TOTVS.ch"

/*/{Protheus.doc} User Function MBrwBtn
Valida o clique em alguma op��o dispon�vel nos Browses das rotinas
@type  Function
@author Atilio
@since 22/08/2023
@see https://tdn.totvs.com/pages/releaseview.action?pageId=6815197
/*/

User Function MBrwBtn()
    Local aArea     := FWGetArea()
    Local lContinua := .T.
    Local cFuncMenu := Upper(Alltrim(ParamIXB[4]))
    Local nOpcaMenu := ParamIXB[3]

    //Se for a op��o de excluir
    If nOpcaMenu == 5

        //N�o permite prosseguir e mostra uma mensagem
        ExibeHelp(;
            "Help MBrwBtn",;
            "N�o � permitido excluir registros! (Fun��o: " + cFuncMenu + ")",;
            "Contate o l�der do departamento";
        )
        lContinua := .F.

    EndIf

    FWRestArea(aArea)
Return lContinua
