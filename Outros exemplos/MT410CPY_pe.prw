#include 'protheus.ch'
#include 'parmtype.ch'

/*/{Protheus.doc} MT410CPY
Ponto de entrada na copia de um pedido
@author Tiago Faria
@since 02/07/2022
@version undefined

@type function
/*/
user function MT410CPY()
	if SC5->(fieldPos("C5_ZZPVORI") > 0)
		M->C5_ZZPVORI := criaVar("C5_ZZPVORI",.f.)
	endif
return
