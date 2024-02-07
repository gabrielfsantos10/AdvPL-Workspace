#INCLUDE "totvs.ch"


/*/{Protheus.doc} cliente
    (Estudando sobre orienta��o a objetos em AdvPL)
    @author gabrielf.santos
    @since 02/01/2024
    @version 1.0
    /*/
    //from pessoa para herdar outra classe
class cliente from pessoa

    // DEFINI��O DOS ATRIBUTOS (O objeto a ser instanciado, ter� esses atributos j� definidos)
    data codigo
    data loja

    // DEFINI��O DOS M�TODOS
    method New() CONSTRUCTOR
    method gravaCliente()
    
    // Sobrescrevendo o m�todo da classe pessoa
    method getCgc()
    
EndClass


Method new(pNome, pNomeReduz, pCpfCnpj, pCep, pEndereco, pBairro, pCidade, pUf, pTel, pEmail) class cliente

    // Herdando da outra classe, passando os par�metros necess�rios
    _Super:new(pNome, pNomeReduz, pCpfCnpj, pCep, pEndereco, pBairro, pCidade, pUf, pTel, pEmail)

    // self devolve o objeto
    self:codigo := '-'
    self:loja   := '-'
    
Return self


Method gravaCliente() class cliente
    
Return .T.


Method getCgc(pCgc) class cliente
    
    default pCgc := 'default0001'
    self:cpfCnpj := pCgc

Return self:cpfCnpj
