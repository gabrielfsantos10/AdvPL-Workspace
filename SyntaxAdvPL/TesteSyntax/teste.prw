#INCLUDE "Protheus.ch"
#INCLUDE "FwMvcDef.ch"

/*/{Protheus.doc} TesteSyntax
(long_description)
@type user function
@author user
@since 01/02/2024
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/

//CONSTANTES
#Define STR_NOME "Gabriel Faria"
#Define NUM_IDADE 21
#Define STR_CIDADE "Limeira"
#Define STR_ESTADO "SP"
#Define STR_SEXO "M"
#Define DAT_NASC DATE()

User Function TesteSyntax(param_name)

    //Variáveis e tipos de declarações
    Local cTeste01  := 'Teste 01'
    Local cAlias    := ""
    Local nNumber   := 123
    Local dData     := DtoD('2024-02-01')
    Local tHora     := HtoD('12:00:00')
    Local oView     := NIL
    Local oBrowse   := FwLoadBrw("MVCTST")
    Local aArray    := {}
    Local aNumbers  := {1, 2, 3, 4, 5}
    Local aStrings  := {"a", "b", "c"}
    Public lFlagT   := .T.
    Public lFlagF   := .F.

    //Bloco de codigo
    Local bCB := {| x1,x2 | IIF( X1 < x2 , x1 , x2 ) }

    //Exemplo Query
    Local cQuery := ""

    cQuery := " SELECT"
    cQuery += "     *"
    cQuery += " FROM"
    cQuery += "	    SA2990"
    cQuery += " WHERE"
    cQuery += "	    A2_FILIAL = ' '"

    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01"

    cAlias := 'SA1'

    @ Li, aCol[1] PSay (cAlias)->A1_TST1
    @ Li, aCol[2] PSay (cAlias)->A1_TST2
    @ Li, aCol[3] PSay (cAlias)->A1_TST3
    @ Li, aCol[4] PSay (cAlias)->A1_TST4

    oBrowse:Activate()

<<<<<<< HEAD
    MsgInfo('A mensagem �: ' + cValToChar(nNumber) + cTeste, 'T�tulo02')
    MSGALERT("TESTE", "TESTE02")
    MSGSTOP('TESTE', "TESTE02")
    MSGYESNO("TESTE", 'TESTE02')
=======
    MsgInfo('A mensagem é: ' + cValToChar(nNumber) + cTeste, 'Título 03')
    MSGALERT("TESTE", "TESTE05")
    MSGSTOP('TESTE', "TESTE07")
    MSGYESNO("TESTE", 'TESTE09')
>>>>>>> 18421619a4a14a2c2e8f9c243d1ee482e429d5e1

    DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 080,300 PIXEL

    ACTIVATE MSDIALOG oDlg CENTERED

    cString1 := FWINPUTBOX("Digite a String 1: ", "Preencha o campo")
    cString2 := FWINPUTBOX("Digite a String 2: ", "Preencha o campo")

    cMsg := cString1 + "   Tamanho: " + cValToChar(Len(cString1)) + CRLF
    cMsg += cString2 + "   Tamanho: " + cValToChar(Len(cString2)) + CRLF + CRLF

    //Validação de tamanho de string
    if (Len(cString1) > Len(cString2)) .or. (Len(cString1) < Len(cString2))
        cMsg += "As duas strings são de tamanhos diferentes!" + CRLF + CRLF
    else
        cMsg += "As duas strings são de tamanhos iguais!" + CRLF + CRLF
    ENDIF

    if cString1 == cString2
        cMsg += "As duas strings possuem conteúdo igual!" + CRLF + CRLF
    else
        cMsg += "As duas strings possuem conteúdo diferente!" + CRLF + CRLF
    endif

    FWAlertError(cMsg, "Manipulação de Strings")

    TCQUERY cQuery ALIAS &(cAlias) new

    FOR nCont := 1 to 3
        amsg[nCont] := &(cAlias)->(B1_DESC)
        &(cAlias)->(DBSKIP())    
    NEXT
    FOR nCont := 1 to 3
       FWALERTINFO(amsg[nCont]) 
    next
    &(cAlias)->(DBCLOSEAREA())

    //Transaction
    Begin Transaction
        MsExecAuto({|x, y| Mata070(x, y)}, aDados)

        if lMsErroAuto
            MostraErro()
            DisarmTransaction()
        else
            MsgInfo("Banco 000 cadastrado com sucesso!", "Atenção")
        endif

    End Transaction

	DbSelectArea('SA2')
	SA2->(DbSetOrder(1))
	SA2->(DbGoTop())
	
	//Enquanto houver dados nos fornecedores e for menos que 100 registros
	While ! SA2->(EoF())
		nAtual++
		cMsg += "[" + cValToChar(nAtual) + "] " + Alltrim(SA2->A2_NOME) + ";" + CRLF
		
		SA2->(DbSkip())
	EndDo

    Local a := 10
    Local b := 20
    Local c := 30

    If a == b
        MsgInfo("a é igual a b")
    EndIf

    If a != b
        MsgInfo("a é diferente de b")
    EndIf

    If a < b
        MsgInfo("a é menor que b")
    EndIf

    If b > a
        MsgInfo("b é maior que a")
    EndIf

    If b >= a
        MsgInfo("b é maior ou igual a a")
    EndIf

    If a <= b
        MsgInfo("a é menor ou igual a b")
    EndIf

    If (a < b) .AND. (b < c)
        MsgInfo("a é menor que b E b é menor que c")
    EndIf

    If (a < b) .OR. (b > c)
        MsgInfo("a é menor que b OU b é maior que c")
    EndIf

    If !(a == b)
        MsgInfo("a não é igual a b")
    EndIf

Return return_var


Static Function BrowseDef()
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias("TST")
    oBrowse:SetDescription("TESTE - SYNTAX ADVPL")

    oBrowse:SetOnlyField({"TST_COD", "TST_NOME", "TST_TESTE"})

    oBrowse:Activate()

Return oBrowse


Static Function MenuDef()
    Local aMenu := {}

    ADD OPTION aMenu TITLE "Pesquisar"  ACTION "PesqBrw" OPERATION 1 ACCESS 0
    ADD OPTION aMenu TITLE "Incluir"    ACTION "VIEWDEF.MVCTST" OPERATION 3 ACCESS 0
    ADD OPTION aMenu TITLE "Alterar"    ACTION "VIEWDEF.MVCTST" OPERATION 4 ACCESS 0
    ADD OPTION aMenu TITLE "Excluir"    ACTION "VIEWDEF.MVCTST" OPERATION 5 ACCESS 0
    ADD OPTION aMenu TITLE "Visualizar" ACTION "VIEWDEF.MVCTST" OPERATION 2 ACCESS 0
    ADD OPTION aMenu TITLE "Copiar"     ACTION "VIEWDEF.MVCTST" OPERATION 9 ACCESS 0
    ADD OPTION aMenu TITLE "Imprimir"   ACTION "VIEWDEF.MVCTST" OPERATION 8 ACCESS 0

Return aMenu


Static Function ModelDef()
    Local oModel     := NIL
    Local oStructTST := FWFormStruct(1, "TST")

    oModel := MPFormModel():New("MVCTSTM", /*bPre*/, /*bPos*/, /*bCommit*/, /*bCancel*/)

    oModel:AddFields("FORMTST", ,oStructTST)

    oModel:SetPrimaryKey({"TST_COD", "TST_NOME"})

    oModel:SetDescription("SYNTAX TESTE - MVCTST")

    oModel:GetModel("FORMTST"):SetDescription("SYNTAX TESTE - TST")
