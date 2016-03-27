globals [
  intro
  alive
  coins
  direction
  deaths
  totalScore-swim
  up#-swim
  totalScore-climb
  direction-climb
  totalScore-fly
  totalScore-run
  jump#-run
  totalScore-race
  ticks-race
  stamina-race
  timeLeft-race
]
patches-own [nextColor]

breed [enemies enemy]

;INTRODUCTION

to instructions
  if intro = 0 [
    cp
    ct
    duckychamp
    wait 3
    credits
    wait 3
    newspaper
    set intro 1
  ]
  instruct1
  instruction
  swim-instruct
  run-instruct
  fly-instruct
  climb-instruct
  race-instruct
  go-back
  if intro = 7 [
    set intro 0
    stop
  ]
end 

to duckychamp
  if [pcolor] of one-of patches = black
  [import-drawing "duckychamp.jpg"
    ask patches [set pcolor brown]]
end

to credits
  if [pcolor] of one-of patches = brown 
  [import-drawing "credits.jpg"
    ask patches [set pcolor cyan]]
end 

to newspaper
  if [pcolor] of one-of patches = cyan 
  [import-drawing "newspaper.jpg"
    ask patches [set pcolor red]
    wait 0.5]
end

to instruct1
  if mouse-down? 
  [if mouse-xcor > 16 and mouse-xcor < 46 and mouse-ycor > -48 and mouse-ycor < -40 and [pcolor] of patch round mouse-xcor round mouse-ycor = red 
    [import-drawing "instruct-1.jpg"
   ask patches[ set pcolor orange]
   wait 0.5]]
  end

to instruction
if mouse-down? 
[if mouse-xcor > -5 and mouse-xcor < 42 and mouse-ycor > -41 and mouse-ycor < -37 and [pcolor] of patch round mouse-xcor round mouse-ycor = orange 
  [import-drawing "instructions.jpg"
    ask patches [set pcolor green]
    wait 0.5]]
end


to swim-instruct
if mouse-down? 
[if mouse-xcor > -47 and mouse-xcor < 0 and mouse-ycor > 14 and mouse-ycor < 25 and [pcolor] of patch round mouse-xcor round mouse-ycor = green 
  [import-drawing "swim-instruct.jpg"
    ask patches [set pcolor violet]
    set intro 2 wait 0.5]]
end

to fly-instruct
if mouse-down? 
[if mouse-xcor > -47 and mouse-xcor < -16 and mouse-ycor > -13 and mouse-ycor < 18 and [pcolor] of patch round mouse-xcor round mouse-ycor = green 
  [import-drawing "fly-instruct.jpg"
    ask patches [set pcolor violet]
    set intro 3 wait 0.5]]
end

to run-instruct
if mouse-down? 
[if mouse-xcor > -47 and mouse-xcor < -9 and mouse-ycor > 1 and mouse-ycor < 12 and [pcolor] of patch round mouse-xcor round mouse-ycor = green 
  [import-drawing "run-instruct.jpg"
    ask patches [set pcolor violet]
    set intro 4 wait 0.5]]
end

to climb-instruct
if mouse-down? 
[if mouse-xcor > -47 and mouse-xcor < -6 and mouse-ycor > -27 and mouse-ycor < -18 and [pcolor] of patch round mouse-xcor round mouse-ycor = green 
  [import-drawing "climb-instruct.jpg"
    ask patches [set pcolor violet]
    set intro 5 wait 0.5]]
end

to race-instruct
if mouse-down? 
[if mouse-xcor > -47 and mouse-xcor < -14 and mouse-ycor > -40 and mouse-ycor < -30 and [pcolor] of patch round mouse-xcor round mouse-ycor = green 
  [import-drawing "race-instruct.jpg"
    ask patches [set pcolor violet]
    set intro 6 wait 0.5]]
end

to go-back
if mouse-down? 
[if mouse-xcor > 0 and mouse-xcor < 35 and mouse-ycor > -50 and mouse-ycor < -15 and [pcolor] of patch round mouse-xcor round mouse-ycor = violet 
  [import-drawing "instructions.jpg"
    ask patches [set pcolor green]
    wait 0.5]]
