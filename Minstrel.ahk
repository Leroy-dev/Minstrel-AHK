;Leroy Minstrel AHK Script
;Ingame AHK Keys
;	<			= 	Target pet
;	z			=	Charm pet
;	x			= 	Mezz
;	h			=	Healsong
;	Windowskey	= 	Pet aggressive
;	CAPSLOCK	=	Speed
;	CTRL+3		=	Sting + Basiliskfang backup || Amethyst Slash + Side Slicer
;	CTRL+4		=	Beartooth + Backup || Amethyst Slash + Back Slash
;	5			=	Speed to Stealth
;	CTRL		=	Switch to Weapon
;	MButton		=	DD charge
;	Mouse6		=	Healpot + Healcharge
;	Mouse7		=	Invig
;	G1			=	Twistmacro
;	G2			=	Pom
;	G3			=	Target Pet + Release
;	G4			=	Target Pet + Here
;	G5			=	Assist
;	G6			= 	Pet passive + follow
;	Numpad1		= 	Grouptarget 1
;	Numpad2		= 	Grouptarget 2
;	Numpad3		= 	Grouptarget 3
;	Numpad4		= 	Grouptarget 4
;	Numpad5		= 	Grouptarget 5
;	Numpad6		= 	Grouptarget 6
;	Numpad7		= 	Grouptarget 7
;	Numpad8		= 	Grouptarget 8

;Ingame Keys
; 	^(Tilde)	=	Draw weapon
;	ALT			= 	Attack target (Pet)
;	g			= 	Absorb
;	c			= 	Demezz
;	v			= 	Switch weapon 1 slot
;	b			=	Ranged slot
;	n			=	2hand slot
;	t			=	Sit Down
;	r			=	run
;	Insert		=	Pet passive
;	PageDown	=	Pet here
;	END			=	Pet follow
;	F1			=	Purge
;	F2			=	IP
;	F3			=	MOC
;	F4			=	SOS
;	F5			=	EM / RR5
;	1			=	DD1
;	2			=	DD2
;	3			=	Stun
;	4			=	Confuse
;	6			=	AOE Mezz
;	CTRL+1		= 	Tranquilize
;	CTRL+2		= 	Wyvernfang
;	XButton1	=	Reset Camera
;	XButton2	=	Autowalk

SetKeyDelay, 0
SetStoreCapsLockMode, Off

#SingleInstance
#InstallKeybdHook
#InstallMouseHook
Cursor =  %A_ScriptDir%\Arrow.cur
CursorHandle := DllCall("LoadCursorFromFile", Str, Cursor)
Cursors = 32512,32513,32514,32515,32516,32640,32641,32642,32643,32644,32645,32646,32648,32649,32650,32651
Loop, Parse, Cursors, `,
{
	DllCall( "SetSystemCursor", Uint, CursorHandle, Int, A_Loopfield )
}

;Variables
toggleLoop := 0

Gui Color, Green
Gui +E0x20 -Caption +LastFound +ToolWindow +AlwaysOnTop
WinSet, Transparent, 255
Gui Show, w8 h8 y1057
;Pause/Start Script
PrintScreen::
	Suspend, toggle
	
	scriptSuspend := !scriptSuspend
	Gui Hide
	if(scriptSuspend)
	{
		SPI_SETCURSORS := 0x57
		DllCall("SystemParametersInfo", UInt, SPI_SETCURSORS, UInt, 0, UInt, 0, UInt, 0 )
		Gui Color, Red
	}
	else
	{
		Cursor =  %A_ScriptDir%\Arrow.cur
		CursorHandle := DllCall("LoadCursorFromFile", Str, Cursor)
		Cursors = 32512,32513,32514,32515,32516,32640,32641,32642,32643,32644,32645,32646,32648,32649,32650,32651
		Loop, Parse, Cursors, `,
		{
			DllCall( "SetSystemCursor", Uint, CursorHandle, Int, A_Loopfield )
		}
		Gui Color, Green
	}
	Gui Show, w8 h8 y1057
	WinActivate, ahk_class DAoCMWC
return


;Start of the binds
#IfWinActive, ahk_class DAoCMWC
;Mezz
x::
	Send, {n}
	Sleep, 50
	Send, {CapsLock}	; Eden custom change. Drop speed to keep the charm pulse active
	Sleep, 50
	Send, {b}{x}		; Switch to Inst
	Send, {l}
	; b = Switch to Instrument
	; x = Flute Mezz
return

;Speed
CapsLock::
	Send, {b}			; Switch to Inst
	Send, {CapsLock}	; Double CapsLock to be sure the drum drums
	Sleep, 300			; Delay needed based on Server
	Send, {CapsLock}
	SetCapsLockState, Off
return

;Pet aggressive
LWin::
	Send, {Home}		; Pet aggressive Windows Key
return

;Switch to weapon
Ctrl::
	Send, {p}			; Switch to weapon
	;Send, {g}			; Abla
return

1::
	Send, {1}{ü}
return

2::
	Send, {2}{ü}
return

3::
	Send, {3}{ü}
return

4::
	Send, {4}{ü}
return

6::
	Send, {6}{l}
return

;
^1::
	;Send, {p}			; Switch to weapon
	Send, ^{1}
