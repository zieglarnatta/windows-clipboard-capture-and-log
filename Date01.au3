#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1
 Software Version: 1.1
 Date: May 22 2011
 Author:         Roy Yap

 Script Function:
	get system date time for filename.

	Changes made: added HH MIN Seconds parsing


#ce ----------------------------------------------------------------------------

#Include <Date.au3> ;needed as part of _Date_Time_SystemTimeToDateStr

;declare global var for date and time read to be sent back to DayFileCreator Func
;May 22 2011 added Hour Minute and seconds
Global $month, $day, $year, $hour, $minute, $second

;local var only for this func to use
Local $date, $aTime ;array time

;debug
;date()
;MsgBox(4096,"Date MM DD YYYY is", $month & " " & $day & " " & $year)


;start main func
Func Date01()
	$date = _Date_Time_GetSystemTime()
	$aTime = _Date_Time_SystemTimeToArray($date)
	;format the month to be forced 2 digit string
	$month = $aTime[0]
		;start IF to test if the month is single digit aka <10
		If $month < 10 Then
			$month = "0" & $month
		EndIf
	$day = $aTime[1]
		;start IF to test if the day is single digit aka <10
		;debug force $day to be single digit
		;$day = 9
		If $day < 10 Then
			$day = "0" & $day
		EndIf
	$year = $aTime[2]
	$hour = $aTime[3]
	$minute = $aTime[4]
	$second = $aTime[5]

;Return $month $day $year
EndFunc