//Sintomas
#include "protheus.ch"

/*/{Protheus.doc} ProcAlgo

    Processa Alguma Coisa

    @author Victor
    @since 17/12/2023
    /*/
User Function ProcAlgo(dDataDe, dDataAte, nTipo, aDados, aEmpresas, cOrigem, cDestino, cRotina, lEnviaEmail, lGravaLog, lMostraRel, lTsJob, cCodUsr, cId)

    if validaDatas(dDataDe, dDataAte)
        execProc(dDataDe, dDataAte, nTipo, aDados, aEmpresas, cOrigem, cDestino, cRotina, lEnviaEmail, lGravaLog, lMostraRel, lTsJob, cCodUsr, cId)
    endif

Return return_var


//Solução
#include "protheus.ch"

/*/{Protheus.doc} ProcAlgo

    Processa Alguma Coisa

    @author Victor
    @since 17/12/2023
    /*/
Class ProcAlgo
    
    data dDataDe
    data dDataAte
    //Continua com os demais parâmetros transformados em atributos...

    method newProcAlgo()

    method getDataDe()
    method setDataDe()
    method getDataAte()
    method setDataAte()
    //Continua com os getters/setters...

    method validaDatas()
    method execProc()

EndClass