if mouse-down?
[if mouse-xcor > -35 and mouse-xcor < 0 and mouse-ycor > -50 and mouse-ycor < -15 and [pcolor] of patch round mouse-xcor round mouse-ycor = violet
  [cd
    if intro = 2 [setup-swim]
    if intro = 3 [setup-fly]
    if intro = 4 [setup-run]
    if intro = 5 [setup-climb]
    if intro = 6 [setup-race]
    set intro 7
  ]]
end

to reset
  if user-yes-or-no? "Do you want to reset all the progress you've made?" [ca]
end

;ALL

to createCoin [pxy backgroundColor #]
  if pxy = 48 and nextColor = backgroundColor and random # = 0 [
    set nextColor yellow
    ask neighbors [set nextColor orange]
  ]
end

to takeCoin [backgroundColor]
  ask neighbors [if pcolor = orange or pcolor = yellow [
      ask neighbors [ask neighbors [
          if pcolor = orange or pcolor = yellow [set pcolor backgroundColor]
      ]]
      set coins coins + 1
  ]]
end

to toDie
  set deaths deaths + 1
  repeat 5 [
    set color red
    wait 0.05
    set color yellow
    wait 0.05
  ]
  die
end

;SWIM

to setup-swim
  set stamina-race "N/A"
  set timeLeft-race "N/A"
  set totalScore-swim totalScore-swim + ticks
  reset-ticks
  set up#-swim 0
  set alive 1
  ct
  cp
  cd
  crt 1
  ask turtles [turtleSetup-swim]
  ask patches [patchSetup-swim]
end

to turtleSetup-swim
  set xcor -40
  set heading 90
  set shape "duckie"
  set color yellow
  set size 4
end

to patchSetup-swim
  if abs pycor < 25 [set pcolor blue]
  if [pcolor] of patch-at 0 1 = blue [set pcolor blue]
  if [pcolor] of patch-at 0 -1 = blue [set pcolor blue]
end

to go-swim
  wait 0.05 - ticks / 10000
  ask turtle 0 [runTurtles-swim]
  ifelse alive = 1 [tick] [end-swim stop]
  set direction random 2
  if [pcolor] of patch 50 50 = blue [set direction 1]
  if [pcolor] of patch 50 -50 = blue [set direction 0]
  ask patches [setNextColor1-swim]
  ask patches [setNextColor2-swim]
  ask patches [set pcolor nextColor]
  ask patches [if random (500 - ticks / 2) < 1 and pxcor = 48 and pcolor = blue
    [sprout-enemies 1 [fishSetup-swim]]]
  ask enemies [runFish-swim]
end

to runTurtles-swim
  ifelse up#-swim > 0 [
    set ycor ycor + 4
    set up#-swim up#-swim - 1
  ]
  [set ycor ycor - 1]
  takeCoin blue
  if pcolor = black [
    set alive 0
    toDie
  ]
  if any? turtles-on neighbors [
    set alive -1
    toDie
  ]
end

to setNextColor1-swim
  ifelse pxcor = 50
  [ifelse direction = 1
    [set nextColor [pcolor] of patch-at 0 1]
    [set nextColor [pcolor] of patch-at 0 -1]]
  [set nextColor [pcolor] of patch-at 1 0]
end

to setNextColor2-swim
  if pxcor = 50 and ticks mod 30 = 0 and
  ([pcolor] of patch-at 0 1 = black or [pcolor] of patch-at 0 -1 = black)
  [set nextColor black]
  createCoin pxcor blue 5000
end

to fishSetup-swim
  set size 4
  set shape "fish"
  set color one-of [red brown green lime turquoise cyan sky violet magenta pink]
  set heading 270
end

to runFish-swim
  fd 3
  let x one-of [-1 1]
  set ycor ycor + x
  if pcolor = black or xcor = -48 [die]
end

to end-swim
  if alive = 0 [user-message "You bump into the wall."]
  if alive = -1 [user-message "You run into a fish."]  
  user-message (word ticks " points will be added to your total swimming score.")
  setup-swim
end

to up-swim
  set up#-swim 4
end

;CLIMB

