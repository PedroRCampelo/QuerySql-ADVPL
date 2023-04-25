// Puxando dado do SQL em ADVPL

#include "tbiconn.ch"
#include "protheus.ch"



Static Function fbalanceSB2(cProduto)
	Local cQuery := ""
	Local nBalance := 0

	RpcSetType(3)
	RpcSetEnv("99", "01")
// Prepare Environment Empresa "01" Filial "01"

	cAliasSB2 := GetNextAlias() //

	cQuery := " SELECT SUM(B2_QATU) BALANCE "
	cQuery += " FROM " + " SB2990 "
	cQuery += " WHERE D_E_L_E_T_  = '' "
	cQuery += " AND B2_COD = '" + cValToChar(cProduto) + "' "

	cQuery := ChangeQuery(cQuery)


	dbUseArea(.T.,"TOPCONN",TcGenQry(,,cQuery),cAliasSB2,.T.,.T.)

	nBalance := BALANCE

	dbCloseArea()
	dbSelectArea("SB2")

// Reset Environment 

Return(nBalance)



User Function ExecSearch()
	CONOUT("Balance: " + cValToChar(fbalanceSB2(2001)))

Return


// User Function tststartjob ()
//   Local lret := .F.
//   lret := startjob("u_fbalanceSB2",getenvserver(),.T.,2001)
//   if !lret
//     return -1
//   endif

// Return

// user function inijob (cTxt)
//   conout(cTxt)
// return .T.
