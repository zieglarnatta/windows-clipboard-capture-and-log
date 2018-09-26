#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1
 Software Version: 1.0
 Date: May 14 2011
 Author:         Roy Yap

 Script Function:
	day file log maker.

	Changes made: initial version


#ce ----------------------------------------------------------------------------

#include <File.au3> ;for creating a new day log file

Global $month, $day, $year

Func DayFileCreator()

	;create the file
	;If Not _FileCreate( "C:\asproductionsupport\" & $day & $month & $year & ".log") Then
	If Not _FileCreate( $day & $month & $year & ".log") Then
	   MsgBox(4096,"Error", " Error Creating/Resetting log. Please contect Roy Yap royyap1@gmail.com the developer.      error:" & @error)
	EndIf

EndFunc