//Bibliotecas
#Include "TOTVS.ch"

/*/{Protheus.doc} User Function MA410MNU
Ponto de Entrada para adicionar Outras A��es na tela do Pedido de Venda
@type  Function
@author Atilio
@since 03/08/2023
@see https://tdn.totvs.com/display/public/PROT/MA410MNU
/*/

User Function MA410MNU()
    Local aArea := GetArea()

    //Adiciona na vari�vel do Menu
	aAdd(aRotina, {"* Data e Hora Atual", "u_zPeMnu()", 0, 2, 0, Nil})
	
	RestArea(aArea)
Return

/*/{Protheus.doc} User Function zPeMnu
Fun��o de teste adicionada no outras a��es do browse do pedido
@type  Function
@author Atilio
@since 03/08/2023
/*/

User Function zPeMnu()
    Local aArea     := FWGetArea()
    Local cMensagem := ""

    //Monta a mensagem e exibe
    cMensagem := "Voc� est� posicionado no pedido [" + SC5->C5_NUM + "]" + CRLF
    cMensagem += "" + CRLF
    cMensagem += "Hoje �:         [" + dToC(Date()) + "]" + CRLF
    cMensagem += "A hora atual �: [" + Time() + "]" + CRLF
    ShowLog(cMensagem)

    FWRestArea(aArea)
Return