to setup-climb
  set stamina-race "N/A"
  set timeLeft-race "N/A"
  set totalScore-climb totalScore-climb + ticks
  reset-ticks
  ifelse random 2 = 0
  [set direction-climb 1]
  [set direction-climb 2]
  set alive 1
  ct
  cp
  cd
  crt 1
  ask turtles [turtleSetup-climb]
  ask patches [patchSetup-climb]
end

to turtleSetup-climb
  set ycor -10
  set heading 0
  set shape "duckie"
  set color yellow
  set size 4
end

to patchSetup-climb
  if abs pxcor < 15 [set pcolor sky]
  if [pcolor] of patch-at 1 0 = sky [set pcolor sky]
  if [pcolor] of patch-at -1 0 = sky [set pcolor sky]
end

to go-climb
  wait 0.05 - ticks / 10000
  ask turtles [runTurtles-climb]
  ifelse alive = 1 [tick] [end-climb stop]
  set direction random 2
  if [pcolor] of patch -40 50 = sky [set direction 1]
  if [pcolor] of patch 40 50 = sky [set direction 0]
  ask patches [setNextColor1-climb]
  ask patches [setNextColor2-climb]
  ask patches [set pcolor nextColor]
end

to runTurtles-climb
  if pcolor = black [
    if pxcor < 0 [set xcor xcor + 1]
    if pxcor > 0 [set xcor xcor - 1]
    set direction-climb 0
  ]
  if direction-climb = 1 [set xcor xcor - 2]
  if direction-climb = 2 [set xcor xcor + 2]
  ifelse [pcolor] of one-of neighbors = black [set ycor ycor + 2] [set ycor ycor - 1]
  takeCoin sky
  if pcolor != sky and pcolor != black [
    set alive 0
    repeat ycor + 48 [
      set ycor ycor - 1
      wait 0.01
    ]
    toDie
  ]
  if pycor < -47 [set alive -1 toDie]
  if pycor > 47 [set alive -2 toDie]
end

to setNextColor1-climb
  ifelse pycor = 50
  [ifelse direction = 1
    [set nextColor [pcolor] of patch-at -1 0]
    [set nextColor [pcolor] of patch-at 1 0]
  ]
  [set nextColor [pcolor] of patch-at 0 1]
end

to setNextColor2-climb
  if pycor = 50 and ticks mod 30 = 0 and
  ([pcolor] of patch-at 1 0 = sky or [pcolor] of patch-at -1 0 = sky)
  [set nextColor sky]
  let randomColor one-of [red brown green lime turquoise cyan blue violet magenta pink]
  if pycor = 48 and nextColor = black and random (600 - ticks) < 1 [
    set nextColor randomColor
    ask neighbors [set nextColor randomColor]
  ]
  createCoin pycor sky 1000
end

to end-climb
  if alive = 0 [user-message "You slip off a rock."]
  if alive = -1 [user-message "You are climbing too slow."]
  if alive = -2 [user-message "You are climbing too fast."]
  user-message (word ticks " points will be added to your total climbing score.")
  setup-climb
end

to left-climb
  set direction-climb 1
end

to right-climb
  set direction-climb 2
end

;FLY

to setup-fly
  set stamina-race "N/A"
  set timeLeft-race "N/A"
  set totalScore-fly totalScore-fly + ticks
  reset-ticks
  set direction 0
  set alive 1
  ct
  cp
  cd
  crt 1
  ask turtles [turtleSetup-fly]
  ask patches [patchSetup-fly]
end

to turtleSetup-fly
  set xcor -40
  set heading 90
  set shape "duckie"
  set color yellow
  set size 4
end

to patchSetup-fly
  set pcolor sky
  if pycor > 47 and random 3 > 0 [set pcolor white]
  if pycor < -47 [set pcolor green]
end

to go-fly
  wait 0.05 - ticks / 10000
  ask turtles [runTurtles-fly]
  ifelse alive = 1 [tick] [end-fly stop]
  ask patches [setNextColor1-fly]
  ask patches [setNextColor2-fly]
  ask patches [createCoin pxcor sky 2000]
  ask patches [set pcolor nextColor]
end

