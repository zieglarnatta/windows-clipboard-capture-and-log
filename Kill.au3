#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.4.0
 Software Version: 1.8
 Date: June 4 2010
 Author:         Roy Yap

 Script Function:
	Kill function AutoIt script.
	Changes: pop up box if user choses not to terminate program

#ce ----------------------------------------------------------------------------

;function to capture Alt+s key
Func Terminate()
	$term = MsgBox ( 4, "Exit Program?","Click Yes to KillScipt, No to continue")
	If $term = 6 Then
			MsgBox ( 0, "Script Killed", "Script has been killed due to Success & Termination of Program else pressing of Alt+s",5)
			Exit 0
		ElseIf $term = 7 Then
			$pos = MouseGetPos()
				ToolTip("Production tool will sit waiting for CTRL+C copy command",$pos[0],$pos[1],"",1,7)
				;wait quickly for 1 second
				Sleep(2000)
				;close up the tool tip
				ToolTip("")
	EndIf
EndFunc
