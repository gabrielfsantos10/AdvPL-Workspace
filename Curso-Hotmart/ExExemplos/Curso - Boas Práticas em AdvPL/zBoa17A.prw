//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa17A
Exemplo de Boas Pr�ticas - N�o utilizar Return no meio da fun��o
@author Atilio
@since 02/11/2020
@version 1.0
@type function
@example
	u_zBoa17A()
@see https://tdn.totvs.com/display/tec/ProtheusDOC
/*/

User Function zBoa17A()
	Local aArea     := GetArea()
	Local aDados    := {}
	Private lMsErroAuto := .F.

	//Adiciona os dados do cadastro de bancos
	aAdd(aDados, {"A6_COD",     "000",            Nil})
	aAdd(aDados, {"A6_AGENCIA", "00000",          Nil})
	aAdd(aDados, {"A6_NUMCON",  "0000000000",     Nil})
	aAdd(aDados, {"A6_NOME",    "BANCO DE TESTE", Nil})
	
	/*
		Na fun��o Mata070, � passado dois par�metros
		x � passado como aDados, um array com todos os campos e conte�dos
		y � passado como a opera��o de inclus�o (n�mero 3)
	*/
	Begin Transaction
		MSExecAuto({|x, y| Mata070(x, y)}, aDados, 3)

		//Se houve erro, mostra mensagem
		If lMsErroAuto
			MostraErro()
			DisarmTransaction()
			Return
			
		EndIf
		
		MsgInfo("Banco 000 cadastrado com sucesso!", "Aten��o")
		//Aqui podemos criar ou atualizar outros registros
		
	End Transaction

	RestArea(aArea)
Return