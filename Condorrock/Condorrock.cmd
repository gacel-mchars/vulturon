[Remap]
x = c
y = x
z = y
a = a
b = b
c = z
s = s
; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
; 
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
; 
;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;-| Hold Button |----------------------------------------------------------
; Please define Anim 74140108 in your AIR file if AND ONLY IF you place these
; 7 Hold Button commands immediately after the 11 Single Button and Hold Dir
; commands at the very top of your CMD list, as demonstrated here.
; In this version of the AI code, these commands are only used by the XOR
; method, and thus are optional.  But there remains a possibility that a
; future version of the helper method might be helped by having these
; commands placed here, and Anim 74140108 would then be used to indicate
; that a partner character has a compatible CMD.

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_s"
command = /s
time = 1


;-| Super Motions |--------------------------------------------------------

;-| Special Motions |------------------------------------------------------

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery" ;Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+b
time = 1

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.  
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.

;===========================================================================
;---------------------------------------------------------------------------
[Statedef -1]
;===========================================================================
;---------------------------------------------------------------------------
; Run Fwd
;[State -1, Run Fwd]
;type = ChangeState
;value = 100
;trigger1 = command = "FF"
;trigger1 = statetype = S
;trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Back
;[State -1, Run Back]
;type = ChangeState
;value = 105
;trigger1 = command = "BB"
;trigger1 = statetype = S
;trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
; Jump
[State -1, State]
type = ChangeState
value = 55
triggerall = Var(20) >= 0
triggerall = command = "a"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 100

; Air Jump
[State -1, Fly]
type = ChangeState
value = 49
;triggerall = Var(2) = 0
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

; Air Jump
[State -1, State]
type = Null;ChangeState
value = 45
triggerall = Var(20) >= 0
triggerall = Var(5) <= 0
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = StateNo != [80,85]
trigger1 = ctrl

;---------------------------------------------------------------------------
; Air Jump
[State -1, Fly Ai]
type = ChangeState
value = 49
triggerall = AiLevel != 0
triggerall = command = "c" || command = "y"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Search Wave Ai
[State -1, Search Wave Ai]
type = ChangeState
value = 210
triggerall = AiLevel != 0
triggerall = command = "z"
triggerall = Var(1) >= 50
triggerall = power >= 500
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Enemy Wave Ai
[State -1, Enemy Wave Ai]
type = ChangeState
value = 610
triggerall = command = "z"
triggerall = Var(1) >= 50
triggerall = statetype = A
triggerall = ctrl
triggerall = numhelper(611) < 2 || numhelper(612) < 2 || numhelper(613) < 2
trigger1 = power >= var(6) + var(7) + var(8) * 200

;---------------------------------------------------------------------------
; Taunt
;[State -1, Taunt]
;type = ChangeState
;value = 195
;triggerall = command = "start"
;trigger1 = statetype != A
;trigger1 = ctrl

;---------------------------------------------------------------------------
; Sonic Boom
[State -1, Sonic Wave]
type = ChangeState
value = 200
triggerall = command = "b"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Sonic Wave
[State -1, Sonic Wave]
type = ChangeState
value = 201
triggerall = command = "b"
trigger1 = stateno = 200
trigger1 = AnimElem = 8, >= 0


;---------------------------------------------------------------------------
; Sonic Wave
[State -1, Sonic Wave]
type = ChangeState
value = 201
triggerall = command = "b"
trigger1 = stateno = 201
trigger1 = AnimElem = 4, >= 0
trigger1 = Var(4) < 2

;---------------------------------------------------------------------------
; Guitar Sword
[State -1, Guitar Sword]
type = ChangeState
value = 220
triggerall = command = "c"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Search Wave
[State -1, Search Wave]
type = ChangeState
value = 210
triggerall = command != "hold_b"
triggerall = Var(1) >= 50
triggerall = power >= 500
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Enemy Wave
[State -1, Enemy Wave]
type = ChangeState
value = 610
triggerall = command != "hold_b"
triggerall = Var(1) >= 50
triggerall = statetype = A
triggerall = ctrl
triggerall = numhelper(611) < 2 || numhelper(612) < 2 || numhelper(613) < 2
trigger1 = power >= var(6) + var(7) + var(8) * 200

