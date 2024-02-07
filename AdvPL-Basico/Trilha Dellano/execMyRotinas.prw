#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"

User Function execMyRotinas()
local lReturn := .T.
local cMyrotinas := Space(30)

cMyRotinas := AllTrim(FWInputBox("Digite a FunÃ§Ã£o", cMyrotinas))

lReturn := &(cMyrotinas)

return


//------------------------------OBSERVAÇÕES------------------------------
//QUANDO FOR QRY FECHA O ARQUIVO
//QUANDO FOR USAR AS TABELAS PADRAO DO PROTHEUS AI NAO FECHA, SOMENTE RESTAURA

//restArea() - usada para restaurar as tabelas/rotinas padrões do PROTHEUS
//recno - número de cada linha

//A mesma lógica dos arquivos binários do Pascalzim, usa DbSeek, DbSelectArea etc. 
// No pascal era usado um contador para poder percorrer um arquivo, ja no do PROTHEUS ele tem o DbSkip
