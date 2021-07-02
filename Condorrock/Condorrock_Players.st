;--------------------------------------------------------------------------

;--------------------
; Enemy Helpers File
;--------------------

;---------------------------------------------------------------------------
; Bifrost Stand
[Statedef 10000]
type = S
physics = S
movetype = A
sprpriority = 0
anim = 10000
ctrl = 0

[State -2]
Type = Helper
Triggerall = NumHelper(11777) = 0 ; Create the superarmor helper if it doesn't exist.
Trigger1 = Time = 0
OwnPal = 1
PosType = P1
Pos = 0, 0
ID = 11777
StateNo = 11777
PauseMoveTime = 999999
SuperMoveTime = 999999
Name = "SuperArmor"

[State 0, PowerAdd]
type = PowerAdd
trigger1 = GameTime%4 = 0
value = -2

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
value2 = S,NA
time = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, HitDef]
type = HitDef
trigger1 = GameTime%60 = 0;timemod = 60,0
attr = S, NA
damage = 50, 0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = Ifelse(Var(55) > 0, 2, 5), Ifelse(Var(55) > 0, 2, 5)
sparkno = 0
sparkxy = ceil(-10 * Const(size.xscale)), ceil(-20 * Const(size.yscale))
ground.type = Low
ground.slidetime = 10
ground.hittime = 10
ground.velocity = -5
airguard.velocity = -2,-1
air.type = Low
air.velocity = -3,-2
air.hittime = 10

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Command = "y"
value = 10003

[State 0, ChangeState]
type = ChangeState
trigger1 = Power = 0
value = 10003

[State 0, ChangeState]
type = ChangeState
trigger1 = RoundState != 2
value = 10003

[State 0, Turn]
type = Turn
trigger1 = command = "holdback"

[State 0, ChangeState]
type = ChangeState
trigger1 = command = "holdfwd"
value = 10001

;---------------------------------------------------------------------------
; Bifrost Walk
[Statedef 10001]
type = S
physics = S
movetype = A
sprpriority = 0
anim = 10001
ctrl = 0

[State 20, PowerAdd]
type = PowerAdd
trigger1 = GameTime%4 = 0
value = -2

[State 20, ChangeState]
type = ChangeState
trigger1 = Power = 0
value = 10000