;---------------------------------------------------------------------------
; Enemy Wave Var
[State -1, Enemy Wave Var]
type = VarSet
trigger1 = numhelper(611) != 2
var(6) = 1

; Enemy Wave Var
[State -1, Enemy Wave Var]
type = VarSet
trigger1 = numhelper(612) != 2
var(7) = 1

; Enemy Wave Var
[State -1, Enemy Wave Var]
type = VarSet
trigger1 = numhelper(613) != 2
var(8) = 1

;---------------------------------------------------------------------------
; Enemy Wave Var
[State -1, Enemy Wave Var]
type = VarSet
trigger1 = numhelper(611) = 2
var(6) = 0

; Enemy Wave Var
[State -1, Enemy Wave Var]
type = VarSet
trigger1 = numhelper(612) = 2
var(7) = 0

; Enemy Wave Var
[State -1, Enemy Wave Var]
type = VarSet
trigger1 = numhelper(613) = 2
var(8) = 0

;---------------------------------------------------------------------------
; Charge
[State -1, Charge]
type = PalFX
triggerall = AiLevel = 0
triggerall = Var(1) >= 50
trigger1 = TimeMod = 4,0
trigger1 = ctrl
time = 2
add = 0,0,250

[State -1, Charge]
type = VarAdd
trigger1 = command = "hold_b"
var(1) = 1

[State -1, Charge]
type = VarSet
trigger1 = command != "hold_b"
var(1) = 0

[State -1, Charge]
type = VarSet
triggerall = var(4) != 0
trigger1 = movetype != A
var(4) = 0

;---------------------------------------------------------------------------
; Sonic Wave
[State -1, Sonic Wave]
type = ChangeState
value = 600
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Sonic Wave
[State -1, Sonic Wave]
type = ChangeState
value = 601
triggerall = command = "b"
triggerall = prevstateno = 49
trigger1 = stateno = 600
trigger1 = AnimElem = 8, >= 0
trigger1 = statetype = A
triggerall = anim = 601

;---------------------------------------------------------------------------
; Sonic Wave
[State -1, Sonic Wave]
type = ChangeState
value = 601
triggerall = command = "b"
trigger1 = stateno = 601
trigger1 = AnimElem = 4, >= 0
trigger1 = statetype = A
trigger1 = Var(4) < 5

;---------------------------------------------------------------------------
; Warp
[State -1, Warp]
type = ChangeState
value = 400
triggerall = command = "x"; || command = "z"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Golem Transform
[State -1, Golem Transform]
type = ChangeState
value = 50010
triggerall = AiLevel = 0
triggerall = command = "y"
triggerall = command = "holdup"
triggerall = command != "holddown"
trigger1 = power >= 20
trigger1 = statetype != A
trigger1 = ctrl
ignorehitpause = 1

; Protectos Transform
[State -1, Protectos Transform]
type = ChangeState
value = 30003
triggerall = AiLevel = 0
triggerall = command = "y"
triggerall = command != "holdup"
triggerall = command != "holddown"
trigger1 = power >= 20
trigger1 = statetype != A
trigger1 = ctrl
ignorehitpause = 1

; Bifrost Transform
[State -1, Bifrost Transform]
type = ChangeState
value = 10002
triggerall = AiLevel = 0
triggerall = command = "y"
triggerall = command != "holdup"
triggerall = command = "holddown"
trigger1 = power >= 20
trigger1 = statetype != A
trigger1 = ctrl
ignorehitpause = 1
;persistent = 1

;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; Sonic Wave
[State -1, Sonic Wave AI]
type = ChangeState
value = 600
triggerall = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
triggerall = AiLevel != 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------




