HA$PBExportHeader$isimple.sra
$PBExportComments$Generated Application Object
forward
global type isimple from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type isimple from application
string appname = "isimple"
end type
global isimple isimple

on isimple.create
appname="isimple"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on isimple.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;
//// Profile ODB
//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=ORA_ODBC;UID=XXI;PWD=1111',PBCatalogOwner='XXI'"
//

// Profile ORA
SQLCA.DBMS = "ORA Oracle"
SQLCA.LogPass = '1111'
SQLCA.ServerName = "ODB"
SQLCA.LogId = "XXI"
SQLCA.AutoCommit = True
SQLCA.DBParm = "PBCatalogOwner='XXI'"




CONNECT;

If SQLCA.SQLCode <> 0 Then
	MessageBox('Error',SQLCA.SQLErrText)
End If	


Open(w_cus_list)
end event

event close;DISCONNECT;
end event