Return oModel


Static Function ViewDef()
    Local oView      := NIL
    Local oModel     := FWLoadModel("MVCTST")
    Local oStructTST := FWFormStruct(2, "TST")

    oView := FWFormView():New()

    //Passando o modelo de dados para a visão, assim trabalhando juntos
    oView:SetModel(oModel)

    oView:AddField("VIEWTST", oStructTST, "FORMTST")

    //Criando uma caixa horizontal, ocupando 100% da tela
    oView:CreateHorizontalBox("TELATST", 100)

    oView:EnableTitleView("VIEWTST", "SYNTAX TESTE")

    oView:SetCloseOnOk({|| .T.})

    oView:SetOwnerView("VIEWTST", "TELATST")

Return oView

//Orient a obj
Class zPessoa
    //Atributos
    Data cNome
    Data nIdade
    Data dNascimento

    //Métodos
    Method New() CONSTRUCTOR
    Method MostraIdade()
EndClass

Method new(pNome, pNomeReduz, pCpfCnpj, pCep, pEndereco, pBairro, pCidade, pUf, pTel, pEmail) class cliente

    // Herdando da outra classe, passando os parâmetros necessários
    _Super:new(pNome, pNomeReduz, pCpfCnpj, pCep, pEndereco, pBairro, pCidade, pUf, pTel, pEmail)

    // self devolve o objeto
    self:codigo := '-'
    self:loja   := '-'
    
Return self