to runTurtles-fly
  if direction = 1 [set ycor ycor + 1]
  if direction = 2 [set ycor ycor - 1]
  if pycor > -47 and pycor < 47 [takeCoin sky]
  if pcolor != sky [set alive 0 toDie]
  if pycor < -47 [set alive -1 toDie]
  if pycor > 47 [set alive -2 toDie]
end

to setNextColor1-fly
  ifelse pxcor < 41
  [set nextColor [pcolor] of patch-at 10 0]
  [set nextColor sky
    if pycor > 47 and random 3 > 0 [set nextColor white]
    if pycor < -47 [set nextColor green]
  ]
end

to setNextColor2-fly
  let randomColor one-of [red brown lime turquoise cyan blue violet magenta pink]
  if pxcor = 40 and pycor > -38 and pycor < 38 and random (2000 - ticks * 2) < 1 [
    ask patches in-radius 10 [set nextColor randomColor]
  ]
end

to end-fly
  if alive = 0 [user-message "You run into an obstacle."]
  if alive = -1 [user-message "You are not here to run."]
  if alive = -2 [user-message "You dissappear into the clouds."]
  user-message (word ticks " points will be added to your total flying score.")
  setup-fly
end

to up-fly
  set direction 1
end

to down-fly
  set direction 2
end

;RUN

to setup-run
  set stamina-race "N/A"
  set timeLeft-race "N/A"
  set totalScore-run totalScore-run + ticks
  reset-ticks
  set jump#-run -6
  set alive 1
  ct
  cp
  cd
  crt 1
  set direction random 360
  ask turtles [turtleSetup-run]
  ask patches [patchSetup-run]
end

to turtleSetup-run
  setxy -40 -34
  set heading 90
  set shape "duckie"
  set color yellow
  set size 4
end

to patchSetup-run
  set pcolor sky
  if (pycor - 10 - sin (pxcor + direction) * 20) < 0 [set pcolor green]
  if pycor < -35 [ifelse random 2 = 0
    [set pcolor green - 2]
    [set pcolor brown]
  ]
end

to go-run
  wait 0.05 - ticks / 10000
  ask turtle 0 [runTurtle-run]
  ifelse alive = 1 [tick] [end-run stop]
  ask patches [setNextColor1-run]
  ask patches with [pycor > -35 and pycor < 50] [setNextColor2-run]
  ask patches [set pcolor nextColor]
  if random (20 - ticks / 50) < 1 [create-enemies 1 [ballSetup-run]]
  ask enemies [runBalls-run]
end

to runTurtle-run
  if ticks mod 2 = 0 and jump#-run > -6 [
    set ycor ycor + jump#-run
    set jump#-run jump#-run - 1
  ]
  if jump#-run = -6 and ticks mod 4 = 0 [set ycor ycor + 1]
  if jump#-run = -6 and ticks mod 4 = 2 [set ycor ycor - 1]
  takeCoin green
  if any? turtles-on neighbors [
    set alive 0
    toDie
  ]
end

to setNextColor1-run
  ifelse pxcor = 50
  [set nextColor sky
    if (pycor - 10 - sin (pxcor + direction + ticks) * 20) < 0 [set nextColor green]
    if pycor < -35 [ifelse random 2 = 0
      [set nextColor green - 2]
      [set nextColor brown]
    ]]
  [set nextColor [pcolor] of patch-at 1 0]
end

to setNextColor2-run
  createCoin pxcor sky 2000
  createCoin pxcor green 2000
end

to ballSetup-run
  set size 4
  ifelse random 3 = 0 [set shape "ball tennis" set color green + 2]
  [ifelse random 2 = 0 [set shape "ball baseball" set color white]
    [set shape "ball basketball" set color orange]]
  setxy 48 -34
  set heading 270
end

to runBalls-run
  set xcor xcor - 3
  lt 10
  if xcor = -48 [die]
end

to end-run
  user-message "You run into an obstacle."
  user-message (word ticks " points will be added to your total running score.")
  setup-run
end

to jump-run
  if jump#-run = -6 [set jump#-run  5]
end

;RACE

to setup-race
  set ticks-race 0
  set stamina-race coins * 5 + 50
  set timeLeft-race 10
  ct
  cp
  cd
  crt 1
  ask turtles [turtleSetup-race]
  ask patches [patchSetup-race]
