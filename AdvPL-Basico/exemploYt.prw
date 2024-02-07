#INCLUDE "TOPCONN.CH"
#INCLUDE "PROTHEUS.CH"

User Function SB1SQLEmbed()
    Local cAliasSB1 := GetNextAlias() //declarei meu alias
    Local aCabec := {} //declarei meu cabecalho
    Local aDados := {} //Arra que armazenara os dados
    Local cPerg := "TRPROD" //variavel que armazena o nome do grupo de perguntas

    Local cStatus  //se esta bloqueado ou nao

    ValidPerg(cPerg)
    //funcao responsavel por chamar a pergunta criada na funcao
    Pergunte(cPerg,.T.)

    //comeco da consulta SQL
    BeginSql Alias cAliasSB1
        SELECT B1_FILIAL, B1_COD, B1_DESC, B1_TIPO, B1_UM, B1_MSBLQL FROM %table:SB1% SB1
        WHERE B1_FILIAL = %xFilial:SB1% AND B1_COD BETWEEN %exp:(MV_PAR01)% AND %exp:(MV_PAR02)%  //filtro where
    ENDSQL //finaliza a query

    cQry := GetLastQuery()[2]
    MEMOWRITE('SB1SQLEmbed.sql', cQry)

    //cabecalho
    aCabec := {"FILIAL","CODIGO","DESCRICAO","TIPO","UNIDADEDEMEDIDA","STATUS"}

    while !(cAliasSB1)->(Eof())
        IIF((cAliasSB1)->B1_MSBLQL == "1",cStatus := "Bloqueado",cStatus := "Desbloqueado--")

        Aadd(aDados, {B1_FILIAL, B1_COD, B1_DESC, B1_TIPO, B1_UM, cStatus})

        (cAliasSB1)->(DBSKIP()) //passa para o proximo registro
    end

    DlgToExcel({{"ARRAY","Relatório de produtos", aCabec, aDados}})

    (cAliasSB1)->(DBCLOSEAREA())

Return