[State 20, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
value2 = S,NA
time = 1

[State 20, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 20, HitDef]
type = HitDef
trigger1 = GameTime%60 = 0;timemod = 60,0
attr = S, NA
damage = 50, 0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = Ifelse(Var(55) > 0, 2, 5), Ifelse(Var(55) > 0, 2, 5)
sparkno = 0
sparkxy = ceil(-10 * Const(size.xscale)), ceil(-20 * Const(size.yscale))
ground.type = Low
ground.slidetime = 10
ground.hittime = 10
ground.velocity = -5
airguard.velocity = -2,-1
air.type = Low
air.velocity = -3,-2
air.hittime = 10

[State 20, EnvShake]
type = EnvShake
trigger1 = AnimElem = 5 || AnimElem = 9
time = 15
freq = 60
ampl = -4
phase = 90

[State 20, VelSet]
type = VelSet
trigger1 = AnimElem = 4 || AnimElem = 8
x = 4

[State 20, VelSet]
type = VelSet
trigger1 = AnimElem != 4 && AnimElem != 8
x = 0

[State 20, ChangeState]
type = ChangeState
trigger1 = command != "holdfwd"
value = 10000

;---------------------------------------------------------------------------
; Bifrost Transform
[Statedef 10002]
type = S
physics = S
sprpriority = 0
anim = 10002
ctrl = 0

[State 10002, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 0,11
channel = -1

;;----- Explode Flash -----
;[State 5155, VarSet]
;type = VarSet
;;trigger1 = Time <= 0
;trigger2 = Var(3) < 0
;var(3) = 0

;[State 5155, VarAdd]
;type = VarAdd
;trigger1 = Var(3) < 250
;trigger1 = Time > 50
;trigger1 = Time%4 = 0;TimeMod = 4,0;
;var(3) = 10

;[State 5155, VarAdd]
;type = VarAdd
;triggerall = Var(3) > 0
;trigger1 = Time > 50
;trigger1 = Time%8 = 0;TimeMod = 8,0;
;var(3) = -10

;[State 5155, PalFX]
;type = AllPalFX
;trigger1 = Time > 50
;time = 1
;add = Var(3),Var(3),Var(3)
;-------------------------

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 10000

;---------------------------------------------------------------------------
; Bifrost Detransform
[Statedef 10003]
type = S
physics = S
sprpriority = 0
anim = 10003
ctrl = 0

[State 10003, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 0,18
channel = -1

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------------------------------------------
; Axeloid Generate
[Statedef 20000]
type = S
physics = S
sprpriority = 0
anim = 9999
velset = 0,0

[State 2000, Mallroid Life]
type = VarSet
trigger1 = Time = 0
v = 1
value = 150

[State 20000, Helper]
type = Helper
trigger1 = Time = 0
helpertype = normal
name = "Mallroid SuperArmor"
ID = 20008
stateno = 20008
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 0
;ontop = 1

[State 613, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 613, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 71120]
type = Explod
trigger1 = time = [0,10]
trigger1 = timemod = 3,0
anim = 6000
pos = (-1)**(random%2)*(random%10),-(random%20)-0
postype = p1
ontop=1
ownpal = 1
removetime =21
;shadow=-1,-1,-1

[State 210, 1]
type = PlaySnd
trigger1 = time = 0
value = 20,0

[State 1073,2]
type = ChangeState
trigger1 = time = 5
value = 20001

;--------------------------------------------------------------------------
; Axeloid Stand
[Statedef 20001]
type = S
physics = S
sprpriority = 0
anim = 7000;614
velset = 0,0

[State 614, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 20000, NotHitBy]
type = NotHitBy
trigger1 = Var(2) < Var(1)
value = SCA
time = 1

[State 614, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1

[State 614]
type = HitOverride
trigger1 = Var(2) >= Var(1)
attr = sca,aa,ap,at
stateno = 20005
time = -1

[State 20000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 614, Turn]
type = Turn
trigger1 = P2Dist x<=-10

[State end]
type = ChangeState
trigger1 = Lose=1
trigger2 = DrawGame=1
value = 20005

[State 614, 2]
type = ChangeState
triggerall = RoundState = 2
trigger1 = P2BodyDist X > 32
triggerall = AnimTime = 0
value = 20002

[State 614, 2]
type = ChangeState
triggerall = RoundState = 2
triggerall = AnimTime = 0
trigger1 = P2BodyDist X <= 32
trigger1 = P2Dist Y <= -45
value = 20002

[State 614, 2]
type = ChangeState
triggerall = RoundState = 2
triggerall = AnimTime = 0
trigger1 = P2BodyDist X <= 32
trigger1 = P2Dist Y >= -45
value = 20003

[State 20000, PalFXWiz]
type = PalFX
trigger1 = Var(3) = 1
time = 10
add = 100,100,100
mul = 256,256,256
sinadd = -80,-80,-80,5
invertall = 0
color = 256

;--------------------------------------------------------------------------
; Axeloid Walk
[Statedef 20002]
type = S
physics = S
sprpriority = 0
anim = 7001;615

[State 615, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 20000, NotHitBy]
type = NotHitBy
trigger1 = Var(2) < Var(1)
value = SCA
time = 1

[State 615, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1

[State 615]
type = HitOverride
trigger1 = Var(2) >= Var(1)
attr = sca,aa,ap,at
stateno = 20005
time = -1

[State 20, VelSet]
type = VelSet
trigger1 = AnimElem = 1, >= 0
trigger1 = AnimElem = 4, < 0
trigger2 = AnimElem = 5, >= 0
trigger2 = AnimElem = 9, < 0
x = 1	

[State 20, VelSet]
type = VelSet
trigger1 = AnimElem = 9, >= 0
trigger1 = AnimElem = 10, < 0
trigger2 = AnimElem = 4, >= 0
trigger2 = AnimElem = 5, < 0
x = 0

[State 615, VelSet]
type = Null;VelSet
trigger1 = 1
trigger1 = AnimElem != 1
trigger1 = AnimElem != 5
x = 1

[State 615, VelSet]
type = Null;VelSet
trigger1 = AnimElem = 1
trigger1 = AnimElem = 5
x = 0

[State 614, 2]
type = ChangeState
trigger1 = RoundState != 2
value = 20000

[State end]
type = ChangeState
trigger1 = Lose=1
trigger2 = DrawGame=1
value = 20005

[State 615]
type = ChangeState
triggerall = P2Dist Y >= -45
trigger1 = P2BodyDist X < 32
trigger2 = P2BodyDist X <= -10
value = 20001

[State 615]
type = ChangeState
triggerall = P2Dist Y <= -45
trigger1 = P2BodyDist X <= -25
value = 20001

[State 20000, PalFXWiz]
type = PalFX
trigger1 = Var(3) = 1
time = 10
add = 100,100,100
mul = 256,256,256
sinadd = -80,-80,-80,5
invertall = 0
color = 256

;--------------------------------------------------------------------------
; Axeloid Atack
[Statedef 20003]
type = S
movetype = A
physics = S
sprpriority = 0
anim = 7002;616
velset = 0,0

[State 616, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 20000, NotHitBy]
type = NotHitBy
trigger1 = Var(2) < Var(1)
value = SCA
time = 1

[State 616, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1

[State 616]
type = HitOverride
trigger1 = Var(2) >= Var(1)
attr = sca,aa,ap,at
stateno = 20005
time = -1

[State 616]
type = HitDef
trigger1 = Time <= 0
attr = S, NA
damage = 20, 0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = Ifelse(Var(55) > 0, 2, 5), Ifelse(Var(55) > 0, 2, 5)
sparkno = 0
sparkxy = ceil(-10 * Const(size.xscale)), ceil(-20 * Const(size.yscale))
ground.type = Low
ground.slidetime = 10
ground.hittime = 10
ground.velocity = -5
airguard.velocity = -2,-1
air.type = Low
air.velocity = -3,-2
air.hittime = 10

[State end]
type = ChangeState
trigger1=Lose=1
trigger2 =DrawGame=1
value = 20005

[State 616, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 20001

[State 20000, PalFXWiz]
type = PalFX
trigger1 = Var(3) = 1
time = 10
add = 100,100,100
mul = 256,256,256
sinadd = -80,-80,-80,5
invertall = 0
color = 256

;--------------------------------------------------------------------------
; Axeloid Hit [Unused]
[Statedef 20004]
type = S
movetype = H
physics = S
sprpriority = 0
anim = 7000;614
velset = 0,0

[State 614]
type = HitOverride
trigger1 = 1
attr = sca,aa,ap,at
stateno = 20004
time = -1

[State 617, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 210, 1]
type = PlaySnd
trigger1 = time = 0
value = 20,0
channel = -1

[State 617, VarSet]
type = VarAdd
trigger1 = Time = 0
var(2) = GetHitVar(Damage)

[State 617, ª¦À??V]
type = PlayerPush
trigger1 = 1
value = 0

[State 617]
type = ChangeState
triggerall = Var(2) >= 150
trigger1 = Time >= 0
value = 20005

[State 617]
type = ChangeState
triggerall = Var(2) < 150
trigger1 = Time >= 1
value = 20001

[State 20004, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;--------------------------------------------------------------------------
; Axeloid Dead
[Statedef 20005]
type = S
movetype = H
physics = S
sprpriority = 0
anim = 9999

[State 618, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 71120]
type = Explod
trigger1 = time = [0,10]
trigger1 = timemod = 3,0
anim = 6000
pos = (-5)**(random%2)*(random%10),-(random%20)-0
postype = p1
ontop=1
ownpal = 1
removetime =21
;shadow=-1,-1,-1

[State 1073,2]
type = DestroySelf
trigger1 = time >= 15

;---------------------------------------------------------------------------
; Axeloid SuperArmor
[StateDef 20008]
Type = S
Physics = N
ctrl = 0
anim = 7008
sprpriority = 0

[State 6965]
Type = Assertspecial ; Invisible
Trigger1 = 1
flag = invisible
flag2 = noshadow
ignorehitpause = 1

[State 20008, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
stateno = 20008
time = 1

[State 6965, BindToRoot]
Type = BindToParent
Trigger1 = 1
Time = 1
Facing = 1
Pos = 0, 0
ignorehitpause=1

[State 6966, ParentVarAdd]
Type = ParentVarAdd
Trigger1 = Time = 0
V = 2
Value = GetHitVar(damage)
ignorehitpause=1

[State 6966, ParentVarAdd]
Type = Hitfallset
TrigGer1 = 1
value = 0

;-----------------------
[State 20008, ParentVarSet]
type = ParentVarSet
trigger1 = Time = 0
v = 3
value = 1

[State 20008, ParentVarSet]
type = ParentVarSet
triggerall = Time >= 1
trigger1 = Parent, Var(3) = 1
trigger2 = Parent, Var(3) != 0
v = 3
value = 0

;-----------------------

[State 6965, DestroySelf]
Type = DestroySelf
Trigger1 = Parent,StateNo = 20005
;Trigger2 = Parent,Var(2) >= Parent,Var(1)
ignorehitpause = 1
;--------------------------------------------------------------------------
; Golem Stand
[Statedef 50000]
type = S
physics = S
movetype = A
sprpriority = 0
;anim = 50000
ctrl = 0

[State 50000, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 50000
value = 50000
ignorehitpause = 1

[State 50000]
Type = Helper
Triggerall = NumHelper(50050) = 0 
Trigger1 = Time = 0
OwnPal = 1
PosType = P1
Pos = 0, 0
ID = 50050
StateNo = 50050
Name = "Arm"

[State 50000]
Type = Helper
Triggerall = NumHelper(50055) = 0 
Trigger1 = Time = 0
OwnPal = 1
PosType = P1
Pos = 0, 0
ID = 50055
StateNo = 50055
Name = "Arm"

[State -2]
Type = Helper
Triggerall = NumHelper(11777) = 0 ; Create the superarmor helper if it doesn't exist.
Trigger1 = Time = 0
OwnPal = 1
PosType = P1
Pos = 0, 0
ID = 11777
StateNo = 11777
PauseMoveTime = 999999
SuperMoveTime = 999999
Name = "SuperArmor"

[State 0, PowerAdd]
type = PowerAdd
trigger1 = GameTime%4 = 0
value = -2

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
value2 = S,NA
time = 1

[State 0, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 0, HitDef]
type = HitDef
trigger1 = GameTime%60 = 0;timemod = 60,0
attr = S, NA
damage = 50, 0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = Ifelse(Var(55) > 0, 2, 5), Ifelse(Var(55) > 0, 2, 5)
sparkno = 0
sparkxy = ceil(-10 * Const(size.xscale)), ceil(-20 * Const(size.yscale))
ground.type = Low
ground.slidetime = 10
ground.hittime = 10
ground.velocity = -5
airguard.velocity = -2,-1
air.type = Low
air.velocity = -3,-2
air.hittime = 10

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = Command = "y"
value = 50011

[State 0, ChangeState]
type = ChangeState
trigger1 = Power = 0
value = 50011

[State 0, ChangeState]
type = ChangeState
trigger1 = RoundState != 2
value = 50011

[State 0, Turn]
type = Turn
trigger1 = command = "holdback"

[State 0, ChangeState]
type = ChangeState
trigger1 = command = "holdfwd"
value = 50001

;---------------------------------------------------------------------------
; Golem Walk
[Statedef 50001]
type = S
physics = S
movetype = A
sprpriority = 0
;anim = 50001
ctrl = 0

[State 50000, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 50000
value = 50000
ignorehitpause = 1

[State 20, PowerAdd]
type = PowerAdd
trigger1 = GameTime%4 = 0
value = -2

[State 20, ChangeState]
type = ChangeState
trigger1 = Power = 0
value = 50011

[State 20, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
value2 = S,NA
time = 1

[State 20, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 20, HitDef]
type = HitDef
trigger1 = GameTime%60 = 0;timemod = 60,0
attr = S, NA
damage = 50, 0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = Ifelse(Var(55) > 0, 2, 5), Ifelse(Var(55) > 0, 2, 5)
sparkno = 0
sparkxy = ceil(-10 * Const(size.xscale)), ceil(-20 * Const(size.yscale))
ground.type = Low
ground.slidetime = 10
ground.hittime = 10
ground.velocity = -5
airguard.velocity = -2,-1
air.type = Low
air.velocity = -3,-2
air.hittime = 10

[State 20, VelSet]
type = VelSet
trigger1 = 1
x = 2.5

[State 20, Explod]
type = Explod
triggerall = Anim = 50001
triggerall = AnimElem = 4, >= 0
trigger1 = NumExplod(50100) = 0
anim = 50100
ID = 50100
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
sprpriority = 0

[State 20, RemoveExplod]
type = RemoveExplod
triggerall = Anim = 50001
trigger1 = command != "holdfwd" 
id = 50100

[State 20, ChangeState]
type = ChangeState
trigger1 = command != "holdfwd"
value = 50002

;---------------------------------------------------------------------------
; Golem Stop
[Statedef 50002]
type = S
physics = S
movetype = A
sprpriority = 0
;anim = 50002
ctrl = 1

[State 50000, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 50000
value = 50000
ignorehitpause = 1

[State 20, Turn]
type = Turn
triggerall = Anim = 50002
triggerall = AnimElem = 3, >= 1
trigger1 = command = "holdback"

[State 20, ChangeState]
type = ChangeState
triggerall = Anim = 50002
triggerall = AnimElem = 3, >= 1
trigger1 = command = "holdfwd"
value = 50001

[State 20, PowerAdd]
type = PowerAdd
trigger1 = GameTime%4 = 0
value = -2

[State 20, ChangeState]
type = ChangeState
trigger1 = Power = 0
value = 50011

[State 20, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
value2 = S,NA
time = 1

[State 20, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 20, HitDef]
type = HitDef
trigger1 = GameTime%60 = 0;timemod = 60,0
attr = S, NA
damage = 50, 0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = Ifelse(Var(55) > 0, 2, 5), Ifelse(Var(55) > 0, 2, 5)
sparkno = 0
sparkxy = ceil(-10 * Const(size.xscale)), ceil(-20 * Const(size.yscale))
ground.type = Low
ground.slidetime = 10
ground.hittime = 10
ground.velocity = -5
airguard.velocity = -2,-1
air.type = Low
air.velocity = -3,-2
air.hittime = 10

[State 20, VelSet]
type = VelSet
trigger1 = 1
x = 1

[State 20, ChangeState]
type = ChangeState
triggerall = Anim = 50002
trigger1 = AnimTime = 0
value = 50000

[State 20, ChangeState]
type = ChangeState
trigger1 = Anim = 50000
value = 50000

;---------------------------------------------------------------------------
; Golem Transform
[Statedef 50010]
type = S
physics = S
sprpriority = 0
anim = 50080
ctrl = 0

[State 10002, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 0,11
channel = -1

;;----- Explode Flash -----
;[State 5155, VarSet]
;type = VarSet
;;trigger1 = Time <= 0
;trigger2 = Var(3) < 0
;var(3) = 0

;[State 5155, VarAdd]
;type = VarAdd
;trigger1 = Var(3) < 250
;trigger1 = Time > 50
;trigger1 = Time%4 = 0;TimeMod = 4,0;
;var(3) = 10

;[State 5155, VarAdd]
;type = VarAdd
;triggerall = Var(3) > 0
;trigger1 = Time > 50
;trigger1 = Time%8 = 0;TimeMod = 8,0;
;var(3) = -10

;[State 5155, PalFX]
;type = AllPalFX
;trigger1 = Time > 50
;time = 1
;add = Var(3),Var(3),Var(3)
;-------------------------

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 50011, PosSet]
type = PosAdd
trigger1 = AnimTime = 0
y = -4

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 50000

;---------------------------------------------------------------------------
; Golem Detransform
[Statedef 50011]
type = S
physics = S
sprpriority = 0
anim = 50081
ctrl = 0

[State 50011, PosSet]
type = PosAdd
trigger1 = Time = 0
y = 4

[State 50011, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 6
value = 0,18
channel = -1

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Golem Arm
[Statedef 50050]
type = S
physics = S
sprpriority = 5
anim = 50050

[State 50050, BindToRoot]
type = BindToRoot
trigger1 = Root,Anim = 50000
time = 1
facing = 1
pos = 0,0

[State 50050, BindToRoot]
type = BindToRoot
trigger1 = Root,Anim = 50001
trigger2 = Root,Anim = 50002
time = 1
facing = 1
pos = 6,0

;[State 50050, VarSet]
;type = VarSet
;trigger1 = Var(0) != AnimElemNo(0)
;var(0) = AnimElemNo(0)

[State 50050, ChangeAnim]
type = Null;ChangeAnim
triggerall = Anim != 50050
trigger1 = Root,Stateno = 50000
value = 50050
elem = AnimElemNo(0)

[State 50050, ChangeAnim]
type = Null;ChangeAnim
triggerall = Anim != 50052
trigger1 = Root,Stateno = 50001
trigger2 = Root,Stateno = 50002
value = 50052
elem = AnimElemNo(0)

[State 50050, DestroySelf]
type = DestroySelf
Trigger1 = Root,StateNo != 50000 && Root,StateNo != 50001 && Root,StateNo != 50002 

;---------------------------------------------------------------------------
; Golem Arm
[Statedef 50055]
type = S
physics = S
sprpriority = -5
anim = 50051

[State 50050, BindToRoot]
type = BindToRoot
trigger1 = Root,Stateno = 50000
time = 1
facing = 1
pos = 0,0

[State 50050, BindToRoot]
type = BindToRoot
trigger1 = Root,Stateno = 50001
trigger2 = Root,Stateno = 50002
time = 1
facing = 1
pos = 3,0

[State 50050, ChangeAnim]
type = Null;ChangeAnim
triggerall = Anim != 50051
trigger1 = Root,Stateno = 50000
value = 50051
elem = AnimElemNo(0)

[State 50050, ChangeAnim]
type = Null;ChangeAnim
triggerall = Anim != 50053
trigger1 = Root,Stateno = 50001
trigger2 = Root,Stateno = 50002
value = 50053
elem = AnimElemNo(0)

[State 50050, DestroySelf]
type = DestroySelf
Trigger1 = Root,StateNo != 50000 && Root,StateNo != 50001 && Root,StateNo != 50002 

;---------------------------------------------------------------------------

;--------------------------------------------------------------------------
;---------------------- Integer variable list ----------------------

; var(0):= 9005151 - Player Death KO, 5156 - CPU Death KO
; var(1):= -1
; var(2):= 20004 - Mallroid Hit
; var(3):= 5151 - Player Death KO
; var(4):= 0 - Stand, 201 - Guitar
; var(5):= -3
;var(29):= -3
;var(46):= -2 - States that are always executed (use statedef -2)

;---------------------- Float variable list ----------------------

; fvar(0):= 7020 - Death KO Explosion
; fvar(1):= 7020 - Death KO Explosion
; fvar(2):= 7020 - Death KO Explosion
; fvar(3):= 7020 - Death KO Explosion
; fvar(4):= 7020 - Death KO Explosion
;fvar(29):= 11777 - SuperArmor


;--------------------------------------------------------------------------

;---------------------------------------------------------------------------
; Protectos Stand
[Statedef 30000]
type = S
physics = S
movetype = A
anim = 30000
ctrl = 0

[State 0, PowerAdd]
type = PowerAdd
trigger1 = GameTime%4 = 0
value = -2

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
value2 = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
triggerall = Vel X != 0
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

;-----------------------
[State 0, ChangeState]
type = ChangeState
trigger1 = Command = "y"
value = 30004

[State 0, ChangeState]
type = ChangeState
trigger1 = Power = 0
value = 30004

[State 0, ChangeState]
type = ChangeState
trigger1 = RoundState != 2
value = 30004

[State 0, ChangeState]
type = ChangeState
trigger1 = Command = "a" || Command = "b"
value = 30002

[State 0, Turn]
type = Turn
trigger1 = command = "holdback"

[State 0, ChangeState]
type = ChangeState
trigger1 = command = "holdfwd"
value = 30001


;-----------------------
[State 0, Helper]
Type = Helper
Triggerall = NumHelper(11777) = 0 ; Create the superarmor helper if it doesn't exist.
Trigger1 = Time = 0
OwnPal = 1
PosType = P1
Pos = 0, 0
ID = 11777
StateNo = 11777
PauseMoveTime = 999999
SuperMoveTime = 999999
Name = "SuperArmor"

;-----------------------
[State 20, HitDef]
type = HitDef
trigger1 = GameTime%60 = 0
attr = S, SP
damage = 30, 0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 0,0
sparkno = 9999
sparkxy = 0,0
hitsound = 9999, 0
guardsound = 9999, 0
ground.type = Low
ground.slidetime = 10
ground.hittime = 5
ground.velocity = -6
airguard.velocity = -2,-1
air.type = Low
air.velocity = -3,-2
air.hittime = 5

;---------------------------------------------------------------------------
; Protectos Walk
[Statedef 30001]
type = S
physics = S
movetype = A
anim = 30001
ctrl = 0

[State 20, PowerAdd]
type = PowerAdd
trigger1 = GameTime%4 = 0
value = -2

[State 20, ChangeState]
type = ChangeState
trigger1 = Power = 0
value = 10000

[State 20, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
value2 = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 20, VelSet]
type = VelSet
triggerall = Vel X != 1
trigger1 = AnimElem = 1, >= 0
trigger1 = AnimElem = 4, < 0
trigger2 = AnimElem = 5, >= 0
trigger2 = AnimElem = 8, < 0
x = 1	

[State 20, VelSet]
type = VelSet
triggerall = Vel X != 0
trigger1 = AnimElem = 4, >= 0
trigger1 = AnimElem = 5, < 0
trigger2 = AnimElem = 8, >= 0
trigger2 = AnimElem = 9, < 0
x = 0

[State 10002, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 8
value = 0,2
channel = -1

[State 20, ChangeState]
type = ChangeState
trigger1 = command != "holdfwd"
value = 30000

;-----------------------
[State 0, ChangeState]
type = ChangeState
trigger1 = Power = 0
value = 30004

[State 0, ChangeState]
type = ChangeState
trigger1 = RoundState != 2
value = 30004

;-----------------------
[State 20, HitDef]
type = HitDef
trigger1 = GameTime%60 = 0
attr = S, SP
damage = 30, 0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 0,0
sparkno = 9999
sparkxy = 0,0
hitsound = 9999, 0
guardsound = 9999, 0
ground.type = Low
ground.slidetime = 5
ground.hittime = 5
ground.velocity = -6
airguard.velocity = -2,-1
air.type = Low
air.velocity = -3,-2
air.hittime = 5

;---------------------------------------------------------------------------
; Protectos Atack
[Statedef 30002]
type = S
physics = S
movetype = A
anim = 30002
ctrl = 0

[State 30003, PowerAdd]
type = PowerAdd
trigger1 = GameTime%4 = 0
value = -2

[State 30003, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
value2 = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

[State 10002, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 9
value = 0,12
channel = -1

[State 30003, Helper]
type = Helper
trigger1 = AnimElem = 10
helpertype = normal
name = "Shoot"
ID = 30010
stateno = 30010
pos = 21,-21
postype = p1
facing = 1

[State 30003, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 30000

;-----------------------
[State 200, HitDef]
type = HitDef
trigger1 = GameTime%60 = 0
attr = S, SP
damage = 30, 0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 0,0
sparkno = 9999
sparkxy = 0,0
hitsound = 9999, 0
guardsound = 9999, 0
ground.type = Low
ground.slidetime = 10
ground.hittime = 5
ground.velocity = -6
airguard.velocity = -2,-1
air.type = Low
air.velocity = -3,-2
air.hittime = 5

;---------------------------------------------------------------------------
; Charged Medium Shot
[Statedef 30010]
type = A
movetype = A
physics = N
sprpriority = 15
juggle = 10
anim = 30010
ctrl = 0

[State 320, VelSet]
type = VelSet
trigger1 = Time = 0
ignorehitpause = 1
x = 1

[State 211, VelMul]
type = VelMul
trigger1 = Vel x < 5
x = 1.05
ignorehitpause = 1

[State 320, 2]
type = HitDef
trigger1 = Time <= 0
attr = A, SP
damage = 60, 0
animtype = Medium
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 1,5
sparkno = 1
sparkxy = 0,0
hitsound = 5, 1
guardsound = 5, 0
ground.type = Low
ground.slidetime = 15
ground.hittime = 15
ground.velocity = -8
airguard.velocity = -3,-2
air.type = Low
air.velocity = -4,-2
air.hittime = 15

[State 211, VelSet]
type = VelSet
trigger1 = var(10) = 0
trigger1 = movecontact
x = 0
y = -5
ignorehitpause = 1

[State 211, VarSet]
type = VarSet
trigger1 = var(10) = 0
trigger1 = movecontact
v = 10
value = 1
ignorehitpause = 1

[State 211, Gravity]
type = Gravity
trigger1 = var(10) != 0

[State 211, AngleAdd]
type = AngleAdd
trigger1 = var(10) != 0
value = 15

[State 211, AngleDraw]
type = AngleDraw
trigger1 = 1
ignorehitpause = 1

[State 320, Destroy]
type = DestroySelf
trigger1 = BackEdgeBodyDist <= -1000
trigger2 = FrontEdgeBodyDist <= -100
trigger3 = Pos Y >= 0 && var(10)

;---------------------------------------------------------------------------
; Protectos Transform
[Statedef 30003]
type = S
physics = S
sprpriority = 0
anim = 30003
ctrl = 0

[State 10002, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 5
value = 0,18
channel = -1

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 30000

;---------------------------------------------------------------------------
; Protectos Detransform
[Statedef 30004]
type = S
physics = S
sprpriority = 0
anim = 30004
ctrl = 0

[State 10002, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 1
value = 0,18
channel = -1

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------------------------------------------
; Funky Junk Generate
[Statedef 40010]
type = S
physics = S
sprpriority = 0
velset = 0,0

[State -3, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 40005
value = 40005

[State -3, Turn]
type = Turn
trigger1 = P2BodyDist X <= -10

[State 4000, ChangeState]
type = ChangeState
triggerall = Anim = 40005
trigger1 = AnimTime = 0
value = 40000

;-----------------------
[State -3, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State -3, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
stateno = 40010
time = -1

;--------------------------------------------------------------------------
; Funky Junk Stand
[Statedef 40000]
type = S
physics = S
movetype = A
sprpriority = 0
velset = 0,0

[State -3, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 40000
value = 40000

[State 0, Turn]
type = Turn
trigger1 = P2BodyDist X <= -10

[State 0, ChangeState]
type = ChangeState
triggerall = RoundState = 2
triggerall = Time >= 3
trigger1 = P2BodyDist X > 8
trigger1 = P2Dist Y >= -40
value = 40001

[State 0, ChangeState]
type = ChangeState
triggerall = RoundState = 2
triggerall = Time >= 3
trigger1 = P2BodyDist X > -35
trigger1 = P2Dist Y < -40
value = 40001

;-----------------------
[State -3, HitDef]
type = HitDef
trigger1 = GameTime%60 = 0
attr = S, NA
damage = 15, 0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 0,0
sparkno = 99999
sparkxy = 0,0
ground.type = Low
ground.slidetime = 10
ground.hittime = 10
ground.velocity = -5
airguard.velocity = -2,-1
air.type = Low
air.velocity = -3,-2
air.hittime = 10

;-----------------------
[State -3, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State -3, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1

[State -3, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
stateno = 40005
time = -1

;[State -3, Hit]
;type = ChangeState
;trigger1 = MoveHit
;value = 40002

[State -3, Lose]
type = ChangeState
trigger1 = Lose=1
trigger2 = DrawGame=1
value = 40006

;--------------------------------------------------------------------------
; Funky Junk Walk
[Statedef 40001]
type = S
physics = S
movetype = A
sprpriority = 0

[State -3, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 40000
value = 40000

[State 20, VelSet]
type = VelSet
trigger1 = Vel X != 1
x = 1.25	

[State 615]
type = ChangeState
triggerall = P2Dist Y >= -40
trigger1 = P2BodyDist X = [-9,8]
trigger2 = P2BodyDist X <= -10
value = 40000

[State 615]
type = ChangeState
triggerall = P2Dist Y <= -40
trigger1 = P2BodyDist X <= -35
value = 40000

;-----------------------
[State -3, HitDef]
type = HitDef
trigger1 = GameTime%60 = 0
attr = S, NA
damage = 15, 0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 0,0
sparkno = 99999
sparkxy = 0,0
ground.type = Low
ground.slidetime = 10
ground.hittime = 10
ground.velocity = -5
airguard.velocity = -2,-1
air.type = Low
air.velocity = -3,-2
air.hittime = 10

;-----------------------
[State -3, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State -3, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1

[State -3, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
stateno = 40006
time = -1

;[State -3, Hit]
;type = ChangeState
;trigger1 = MoveHit
;value = 40002

[State -3, Lose]
type = ChangeState
trigger1 = Lose=1
trigger2 = DrawGame=1
value = 40002

;--------------------------------------------------------------------------
; Funky Junk Atack
[Statedef 40002]
type = S
physics = S
sprpriority = 0
velset = 0,0

[State -3, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 40000
value = 40000

[State 4000, Lose]
type = ChangeState
trigger1 = Time >= 2
value = 40000

;-----------------------
[State -3, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State -3, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 1

[State -3, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
stateno = 40005
time = -1

[State -3, Lose]
type = ChangeState
trigger1 = Lose=1
trigger2 = DrawGame=1
value = 40006

;--------------------------------------------------------------------------
; Funky Junk Hit
[Statedef 40005]
type = S
movetype = H
physics = S
sprpriority = 0
anim = 40001
velset = 0,0

[State 4000, VarSet]
type = VarSet
trigger1 = Time = 0
fv = 0
value = GetHitVar(hittime)*2

[State 4000, VarSet]
type = VarAdd
trigger1 = Time = 0
var(0) = GetHitVar(Damage)

[State 4000]
type = ChangeState
triggerall = Var(0) >= 100
trigger1 = Time >= FVar(0)
value = 40006

[State 4000]
type = ChangeState
triggerall = Var(0) < 100
trigger1 = Time >= FVar(0)
value = 40000

;-----------------------
[State -3, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State -3, HitOverride]
type = HitOverride
trigger1 = Var(0) < 100
attr = SCA,AA,AP,AT
stateno = 40005
time = -1

[State -3, HitOverride]
type = HitOverride
trigger1 = Var(0) >= 100
attr = SCA,AA,AP,AT
stateno = 40006
time = -1

[State -3, Lose]
type = ChangeState
trigger1 = Lose=1
trigger2 = DrawGame=1
value = 40006

;--------------------------------------------------------------------------
; Funky Junk LieDead
[Statedef 40006]
type = S
movetype = H
physics = S
sprpriority = 0
anim = 40002
velset = 0,0

[State 4000, VarAdd]
type = VarAdd
trigger1 = Var(0) >= 100
var(1) = 1

[State 4000, VarSet]
type = VarSet
trigger1 = Var(0) >= 100
var(0) = 0

[State -3, Lose]
type = ChangeState
triggerall = Anim = 40002
triggerall = AnimTime = 0
trigger1 = Lose=1
trigger2 = DrawGame=1
value = 40007

[State -3, ChangeAnim]
type = ChangeAnim
triggerall = Anim = 40002
trigger1 = Var(1) < 2
trigger1 = AnimTime = 0
value = 40003

[State 4000]
type = ChangeState
triggerall = Anim = 40003
trigger1 = AnimTime = 0
trigger1 = Var(1) < 2
value = 40000

[State 4000]
type = ChangeState
triggerall = Anim = 40002
trigger1 = AnimTime = 0
trigger1 = Var(1) >= 2
value = 40007

;-----------------------
[State -3, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State -3, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AP,AT
stateno = 40006
time = -1

;--------------------------------------------------------------------------
; Funky Junk Dead
[Statedef 40007]
type = S
movetype = H
physics = S
anim = 9999
sprpriority = 0

[State 5000, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 5000]
type = Explod
trigger1 = time = [0,10]
trigger1 = timemod = 3,0
anim = 6000
pos = (-10)*(random%2)*(random%10),-(random%10)+10
postype = p1
ontop=1
ownpal = 1
removetime =21

[State 5000,2]
type = DestroySelf
trigger1 = Time >= 15