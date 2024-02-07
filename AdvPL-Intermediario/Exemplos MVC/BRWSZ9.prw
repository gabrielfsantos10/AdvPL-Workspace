#include "Protheus.ch"
//Principal import do MVC
#include "FWMVCDEF.ch"

User Function BRWSZ9()

    //Abrindo a área/tabela que irá trabalhar
    Local aArea := GetNextAlias()
    Local oBrowseSZ9 //Variável que receberá o instanciamento da classe FWmBrowse

    //Usar o construtor New - Método construtor da classe
    oBrowseSZ9 := FWmBrowse():New()

    //Passa como parâmetro a tabela que irá ser mostrada no Browse
    oBrowseSZ9:SetAlias("SB1")

    //SetDescription - Usado para definir a descrição/título
    oBrowseSZ9:SetDescription("Meu primeiro Browse - Tela SB1")

    oBrowseSZ9:Activate()
    //Ativa e adiciona a função ao sistema

    RestArea(aArea)
Return FWMVCMenu('COMP011_MVC')
