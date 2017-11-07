;************************** GroupBox *******************************
;
;	Adds and wraps a GroupBox around a group of controls in
;	the default Gui. Use the Gui Default command if needed.
;	For instance:
;
;		Gui, 2:Default
;
;	sets the default Gui to Gui 2.
;
;	Add the controls you want in the GroupBox to the Gui using
;	the "v" option to assign a variable name to each control. *
;	Then immediately after the last control for the group
;	is added call this function. It will add a GroupBox and
;	wrap it around the controls.
;
;	Example:
;
;	Gui, Add, Text, vControl1, This is Control 1
;	Gui, Add, Text, vControl2 x+30, This is Control 2
;	GroupBox("GB1", "Testing", 20, 10, "Control1|Control2")
;	Gui, Add, Text, Section xMargin, This is Control 3
;	GroupBox("GB2", "Another Test", 20, 10, "This is Control 3")
;	Gui, Add, Text, yS, This is Control 4
;	GroupBox("GB3", "Third Test", 20, 10, "Static4")
;	Gui, Show, , GroupBox Test
;
;	* The "v" option to assign Control ID is not mandatory. You
;	may also use the ClassNN name or text of the control.
;
;	Author: dmatch @ AHK forum
;	Date: Sept. 5, 2011
;	Additions by: digimystigi
;
;********************************************************************

GroupBox(GBvName			;Name for GroupBox control variable
		,Title				;Title for GroupBox
		,Piped_CtrlvNames	;Pipe (|) delimited list of Controls
		,Margin=10			;Margin in pixels around the controls
		,TitleHeight=10		;Height in pixels to allow for the Title
		,FixedWidth=""		;Optional fixed width
		,FixedHeight=""		;Optional fixed height
		,Kin=true)
{
	Local maxX, maxY, minX, minY, xPos, yPos ;all else assumed Global
	minX:=99999, minY:=99999, maxX:=0, maxY:=0

	;; Start of new code
	static GBArray := Object()
	GBArray.Insert(GBvName)
	GBArray%GBvName% := Piped_CtrlvNames

	If Kin
	{
		/*doneExpanding := true
		Loop
		{
		*/
			PCNInclude =
			Loop, Parse, Piped_CtrlvNames, |, %A_Space%
			{
				i := A_LoopField
				For index, element in GBArray
				{
					If i = %element%
					{
						PCNInclude := PCNInclude "|" GBArray%i%
						doneExpanding := false
						MsgBox % "PCN: " PCNInclude
					}
				}
			}
			Piped_CtrlvNames := Piped_CtrlvNames PCNInclude
			MsgBox % "Piped: " Piped_CtrlvNames
		;} Until doneExpanding
	}

	;; End of new code

	Loop, Parse, Piped_CtrlvNames, |, %A_Space%
	{
		;Get position and size of each control in list.
		GuiControlGet, GB, Pos, %A_LoopField%
		;creates GBX, GBY, GBW, GBH
		minX := GBX<minX ? GBX : minX ;check for minimum X
		minY := GBY<minY ? GBY : minY ;Check for minimum Y
		maxX := GBX+GBW>maxX ? GBX+GBW : maxX ;Check for maximum X
		maxY := GBY+GBH>maxY ? GBY+GBH : maxY ;Check for maximum Y

		;Move the control to make room for the GroupBox
		xPos:=GBX+Margin
		yPos:=GBY+TitleHeight+Margin ;fixed margin
		GuiControl, Move, %A_LoopField%, x%xPos% y%yPos%
	}
	;re-purpose the GBW and GBH variables
	GBW := FixedWidth ? FixedWidth : maxX-minX+2*Margin ;calculate width for GroupBox
	GBH := FixedHeight ? FixedHeight : maxY-MinY+TitleHeight+2*Margin ;calculate height for GroupBox ;fixed 2*margin

	;Add the GroupBox
	Gui, Add, GroupBox, v%GBvName% x%minX% y%minY% w%GBW% h%GBH%, %Title%
	return
}