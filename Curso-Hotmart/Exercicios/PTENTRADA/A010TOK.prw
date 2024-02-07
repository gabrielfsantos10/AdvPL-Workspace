//Bibliotecas
#Include "Protheus.ch"
 
/*------------------------------------------------------------------------------------------------------*
 | P.E.:  A010TOK                                                                                       |
 | Desc:  Confirma��o do cadastro de produtos                                                           |
 | Link:  http://tdn.totvs.com/pages/releaseview.action�pageId=6087477                                  |
 *------------------------------------------------------------------------------------------------------*/
 
User Function A010TOK()
    Local aArea := GetArea()
    Local aAreaB1 := SB1->(GetArea())
    Local lRet := .T.
    
    //Se for inclus�o
    If INCLUI
        MsgInfo("Estou em uma <b>inclus�o</b>!", "Aten��o")
    EndIf

    //Se for altera��o
    If ALTERA
        lRet := .F.
        MsgInfo("N�O H� PERMISS�ES PARA ALTERA��O", "Aten��o")
    EndIf

    //Se for c�pia
    If lCopia
        MsgInfo("Estou em uma <b>c�pia</b>!", "Aten��o")
    EndIf

    // lRet := MsgYesNo("Deseja continuar?", "Aten��o")
     
    RestArea(aAreaB1)
    RestArea(aArea)
Return lRet
