#INCLUDE "protheus.ch"
#INCLUDE "rwmake.ch"
#INCLUDE "topconn.ch"
#INCLUDE "tbiconn.ch"

/*/{Protheus.doc} User Function CadProduto
    (long_description)
    @type  Function
    @author user
    @since 16/05/2022
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function CadProduto()

    Local nOption    := 1
    Local aDadosProd := {} // Tabela de Produtos SB1

    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT" TABLES "SB1", "SBM"

    FOR nOption   := 1 TO 2
        aDadosProd := getProduto(@nOption)
        nOption+=1
    NEXT

Return

Static Function getProduto(nOption)

    Local cCodProduto  := ""
    Local cDescProduto := ""
    Local cAliasQry    := ""

    if nOption == 1 // EXECUTAR COMANDOS DBF

        cAliasQry := "SB1"
        
        DbSelectArea('SB1')
        DbSetOrder(1)
        DbSeek(xFilial('SB1')+'00001') // FILIAL + COD DO PRODUTO
    else // EXECUTAR SQL

        cAliasQry := GetNextAlias()
        
		cQuery := " SELECT B1_COD, B1_DESC"
		cQuery += " FROM "+RetSqlName("SB1")+" SB1"
		cQuery += " WHERE D_E_L_E_T_ = ' '"
				
		TCQUERY cQuery ALIAS &(cAliasQry) NEW
    endif

    // Usar um array
    cCodProduto  := &(cAliasQry)->(B1_COD)
    cDescProduto := &(cAliasQry)->(B1_DESC)

    // Usar estrutura de laço while
    WHILE &(cAliasQry)->(eof())
        &(cAliasQry)->(dbSkip())
    ENDDO

    if cAliasQry != "SB1"
        &(cAliasQry)->(dbCloseArea())        
    endif
    alert("finalizou")

Return {cCodProduto,cDescProduto}

/*
SELECT TOP 1 * 
FROM SB1990 
WHERE D_E_L_E_T_ = ' '

sp_helpindex SB1990
*/

/*
ENTRAR NO SMART CLIENT

MODULO SIGAFAT
senha em branco

entra em...
atualizacoes/cadastros/+incluir/preenche.codigo com 5 caracteres/descricao/tipo: PA/unidade: UN/armazem 01

*/
