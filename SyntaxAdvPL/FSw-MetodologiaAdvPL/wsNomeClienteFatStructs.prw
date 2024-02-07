//wsNomeClientFatStructs.prw

#include "protheus.ch"
#include "apwebsrv.ch"

/*/{Protheus.doc} WsClienteTesteResponseConsultaPv
    Requisição de consulta de pedidos de venda

    @author  Victor
    @since   19/12/2013
/*/

WSStruct WsClienteTesteResponseConsultaPv

    WsData dataDe as date
    WsData dataAte as date
    WsData numPvDe as string
    WsData numPvAte as string

ENDWsStruct


/*/{Protheus.doc} WsClienteTesteResponseConsultaPv

    Resposta da consulta de pedidos de vendas

    @author  Victor
    @since   19/12/2013
/*/

WSStruct WsClienteTesteResponseConsultaPv

    WsData pedidos as array of WsClienteTestePedidoDeVenda

ENDWsStruct
