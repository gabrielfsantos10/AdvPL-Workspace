//Bibliotecas
#Include "TOTVS.ch"

/*/{Protheus.doc} User Function AfterLogin
Ponto de entrada ap�s a abertura das SX
@type  Function
@author Atilio
@since 22/08/2023
@obs Se for SIGAADV, � disparado apenas uma vez
    Por�m, se for SIGAMDI, ser� disparado toda vez que abrir alguma aba
@see https://tdn.totvs.com/pages/releaseview.action?pageId=6815186
/*/

User Function AfterLogin()
    Local aArea := FWGetArea()

    //Se estiver usando o m�dulo financeiro
    If nModulo == 6
        u_zMsgPopup()
    EndIf

    FWRestArea(aArea)
Return
 
//Dispon�vel em https://terminaldeinformacao.com/2021/09/08/exibindo-uma-notificacao-no-windows-atraves-de-um-programa-em-advpl/

/*/{Protheus.doc} User Function zMsgPopup
Fun��o que mostra um popup de aviso no Windows 10 (Windows Notification Balloon)
@type  Function
@author Atilio
@since 08/04/2021
@version version
@obs A fun��o tamb�m pode ser adaptada para ser usada com TSystemTray - https://tdn.totvs.com/display/tec/TSystemTray
@see https://stackoverflow.com/questions/50927132/show-balloon-notifications-from-batch-file
/*/
 
User Function zMsgPopup()
    Local aArea := FWGetArea()
    Local cPastaTemp := GetTempPath()
    Local cArquiBat := dToS(Date()) + "-test-message.bat"
    Local cConteuBat := ""
    Local cTitulo := ""
    Local cMensagem := ""
    Local nTotSE1 := 0
    Local nTotSE2 := 0

    //Primeiro passo, iremos criar um arquivo .bat dentro da pasta tempor�ria do Windows - Conforme exemplo do StackOverFlow Acima
    If ! File(cPastaTemp + cArquiBat)
        cConteuBat := '@echo off' + CRLF
        cConteuBat += '' + CRLF
        cConteuBat += 'if "%~1"=="" call :printhelp  & exit /b 1' + CRLF
        cConteuBat += 'setlocal' + CRLF
        cConteuBat += '' + CRLF
        cConteuBat += 'if "%~2"=="" (set Icon=Information) else (set Icon=%2)' + CRLF
        cConteuBat += 'powershell -Command "[void] [System.Reflection.Assembly]::LoadWithPartialName(' + "'System.Windows.Forms'" + '); $objNotifyIcon=New-Object System.Windows.Forms.NotifyIcon; $objNotifyIcon.BalloonTipText=' + "'%~1'" + '; $objNotifyIcon.Icon=[system.drawing.systemicons]::%Icon%; $objNotifyIcon.BalloonTipTitle=' + "'%~3'" + '; $objNotifyIcon.BalloonTipIcon=' + "'None'" + '; $objNotifyIcon.Visible=$True; $objNotifyIcon.ShowBalloonTip(5000);"' + CRLF
        cConteuBat += '' + CRLF
        cConteuBat += 'endlocal' + CRLF
        cConteuBat += 'goto :eof' + CRLF
        cConteuBat += '' + CRLF
        cConteuBat += ':printhelp' + CRLF
        cConteuBat += 'echo USAGE: %~n0 Text [Icon [Title]]' + CRLF
        cConteuBat += 'echo Icon can be: Application, Asterisk, Error, Exclamation, Hand, Information, Question, Shield, Warning or WinLogo' + CRLF
        cConteuBat += 'exit /b' + CRLF

        MemoWrite(cPastaTemp + cArquiBat, cConteuBat)

        //Busca o total de t�tulos
        nTotSE1 := Contar("SE1", "SE1->E1_SALDO != 0 .And. Empty(SE1->E1_BAIXA)")
        nTotSE2 := Contar("SE2", "SE2->E2_SALDO != 0 .And. Empty(SE2->E2_BAIXA)")

        //Agora iremos montar a mensagem do comando, aqui estou chumbando ela, mas voc� pode fazer uma query SQL para montar
        cTitulo := "[Protheus] Aten��o"
        cMensagem := "Seja bem vindo -" + Alltrim(UsrRetName(RetCodUsr())) + "- , lembre-se que: "
        cMensagem += "Existem " + cValToChar(nTotSE2) + " T�tulos a Pagar em aberto e "
        cMensagem += "Existem " + cValToChar(nTotSE1) + " T�tulos a Receber em aberto"

        //Por �ltimo, iremos mostrar o comando, executando o bat, e passando as variaveis montadas acima
        ShellExecute("OPEN", cArquiBat, '"' + cMensagem + '" Information "' + cTitulo + '"', cPastaTemp, 0 )
    EndIf

    FWRestArea(aArea)
Return
