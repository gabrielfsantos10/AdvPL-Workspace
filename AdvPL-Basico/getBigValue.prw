/*
Crie uma fun��o que retorne o produto de maior valor total dos pedidos de venda.
A Fun��o ir� receber um periodo (Emiss�o De e Emiss�o at�)
Com isso a sua fun��o dever� efetuar uma query na Tabela SC6 filtrando a data de emiss�o do pedido e percorrendo todos os itens filtrados, retorne o nome do produto que possue maior valor total.


Tipos complexos de dados o protheus n�o trabalha: float, date (banco de dados)

data (padr�o dbf) = 09/06/2022
date (padr�o DB)  = 09/06/2022 14:21:00

NO BD = CAMPO STRING TAMANHO 8 = 20220609 (BASE PROTHEUS)


09/06/2022 => DTOS => 20220609 (BASE PROTHEUS)
20220609   => STOD => 09/06/2022

*/

// RETORNARIA TODOS OS CLIENTES DA BAHIA
"SELECT A1_COD, A1_NOME, A1_END" // CAMPOS A SEREM MOSTRADOS 
"FROM   SA1990"                  // TABELA DE ORIGEM DOS CAMPOS
"WHERE  A1_UF = 'BA'"           // S�O FILTROS


"SELECT B1_COD, B1_DESC,BM_DESC,B1_GRUPO " // CAMPOS A SEREM MOSTRADOS 
"FROM SB1990"              // TABELA DE ORIGEM DOS CAMPOS
"INNER JOIN SBM990"        // NOME DA TABELA QUE EU QUERO JUNTAR 
"ON BM_GRUPO = B1_GRUPO AND SBM.D_E_L_E_T_ = ' '" // NO ON INDICO A CHAVE QUE PERMITE A JUN��O
"
"_FILIAL D_E_L_E_T_ = ' '

#include "topconn.ch"

User Function getBigValue(dDataDe,dDataAte)

local cDataDe  := dtos(dDataDe)
local cDataAte := dtos(dDataAte)
local cQuery   := ""

// maior valor total.
cQuery   := "SELECT TOP 1 C6_PROD,B1_DESC, MAX(C6_TOTAL) C6_TOTAL"
cQuery   += "FROM " + retSqlName("SC6")
cQuery   += "INNER JOIN " + retSqlName("SB1")
cQuery   += "WHERE C6_FILIAL = '"+xFilial("SC6")+"' AND "
cQuery   += "      BETWEEN '"+cDataDe+"' AND '"+cDataAte+"' AND "
cQuery   += "GROUP BY C6_PROD
cQuery   += "ORDER BY C6_TOTAL DESC
// 10	20	30	40	50	55	56	58	59	80
TCQUERY

// 10 � maior valor total.
cQuery   := "SELECT TOP 1 C6_PROD,B1_DESC, MAX(C6_TOTAL) C6_TOTAL"
cQuery   += "FROM " + retSqlName("SC6")
cQuery   += "INNER JOIN " + retSqlName("SB1")
cQuery   += "WHERE C6_FILIAL = '"+xFilial("SC6")+"' AND "
cQuery   += "      BETWEEN '"+cDataDe+"' AND '"+cDataAte+"' AND "
cQuery   += "GROUP BY C6_PROD
cQuery   += "ORDER BY C6_TOTAL

TCQUERY

return