end

to turtleSetup-race
  set ycor -29
  set heading 90
  set shape "duckie"
  set color yellow
  set size 4
end

to patchSetup-race
  ifelse pycor < -30 [set pcolor yellow] [set pcolor sky]
  if pycor < -31 and pycor > -50 and random 3 = 0 [set pcolor brown]
end

to go-race
  if ticks-race = 0 [set totalScore-race totalScore-run]
  if ticks-race = 70 [set totalScore-race totalScore-climb]
  if ticks-race = 130 [set totalScore-race totalScore-run]
  if ticks-race = 160 [set totalScore-race totalScore-fly]
  if ticks-race = 220 [set totalScore-race totalScore-swim]
  if ticks-race = 280 [set totalScore-race totalScore-run]
  wait 0.05 - totalScore-race / 200000
  if ticks-race > -1 and ticks-race < 70 [ask turtles [runTurtles-race]]
  if ticks-race = 70 [ask turtles [set heading 0]]
  if ticks-race > 69 and ticks-race < 130 [ask turtles [fd 1]]
  if ticks-race = 130 [ask turtles [set heading 90]]
  if ticks-race > 129 and ticks-race < 160 [ask turtles [runTurtles-race]]
  if ticks-race > 159 and ticks-race < 220 [ask turtles [set ycor ycor - 1]]
  if ticks-race > 219 and ticks-race < 280 [if count turtles > 1 [ask turtle 1 [fd 1]]]
  if ticks-race > 279 and ticks-race < 300 [ask turtle 0 [runTurtles-race] ask turtle 1 [fd 1]]
  if ticks-race > -1 and ticks-race < 20 [runPatches0-race]
  if ticks-race > 19 and ticks-race < 50 [runPatches0-race ask patches [runPatches1-race]]
  if ticks-race > 49 and ticks-race < 70 [runPatches0-race]
  if ticks-race > 129 and ticks-race < 210 [runPatches0-race runPatches2-race ask patches [runPatches3-race]]
  if ticks-race > 209 and ticks-race < 230 [runPatches0-race runPatches2-race ask patches [runPatches4-race]]
  if ticks-race > 230 and ticks-race < 300 [runPatches0-race ask patches [runPatches5-race]]
  if ticks-race = 255 [crt 1 ask turtle 1 [flagSetup-race]]
  if ticks-race = 300 [win-race stop]
  ask patches [set pcolor nextColor]
  ifelse stamina-race > 0 [set ticks-race ticks-race + 1 set stamina-race stamina-race - 1] [end-race stop]
  every 0.1 [set timeLeft-race timeLeft-race - 0.1]
  if timeLeft-race < 0.1 [end-race stop]
end

to runTurtles-race
  if ticks-race mod 4 = 0 [set ycor ycor + 1]
  if ticks-race mod 4 = 2 [set ycor ycor - 1]
end

to runPatches0-race
  ask patches [set nextColor [pcolor] of patch-at 1 0]
end

to runPatches1-race
  if pxcor = 50 and pycor > -31 and pycor < 30 and pycor mod 2 = 0 [set nextColor gray - 2]
  if pxcor = 50 and pycor > -31 and pycor < 30 and pycor mod 2 = 1 [set nextColor gray]
end

to runPatches2-race
  ask patches [if pxcor = 50 and pycor > -31 [set nextColor sky]]
end

to runPatches3-race
  if pxcor = 50 and pycor < -30 and pycor > -50 and
  ([pcolor] of patch-at 0 1 = sky or [pcolor] of patch-at 0 1 = blue) [set nextColor blue]
end

to runPatches4-race
  if pxcor = 50 and pcolor = blue and [pcolor] of patch-at 0 -1 = blue [set nextColor blue]
end

to runPatches5-race
  if pxcor = 50 and pycor < -30 [set nextColor yellow]
  if pxcor = 50 and pycor < -31 and pycor > -50 and random 3 = 0 [set nextColor brown]
end

to flagSetup-race
  setxy 47 -25
  set heading 270
  set color red
  set shape "flag"
  set size 10
end

