#SingleInstance Force
SetWorkingDir %A_ScriptDir%

#Include %A_ScriptDir%\GroupBox.ahk

GBTHeight:=10
Gui, +LastFound
Gui, Add, Text, vLabel1, A Label
Gui, Add, Text, x162 yMargin vLabel2, Another Label
Gui, Add, Edit, Section vMyEdit1 xMargin, This is a Control
Gui, Add, Edit, vMyEdit2 ys x162, This is a Control
Gui, Add, CheckBox, Section vCheck1 xMargin, CheckBox 1
Gui, Add, CheckBox, vCheck2 ys x160 Checked, CheckBox 2
GroupBox("GB1", "Testing", "Label1|Label2|MyEdit1|MyEdit2|Check1|Check2", 10, GBTHeight)
Gui, Add, Text, Section xMargin, This is un-named
Gui, Add, DropDownList, xMargin vDDL, Line 1|Line 2||Line 3
GroupBox("GB2", "Another Test", "This is un-named|DDL", 10, GBTHeight)
Gui, Add, Text, yS, This is a control
Gui, Add, DateTime, vMyDateTime w127
GroupBox("GB3", "Test", "Static4|MyDateTime", 10, GBTHeight)
GroupBox("SideBy", "Side-by-Side Wrapper", "GB2|GB3", 10, GBTHeight)
Gui, Add, Button, xm vButtonT, Button Top
Gui, Add, Text, vMyText xMargin, Some text to read.
Gui, Add, Button, Section x60, Button 1
Gui, Add, Button, ys x+10, Button 2
GroupBox("GB4", "Buttons Too", "Button 1|Button 2", 10, GBTHeight)
;GroupBox("GB5", "Around Another GroupBox", 10, GBTHeight, "MyText|Button 1|Button 2|GB4", 298,, false)
GroupBox("GB5", "Around Another GroupBox", "MyText|GB4", 10, GBTHeight, 298,, true)
Gui, Add, Button, vButtonB, Button Bottom
Gui, Add, Button, ys vButtonR, Button Right
GroupBox("GB6", "I added a box!", "ButtonT|ButtonR|ButtonB|GB5", 10, GBTHeight)
Gui, Show, , GroupBox Test

return

GuiClose:
ExitApp



