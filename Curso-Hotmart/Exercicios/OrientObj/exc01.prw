#INCLUDE 'totvs.ch'


Class zPessoa
    //Atributos
    Data cNome
    Data nIdade
    Data dNascimento

    //M�todos
    Method New() CONSTRUCTOR
    Method MostraIdade()
EndClass


User Function zU001()
    Local oPessoa
    Local cNome       := "Gabriel"
    Local dNascimento := sToD("20020211")

    //Instanciando obj atrav�s da classe Pessoa
    oPessoa := zPessoa():New(cNome, dNascimento)

    //Chamando um m�todo da classe
    oPessoa:MostraIdade()
Return