to end-race
  ask turtle 0 [toDie]
  if stamina-race = 0 [user-message "You ran out of stamina. Collect more coins to increase your stamina."]
  if timeLeft-race < 0.1 [user-message "You ran out of time. Continue to practice the courses to become faster."]
  setup-race
end

to win-race
  user-message (word "Congratulations. You beat the game! It took you only " deaths " deaths!")
  ifelse user-yes-or-no? "Would you like to reset your game scores and coins?"
  [user-message "All your data will be reset." ca]
  [user-message "All your data will be kept." cp ct]
end
@#$#@#$#@
GRAPHICS-WINDOW
567
10
981
445
50
50
4.0
1
10
1
1
1
0
1
1
1
-50
50
-50
50
0
0
1
Current Score

BUTTON
10
174
98
207
Setup (Swim)
setup-swim
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
10
204
97
237
Go (Swim)
go-swim
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
10
236
97
269
Up (Swim)
up-swim
NIL
1
T
OBSERVER
NIL
Q
NIL
NIL

BUTTON
116
174
203
207
Setup (Climb)
setup-climb
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

MONITOR
8
306
110
351
Total Score (swim)
totalScore-swim
17
1
11

BUTTON
116
206
204
239
Go (Climb)
go-climb
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
116
236
205
269
Left (Climb)
left-climb
NIL
1
T
OBSERVER
NIL
A
NIL
NIL

BUTTON
116
268
204
301
Right (Climb)
right-climb
NIL
1
T
OBSERVER
NIL
D
NIL
NIL

BUTTON
224
174
317
207
Setup (Fly)
setup-fly
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

MONITOR
114
306
215
351
Total Score (Climb)
totalScore-climb
17
1
11

BUTTON
224
206
315
239
Go (Fly)
go-fly
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
224
238
317
271
Up (Fly)
up-fly
NIL
1
T
OBSERVER
NIL
W
NIL
NIL

BUTTON
224
270
316
303
Down (Fly)
down-fly
NIL
1
T
OBSERVER
NIL
S
NIL
NIL

MONITOR
222
306
324
351
Total Score (Fly)
totalScore-fly
17
1
11

BUTTON
337
174
425
207
Setup (Run)
setup-run
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
337
206
424
239
Go (Run)
go-run
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
337
238
424
271
Jump (Run)
jump-run
NIL
1
T
OBSERVER
NIL
E
NIL
NIL

MONITOR
333
306
437
351
Total Score (Run)
totalScore-run
17
1
11

BUTTON
447
174
535
207
Setup (Race)
setup-race
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
447
204
534
237
Go (Race)
go-race
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

MONITOR
449
262
552
307
Stamina (Race)
stamina-race
17
1
11

MONITOR
449
306
553
351
Time Left (Race)
timeLeft-race
1
1
11

MONITOR
7
360
110
405
Coins (All)
coins
17
1
11

BUTTON
10
10
97
43
NIL
Instructions
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

TEXTBOX
117
10
547
164
Click the \"Instructions\" button to view the introduction and instructions. After you select a specific course to play (either via the instructions or by clicking Setup), click the \"Go\" button for the respective course. The buttons below \"Go\" are your controls for the respective course.\n\nAs you advance further into a course, it will become faster and harder, but the score will increase faster too.\n\nEarn a high total score and coins from each course to succeed in the race. During the race, speed will depend on the total score for the respective course and stamina will depend on the number of coins collected.
11
0.0
1

BUTTON
10
54
77
87
NIL
RESET
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

@#$#@#$#@
CREDITS
----------------------
John Lin
William Xiao
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

ball baseball
true
0
Circle -7500403 true true 30 30 240
Polygon -2674135 true false 247 79 243 86 237 106 232 138 232 167 235 199 239 215 244 225 236 234 229 221 224 196 220 163 221 138 227 102 234 83 240 71
Polygon -2674135 true false 53 79 57 86 63 106 68 138 68 167 65 199 61 215 56 225 64 234 71 221 76 196 80 163 79 138 73 102 66 83 60 71
Line -2674135 false 241 149 210 149
Line -2674135 false 59 149 90 149
Line -2674135 false 241 171 212 176
Line -2674135 false 246 191 218 203
Line -2674135 false 251 207 227 226
Line -2674135 false 251 93 227 74
Line -2674135 false 246 109 218 97
Line -2674135 false 241 129 212 124
Line -2674135 false 59 171 88 176
Line -2674135 false 59 129 88 124
Line -2674135 false 54 109 82 97
Line -2674135 false 49 93 73 74
Line -2674135 false 54 191 82 203
Line -2674135 false 49 207 73 226

