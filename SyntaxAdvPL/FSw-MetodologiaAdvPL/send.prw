//send.prw

/*/{Protheus.doc} send

    Envia o e-mail

    @author Victor Hugo
    @since 11/11/2013

    @param cTo, String, Destinat�rio(s)
    @param cSubject, String, Assunto da mensagem
    @param cBody, String, Corpo da mensagem(ser� ignorado caso seja definido um layout HTML)
    @param cAttachment, String, Anexo (Opcional. Para definir v�rios anexos utilize o m�todo attachFile())

    @return Logico indica se o e-mail foi enviado
    /*/
Method send(cTo, cSubject, cBody, cAttachment) class IpMailObject
