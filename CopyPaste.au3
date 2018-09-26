#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1
 Software Version: 1.1
 Date: May 22 2011
 Author:         Roy Yap

 Script Function:
	Copy Paste.

	Changes made: Getting time stamp for every time it writes the log


#ce ----------------------------------------------------------------------------

#Include <Clipboard.au3> ;used for the _ClipBoard_GetData to check if ti's txt only data in clipboard
#Include <File.au3> ; used for the file write log function


Local $file, $clipBoardContents, $checkClipBoardContents, $checkClipBoardSequence, $checkClipBoardSequenceCompare, $lastLine

;debug
;ClipPut ("debug test message")
;$day = 24
;$month = 05
;$year = 1979
;CopyPaste()

Func CopyPaste()
	;open up the recently created log
	;$file = FileOpen("C:\asproductionsupport\" & $day & $month & $year & ".log", 1)
	$file = FileOpen($day & $month & $year & ".log", 1)
	;$file = $day & $month & $year & ".log"

;~ 	; Check if file opened for writing OK
;~ 	If $file = -1 Then
;~ 		MsgBox(0, "Error", "Unable to open file. Please contect Roy Yap royyap1@gmail.com the developer about the inability of the program to open the file for writing.")
;~ 		Exit
;~ 	EndIf

	;Check if the sequence of the clipboard has changed

	$checkClipBoardSequence = _ClipBoard_GetSequenceNumber ()
	If $checkClipBoardSequenceCompare <> $checkClipBoardSequence Then
		$checkClipBoardSequenceCompare = $checkClipBoardSequence

		;check the format of the clipboard contents
		$checkClipBoardContents = _ClipBoard_IsFormatAvailable($CF_TEXT)

		If $checkClipBoardContents <> 0 Then

			;get contents of clipboard
			$clipBoardContents = ClipGet()

			;debug
			;MsgBox(4096,"$clipBoardContents value is", $clipBoardContents)
			;get the time stamp
			Date01()
			;put a time stamp into daily log file
			FileWrite($file, "" & $day & $month & $year & "HH:MM:SS" & $hour & $minute & $second)
			;paste the contents into log file
			FileWrite($file, "" & $clipBoardContents)
			;_FileWriteLog($file, "" & $clipBoardContents & "                                                                                                                                                                                                              ", -1)
			;_FileWriteLog($file, $clipBoardContents, -1)


			;enter 2 emtpy lines

			;$lastLine = FileReadLine ($file, -1 )

			;$lastLine = $lastLine+2

			;FileWriteLine ($file, $lastLine)

			FileWrite($file, "                                                                                                                                                                                                               ")
			FileWrite($file, "                                                                                                                                                                                                               ")
			;FileWrite($file, "rrr")
			FileWrite($file, "                                                                                                                                                                                                               ")
			FileWrite($file, "                                                                                                                                                                                                               ")

			;enter 2 more emtpy lines

			;$lastLine = FileReadLine ($file, -1 )

			;$lastLine = $lastLine+2

			;FileWriteLine ($file, $lastLine)

			;FileWrite($file, " ")
			;FileWrite($file, " ")
			;FileWrite($file, " ")

		EndIf

	EndIf

	;FileClose($file)
EndFunc