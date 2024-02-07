#INCLUDE 'totvs.ch'


Class zPessoa
    //Atributos
    Data cNome
    Data nIdade
    Data dNascimento

    //Métodos
    Method New() CONSTRUCTOR
    Method MostraIdade()
EndClass


User Function zU001()
    Local oPessoa
    Local cNome       := "Gabriel"
    Local dNascimento := sToD("20020211")

    //Instanciando obj através da classe Pessoa
    oPessoa := zPessoa():New(cNome, dNascimento)

    //Chamando um método da classe
    oPessoa:MostraIdade()
Return
