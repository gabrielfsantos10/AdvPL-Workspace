//Bibliotecas
#Include "TOTVS.ch"  
 
/*/{Protheus.doc} zOO24
Fun��o de teste da classe FWChartBar
@type function
@author Atilio
@since 01/12/2015
@version 1.0
@see https://terminaldeinformacao.com/2016/09/06/criando-graficos-advpl-fwchartbar/
/*/
 
User Function zOO24()
    Local oFWChart
    Local oDlg
    Local aRand := {}
     
    //Cria a Janela
    DEFINE MSDIALOG oDlg PIXEL FROM 0,0 TO 400,600
        //Inst�ncia a classe
        oFWChart := FWChartFactory():New()
        oFWChart := oFWChart:getInstance(BARCHART) //BARCOMPCHART ; LINECHART ; PIECHART
         
        //Inicializa pertencendo a janela
        oFWChart:Init(oDlg, .T., .T. )
         
        //Seta o t�tulo do gr�fico
        oFWChart:SetTitle("T�tulo", CONTROL_ALIGN_CENTER)
         
        //Adiciona as s�ries, com as descri��es e valores
        oFWChart:addSerie("Ano 2011", 20044453.50)
        oFWChart:addSerie("Ano 2012", 21044453.35)
        oFWChart:addSerie("Ano 2013", 22044453.15)
        oFWChart:addSerie("Ano 2014", 23044453.10)
        oFWChart:addSerie("Ano 2015", 25544453.01)
         
        //Define que a legenda ser� mostrada na esquerda
        oFWChart:setLegend( CONTROL_ALIGN_LEFT )
         
        //Seta a m�scara mostrada na r�gua
        oFWChart:cPicture := "@E 999,999,999,999,999.99"
         
        //Define as cores que ser�o utilizadas no gr�fico
        aAdd(aRand, {"084,120,164", "007,013,017"})
        aAdd(aRand, {"171,225,108", "017,019,010"})
        aAdd(aRand, {"207,136,077", "020,020,006"})
        aAdd(aRand, {"166,085,082", "017,007,007"})
        aAdd(aRand, {"130,130,130", "008,008,008"})
         
        //Seta as cores utilizadas
        oFWChart:oFWChartColor:aRandom := aRand
        oFWChart:oFWChartColor:SetColor("Random")
         
        //Constr�i o gr�fico
        oFWChart:Build()
    ACTIVATE MSDIALOG oDlg CENTERED
Return
