#INCLUDE "totvs.ch"


/*/{Protheus.doc} User Function nomeFunction
    (long_description)
    @type  Function
    @author user
    @since 04/12/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/

User Function expl001()
    Local cQuery := ""

    cQuery := " SELECT"
    cQuery += "     *"
    cQuery += " FROM"
    cQuery += "	    SA2990"
    cQuery += " WHERE"
    cQuery += "	    A2_FILIAL = ' '"

Return return_var
