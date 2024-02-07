#INCLUDE "totvs.ch"


/*/{Protheus.doc} pessoa
    (Estudando sobre orienta��o a objetos em AdvPL)
    @author gabrielf.santos
    @since 02/01/2024
    @version 1.0
    /*/
class pessoa

    // DEFINI��O DOS ATRIBUTOS (O objeto a ser instanciado, ter� esses atributos j� definidos)
    data nome
    data nomeReduzido
    data cpfCnpj
    data cep
    data endereco
    data bairro
    data cidade
    data uf
    data telefone
    data email

    // DEFINI��O DOS M�TODOS
    method New() CONSTRUCTOR
    method getCgc()
    
EndClass


Method new(pNome, pNomeReduz, pCpfCnpj, pCep, pEndereco, pBairro, pCidade, pUf, pTel, pEmail) class pessoa

    // Se o usu�rio n�o passar nada para os par�metros, ele assume o valor default
    default pNome      := '-'
    default pNomeReduz := '-'
    default pCpfCnpj   := '-'
    default pCep       := '-'
    default pEndereco  := '-'
    default pBairro    := '-'
    default pCidade    := '-'
    default pUf        := '-'
    default pTel       := '-'
    default pEmail     := '-'

    // self devolve o objeto
    self:nome          := pNome
    self:nomeReduzido  := pNomeReduz
    self:cpfCnpj       := pCpfCnpj
    self:cep           := pCep
    self:endereco      := pEndereco
    self:bairro        := pBairro
    self:cidade        := pCidade
    self:uf            := pUf
    self:telefone      := pTel
    self:email         := pEmail
    
Return self


Method getCgc() class pessoa
    
Return self:cpfCnpj
