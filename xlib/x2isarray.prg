* 
*  X2IsArray.PRG
*  RETURNs a logical value indicating whether the
*  variable PASSED BY REFERENCE or the passed Object, PropertyName
*  is an array.
*
*  Author:  Drew Speedie  
*           Special thanks to Mike Yearwood and Chris Bohling
*           mJindrova from Tek-Tips
*
*  USAGE
*  =====================================
*  IF X2IsArray(@m.SomeVariable)
*    ...
*  ENDIF
*  IF X2IsArray(SomeObject,"SomeProperty")
*    ...
*  ENDIF
* 
*  lParameters
*   tuVariable (R) Memory variable to be checked, 
*                    passed here BY REFERENCE
*                    -OR-
*                  Object whose tcProperty is to be
*                    checked
*   tcProperty (O) If tuVariable is passed as an object
*                    reference, this parameter is REQUIRED,
*                    and indicates the property of the
*                    tuVariable object that is checked for
*                    being an array
*                  If tuVariable is passed as a memory
*                    variable, DO NOT PASS THIS PARAMETER,
*                    or this routine will RETURN .F.
*
#IF VAL(LEFT(SUBSTR(VERSION(),AT("FOXPRO",UPPER(VERSION()))+7),3))<3
	#DEFINE LPARAMETERS PARAMETERS
#ENDIF
LPARAMETERS tuVariable, tcPropertyName
EXTERNAL ARRAY tuVariable
#IF VAL(LEFT(SUBSTR(VERSION(),AT("FOXPRO",UPPER(VERSION()))+7),3))<9
	RETURN IIF(EMPTY(m.tcPropertyName),TYPE("m.tuVariable[1]")#"U",TYPE("ALEN(m.tuVariable."+m.tcPropertyName+")")="N")
#ELSE
	RETURN IIF(EMPTY(m.tcPropertyName),TYPE("m.tuVariable",1)="A",TYPE("m.tuVariable."+m.tcPropertyName,1)="A")
#ENDIF
