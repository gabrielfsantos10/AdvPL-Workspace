#include 'protheus.ch'
#include 'parmtype.ch'

/*/{Protheus.doc} MA410MNU
PE para inclusao de novas opções do outras acoes do pedido de venda
@author Tiago Faria
@since 02/07/2022
@version 1.0
@type function
/*/
user function MA410MNU()
	aadd(aRotina, {'#Copia Pedido Filial', "U_COPIAPV()", 0, 4, 0, NIL})
return
