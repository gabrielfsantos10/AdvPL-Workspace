#INCLUDE "totvs.ch"


User Function app001()

    // Chama a classe criada para instanciar
    Local oCliente := cliente():new("GABRIEL FARIA", "GABRIEL")
    Local cCgc     := oCliente:getCgc()
    
    oCliente:email   := "gabrielf.santos@totvs.com.br"
    oCliente:cpfCnpj := "46507382884"

    oCliente:codigo := "0001"
    oCliente:loja   := "LOJA TESTE"
    
    // Alterando o valor do método sobrescrito
    cCgc := oCliente:getCgc("AAA00")

Return oCliente
