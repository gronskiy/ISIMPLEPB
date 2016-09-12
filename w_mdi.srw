HA$PBExportHeader$w_mdi.srw
forward
global type w_mdi from window
end type
type mdi_1 from mdiclient within w_mdi
end type
end forward

global type w_mdi from window
integer width = 4914
integer height = 2384
boolean titlebar = true
string title = "Isimple MDI"
string menuname = "m_mdi"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdidockhelp!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
end type
global w_mdi w_mdi

on w_mdi.create
if this.MenuName = "m_mdi" then this.MenuID = create m_mdi
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_mdi.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

type mdi_1 from mdiclient within w_mdi
long BackColor=268435456
end type

