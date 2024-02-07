//Bibliotecas
#Include "TOTVS.ch"

/*/{Protheus.doc} User Function RPTName
Modifica o nome do arquivo de um relat�rio (SetPrint e TReport)
@type  Function
@author Atilio
@since 25/08/2023
@see https://tdn.totvs.com/pages/releaseview.action?pageId=315908053
/*/

User Function RPTName()
    Local aArea     := FWGetArea()    
    Local cNomeRel  := Alltrim(ParamIXB[1])
    Local cNomeUsr  := Alltrim(UsrRetName(RetCodUsr()))

    //Se tiver extens�o, remove (ex.: "\spool\matr010.prt" => "\spool\matr010")
    If ".PRT" == Right(Upper(cNomeRel), 4)
        cNomeRel  := SubStr(cNomeRel, 1, Len(cNomeRel) - 4)
    EndIf

    //Se tiver barra no nome, pega a partir da �ltima barra (ex.: "\spool\matr010" => "matr010")
    If "\" $ cNomeRel
        cNomeRel := SubStr(cNomeRel, RAt("\", cNomeRel) + 1)
    EndIf

    //Coloca o nome do usu�rio, a data e hora no nome do arquivo
    cNomeRel += "_" + cNomeUsr + "_" + dToS(Date()) + "_" + StrTran(Time(), ":", "-")

    FWRestArea(aArea)
Return cNomeRel