ball basketball
true
0
Circle -7500403 true true 26 26 247
Polygon -16777216 false false 30 150 30 165 45 195 75 225 120 240 180 240 225 225 255 195 270 165 270 150 270 135 255 105 225 75 180 60 120 60 75 75 45 105 30 135
Line -16777216 false 30 150 270 150
Circle -16777216 false false 26 26 247

ball football
false
0
Polygon -7500403 false true 301 133 301 164 275 192 229 224 167 236 137 236 74 224 30 194 3 162 2 138 30 104 76 74 134 62 168 62 228 74 274 105
Polygon -7500403 true true 300 150 300 165 270 195 225 225 163 236 134 236 75 225 30 195 2 162 2 140 30 105 75 75 136 63 165 63 225 75 270 105 300 135
Line -16777216 false 300 155 5 155
Polygon -1 true false 28 193 28 107 51 91 51 209
Rectangle -1 true false 90 150 210 160
Rectangle -1 true false 198 141 205 170
Rectangle -1 true false 183 141 190 170
Rectangle -1 true false 168 141 175 170
Rectangle -1 true false 153 141 160 170
Rectangle -1 true false 138 141 145 170
Rectangle -1 true false 123 141 130 170
Rectangle -1 true false 108 141 115 170
Rectangle -1 true false 93 141 100 170
Polygon -1 true false 272 193 272 107 249 91 249 209

ball tennis
true
0
Circle -7500403 true true 30 30 240
Circle -7500403 false true 30 30 240
Polygon -16777216 true false 50 82 54 90 59 107 64 140 64 164 63 189 59 207 54 222 68 236 76 220 81 195 84 163 83 139 78 102 72 83 63 67
Polygon -16777216 true false 250 82 246 90 241 107 236 140 236 164 237 189 241 207 246 222 232 236 224 220 219 195 216 163 217 139 222 102 228 83 237 67
Polygon -1 true false 247 79 243 86 237 106 232 138 232 167 235 199 239 215 244 225 236 234 229 221 224 196 220 163 221 138 227 102 234 83 240 71
Polygon -1 true false 53 79 57 86 63 106 68 138 68 167 65 199 61 215 56 225 64 234 71 221 76 196 80 163 79 138 73 102 66 83 60 71

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

duckie
false
4
Circle -1184463 true true 30 75 180
Polygon -955883 true false 195 60 240 75 195 90 195 60
Circle -1184463 true true 90 15 120
Circle -1 true false 133 28 62
Circle -16777216 true false 165 45 30
Circle -16777216 false false 133 28 62
Line -16777216 false 135 165 120 195
Line -16777216 false 120 195 105 165

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 256 131 279 87 285 86 300 120 285 150 300 180 287 214 280 212 255 166
Polygon -1 true false 165 195 181 235 205 218 224 210 254 204 240 165
Polygon -1 true false 225 45 217 77 229 103 214 114 134 78 165 60
Polygon -7500403 true true 270 136 149 77 74 81 20 119 8 146 8 160 13 170 30 195 105 210 149 212 270 166
Circle -16777216 true false 55 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
0
Rectangle -7500403 true true 151 225 180 285
Rectangle -7500403 true true 47 225 75 285
Rectangle -7500403 true true 15 75 210 225
Circle -7500403 true true 135 75 150
Circle -16777216 true false 165 76 116

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

warning
false
0
Polygon -7500403 true true 0 240 15 270 285 270 300 240 165 15 135 15
Polygon -16777216 true false 180 75 120 75 135 180 165 180
Circle -16777216 true false 129 204 42

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 4.1.3
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 1.0 0.0
0.0 1 1.0 0.0
0.2 0 1.0 0.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
