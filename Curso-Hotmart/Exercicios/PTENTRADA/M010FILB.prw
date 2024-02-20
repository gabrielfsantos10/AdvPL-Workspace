#include "rwmake.ch"
#include "protheus.ch"


User Function M010FIL()
    Local aArea     := FWGetArea()
    Local aBrwModel := {} //Browse de filtros
    Local cFiltro   := ""
    Local cCodDe    := Space(TamSX3('B1_COD')[1])
    Local cCodAt    := StrTran(cCodDe, ' ', 'Z')

    //Montando o browse através do Array
    aAdd(aBrwModel, {1, "Código De",  cCodDe,  "", "Vazio() .Or. ExistCPO('SB1')", "SB1", ".T.", 70,  .F.}) //MV_PAR01
    aAdd(aBrwModel, {1, "Código Até", cCodAt,  "", "ExistCPO('SB1')",              "SB1", ".T.", 70,  .T.}) //MV_PAR02

    //Se a pergunta for confirmada
    If ParamBox(aBrwModel, "Informe os parâmetros", , , , , , , , , .F., .F.)

        //Monta o filtro que será aplicado no browse
        cFiltro += " SB1->B1_COD >= '" + MV_PAR01       + "' .AND. "
        cFiltro += " SB1->B1_COD <= '" + MV_PAR02       + "'"
    EndIf

    FWRestArea(aArea)

Return cFiltro
