//Bibliotecas
#Include "Totvs.ch"

/*/{Protheus.doc} zBoa07
Demonstrando tipos de funções em AdvPL
@author Atilio
@since 12/10/2020
@version 1.0
@type function
@obs O tipo User Function pode ser chamado em qualquer lugar do Protheus com
	o prefixo U_ (letra U com underscore/underline), por exemplo, u_zBoa07()
	
	As nomenclaturas utilizadas, geralmente são:
	AABBBXNN ou ABBBXNN, onde:
	AA - Sigla da empresa
	BBB - Módulo da Função
	X - Tipo (Atualização, Consulta, Relatório, Miscelanea, Job, etc)
	NN - Sequência, por exemplo:
	ASFATR87 ou AFATR87 -> Atilio Sistemas, FATuramento, Relatório, sequência 87
	
	Ou se for um fonte genérico, de uma lib por exemplo, iniciamos a função de usuário com a letra "z"
	
	Já as funções estáticas não tem limitação de tamanho de caracteres (até 10)
	Para seguir um padrão, tentamos começar com elas, utilizando a letra "f"
/*/

User Function zBoa07()
	Local aArea := GetArea()
	
	//Mostrando a mensagem de que está na User Function
	MsgInfo("Estou na User Function zBoa07!", "Atenção")
	
	RestArea(aArea)
Return
