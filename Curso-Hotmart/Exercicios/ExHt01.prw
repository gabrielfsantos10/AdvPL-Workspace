#INCLUDE "totvs.ch"


User Function HtEx01()

	Local aAlunos := {}
	Local nCount  := 0
    Local lTeste  := .T.

	aAdd(aAlunos, {"Gabriel", 21})
	aAdd(aAlunos, {"Pedro", 15})
	aAdd(aAlunos, {"Felipe", 18})
	aAdd(aAlunos, {"Maria", 22})
	aAdd(aAlunos, {"Ana", 16})

	for nCount := 1 to Len(aAlunos)
		MsgInfo("Aluno nº " + cValToChar(nCount) + " - [Nome: " + aAlunos[nCount][1] + ", Idade: " + cValToChar(aAlunos[nCount][2]))

		if aAlunos[nCount][2] >= 18
			MsgInfo("É maior de idade!")
		else
			MsgAlert("É menor de idade!")
		endif
	next

    //teste Iif
    lTeste := IIF( 1 == 2, "SIM", "NÃO")
    Alert(lTeste)

Return
