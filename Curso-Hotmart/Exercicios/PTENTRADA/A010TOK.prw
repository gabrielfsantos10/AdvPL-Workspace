//Bibliotecas
#Include "Protheus.ch"
 
/*------------------------------------------------------------------------------------------------------*
 | P.E.:  A010TOK                                                                                       |
 | Desc:  Confirmação do cadastro de produtos                                                           |
 | Link:  http://tdn.totvs.com/pages/releaseview.actionçpageId=6087477                                  |
 *------------------------------------------------------------------------------------------------------*/
 
User Function A010TOK()
    Local aArea := GetArea()
    Local aAreaB1 := SB1->(GetArea())
    Local lRet := .T.
    
    //Se for inclusão
    If INCLUI
        MsgInfo("Estou em uma <b>inclusão</b>!", "Atenção")
    EndIf

    //Se for alteração
    If ALTERA
        lRet := .F.
        MsgInfo("NÃO HÁ PERMISSÕES PARA ALTERAÇÃO", "Atenção")
    EndIf

    //Se for cópia
    If lCopia
        MsgInfo("Estou em uma <b>cópia</b>!", "Atenção")
    EndIf

    // lRet := MsgYesNo("Deseja continuar?", "Atenção")
     
    RestArea(aAreaB1)
    RestArea(aArea)
Return lRet
