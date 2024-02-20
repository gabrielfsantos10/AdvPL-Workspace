//Bibliotecas
#Include "TOTVS.ch"

/*/{Protheus.doc} User Function B1CUST
Ponto de Entrada para filtrar o browse da tela de Produtos
@type  Function
@author Gabriel
@since 09/02/2024
/*/

User Function B1CUST()
    Local aArea      := FWGetArea()
    Local cFiltro    := ""
    Local aParams    := {}
    Local cProdDe    := Space(TamSX3('B1_COD')[1])
    Local cProdAt    := StrTran(cProdDe, ' ', 'Z')

    //Adiciona os parâmetros que serão exibidos
    aAdd(aParams, {1, "Produdo De",  cProdDe,  "", "Vazio() .Or. ExistCPO('SA1')", "SB1", ".T.", 70,  .F.}) //MV_PAR01
    aAdd(aParams, {1, "Produto Até", cProdAt,  "", "ExistCPO('SA1')",              "SB1", ".T.", 70,  .T.}) //MV_PAR02

    //Se a pergunta for confirmada
    If ParamBox(aParams, "Informe os parâmetros", , , , , , , , , .F., .F.)

        //Monta o filtro que será aplicado no browse
        cFiltro += " SB1->B1_COD >= '" + MV_PAR01       + "' .AND. "
        cFiltro += " SB1->B1_COD <= '" + MV_PAR02       + "' .AND. "
        cFiltro += " SB1->B1_TIPO == '" + MV_PAR03 + "'"
    EndIf

    FWRestArea(aArea)
Return cFiltro
