#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"

User Function execMyRotinas()
local lReturn := .T.
local cMyrotinas := Space(30)

cMyRotinas := AllTrim(FWInputBox("Digite a Função", cMyrotinas))

lReturn := &(cMyrotinas)

return


//------------------------------OBSERVA��ES------------------------------
//QUANDO FOR QRY FECHA O ARQUIVO
//QUANDO FOR USAR AS TABELAS PADRAO DO PROTHEUS AI NAO FECHA, SOMENTE RESTAURA

//restArea() - usada para restaurar as tabelas/rotinas padr�es do PROTHEUS
//recno - n�mero de cada linha

//A mesma l�gica dos arquivos bin�rios do Pascalzim, usa DbSeek, DbSelectArea etc. 
// No pascal era usado um contador para poder percorrer um arquivo, ja no do PROTHEUS ele tem o DbSkip
