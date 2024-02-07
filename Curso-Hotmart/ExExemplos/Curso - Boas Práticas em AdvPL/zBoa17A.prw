//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa17A
Exemplo de Boas Práticas - Não utilizar Return no meio da função
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
		Na função Mata070, é passado dois parâmetros
		x é passado como aDados, um array com todos os campos e conteúdos
		y é passado como a operação de inclusão (número 3)
	*/
	Begin Transaction
		MSExecAuto({|x, y| Mata070(x, y)}, aDados, 3)

		//Se houve erro, mostra mensagem
		If lMsErroAuto
			MostraErro()
			DisarmTransaction()
			Return
			
		EndIf
		
		MsgInfo("Banco 000 cadastrado com sucesso!", "Atenção")
		//Aqui podemos criar ou atualizar outros registros
		
	End Transaction

	RestArea(aArea)
Return