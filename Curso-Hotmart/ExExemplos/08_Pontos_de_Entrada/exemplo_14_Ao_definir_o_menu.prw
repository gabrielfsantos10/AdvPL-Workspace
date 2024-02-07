//Bibliotecas
#Include "TOTVS.ch"

/*/{Protheus.doc} User Function CallChgXnu
Ponto de entrada ao carregar o menu
@type  Function
@author Atilio
@since 22/08/2023
@see https://tdn.totvs.com/display/public/framework/CALLCHGXNU
/*/

User Function CallChgXnu()
    Local aArea      := FWGetArea()
    Local cUserAtu   := Alltrim(ParamIxb[1])
    Local cUserNome  := Upper(Alltrim(UsrRetName(cUserAtu)))
    Local cNomeMenu  := Alltrim(ParamIxb[5])
    Local cCodEmpres := Alltrim(ParamIxb[6])

    //Se for a empresa 99, e o usu�rio for o Daniel e estiver no m�dulo do faturamento
    If cCodEmpres == "99" .And. cUserNome == "DANIEL" .And. cNomeMenu == "SIGAFAT"

        //Altera, para abrir o menu que tem apenas os relat�rios
        cNomeMenu := "SIGAFAT_SO_RELATORIOS"
    EndIf

    //Adiciona uma tecla de atalho no Alt+L pra ver o menu logado
	SetKey(K_ALT_L, {|| ShowLog("Menu utilizado � '" + cNomeMenu + "'") })

    FWRestArea(aArea)
Return cNomeMenu