return

;
^2::
	;Send, {p}			; Switch to weapon
	Send, ^{2}
return

;Anytimer + Sidesnare
^3::
	Send, {p}			; Switch to weapon
	Send, ^{3}{o}		; Style in Quickbar + Anytimer
return

;Anytimer + Backsnare
^4::
	Send, {p}			; Switch to weapon
	Send, ^{4}{o}		; Style in Quickbar + Anytimer
return

;Speed to Stealth
5::
	Send, {CapsLock}	; Speed
	Sleep, 25
	Send, {5}			; Stealth
return

;Healsong
h::
	Send, {b}{h}{h}		; Switch to Inst + Healsong
return

;Demezz & Disease
C::
	Send, {c}{i}
	Send, {l}
return

;SOS - Switching to my 2-Hand and back to Harp to be sure that I don't hit anything
F4::
	Send, {n}{b}		; Switch to 2-Hand and to Harp
	Send, {F4}			; SOS
return

;Considering Target (just for Herald-Tool)
Tab::
	Send, {Tab}			; Switch to 2-Hand and to Harp
	Sleep, 25
	Send, {,}
return

;Group Target 1
Numpad1::
	Send, {LShift Down}
	Sleep, 25
	Send, {F1}
	Sleep, 25
	Send, {LShift Up}
return

;Group Target 2
Numpad2::
	Send, {LShift Down}
	Sleep, 25
	Send, {F2}
	Sleep, 25
	Send, {LShift Up}
return

;Group Target 3
Numpad3::
	Send, {LShift Down}
	Sleep, 25
	Send, {F3}
	Sleep, 25
	Send, {LShift Up}
return

;Group Target 4
Numpad4::
	Send, {LShift Down}
	Sleep, 25
	Send, {F4}
	Sleep, 25
	Send, {LShift Up}
return

;Group Target 5
Numpad5::
	Send, {LShift Down}
	Sleep, 25
	Send, {F5}
	Sleep, 25
	Send, {LShift Up}
return

;Group Target 6
Numpad6::
	Send, {LShift Down}
	Sleep, 25
	Send, {F6}
	Sleep, 25
	Send, {LShift Up}
return

;Group Target 7
Numpad7::
	Send, {LShift Down}
	Sleep, 25
	Send, {F7}
	Sleep, 25
	Send, {LShift Up}
return

;Group Target 8
Numpad8::
	Send, {LShift Down}
	Sleep, 25
	Send, {F8}
	Sleep, 25
	Send, {LShift Up}
return

;Disable Shift Modifier to make sure you don't switch Hotbar-Pages during gameplay
LShift & 1::return
LShift & 2::return
LShift & 3::return
LShift & 4::return
LShift & 5::return
LShift & 6::return
LShift & 7::return
LShift & 8::return
LShift & 9::return

Left::
	Send, {Left}{l}
return

;Mouse Button 6
PAUSE::
	Send, {UP}{RIGHT}		; Use Healpot & Healcahrge
return

;G1 Button | unimportant
F13::
	toggleLoop := !toggleLoop
    if (toggleLoop) {
        SetTimer, Timer_Twist, 10
    } else {
        SetTimer, Timer_Twist, Off
    }
return

;G2 Button | Power Song
F14::
	Send, {b}{j}{j}			; Switch to instrument and play song.
return

;G3 Button | Release Pet
F15::
	Send, {<}{DEL}			; Target Pet & Release
	;Send, {y} 				; Charm was needed on Phoenix because charm pulse dropped after release
return

;G4 Button | Here Pet
F16::
	Send, {INS}{PgDn}		; Pet Passive & here
return

;G5 Button | Assist Button
F17::
	Send, {k}{,} 			; Consider target with , for personal reasons.
return

;G6 Button | Pet follow
F18::
	Send, {INS}{END}		; Pet Passive & Pet Follow		
return

;G7 Button Charm pet out of spot without aggro 
F19::
	Send, {y}{o}{<}{DEL}
	;Charm, passive pet, target pet, release pet
return

;G2
F20::
	
return

;G5
F21::
	Send, {ß}
return

;G5
F22::
	Send, {´}
return

;G12 Button | Send pet to target
F24::
	Send, {INS}{PgUp}		; Pet Passive & Pet Go to Target
return

;Twist Macros
Stop_Timer_Twist:
	toggleLoop := 0
	SetTimer, Timer_Twist, Off
return
	
Timer_Twist:
	if (toggleLoop) {
		Send, {CAPSLOCK}	; cancle current speed if needed
		Sleep, 25
		Send, {CAPSLOCK}	; cancle current speed if needed
	}
	if (toggleLoop) {
		Send, {g}
	}
	if (toggleLoop) {
		Send, {<}			; Target Pet
	}
	
	loop, 100
	{
		if (toggleLoop) {
			Send, {y}		; Charm pet for 3 seconds
			Sleep, 1
		}
	}
		
	if (toggleLoop) {
		Sleep, 4000			; do 4 seconds nothing
	}
	if (toggleLoop) {
		Send, {<}			; Target Pet
	}
	loop, 100
	{
		if (toggleLoop) {
			Send, {y}		; Charm pet for 3 seconds
			Sleep, 1
		}
	}
return