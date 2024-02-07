#include "Protheus.ch"
//Principal import do MVC
#include "FWMVCDEF.ch"

User Function BRWSZ9()

    //Abrindo a �rea/tabela que ir� trabalhar
    Local aArea := GetNextAlias()
    Local oBrowseSZ9 //Vari�vel que receber� o instanciamento da classe FWmBrowse

    //Usar o construtor New - M�todo construtor da classe
    oBrowseSZ9 := FWmBrowse():New()

    //Passa como par�metro a tabela que ir� ser mostrada no Browse
    oBrowseSZ9:SetAlias("SB1")

    //SetDescription - Usado para definir a descri��o/t�tulo
    oBrowseSZ9:SetDescription("Meu primeiro Browse - Tela SB1")

    oBrowseSZ9:Activate()
    //Ativa e adiciona a fun��o ao sistema

    RestArea(aArea)
Return FWMVCMenu('COMP011_MVC')
