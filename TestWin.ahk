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
GroupBox("GB1", "Testing", GBTHeight, 10, "Label1|Label2|MyEdit1|MyEdit2|Check1|Check2")
Gui, Add, Text, Section xMargin, This is un-named
Gui, Add, DropDownList, xMargin vDDL, Line 1||Line 2|Line 3
GroupBox("GB2", "Another Test", GBTHeight, 10, "This is un-named|DDL")
Gui, Add, Text, yS, This is a control
Gui, Add, DateTime, vMyDateTime w127
GroupBox("GB3", "Test", GBTHeight, 10, "Static4|MyDateTime")
Gui, Add, Text, vMyText xMargin, Some text to read.
Gui, Add, Button, Section x60, Button 1
Gui, Add, Button, ys x+10, Button 2
GroupBox("GB4", "Buttons Too", GBTHeight, 10, "Button 1|Button 2")
GroupBox("GB5", "Around Another GroupBox", GBTHeight, 10, "MyText|Button 1|Button 2|GB4", 298,, false)
Gui, Add, Button, ys x+10 vIWin, I Win!
GroupBox("GB6", "I added a box!", GBTHeight, 10, "IWin|GB5")
Gui, Show, , GroupBox Test

return

GuiClose:
ExitApp



