; Tid till Phtalo: 19 minuter
; Tid till 1600: 45 minuter

; Google Chrome, 1920x1080, 100% zoom



; Global variables
global title := "Clicker Heroes - Google Chrome"
global stop  := False
global hX	 := "x500"
global hY0   := "y388"
global hY1   := "y420"
global hY2   := "y530"
global hY3   := "y640"
global hY4   := "y750"

; Title match requires key word
SetTitleMatchMode 2

; Key bindings
F1::
	getClickables()
	Return
F2::
	idle()
	Return
F4::
	active()
	Return
F6::
	idle1hero()
	Return

F8::
	stop := True
	Return	

Esc::
	Reload
	Return

; Clicks all spots where clickables can spawn
getClickables(){
	ControlClick, x916 y671, %title%
	ControlClick, x1262 y694, %title%
	ControlClick, x1141 y613, %title%
	ControlClick, x1398 y635, %title%
	ControlClick, x1446 y626, %title%
	ControlClick, x1150 y650, %title%	
	ControlClick, x1152 y561, %title%
	Return
}

; Scroll up on the hero pane
scrollUp(scrolls){
	Loop, %scrolls% {
		ControlClick, x948 y398, %title%		
	}
	Return
}

; Scroll down on the hero pane
scrollDown(scrolls){
	Loop, %scrolls% {
		ControlClick, x948 y834, %title%		
	}
	Return
}

; Level up 100 times
levelUpHero(x, y){
	ControlSend,, {ctrl down}, %title%
	Sleep 10
	ControlClick, %x% %y%, %title%
	ControlClick, %x% %y%, %title%
	ControlSend,, {ctrl up}, %title%
	Return
}

idle1hero(){
	Loop{
		levelUpHero(hX, "y770")
		Sleep 15000
	}
	Return
}

levelUpAll(){
	loop, 2{
		levelUpHero(hX, hY1)
		levelUpHero(hX, hY2)
		levelUpHero(hX, hY3)
		levelUpHero(hX, hY4)
	}
	Return
}
upgradeAll(){
	ControlClick, x700 y780, %title%
	Return
}
newGame(){
	getClickables()
	ControlSend,, {a}, %title%
	Sleep 5000
	levelUpAll()
	Sleep 500
	scrollDown(7)
	Sleep 500
	levelUpAll()
	Sleep 500
	scrollDown(7)
	Sleep 500
	levelUpAll()
	Sleep 500
	scrollDown(8)
	Sleep 500
	levelUpAll()
	Sleep 500
	scrollDown(7)
	Sleep 500
	levelUpAll()
	Sleep 500
	scrollDown(7)
	Sleep 500
	levelUpAll()
	Sleep 500
	scrollDown(7)
	Sleep 500
	levelUpAll()
	Sleep 500
	scrollDown(1)
	Sleep 500
	upgradeAll()
	Sleep 500
	Return
}

; Fully automated hero soul farming, designed for gilded Terra and 45 minutes per run.
idle(){
	stop := False
	while(!stop){
		start := A_TickCount
		newGame()
		SetTimer, upgradeTerra, -800000
		Loop {
			now := A_TickCount-start
			if now < 700000
				levelUpHero(hX, "y470")
			Else 
				levelUpHero(hX, "y770")	
			Sleep 10000
			if now > 2250000
				break
			Else
				Continue
		}
		scrollUp(8)
		Sleep 5000
		ControlClick, x700 y425, %title%
		Sleep 100
		ControlClick, x900 y630, %title%
		Sleep 500
	}
	Return
}

upgradeTerra:
	ControlClick, x590 y820, %title%
	ControlClick, x640 y820, %title%
	ControlClick, x670 y820, %title%
	ControlClick, x700 y820, %title%
	Return

active(){
	setControlDelay -1
	stop := False
	while(!stop){
		start := A_TickCount
		abilities_1()
		Sleep 500
		getClickables()
		Loop{
			now := A_TickCount-start
			ControlClick, x1250 y560, %title%
			if now > 902000
				Break
			Else
				Continue
		}
		abilities_2()
		Sleep 500
		levelUpHero(hX, "y770")	
		getClickables()
		Loop{
			now := A_TickCount-start
			ControlClick, x1250 y560, %title%
			if now > 1804000
				Break
			Else
				Continue
		}

	}
	Return
}

autoClicker(){
	stop := False
	while(!stop){
		ControlClick, x1250 y560, %title%
	}
	Return
}
	





abilities_1(){
	ControlSend,, {1 down}, %title%
	ControlSend,, {1 up}, %title%
	ControlSend,, {2 down}, %title%
	ControlSend,, {2 up}, %title%
	ControlSend,, {3 down}, %title%
	ControlSend,, {3 up}, %title%
	ControlSend,, {4 down}, %title%
	ControlSend,, {4 up}, %title%
	ControlSend,, {5 down}, %title%
	ControlSend,, {5 up}, %title%
	ControlSend,, {7 down}, %title%
	ControlSend,, {7 up}, %title%
	ControlSend,, {8 down}, %title%
	ControlSend,, {8 up}, %title%
	ControlSend,, {6 down}, %title%
	ControlSend,, {6 up}, %title%
	ControlSend,, {9 down}, %title%
	ControlSend,, {9 up}, %title%
	Return
}

abilities_2(){
	ControlSend,, {8 down}, %title%
	ControlSend,, {8 up}, %title%
	ControlSend,, {9 down}, %title%
	ControlSend,, {9 up}, %title%
	ControlSend,, {1 down}, %title%
	ControlSend,, {1 up}, %title%
	ControlSend,, {2 down}, %title%
	ControlSend,, {2 up}, %title%
	ControlSend,, {3 down}, %title%
	ControlSend,, {3 up}, %title%
	ControlSend,, {4 down}, %title%
	ControlSend,, {4 up}, %title%
	ControlSend,, {5 down}, %title%
	ControlSend,, {5 up}, %title%
	ControlSend,, {7 down}, %title%
	ControlSend,, {7 up}, %title%
	Return
}