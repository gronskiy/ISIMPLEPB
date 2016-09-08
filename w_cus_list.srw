HA$PBExportHeader$w_cus_list.srw
forward
global type w_cus_list from window
end type
type st_trn from statictext within w_cus_list
end type
type st_1 from statictext within w_cus_list
end type
type dw_trn_list from datawindow within w_cus_list
end type
type dw_acc_list from datawindow within w_cus_list
end type
type cb_1 from commandbutton within w_cus_list
end type
type dw_cus_list from datawindow within w_cus_list
end type
end forward

global type w_cus_list from window
integer width = 5321
integer height = 3152
boolean titlebar = true
string title = "Clients - Accounts - Transaction"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_trn st_trn
st_1 st_1
dw_trn_list dw_trn_list
dw_acc_list dw_acc_list
cb_1 cb_1
dw_cus_list dw_cus_list
end type
global w_cus_list w_cus_list

on w_cus_list.create
this.st_trn=create st_trn
this.st_1=create st_1
this.dw_trn_list=create dw_trn_list
this.dw_acc_list=create dw_acc_list
this.cb_1=create cb_1
this.dw_cus_list=create dw_cus_list
this.Control[]={this.st_trn,&
this.st_1,&
this.dw_trn_list,&
this.dw_acc_list,&
this.cb_1,&
this.dw_cus_list}
end on

on w_cus_list.destroy
destroy(this.st_trn)
destroy(this.st_1)
destroy(this.dw_trn_list)
destroy(this.dw_acc_list)
destroy(this.cb_1)
destroy(this.dw_cus_list)
end on

event open;dw_cus_list.SetTransObject(SQLCA)
dw_acc_list.SetTransObject(SQLCA)
dw_trn_list.SetTransObject(SQLCA)
end event

type st_trn from statictext within w_cus_list
integer x = 18
integer y = 1956
integer width = 3552
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transactions:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cus_list
integer x = 41
integer y = 1172
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Accounts:"
boolean focusrectangle = false
end type

type dw_trn_list from datawindow within w_cus_list
integer x = 18
integer y = 2048
integer width = 5257
integer height = 984
integer taborder = 30
string title = "none"
string dataobject = "d_trn_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;SelectRow(0,false)
SelectRow(currentrow,true)

end event

event doubleclicked;string ls_null 

SetNull(ls_null)

this.SetSort( ls_null)
this.Sort()
end event

type dw_acc_list from datawindow within w_cus_list
integer x = 18
integer y = 1232
integer width = 5257
integer height = 692
integer taborder = 20
string title = "none"
string dataobject = "d_acc_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;string ls_account
string ls_sessionid

dw_trn_list.Reset()

If currentrow < 1 Then Return

ls_account = string(this.object.account[currentrow])

st_trn.text = 'Account: ' + ls_account

If IsNull(ls_account) or ls_account = '' Then Return




dw_trn_list.Retrieve(ls_account)


SelectRow(0,false)
SelectRow(currentrow,true)

end event

event doubleclicked;string ls_null 

SetNull(ls_null)

this.SetSort( ls_null)
this.Sort()
end event

type cb_1 from commandbutton within w_cus_list
integer x = 14
integer y = 20
integer width = 311
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = russiancharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Retrieve"
end type

event clicked;
SetPointer(HourGlass!)
dw_cus_list.Retrieve()
SetPointer(Arrow!)
end event

type dw_cus_list from datawindow within w_cus_list
integer x = 18
integer y = 132
integer width = 5257
integer height = 1004
integer taborder = 10
string title = "none"
string dataobject = "d_cus_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;string ls_icusnum 
string ls_acc

SetNull(ls_acc)
dw_acc_list.Reset()
dw_trn_list.Reset()



If currentrow < 1 Then Return

ls_icusnum = string(this.object.icusnum[currentrow])

If trim(ls_icusnum) = '' or IsNull(ls_icusnum) Then Return

dw_acc_list.Retrieve(ls_icusnum, ls_acc)


SelectRow(0,false)
SelectRow(currentrow,true)

end event

event doubleclicked;string ls_null 

SetNull(ls_null)

this.SetSort( ls_null)
this.Sort()



end event

