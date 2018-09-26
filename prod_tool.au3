#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=screen_capture_tool_v1_8_enhanced.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1
 Software Version: 1.2
 Date: May 22 2011
 Author:         Roy Yap

 Script Function:
	Main Copy Paster script.

	Changes made: Change to 800 miliseconds and building the GUI, added time stamping capability separate from file logging


#ce ----------------------------------------------------------------------------

#include <Date01.au3> ;for calling the Date.au3 func
#include <CopyPaste.au3> ; for calling the copyPaste.au3 func
#include <DayFileCreator.au3>  ; for calling the DayFileCreator.au3 function
#include <Kill.au3>  ; for calling the Kill.au3 terminate program function
#Include <Misc.au3> ; for use of teh _IsPressed function
#include <GUIConstantsEx.au3> ; needed for creating GUI


;#include <File.au3> ;for creating a new day log file

;Global variables used are declared (May 14 2011 initial version)
Global $month, $day, $year, $hour, $minute, $second


;call the dateTime func to get date
Date01()

; create a new log file
DayFileCreator()

; create the gui

CreateGui()

Func CreateGui()
	GUICreate("Production Tool")
	GUISetState(@SW_SHOW) ; will display an empty dialog box

	Do
        $msg = GUIGetMsg()

    Until $msg = $GUI_EVENT_CLOSE
EndFunc

;capture CTRL+C copy text script
;Global $imgcounts , $imgcounte , $imgext , $imgloc , $imgname
;HotKeySet("^c", "CopyPaste")
$dll = DllOpen("user32.dll")
		While 1
			Sleep (800)
			;If _IsPressed("^c", $dll) Then
				;wait 250 mili seconds for the dat aot be written into clipboard
			;	Sleep ( 1000 )
				CopyPaste()
			;May 22 2011 kill the ALT + S kill functionality
			;ElseIf _IsPressed("!s", $dll) Then
			;If _IsPressed("!s", $dll) Then
			;	Terminate()
			;	ExitLoop
			;EndIf
		WEnd
DllClose($dll)

;May 22 remove the Alt S kill switch using GUI to terminate the program
;capture Alt+ S and kill script Kill.au3
;HotKeySet("!s", "Terminate")



Exit
