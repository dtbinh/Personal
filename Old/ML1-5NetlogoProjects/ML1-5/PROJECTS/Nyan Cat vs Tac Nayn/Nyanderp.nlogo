extensions [sound]
breed [nyans nyan]
breed [bullets bullet]
breed [nayns nayn]
breed [enemy-bullets enemy-bullet]
globals [score game-over? highscore was-mouse-down?]
nyans-own [hp]
nayns-own [ehp]


to spawn-nyancat
  create-nyans 1 [derpderp]
end

to derpderp
  setxy -125 125
  set size 40
  set heading 90
  set shape "upwards?"
  set hp 450
end

to nyanss
  ask turtles with [shape = "upwards?"] 
  [set shape "downwards"
    wait .001
  set shape "upwards?"
  set label hp
  wait .001]
end


to Newgame
  ca
  resize-world -210 210 0 250
  set-patch-size 2
  set score 0
  ask patches [ifelse pxcor < 0 [set pcolor 102] [set pcolor 12]]
  crt 2
  ask one-of turtles [nyansetup]
  ask turtles with [shape = "default"] [nyansetup2]
  spawn-nyancat 
  ask turtle 0 [create-link-to turtle 1 [tie] create-link-to turtle 2 [tie]]
  ask links [set color 102]
  user-message 
  "If you want to play with the mouse, do NOT put the cursor near the horizontal boundaries of the world unless you are a ruthless murderer of nyancats"
  ;nyannyannyan
end 

to nyansetup
  set size 20
  set shape "nyan cat"
  set heading 90
  set color grey
  set xcor -115
  set ycor 125
end

to nyansetup2
  set size 20
  set shape "nyan cat 2"
  set heading 90
  set xcor -115
  fd 13
  set color grey
  set ycor 125
end

 
to nyannyannyan
  sound:play-sound "Nyan Cat.wav"
end

to Start
  nyanss
  moarscoar
  ohnoes
  nayn-power
  pewpew-bullets
  game-over
  if Mouse-control? [
    ask turtle 0 [ let current-xcor xcor
      if (round mouse-xcor) != -210 or (round mouse-ycor) != 0 
      [ fd mouse-xcor - current-xcor
        set ycor mouse-ycor]
    ]
    if mouse-down? and not was-mouse-down? [ shoot ]
    set was-mouse-down? mouse-down?
  ]
  if game-over? = 1 
    [user-message "GAME OVER. Click New Game if you want to start from scratch, or press Restart if you want to maintain your old high score and compete against it." stop]
end

to game-over
  ask nyan 2 [if (hp <= 0) [set game-over? 1]]
end

to moarscoar
  set score score + .05
  wait .001
  if score >= highscore [set highscore score]
end

to ohnoes
  ask nyan 2 [if (any? nayns in-radius 10) 
    [set hp hp - 15 set label hp]]
end

to obstacles
  if [hp] of nyan 2 = 0 [stop]
  ifelse difficulty < 3 
  [every 2.5
    [ask one-of patches with [(pxcor = 180) and ((pycor <= 230) and (pycor >= 20))] 
      [sprout-nayns 2 [tacnayn1] ask one-of nayns with [shape = "tac nayn2"] in-radius 1 [tacnayn2]]]]
  [every 1
    [ask one-of patches with [(pxcor = 180) and ((pycor <= 230) and (pycor >= 20))] 
      [sprout-nayns 2 [tacnayn1] ask one-of nayns with [shape = "tac nayn2"] in-radius 1 [tacnayn2]]]]
  ask links [set color 102]
  ask nayns with [shape = "tac nayn2"] [set label [ehp] of one-of nayns with [shape = "tac nayn1"] in-radius 13.25]
end

to nayn-power 
  if difficulty <= 2 [ask nayns with [shape = "tac nayn1"] [bk .5]]
  if difficulty > 1 [every 1 [ask nayns with [shape = "tac nayn1"] [hatch-enemy-bullets 1 [enemy-bullet-setup]]]]
  if difficulty >= 3 [ask nayns with [shape = "tac nayn1"] [bk 1.25]]
  if difficulty = 4 [every .25 [ask nayns with [shape = "tac nayn1"] [hatch-enemy-bullets 1 [enemy-bullet-setup]]]]
  ask nayns [if xcor <= -200 [ask one-of nayns with [shape = "tac nayn2"] in-radius 14.25 [die] die]]
end

to up
   carefully [ask turtle 0
    [set ycor ycor + 7.5]] []
end 

to down
   carefully [ask turtle 0 
    [set ycor ycor - 7.5]] []
end

to moveleft
  carefully [ask turtle 0 [if xcor > -190 [bk 9]]] []
end

to moveright
  carefully [ask turtle 0 [if xcor < 190 [fd 9]]] []
end

to shoot
  carefully [ask turtle 0 [hatch-bullets 1 [bullet-setup]]] []
end


to bullet-setup
  set size 10
  set shape "sprinkle bullet"
  set heading 90
  set color pink
end

to enemy-bullet-setup
  set size 10
  set shape "squarez"
  set color 33
  carefully [set heading towards turtle 2] []
end

to pewpew-bullets
  ask bullets [fd 1
    if xcor >= 205 [die]
    if any? nayns in-radius 7 
    [ask one-of nayns in-radius 7 
        [set ehp (ehp - 150) if (ehp <= 0) 
          [ask one-of nayns with [shape = "tac nayn2"] in-radius 13.25 [die] die]] set score score + 100 die]]
  ask enemy-bullets [
    ifelse difficulty < 3 [fd .75] [fd 1.5]
    if any? nyans in-radius 10 [ask nyans in-radius 10 [set hp hp - 15 set label hp] die]
    if xcor <= -205 [die]
    if xcor >= 205 [die]
    if ycor <= 5 [die]
    if ycor >= 245 [die]]
end



to tacnayn1
      set size 20
      set shape "tac nayn2"
      set heading 90
      set color 14
      set ehp 300
end
    
to tacnayn2
      set size 20
      set shape "tac nayn1"
      set heading 90
      set color 14
      set ehp 300
      create-link-to one-of nayns with [shape = "tac nayn2"] in-radius 1 [tie]
      ask one-of nayns with [shape = "tac nayn2"] in-radius 1 [fd 13.25]
end
    
to restart
  ask nayns [die]
  ask bullets [die]
  ask enemy-bullets [die]
  ask nyan 2 [set hp 450]
  set game-over? 0
  set score 0
end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
1062
543
210
-1
2.0
1
10
1
1
1
0
0
0
1
-210
210
0
250
0
0
1
ticks

BUTTON
2
17
92
50
New Game
Newgame
NIL
1
T
OBSERVER
NIL
Q
NIL
NIL

BUTTON
112
17
175
50
NIL
Start
T
1
T
OBSERVER
NIL
E
NIL
NIL

MONITOR
13
296
70
341
Score
score
0
1
11

BUTTON
99
64
191
97
Obstacles?
obstacles
T
1
T
OBSERVER
NIL
O
NIL
NIL

BUTTON
51
151
108
184
NIL
up\n
NIL
1
T
OBSERVER
NIL
W
NIL
NIL

BUTTON
51
120
108
153
NIL
shoot
NIL
1
T
OBSERVER
NIL
J
NIL
NIL

BUTTON
49
213
112
246
NIL
down
NIL
1
T
OBSERVER
NIL
S
NIL
NIL

BUTTON
20
182
83
215
Left
moveleft
NIL
1
T
OBSERVER
NIL
A
NIL
NIL

BUTTON
80
182
143
215
Right
Moveright
NIL
1
T
OBSERVER
NIL
D
NIL
NIL

CHOOSER
16
403
154
448
Difficulty
Difficulty
1 2 3 4
3

MONITOR
13
339
85
384
High Score
highscore
0
1
11

BUTTON
8
63
81
96
NIL
Restart
NIL
1
T
OBSERVER
NIL
R
NIL
NIL

SWITCH
11
460
178
493
mouse-control?
mouse-control?
0
1
-1000

@#$#@#$#@
WHAT IS IT?
-----------
This model is simply just a basic spaceship shooter game, except with a Nyancat theme. You play as a Nyancat firing sprinkle-bullets at evil Tac Nayns that are firing their waffles at you. Try to avoid waffles as well as the Tac Nayns as well as you can. If you get hit too often, you'll die and the game will end. The game itself will never end if you are good enough, but you can adjust the difficulty level to suit your own abilities (if you think you're hot stuff, try difficulty 4!). Overall, the point is to have fun, so there is no real "win condition" in which you are victorious. However, with the high score functionality, you can compete in friends for highest high score if you just have that inner competetiveness that can not be held back.

HOW IT WORKS
------------
Gameplay is very simple. When playing with the mouse, simply move your mouse around (so long as the mouse is within the boundaries of the world) to move Nyancat around, and click to shoot sprinkles. When playing with the keyboard, use WASD to mvoe Nyancat around (UpLeftDownRight respectively) and press J to shoot sprinkles. 

HOW TO USE IT
-------------
Firstly, click New Game. You might want to select your difficulty before doing anything else. Then, decide whether or not you wish to use your mouse to play the game via the chooser "mouse-control?," and then press Start. Once you have fiddled around with the controls and are comfortable enough with them, turn on "Obstacles", preferably by pressing "O" rather than the actual button, and enjoy! If you die yet want to beat your high score, press Restart instead of New Game after death, and then repeat the process started previously. 


EXTENDING THE MODEL
-------------------
There are many things that can be added to extend the model. One can add infinitely many sliders and the such that affect variables in the model, such as the speed of Tac Nayns, bullet speeds, spawn rate of enemies, initial HP and EHP of Nyancat and Tac Nayns, etc.

CREDITS AND REFERENCES
----------------------
Nyanicorn.com
Hanson Lin + Jason Lau


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

burret
true
0

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

downwards
true
0
Rectangle -13840069 true false 150 285 165 300
Rectangle -13840069 true false 150 270 165 285
Rectangle -955883 true false 120 270 135 285
Rectangle -2674135 true false 105 270 120 285
Rectangle -955883 true false 120 285 135 300
Rectangle -2674135 true false 105 285 120 300
Rectangle -2674135 true false 90 150 105 165
Rectangle -2674135 true false 105 90 120 105
Rectangle -2674135 true false 90 135 105 150
Rectangle -2674135 true false 105 210 120 225
Rectangle -2674135 true false 105 105 120 120
Rectangle -2674135 true false 90 45 105 60
Rectangle -2674135 true false 90 60 105 75
Rectangle -2674135 true false 105 15 120 30
Rectangle -2674135 true false 105 0 120 15
Rectangle -2674135 true false 105 120 120 135
Rectangle -2674135 true false 105 195 120 210
Rectangle -2674135 true false 90 165 105 180
Rectangle -2674135 true false 105 30 120 45
Rectangle -2674135 true false 90 75 105 90
Rectangle -2674135 true false 105 180 120 195
Rectangle -2674135 true false 90 225 105 240
Rectangle -2674135 true false 90 240 105 255
Rectangle -2674135 true false 90 255 105 270
Rectangle -955883 true false 105 135 120 150
Rectangle -955883 true false 120 120 135 135
Rectangle -955883 true false 105 150 120 165
Rectangle -955883 true false 120 210 135 225
Rectangle -955883 true false 105 165 120 180
Rectangle -955883 true false 120 180 135 195
Rectangle -955883 true false 120 195 135 210
Rectangle -955883 true false 105 45 120 60
Rectangle -955883 true false 120 90 135 105
Rectangle -955883 true false 120 105 135 120
Rectangle -955883 true false 105 75 120 90
Rectangle -955883 true false 105 60 120 75
Rectangle -955883 true false 105 255 120 270
Rectangle -955883 true false 105 240 120 255
Rectangle -955883 true false 105 225 120 240
Rectangle -1184463 true false 135 105 150 120
Rectangle -1184463 true false 135 120 150 135
Rectangle -1184463 true false 120 75 135 90
Rectangle -1184463 true false 120 60 135 75
Rectangle -1184463 true false 120 135 135 150
Rectangle -1184463 true false 135 30 150 45
Rectangle -1184463 true false 120 45 135 60
Rectangle -1184463 true false 135 195 150 210
Rectangle -1184463 true false 120 165 135 180
Rectangle -1184463 true false 135 210 150 225
Rectangle -1184463 true false 120 150 135 165
Rectangle -1184463 true false 135 90 150 105
Rectangle -1184463 true false 135 180 150 195
Rectangle -1184463 true false 120 255 135 270
Rectangle -1184463 true false 120 240 135 255
Rectangle -1184463 true false 120 225 135 240
Rectangle -13840069 true false 150 105 165 120
Rectangle -13840069 true false 135 165 150 180
Rectangle -13840069 true false 150 120 165 135
Rectangle -13840069 true false 135 135 150 150
Rectangle -13840069 true false 150 90 165 105
Rectangle -13840069 true false 135 45 150 60
Rectangle -13840069 true false 150 30 165 45
Rectangle -13840069 true false 150 180 165 195
Rectangle -13840069 true false 135 150 150 165
Rectangle -13840069 true false 150 195 165 210
Rectangle -13840069 true false 135 225 150 240
Rectangle -13840069 true false 135 60 150 75
Rectangle -13840069 true false 135 75 150 90
Rectangle -13840069 true false 135 240 150 255
Rectangle -13840069 true false 135 255 150 270
Rectangle -13840069 true false 150 210 165 225
Rectangle -13345367 true false 150 75 165 90
Rectangle -13345367 true false 165 90 180 105
Rectangle -13345367 true false 150 45 165 60
Rectangle -13345367 true false 150 60 165 75
Rectangle -13345367 true false 165 30 180 45
Rectangle -13345367 true false 165 105 180 120
Rectangle -13345367 true false 165 180 180 195
Rectangle -13345367 true false 165 210 180 225
Rectangle -13345367 true false 150 165 165 180
Rectangle -13345367 true false 150 135 165 150
Rectangle -13345367 true false 165 120 180 135
Rectangle -13345367 true false 165 195 180 210
Rectangle -13345367 true false 150 225 165 240
Rectangle -13345367 true false 150 240 165 255
Rectangle -13345367 true false 150 150 165 165
Rectangle -13345367 true false 150 255 165 270
Rectangle -8630108 true false 165 165 180 180
Rectangle -8630108 true false 165 135 180 150
Rectangle -8630108 true false 165 75 180 90
Rectangle -8630108 true false 165 60 180 75
Rectangle -8630108 true false 165 150 180 165
Rectangle -8630108 true false 165 45 180 60
Rectangle -1184463 true false 135 0 150 15
Rectangle -1184463 true false 135 15 150 30
Rectangle -13840069 true false 150 0 165 15
Rectangle -13840069 true false 150 15 165 30
Rectangle -955883 true false 120 30 135 45
Rectangle -955883 true false 120 15 135 30
Rectangle -955883 true false 120 0 135 15
Rectangle -13345367 true false 165 0 180 15
Rectangle -13345367 true false 165 15 180 30
Rectangle -2674135 true false 98 90 113 135
Rectangle -955883 true false 112 90 127 135
Rectangle -955883 true false 105 45 120 90
Rectangle -955883 true false 109 0 124 45
Rectangle -955883 true false 105 135 120 180
Rectangle -955883 true false 112 180 127 225
Rectangle -955883 true false 105 225 120 270
Rectangle -2674135 true false 98 0 113 45
Rectangle -2674135 true false 90 45 105 90
Rectangle -2674135 true false 90 135 105 180
Rectangle -2674135 true false 98 180 113 225
Rectangle -2674135 true false 90 225 105 270
Rectangle -1184463 true false 120 225 135 270
Rectangle -1184463 true false 127 180 142 225
Rectangle -1184463 true false 120 135 135 180
Rectangle -1184463 true false 126 90 141 135
Rectangle -1184463 true false 120 45 135 90
Rectangle -1184463 true false 127 0 142 45
Rectangle -13840069 true false 141 0 156 45
Rectangle -13840069 true false 135 45 150 90
Rectangle -13840069 true false 142 90 157 135
Rectangle -13840069 true false 135 135 150 180
Rectangle -13840069 true false 142 180 157 225
Rectangle -13840069 true false 135 225 150 270
Rectangle -13345367 true false 150 225 165 270
Rectangle -13345367 true false 156 180 171 225
Rectangle -13345367 true false 150 135 165 180
Rectangle -13345367 true false 156 90 171 135
Rectangle -13345367 true false 150 45 165 90
Rectangle -13345367 true false 156 0 171 45
Rectangle -8630108 true false 172 0 187 45
Rectangle -8630108 true false 172 90 187 135
Rectangle -8630108 true false 165 45 180 90
Rectangle -8630108 true false 165 135 180 180
Rectangle -8630108 true false 171 180 186 225
Rectangle -8630108 true false 165 225 180 270
Rectangle -8630108 true false 170 270 185 315
Rectangle -2674135 true false 98 270 113 315
Rectangle -955883 true false 112 270 127 315
Rectangle -1184463 true false 126 270 141 315
Rectangle -13840069 true false 141 270 156 315
Rectangle -13345367 true false 156 270 171 315

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
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

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

ground0
true
1
Rectangle -7500403 true false 135 -150 150 150

ground1
true
1
Rectangle -7500403 true false -150 150 150 165

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

nyan cat
true
0
Rectangle -16777216 true false 135 300 150 315
Rectangle -16777216 true false 135 300 150 315
Rectangle -16777216 true false 150 270 165 285
Rectangle -16777216 true false 135 285 165 300
Rectangle -16777216 true false 120 270 135 285
Rectangle -16777216 true false 120 225 135 255
Rectangle -16777216 true false 120 255 135 270
Rectangle -16777216 true false 180 195 195 210
Rectangle -16777216 true false 180 210 195 225
Rectangle -16777216 true false 165 210 180 225
Rectangle -16777216 true false 165 225 180 240
Rectangle -16777216 true false 135 195 150 210
Rectangle -16777216 true false 135 210 150 225
Rectangle -16777216 true false 135 225 150 240
Rectangle -16777216 true false 165 240 180 255
Rectangle -16777216 true false 165 255 180 270
Rectangle -16777216 true false 0 135 15 150
Rectangle -16777216 true false 15 165 30 180
Rectangle -16777216 true false 30 180 45 195
Rectangle -16777216 true false 45 180 60 195
Rectangle -16777216 true false 60 180 75 195
Rectangle -16777216 true false 75 180 90 195
Rectangle -16777216 true false 90 180 105 195
Rectangle -16777216 true false 105 180 120 195
Rectangle -16777216 true false 120 180 135 195
Rectangle -16777216 true false 285 135 300 150
Rectangle -16777216 true false 285 120 300 135
Rectangle -16777216 true false 285 105 300 120
Rectangle -16777216 true false 270 105 285 120
Rectangle -16777216 true false 255 105 270 120
Rectangle -16777216 true false 255 120 270 135
Rectangle -16777216 true false 270 150 285 165
Rectangle -16777216 true false 255 135 270 150
Rectangle -16777216 true false 255 150 270 165
Rectangle -16777216 true false 255 165 270 180
Rectangle -16777216 true false 270 180 285 195
Rectangle -16777216 true false 285 195 300 210
Rectangle -16777216 true false 285 210 300 225
Rectangle -16777216 true false 285 225 300 240
Rectangle -16777216 true false 270 225 285 240
Rectangle -16777216 true false 255 225 270 240
Rectangle -16777216 true false 240 180 255 195
Rectangle -16777216 true false 240 195 255 210
Rectangle -16777216 true false 240 210 255 225
Rectangle -16777216 true false 225 195 240 210
Rectangle -16777216 true false 225 180 240 195
Rectangle -16777216 true false 210 180 225 195
Rectangle -16777216 true false 195 180 210 195
Rectangle -16777216 true false 180 180 195 195
Rectangle -16777216 true false 165 180 180 195
Rectangle -16777216 true false 150 180 165 195
Rectangle -7500403 true true 135 180 150 195
Rectangle -7500403 true true 135 180 150 195
Rectangle -7500403 true true 135 180 150 195
Rectangle -16777216 true false 135 180 150 195
Rectangle -16777216 true false 0 150 15 165
Rectangle -16777216 true false 255 90 270 105
Rectangle -16777216 true false 0 45 15 60
Rectangle -16777216 true false 0 60 15 75
Rectangle -16777216 true false 0 75 15 90
Rectangle -16777216 true false 0 90 15 105
Rectangle -16777216 true false 0 105 15 120
Rectangle -16777216 true false 0 120 15 135
Rectangle -955883 true false 165 165 180 180
Rectangle -955883 true false 225 165 240 180
Rectangle -955883 true false 135 165 150 180
Rectangle -955883 true false 240 105 255 120
Rectangle -955883 true false 150 165 165 180
Rectangle -16777216 true false 240 165 255 180
Rectangle -955883 true false 240 150 255 165
Rectangle -955883 true false 120 165 135 180
Rectangle -955883 true false 240 120 255 135
Rectangle -955883 true false 180 165 195 180
Rectangle -955883 true false 210 165 225 180
Rectangle -16777216 true false 150 195 165 210
Rectangle -955883 true false 195 165 210 180
Rectangle -16777216 true false 255 45 270 60
Rectangle -16777216 true false 255 60 270 75
Rectangle -16777216 true false 255 75 270 90
Rectangle -955883 true false 225 150 240 165
Rectangle -955883 true false 210 150 225 165
Rectangle -955883 true false 15 45 30 60
Rectangle -955883 true false 15 90 30 105
Rectangle -955883 true false 15 105 30 120
Rectangle -955883 true false 15 120 30 135
Rectangle -955883 true false 15 150 30 165
Rectangle -955883 true false 240 45 255 60
Rectangle -955883 true false 240 60 255 75
Rectangle -955883 true false 240 75 255 90
Rectangle -955883 true false 240 90 255 105
Rectangle -955883 true false 90 165 105 180
Rectangle -955883 true false 75 165 90 180
Rectangle -955883 true false 30 165 45 180
Rectangle -955883 true false 60 165 75 180
Rectangle -955883 true false 45 165 60 180
Rectangle -955883 true false 105 165 120 180
Rectangle -955883 true false 45 150 60 165
Rectangle -955883 true false 30 135 45 150
Rectangle -955883 true false 30 150 45 165
Rectangle -5825686 true false 195 75 210 90
Rectangle -955883 true false 240 135 255 150
Rectangle -5825686 true false 210 120 225 135
Rectangle -5825686 true false 135 105 150 120
Rectangle -955883 true false 15 135 30 150
Rectangle -5825686 true false 165 135 180 150
Rectangle -5825686 true false 60 120 75 135
Rectangle -955883 true false 15 75 30 90
Rectangle -955883 true false 15 60 30 75
Rectangle -955883 true false 225 135 240 150
Rectangle -5825686 true false 150 45 165 60
Rectangle -5825686 true false 105 60 120 75
Rectangle -5825686 true false 45 45 60 60
Rectangle -7500403 true true 135 270 150 285
Rectangle -7500403 true true 135 255 150 270
Rectangle -7500403 true true 135 240 150 255
Rectangle -7500403 true true 150 210 165 225
Rectangle -7500403 true true 150 225 165 240
Rectangle -7500403 true true 150 240 165 255
Rectangle -7500403 true true 150 255 165 270
Rectangle -7500403 true true 165 195 180 210
Rectangle -7500403 true true 270 195 285 210
Rectangle -7500403 true true 270 210 285 225
Rectangle -7500403 true true 255 180 270 195
Rectangle -7500403 true true 255 195 270 210
Rectangle -7500403 true true 255 210 270 225
Rectangle -7500403 true true 270 120 285 135
Rectangle -7500403 true true 270 135 285 150
Rectangle -2064490 true false 75 120 165 165
Rectangle -2064490 true false 60 150 75 165
Rectangle -2064490 true false 45 60 60 150
Rectangle -2064490 true false 60 135 75 150
Rectangle -2064490 true false 30 45 45 135
Rectangle -2064490 true false 165 150 210 165
Rectangle -2064490 true false 180 45 195 150
Rectangle -2064490 true false 195 90 210 150
Rectangle -2064490 true false 210 135 225 150
Rectangle -2064490 true false 225 45 240 135
Rectangle -2064490 true false 210 45 225 120
Rectangle -2064490 true false 195 45 210 75
Rectangle -2064490 true false 165 45 180 135
Rectangle -2064490 true false 150 60 165 120
Rectangle -2064490 true false 60 75 135 120
Rectangle -2064490 true false 105 45 150 60
Rectangle -2064490 true false 120 60 135 75
Rectangle -2064490 true false 135 60 150 105
Rectangle -2064490 true false 60 45 105 75

nyan cat 2
true
0
Rectangle -16777216 true false 0 225 15 240
Rectangle -16777216 true false 255 135 270 150
Rectangle -16777216 true false 165 225 180 240
Rectangle -16777216 true false 195 225 210 240
Rectangle -16777216 true false 255 225 270 240
Rectangle -16777216 true false 240 195 255 210
Rectangle -16777216 true false 255 195 270 210
Rectangle -16777216 true false 255 180 270 195
Rectangle -16777216 true false 255 120 270 135
Rectangle -16777216 true false 255 165 270 180
Rectangle -16777216 true false 255 210 270 225
Rectangle -16777216 true false 120 120 135 135
Rectangle -16777216 true false 120 90 135 105
Rectangle -16777216 true false 120 105 135 120
Rectangle -16777216 true false 0 105 15 120
Rectangle -16777216 true false 225 210 240 225
Rectangle -16777216 true false 210 225 225 240
Rectangle -16777216 true false 255 150 270 165
Rectangle -16777216 true false 255 105 270 120
Rectangle -16777216 true false 225 150 240 165
Rectangle -16777216 true false 225 135 240 150
Rectangle -16777216 true false 225 120 240 135
Rectangle -16777216 true false 180 105 195 120
Rectangle -16777216 true false 180 75 195 90
Rectangle -16777216 true false 165 60 180 75
Rectangle -16777216 true false 180 60 195 75
Rectangle -16777216 true false 90 75 105 90
Rectangle -16777216 true false 105 75 120 90
Rectangle -16777216 true false 75 75 90 90
Rectangle -16777216 true false 60 75 75 90
Rectangle -16777216 true false 45 75 60 90
Rectangle -16777216 true false 30 75 45 90
Rectangle -16777216 true false 15 90 30 105
Rectangle -16777216 true false 0 120 15 135
Rectangle -16777216 true false 0 135 15 150
Rectangle -16777216 true false 0 150 15 165
Rectangle -16777216 true false 0 165 15 180
Rectangle -16777216 true false 0 180 15 195
Rectangle -16777216 true false 0 195 15 210
Rectangle -16777216 true false 0 210 15 225
Rectangle -16777216 true false 150 225 165 240
Rectangle -16777216 true false 105 150 120 165
Rectangle -16777216 true false 105 210 120 225
Rectangle -16777216 true false 120 210 135 225
Rectangle -16777216 true false 180 225 195 240
Rectangle -16777216 true false 90 210 105 225
Rectangle -16777216 true false 135 210 150 225
Rectangle -16777216 true false 90 165 105 180
Rectangle -2064490 true false 195 180 210 195
Rectangle -2064490 true false 195 195 210 210
Rectangle -2064490 true false 210 195 225 210
Rectangle -16777216 true false 180 165 195 180
Rectangle -1 true false 165 165 180 180
Rectangle -16777216 true false 75 180 90 195
Rectangle -16777216 true false 75 195 90 210
Rectangle -16777216 true false 120 135 135 150
Rectangle -16777216 true false 75 45 90 60
Rectangle -16777216 true false 90 60 105 75
Rectangle -16777216 true false 75 30 90 45
Rectangle -16777216 true false 105 15 120 30
Rectangle -16777216 true false 90 15 105 30
Rectangle -16777216 true false 120 15 135 30
Rectangle -16777216 true false 150 0 165 15
Rectangle -16777216 true false 135 15 150 30
Rectangle -16777216 true false 180 0 195 15
Rectangle -16777216 true false 165 0 180 15
Rectangle -16777216 true false 195 0 210 15
Rectangle -16777216 true false 210 0 225 15
Rectangle -16777216 true false 225 15 240 30
Rectangle -16777216 true false 240 30 255 45
Rectangle -16777216 true false 255 45 270 60
Rectangle -16777216 true false 255 60 270 75
Rectangle -16777216 true false 255 75 270 90
Rectangle -16777216 true false 255 90 270 105
Rectangle -2064490 true false 195 45 210 60
Rectangle -2064490 true false 210 30 225 45
Rectangle -2064490 true false 195 30 210 45
Rectangle -2064490 true false 210 45 225 60
Rectangle -16777216 true false 225 75 240 90
Rectangle -16777216 true false 225 90 240 105
Rectangle -16777216 true false 225 105 240 120
Rectangle -16777216 true false 210 112 225 127
Rectangle -5825686 true false 75 135 90 150
Rectangle -5825686 true false 45 195 60 210
Rectangle -955883 true false 240 210 255 225
Rectangle -955883 true false 240 225 255 240
Rectangle -955883 true false 105 90 120 105
Rectangle -955883 true false 30 90 45 105
Rectangle -955883 true false 45 90 60 105
Rectangle -955883 true false 60 90 75 105
Rectangle -955883 true false 75 90 90 105
Rectangle -955883 true false 90 90 105 105
Rectangle -955883 true false 30 105 45 120
Rectangle -955883 true false 15 105 30 120
Rectangle -955883 true false 15 120 30 135
Rectangle -955883 true false 15 135 30 150
Rectangle -955883 true false 15 150 30 165
Rectangle -955883 true false 15 165 30 180
Rectangle -955883 true false 15 180 30 195
Rectangle -955883 true false 15 195 30 210
Rectangle -955883 true false 15 210 30 225
Rectangle -955883 true false 15 225 30 240
Rectangle -955883 true false 45 105 60 120
Rectangle -955883 true false 30 120 45 135
Rectangle -16777216 true false 270 120 285 135
Rectangle -16777216 true false 270 75 285 90
Rectangle -16777216 true false 285 75 300 90
Rectangle -16777216 true false 285 90 300 105
Rectangle -16777216 true false 285 105 300 120
Rectangle -16777216 true false 270 210 285 225
Rectangle -16777216 true false 285 195 300 210
Rectangle -16777216 true false 285 180 300 195
Rectangle -16777216 true false 285 165 300 180
Rectangle -16777216 true false 270 165 285 180
Rectangle -2064490 true false 225 225 240 240
Rectangle -2064490 true false 135 225 150 240
Rectangle -2064490 true false 120 225 135 240
Rectangle -2064490 true false 105 225 120 240
Rectangle -2064490 true false 90 225 105 240
Rectangle -2064490 true false 75 210 90 240
Rectangle -2064490 true false 60 105 75 240
Rectangle -2064490 true false 45 225 60 240
Rectangle -2064490 true false 30 135 45 240
Rectangle -2064490 true false 45 210 60 225
Rectangle -2064490 true false 45 120 60 195
Rectangle -2064490 true false 75 150 90 180
Rectangle -2064490 true false 75 120 90 135
Rectangle -2064490 true false 90 105 105 165
Rectangle -2064490 true false 105 105 120 150
Rectangle -2064490 true false 75 105 90 120
Rectangle -7500403 true true 90 180 105 210
Rectangle -7500403 true true 270 180 285 210
Rectangle -7500403 true true 270 90 285 120
Rectangle -7500403 true true 180 90 195 105
Rectangle -7500403 true true 180 120 195 135
Rectangle -7500403 true true 165 105 180 120
Rectangle -7500403 true true 180 127 195 142
Rectangle -7500403 true true 210 142 225 157
Rectangle -7500403 true true 210 157 225 172
Rectangle -7500403 true true 180 142 195 157
Rectangle -16777216 true false 180 150 195 165
Rectangle -7500403 true true 210 172 225 187
Rectangle -2064490 true false 210 180 225 195
Rectangle -16777216 true false 210 150 225 165
Rectangle -7500403 true true 210 127 225 142
Rectangle -7500403 true true 210 97 225 112
Rectangle -7500403 true true 210 82 225 97
Rectangle -16777216 true false 210 75 225 90
Rectangle -7500403 true true 195 60 210 180
Rectangle -7500403 true true 165 142 180 157
Rectangle -7500403 true true 165 127 180 142
Rectangle -16777216 true false 165 150 180 165
Rectangle -7500403 true true 165 112 180 127
Rectangle -7500403 true true 165 97 180 112
Rectangle -7500403 true true 165 82 180 97
Rectangle -1 true false 165 75 180 90
Rectangle -7500403 true true 210 60 225 75
Rectangle -7500403 true true 225 60 240 75
Rectangle -7500403 true true 240 45 255 165
Rectangle -7500403 true true 225 165 240 180
Rectangle -7500403 true true 240 165 255 180
Rectangle -7500403 true true 225 180 255 195
Rectangle -7500403 true true 225 195 240 210
Rectangle -7500403 true true 225 30 240 45
Rectangle -7500403 true true 225 45 240 60
Rectangle -7500403 true true 150 15 225 30
Rectangle -7500403 true true 105 30 195 60
Rectangle -7500403 true true 90 45 105 60
Rectangle -7500403 true true 90 30 105 45
Rectangle -7500403 true true 150 60 165 225
Rectangle -7500403 true true 165 210 225 225
Rectangle -7500403 true true 165 180 195 210
Rectangle -7500403 true true 135 60 150 210
Rectangle -7500403 true true 120 150 135 210
Rectangle -7500403 true true 105 165 120 210
Rectangle -7500403 true true 105 60 120 75
Rectangle -7500403 true true 120 60 135 90

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

poof1
true
0
Rectangle -16777216 true false 135 300 150 315
Rectangle -16777216 true false 135 300 150 315
Rectangle -16777216 true false 195 270 210 285
Rectangle -16777216 true false 180 285 210 300
Rectangle -16777216 true false 150 270 165 285
Rectangle -16777216 true false 135 225 150 255
Rectangle -16777216 true false 150 255 165 270
Rectangle -16777216 true false 180 195 195 210
Rectangle -16777216 true false 180 210 195 225
Rectangle -16777216 true false 165 210 180 225
Rectangle -16777216 true false 165 225 180 240
Rectangle -16777216 true false 135 195 150 210
Rectangle -16777216 true false 135 210 150 225
Rectangle -16777216 true false 135 225 150 240
Rectangle -16777216 true false 180 240 195 255
Rectangle -16777216 true false 195 255 210 270
Rectangle -16777216 true false 0 135 15 150
Rectangle -16777216 true false 15 165 30 180
Rectangle -16777216 true false 30 180 45 195
Rectangle -16777216 true false 45 180 60 195
Rectangle -16777216 true false 60 180 75 195
Rectangle -16777216 true false 75 180 90 195
Rectangle -16777216 true false 90 180 105 195
Rectangle -16777216 true false 105 180 120 195
Rectangle -16777216 true false 120 180 135 195
Rectangle -16777216 true false 285 135 300 150
Rectangle -16777216 true false 285 120 300 135
Rectangle -16777216 true false 285 105 300 120
Rectangle -16777216 true false 270 105 285 120
Rectangle -16777216 true false 255 105 270 120
Rectangle -16777216 true false 255 120 270 135
Rectangle -16777216 true false 270 150 285 165
Rectangle -16777216 true false 255 135 270 150
Rectangle -16777216 true false 255 150 270 165
Rectangle -16777216 true false 255 165 270 180
Rectangle -16777216 true false 270 180 285 195
Rectangle -16777216 true false 285 195 300 210
Rectangle -16777216 true false 285 210 300 225
Rectangle -16777216 true false 285 225 300 240
Rectangle -16777216 true false 270 225 285 240
Rectangle -16777216 true false 255 225 270 240
Rectangle -16777216 true false 240 180 255 195
Rectangle -16777216 true false 240 195 255 210
Rectangle -16777216 true false 240 210 255 225
Rectangle -16777216 true false 225 195 240 210
Rectangle -16777216 true false 225 180 240 195
Rectangle -16777216 true false 210 180 225 195
Rectangle -16777216 true false 195 180 210 195
Rectangle -16777216 true false 180 180 195 195
Rectangle -16777216 true false 165 180 180 195
Rectangle -16777216 true false 150 180 165 195
Rectangle -7500403 true true 135 180 150 195
Rectangle -7500403 true true 135 180 150 195
Rectangle -7500403 true true 135 180 150 195
Rectangle -16777216 true false 135 180 150 195
Rectangle -16777216 true false 0 150 15 165
Rectangle -16777216 true false 255 90 270 105
Rectangle -16777216 true false 0 45 15 60
Rectangle -16777216 true false 0 60 15 75
Rectangle -16777216 true false 0 75 15 90
Rectangle -16777216 true false 0 90 15 105
Rectangle -16777216 true false 0 105 15 120
Rectangle -16777216 true false 0 120 15 135
Rectangle -955883 true false 165 165 180 180
Rectangle -955883 true false 225 165 240 180
Rectangle -955883 true false 135 165 150 180
Rectangle -955883 true false 240 105 255 120
Rectangle -955883 true false 150 165 165 180
Rectangle -16777216 true false 240 165 255 180
Rectangle -955883 true false 240 150 255 165
Rectangle -955883 true false 120 165 135 180
Rectangle -955883 true false 240 120 255 135
Rectangle -955883 true false 180 165 195 180
Rectangle -955883 true false 210 165 225 180
Rectangle -16777216 true false 150 195 165 210
Rectangle -955883 true false 195 165 210 180
Rectangle -16777216 true false 255 45 270 60
Rectangle -16777216 true false 255 60 270 75
Rectangle -16777216 true false 255 75 270 90
Rectangle -955883 true false 225 150 240 165
Rectangle -955883 true false 210 150 225 165
Rectangle -955883 true false 15 45 30 60
Rectangle -955883 true false 15 90 30 105
Rectangle -955883 true false 15 105 30 120
Rectangle -955883 true false 15 120 30 135
Rectangle -955883 true false 15 150 30 165
Rectangle -955883 true false 240 45 255 60
Rectangle -955883 true false 240 60 255 75
Rectangle -955883 true false 240 75 255 90
Rectangle -955883 true false 240 90 255 105
Rectangle -955883 true false 90 165 105 180
Rectangle -955883 true false 75 165 90 180
Rectangle -955883 true false 30 165 45 180
Rectangle -955883 true false 60 165 75 180
Rectangle -955883 true false 45 165 60 180
Rectangle -955883 true false 105 165 120 180
Rectangle -955883 true false 45 150 60 165
Rectangle -955883 true false 30 135 45 150
Rectangle -955883 true false 30 150 45 165
Rectangle -5825686 true false 195 75 210 90
Rectangle -955883 true false 240 135 255 150
Rectangle -5825686 true false 210 120 225 135
Rectangle -5825686 true false 135 105 150 120
Rectangle -955883 true false 15 135 30 150
Rectangle -5825686 true false 165 135 180 150
Rectangle -5825686 true false 60 120 75 135
Rectangle -955883 true false 15 75 30 90
Rectangle -955883 true false 15 60 30 75
Rectangle -955883 true false 225 135 240 150
Rectangle -5825686 true false 150 45 165 60
Rectangle -5825686 true false 105 60 120 75
Rectangle -5825686 true false 45 45 60 60
Rectangle -7500403 true true 180 270 195 285
Rectangle -7500403 true true 165 255 180 270
Rectangle -7500403 true true 150 240 165 255
Rectangle -7500403 true true 150 210 165 225
Rectangle -7500403 true true 150 225 165 240
Rectangle -7500403 true true 165 240 180 255
Rectangle -7500403 true true 180 255 195 270
Rectangle -7500403 true true 165 195 180 210
Rectangle -7500403 true true 270 195 285 210
Rectangle -7500403 true true 270 210 285 225
Rectangle -7500403 true true 255 180 270 195
Rectangle -7500403 true true 255 195 270 210
Rectangle -7500403 true true 255 210 270 225
Rectangle -7500403 true true 270 120 285 135
Rectangle -7500403 true true 270 135 285 150
Rectangle -2064490 true false 75 120 165 165
Rectangle -2064490 true false 60 150 75 165
Rectangle -2064490 true false 45 60 60 150
Rectangle -2064490 true false 60 135 75 150
Rectangle -2064490 true false 30 45 45 135
Rectangle -2064490 true false 165 150 210 165
Rectangle -2064490 true false 180 45 195 150
Rectangle -2064490 true false 195 90 210 150
Rectangle -2064490 true false 210 135 225 150
Rectangle -2064490 true false 225 45 240 135
Rectangle -2064490 true false 210 45 225 120
Rectangle -2064490 true false 195 45 210 75
Rectangle -2064490 true false 165 45 180 135
Rectangle -2064490 true false 150 60 165 120
Rectangle -2064490 true false 60 75 135 120
Rectangle -2064490 true false 105 45 150 60
Rectangle -2064490 true false 120 60 135 75
Rectangle -2064490 true false 135 60 150 105
Rectangle -2064490 true false 60 45 105 75

poof2
true
0
Rectangle -7500403 true true 225 60 240 180
Rectangle -16777216 true false 0 225 15 240
Rectangle -16777216 true false 255 135 270 150
Rectangle -16777216 true false 165 225 180 240
Rectangle -16777216 true false 195 225 210 240
Rectangle -16777216 true false 255 225 270 240
Rectangle -16777216 true false 240 195 255 210
Rectangle -16777216 true false 255 195 270 210
Rectangle -16777216 true false 255 180 270 195
Rectangle -16777216 true false 255 120 270 135
Rectangle -16777216 true false 255 165 270 180
Rectangle -16777216 true false 255 210 270 225
Rectangle -16777216 true false 120 120 135 135
Rectangle -16777216 true false 120 90 135 105
Rectangle -16777216 true false 120 105 135 120
Rectangle -16777216 true false 0 105 15 120
Rectangle -16777216 true false 225 210 240 225
Rectangle -16777216 true false 210 225 225 240
Rectangle -16777216 true false 255 150 270 165
Rectangle -16777216 true false 255 105 270 120
Rectangle -16777216 true false 180 105 195 120
Rectangle -16777216 true false 180 75 195 90
Rectangle -1 true false 180 60 195 75
Rectangle -16777216 true false 90 75 105 90
Rectangle -16777216 true false 105 75 120 90
Rectangle -16777216 true false 75 75 90 90
Rectangle -16777216 true false 60 75 75 90
Rectangle -16777216 true false 45 75 60 90
Rectangle -16777216 true false 30 75 45 90
Rectangle -16777216 true false 15 90 30 105
Rectangle -16777216 true false 0 120 15 135
Rectangle -16777216 true false 0 135 15 150
Rectangle -16777216 true false 0 150 15 165
Rectangle -16777216 true false 0 165 15 180
Rectangle -16777216 true false 0 180 15 195
Rectangle -16777216 true false 0 195 15 210
Rectangle -16777216 true false 0 210 15 225
Rectangle -16777216 true false 150 225 165 240
Rectangle -16777216 true false 105 150 120 165
Rectangle -16777216 true false 105 210 120 225
Rectangle -16777216 true false 120 210 135 225
Rectangle -16777216 true false 180 225 195 240
Rectangle -16777216 true false 90 210 105 225
Rectangle -16777216 true false 135 210 150 225
Rectangle -16777216 true false 90 165 105 180
Rectangle -7500403 true true 195 180 210 195
Rectangle -7500403 true true 195 195 210 210
Rectangle -7500403 true true 210 195 225 210
Rectangle -16777216 true false 180 165 195 180
Rectangle -16777216 true false 75 180 90 195
Rectangle -16777216 true false 75 195 90 210
Rectangle -16777216 true false 120 135 135 150
Rectangle -16777216 true false 75 45 90 60
Rectangle -16777216 true false 90 60 105 75
Rectangle -16777216 true false 75 30 90 45
Rectangle -16777216 true false 105 15 120 30
Rectangle -16777216 true false 90 15 105 30
Rectangle -16777216 true false 120 15 135 30
Rectangle -16777216 true false 150 0 165 15
Rectangle -16777216 true false 135 15 150 30
Rectangle -16777216 true false 180 0 195 15
Rectangle -16777216 true false 165 0 180 15
Rectangle -16777216 true false 195 0 210 15
Rectangle -16777216 true false 210 0 225 15
Rectangle -16777216 true false 225 15 240 30
Rectangle -16777216 true false 240 30 255 45
Rectangle -16777216 true false 255 45 270 60
Rectangle -16777216 true false 255 60 270 75
Rectangle -16777216 true false 255 75 270 90
Rectangle -16777216 true false 255 90 270 105
Rectangle -7500403 true true 195 45 210 60
Rectangle -7500403 true true 210 30 225 45
Rectangle -7500403 true true 195 30 210 45
Rectangle -7500403 true true 210 45 225 60
Rectangle -16777216 true false 225 97 240 112
Rectangle -5825686 true false 75 135 90 150
Rectangle -5825686 true false 45 195 60 210
Rectangle -955883 true false 240 210 255 225
Rectangle -955883 true false 240 225 255 240
Rectangle -955883 true false 105 90 120 105
Rectangle -955883 true false 30 90 45 105
Rectangle -955883 true false 45 90 60 105
Rectangle -955883 true false 60 90 75 105
Rectangle -955883 true false 75 90 90 105
Rectangle -955883 true false 90 90 105 105
Rectangle -955883 true false 30 105 45 120
Rectangle -955883 true false 15 105 30 120
Rectangle -955883 true false 15 120 30 135
Rectangle -955883 true false 15 135 30 150
Rectangle -955883 true false 15 150 30 165
Rectangle -955883 true false 15 165 30 180
Rectangle -955883 true false 15 180 30 195
Rectangle -955883 true false 15 195 30 210
Rectangle -955883 true false 15 210 30 225
Rectangle -955883 true false 15 225 30 240
Rectangle -955883 true false 45 105 60 120
Rectangle -955883 true false 30 120 45 135
Rectangle -16777216 true false 270 120 285 135
Rectangle -16777216 true false 270 75 285 90
Rectangle -16777216 true false 285 75 300 90
Rectangle -16777216 true false 285 90 300 105
Rectangle -16777216 true false 285 105 300 120
Rectangle -16777216 true false 270 210 285 225
Rectangle -16777216 true false 285 195 300 210
Rectangle -16777216 true false 285 180 300 195
Rectangle -16777216 true false 285 165 300 180
Rectangle -16777216 true false 270 165 285 180
Rectangle -2064490 true false 225 225 240 240
Rectangle -2064490 true false 135 225 150 240
Rectangle -2064490 true false 120 225 135 240
Rectangle -2064490 true false 105 225 120 240
Rectangle -2064490 true false 90 225 105 240
Rectangle -2064490 true false 75 210 90 240
Rectangle -2064490 true false 60 105 75 240
Rectangle -2064490 true false 45 225 60 240
Rectangle -2064490 true false 30 135 45 240
Rectangle -2064490 true false 45 210 60 225
Rectangle -2064490 true false 45 120 60 195
Rectangle -2064490 true false 75 150 90 180
Rectangle -2064490 true false 75 120 90 135
Rectangle -2064490 true false 90 105 105 165
Rectangle -2064490 true false 105 105 120 150
Rectangle -2064490 true false 75 105 90 120
Rectangle -7500403 true true 90 180 105 210
Rectangle -7500403 true true 270 180 285 210
Rectangle -7500403 true true 270 90 285 120
Rectangle -7500403 true true 180 90 195 105
Rectangle -7500403 true true 180 120 195 135
Rectangle -7500403 true true 165 105 180 120
Rectangle -7500403 true true 180 127 195 142
Rectangle -7500403 true true 210 142 225 157
Rectangle -7500403 true true 210 157 225 172
Rectangle -7500403 true true 180 142 195 157
Rectangle -1 true false 180 150 195 165
Rectangle -7500403 true true 210 172 225 187
Rectangle -7500403 true true 210 180 225 195
Rectangle -7500403 true true 210 127 225 142
Rectangle -7500403 true true 210 97 225 112
Rectangle -7500403 true true 210 82 225 97
Rectangle -7500403 true true 195 60 210 180
Rectangle -7500403 true true 165 142 180 157
Rectangle -7500403 true true 165 127 180 142
Rectangle -7500403 true true 165 112 180 127
Rectangle -7500403 true true 165 97 180 112
Rectangle -7500403 true true 165 82 180 97
Rectangle -7500403 true true 210 60 225 75
Rectangle -7500403 true true 225 60 240 75
Rectangle -7500403 true true 240 45 255 165
Rectangle -7500403 true true 225 165 240 180
Rectangle -7500403 true true 240 165 255 180
Rectangle -7500403 true true 225 180 255 195
Rectangle -7500403 true true 225 195 240 210
Rectangle -7500403 true true 225 30 240 45
Rectangle -7500403 true true 225 45 240 60
Rectangle -7500403 true true 150 15 225 30
Rectangle -7500403 true true 105 30 195 60
Rectangle -7500403 true true 90 45 105 60
Rectangle -7500403 true true 90 30 105 45
Rectangle -7500403 true true 150 60 165 225
Rectangle -7500403 true true 165 210 225 225
Rectangle -7500403 true true 165 180 195 210
Rectangle -7500403 true true 135 60 150 210
Rectangle -7500403 true true 120 150 135 210
Rectangle -7500403 true true 105 165 120 210
Rectangle -7500403 true true 105 60 120 75
Rectangle -7500403 true true 120 60 135 90
Rectangle -7500403 true true 165 150 180 187
Rectangle -7500403 true true 165 60 180 82
Rectangle -16777216 true false 240 165 255 180
Rectangle -16777216 true false 225 150 240 165
Rectangle -16777216 true false 225 135 240 150
Rectangle -16777216 true false 225 120 240 135
Rectangle -7500403 true true 210 105 225 135
Rectangle -16777216 true false 225 105 240 120
Rectangle -16777216 true false 225 45 240 60
Rectangle -16777216 true false 225 60 240 105
Rectangle -7500403 true true 210 75 225 90
Rectangle -16777216 true false 165 165 180 180
Rectangle -16777216 true false 165 150 180 165
Rectangle -16777216 true false 165 75 180 90
Rectangle -16777216 true false 165 60 180 75

sheep
false
0
Rectangle -7500403 true true 151 225 180 285
Rectangle -7500403 true true 47 225 75 285
Rectangle -7500403 true true 15 75 210 225
Circle -7500403 true true 135 75 150
Circle -16777216 true false 165 76 116

sprinkle bullet
true
13
Circle -2064490 true true 120 15 60
Rectangle -2064490 true true 120 45 180 225
Rectangle -7500403 true false 105 165 195 165
Rectangle -7500403 true false 105 255 195 165
Rectangle -7500403 true false 105 255 150 255
Rectangle -7500403 true false 105 255 195 255
Polygon -2064490 true true 120 180 105 270 195 270 180 180

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

squarez
true
0
Rectangle -7500403 true true 0 0 300 300
Rectangle -6459832 true false 15 15 285 285
Rectangle -7500403 true true 225 30 270 75
Rectangle -7500403 true true 165 30 210 75
Rectangle -7500403 true true 90 30 135 75
Rectangle -7500403 true true 30 90 75 135
Rectangle -7500403 true true 30 30 75 75
Rectangle -7500403 true true 90 90 135 135
Rectangle -7500403 true true 165 90 210 135
Rectangle -7500403 true true 225 90 270 135
Rectangle -7500403 true true 225 165 270 210
Rectangle -7500403 true true 225 225 270 270
Rectangle -7500403 true true 165 225 210 270
Rectangle -7500403 true true 165 165 210 210
Rectangle -7500403 true true 90 165 135 210
Rectangle -7500403 true true 90 225 135 270
Rectangle -7500403 true true 30 225 75 270
Rectangle -7500403 true true 30 165 75 210

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

tac nayn1
true
1
Rectangle -16777216 true false 135 90 150 240
Rectangle -16777216 true false 0 60 15 75
Rectangle -16777216 true false 255 150 270 165
Rectangle -16777216 true false 165 60 180 75
Rectangle -16777216 true false 195 60 210 75
Rectangle -16777216 true false 255 60 270 75
Rectangle -16777216 true false 240 90 255 105
Rectangle -16777216 true false 255 90 270 105
Rectangle -16777216 true false 255 105 270 120
Rectangle -16777216 true false 255 165 270 180
Rectangle -16777216 true false 255 120 270 135
Rectangle -16777216 true false 255 75 270 90
Rectangle -16777216 true false 120 195 135 210
Rectangle -16777216 true false 0 180 15 195
Rectangle -16777216 true false 225 75 240 90
Rectangle -16777216 true false 210 60 225 75
Rectangle -16777216 true false 255 135 270 150
Rectangle -16777216 true false 255 180 270 195
Rectangle -16777216 true false 225 135 240 150
Rectangle -16777216 true false 225 150 240 165
Rectangle -16777216 true false 225 165 240 180
Rectangle -16777216 true false 180 180 195 195
Rectangle -2674135 true true 180 210 195 225
Rectangle -2674135 true true 165 225 180 240
Rectangle -2674135 true true 180 225 195 240
Rectangle -16777216 true false 90 210 105 225
Rectangle -16777216 true false 105 210 120 225
Rectangle -16777216 true false 75 210 90 225
Rectangle -16777216 true false 60 210 75 225
Rectangle -16777216 true false 45 210 60 225
Rectangle -16777216 true false 30 210 45 225
Rectangle -16777216 true false 15 195 30 210
Rectangle -16777216 true false 0 165 15 180
Rectangle -16777216 true false 0 150 15 165
Rectangle -16777216 true false 0 135 15 150
Rectangle -16777216 true false 0 120 15 135
Rectangle -16777216 true false 0 105 15 120
Rectangle -16777216 true false 0 90 15 105
Rectangle -16777216 true false 0 75 15 90
Rectangle -16777216 true false 150 60 165 75
Rectangle -16777216 true false 180 60 195 75
Rectangle -2064490 true false 195 105 210 120
Rectangle -2064490 true false 195 90 210 105
Rectangle -2064490 true false 210 90 225 105
Rectangle -2674135 true true 180 120 195 135
Rectangle -1 true false 165 120 180 135
Rectangle -16777216 true false 75 240 90 255
Rectangle -16777216 true false 90 225 105 240
Rectangle -16777216 true false 75 255 90 270
Rectangle -16777216 true false 105 270 120 285
Rectangle -16777216 true false 90 270 105 285
Rectangle -16777216 true false 120 270 135 285
Rectangle -16777216 true false 150 285 165 300
Rectangle -16777216 true false 135 270 150 285
Rectangle -16777216 true false 180 285 195 300
Rectangle -16777216 true false 165 285 180 300
Rectangle -16777216 true false 195 285 210 300
Rectangle -16777216 true false 210 285 225 300
Rectangle -16777216 true false 225 270 240 285
Rectangle -16777216 true false 240 255 255 270
Rectangle -16777216 true false 255 240 270 255
Rectangle -16777216 true false 255 225 270 240
Rectangle -16777216 true false 255 210 270 225
Rectangle -16777216 true false 255 195 270 210
Rectangle -2064490 true false 195 240 210 255
Rectangle -2064490 true false 210 255 225 270
Rectangle -2064490 true false 195 255 210 270
Rectangle -2064490 true false 210 240 225 255
Rectangle -16777216 true false 225 210 240 225
Rectangle -16777216 true false 225 195 240 210
Rectangle -16777216 true false 225 180 240 195
Rectangle -16777216 true false 210 173 225 188
Rectangle -955883 true false 75 150 90 165
Rectangle -955883 true false 45 90 60 105
Rectangle -955883 true false 240 75 255 90
Rectangle -955883 true false 240 60 255 75
Rectangle -955883 true false 105 195 120 210
Rectangle -955883 true false 30 195 45 210
Rectangle -955883 true false 45 195 60 210
Rectangle -955883 true false 60 195 75 210
Rectangle -955883 true false 75 195 90 210
Rectangle -955883 true false 90 195 105 210
Rectangle -955883 true false 30 180 45 195
Rectangle -955883 true false 15 180 30 195
Rectangle -955883 true false 15 165 30 180
Rectangle -955883 true false 15 150 30 165
Rectangle -955883 true false 15 135 30 150
Rectangle -955883 true false 15 120 30 135
Rectangle -955883 true false 15 105 30 120
Rectangle -955883 true false 15 90 30 105
Rectangle -955883 true false 15 75 30 90
Rectangle -955883 true false 15 60 30 75
Rectangle -955883 true false 45 180 60 195
Rectangle -955883 true false 30 165 45 180
Rectangle -16777216 true false 270 165 285 180
Rectangle -16777216 true false 270 210 285 225
Rectangle -16777216 true false 285 210 300 225
Rectangle -16777216 true false 285 195 300 210
Rectangle -16777216 true false 285 180 300 195
Rectangle -16777216 true false 270 75 285 90
Rectangle -16777216 true false 285 90 300 105
Rectangle -16777216 true false 285 105 300 120
Rectangle -16777216 true false 285 120 300 135
Rectangle -16777216 true false 270 120 285 135
Rectangle -955883 true false 225 60 240 75
Rectangle -955883 true false 135 60 150 75
Rectangle -955883 true false 120 60 135 75
Rectangle -955883 true false 105 60 120 75
Rectangle -955883 true false 90 60 105 75
Rectangle -955883 true false 75 60 90 90
Rectangle -955883 true false 45 60 60 75
Rectangle -955883 true false 30 60 45 165
Rectangle -955883 true false 45 75 60 90
Rectangle -955883 true false 45 105 60 180
Rectangle -955883 true false 75 120 90 150
Rectangle -955883 true false 75 165 90 180
Rectangle -955883 true false 90 135 105 195
Rectangle -955883 true false 105 150 120 195
Rectangle -955883 true false 75 180 90 195
Rectangle -16777216 true false 270 90 285 120
Rectangle -16777216 true false 270 180 285 210
Rectangle -16777216 true false 180 195 195 210
Rectangle -16777216 true false 180 165 195 180
Rectangle -7500403 true false 165 180 180 195
Rectangle -16777216 true false 180 158 195 173
Rectangle -16777216 true false 210 143 225 158
Rectangle -16777216 true false 210 128 225 143
Rectangle -16777216 true false 180 143 195 158
Rectangle -2674135 true true 180 135 195 150
Rectangle -7500403 true false 210 113 225 128
Rectangle -16777216 true false 210 120 225 135
Rectangle -16777216 true false 210 158 225 173
Rectangle -16777216 true false 210 188 225 203
Rectangle -16777216 true false 210 203 225 218
Rectangle -16777216 true false 210 210 225 225
Rectangle -16777216 true false 195 120 210 240
Rectangle -16777216 true false 165 143 180 158
Rectangle -16777216 true false 165 158 180 173
Rectangle -2674135 true true 165 135 180 150
Rectangle -16777216 true false 165 173 180 188
Rectangle -16777216 true false 165 188 180 203
Rectangle -16777216 true false 165 203 180 218
Rectangle -1 true false 165 210 180 225
Rectangle -16777216 true false 210 225 225 240
Rectangle -16777216 true false 225 225 240 240
Rectangle -16777216 true false 240 135 255 255
Rectangle -16777216 true false 240 120 255 135
Rectangle -16777216 true false 225 105 255 120
Rectangle -16777216 true false 225 90 240 105
Rectangle -16777216 true false 225 255 240 270
Rectangle -16777216 true false 225 240 240 255
Rectangle -16777216 true false 150 270 225 285
Rectangle -16777216 true false 104 240 194 270
Rectangle -16777216 true false 90 240 105 255
Rectangle -16777216 true false 90 255 105 270
Rectangle -16777216 true false 150 75 165 240
Rectangle -16777216 true false 165 75 225 90
Rectangle -16777216 true false 165 90 195 120
Rectangle -16777216 true false 105 225 120 240
Rectangle -16777216 true false 120 210 135 240
Rectangle -16777216 true false 210 128 225 143
Rectangle -2064490 true false 210 105 225 120
Rectangle -16777216 true false 225 120 240 135
Rectangle -955883 true false 60 60 75 195
Rectangle -6459832 true false 45 120 75 150
Rectangle -6459832 true false 45 75 75 105
Rectangle -6459832 true false 90 120 120 150
Rectangle -16777216 true false 120 165 135 180
Rectangle -16777216 true false 120 180 135 195
Rectangle -16777216 true false 90 120 105 135
Rectangle -16777216 true false 75 105 90 120
Rectangle -16777216 true false 120 150 135 165
Rectangle -6459832 true false 90 75 135 120
Rectangle -16777216 true false 90 75 105 90
Rectangle -16777216 true false 90 90 105 120
Rectangle -16777216 true false 105 90 120 135
Rectangle -16777216 true false 105 75 120 90
Rectangle -16777216 true false 105 135 120 150
Rectangle -16777216 true false 120 90 135 150
Rectangle -16777216 true false 120 75 135 90
Rectangle -16777216 true false 135 75 150 90
Rectangle -1 true false 226 216 241 231
Rectangle -1 true false 227 179 242 194
Rectangle -1 true false 226 127 241 142
Rectangle -1 true false 212 216 227 231
Rectangle -1 true false 212 201 227 216
Rectangle -1 true false 212 186 227 201
Rectangle -1 true false 212 171 227 186
Rectangle -1 true false 212 157 227 172
Rectangle -1 true false 212 142 227 157
Rectangle -1 true false 212 127 227 142
Rectangle -2674135 true true 148 145 159 154
Rectangle -2674135 true true 143 126 151 134
Rectangle -2674135 true true 145 133 153 141
Rectangle -2674135 true true 147 138 158 147
Rectangle -2674135 true true 139 117 147 125
Rectangle -2674135 true true 141 123 149 131
Rectangle -2674135 true true 136 113 144 121
Rectangle -2674135 true true 136 105 144 112
Rectangle -2674135 true true 133 109 141 117
Rectangle -2674135 true true 138 109 146 117
Rectangle -2674135 true true 131 103 139 111
Rectangle -2674135 true true 136 100 144 108
Rectangle -2674135 true true 131 99 139 107
Rectangle -2674135 true true 149 206 160 215
Rectangle -2674135 true true 149 206 160 215
Rectangle -2674135 true true 146 214 157 223
Rectangle -2674135 true true 142 221 153 230
Rectangle -2674135 true true 139 227 150 236
Rectangle -2674135 true true 133 234 144 243
Rectangle -2674135 true true 129 241 140 250
Rectangle -2674135 true true 133 243 144 252
Rectangle -2674135 true true 127 250 138 259
Rectangle -2674135 true true 127 248 139 259
Rectangle -2674135 true true 130 245 142 256
Rectangle -16777216 true false 75 90 90 105
Rectangle -6459832 true false 45 165 75 195
Rectangle -6459832 true false 90 165 120 195

tac nayn2
true
0
Rectangle -16777216 true false 135 -15 150 0
Rectangle -16777216 true false 135 -15 150 0
Rectangle -16777216 true false 150 15 165 30
Rectangle -16777216 true false 135 0 165 15
Rectangle -16777216 true false 120 15 135 30
Rectangle -16777216 true false 120 45 135 75
Rectangle -16777216 true false 120 30 135 45
Rectangle -16777216 true false 180 90 195 105
Rectangle -16777216 true false 180 75 195 90
Rectangle -16777216 true false 165 75 180 90
Rectangle -16777216 true false 165 60 180 75
Rectangle -16777216 true false 135 90 150 105
Rectangle -16777216 true false 135 75 150 90
Rectangle -16777216 true false 135 60 150 75
Rectangle -16777216 true false 165 45 180 60
Rectangle -16777216 true false 165 30 180 45
Rectangle -16777216 true false 0 150 15 165
Rectangle -16777216 true false 15 120 30 135
Rectangle -16777216 true false 30 105 45 120
Rectangle -16777216 true false 45 105 60 120
Rectangle -16777216 true false 60 105 75 120
Rectangle -16777216 true false 75 105 90 120
Rectangle -16777216 true false 90 105 105 120
Rectangle -16777216 true false 105 105 120 120
Rectangle -16777216 true false 120 105 135 120
Rectangle -16777216 true false 285 150 300 165
Rectangle -16777216 true false 285 165 300 180
Rectangle -16777216 true false 285 180 300 195
Rectangle -16777216 true false 270 180 285 195
Rectangle -16777216 true false 255 180 270 195
Rectangle -16777216 true false 255 165 270 180
Rectangle -16777216 true false 270 135 285 150
Rectangle -16777216 true false 255 150 270 165
Rectangle -16777216 true false 255 135 270 150
Rectangle -16777216 true false 255 120 270 135
Rectangle -16777216 true false 270 105 285 120
Rectangle -16777216 true false 285 90 300 105
Rectangle -16777216 true false 285 75 300 90
Rectangle -16777216 true false 285 60 300 75
Rectangle -16777216 true false 270 60 285 75
Rectangle -16777216 true false 255 60 270 75
Rectangle -16777216 true false 240 105 255 120
Rectangle -16777216 true false 240 90 255 105
Rectangle -16777216 true false 240 75 255 90
Rectangle -16777216 true false 225 90 240 105
Rectangle -16777216 true false 225 105 240 120
Rectangle -16777216 true false 210 105 225 120
Rectangle -16777216 true false 195 105 210 120
Rectangle -16777216 true false 180 105 195 120
Rectangle -16777216 true false 165 105 180 120
Rectangle -16777216 true false 150 105 165 120
Rectangle -7500403 true true 135 105 150 120
Rectangle -7500403 true true 135 105 150 120
Rectangle -7500403 true true 135 105 150 120
Rectangle -16777216 true false 135 105 150 120
Rectangle -16777216 true false 0 135 15 150
Rectangle -16777216 true false 255 195 270 210
Rectangle -16777216 true false 0 240 15 255
Rectangle -16777216 true false 0 225 15 240
Rectangle -16777216 true false 0 210 15 225
Rectangle -16777216 true false 0 195 15 210
Rectangle -16777216 true false 0 180 15 195
Rectangle -16777216 true false 0 165 15 180
Rectangle -955883 true false 165 120 180 135
Rectangle -955883 true false 225 120 240 135
Rectangle -955883 true false 135 120 150 135
Rectangle -955883 true false 240 180 255 195
Rectangle -955883 true false 150 120 165 135
Rectangle -16777216 true false 240 120 255 135
Rectangle -955883 true false 240 135 255 150
Rectangle -955883 true false 120 120 135 135
Rectangle -955883 true false 240 165 255 180
Rectangle -955883 true false 180 120 195 135
Rectangle -955883 true false 210 120 225 135
Rectangle -16777216 true false 150 90 165 105
Rectangle -955883 true false 195 120 210 135
Rectangle -16777216 true false 255 240 270 255
Rectangle -16777216 true false 255 225 270 240
Rectangle -16777216 true false 255 210 270 225
Rectangle -955883 true false 225 135 240 150
Rectangle -955883 true false 210 135 225 150
Rectangle -955883 true false 15 240 30 255
Rectangle -955883 true false 15 195 30 210
Rectangle -955883 true false 15 180 30 195
Rectangle -955883 true false 15 165 30 180
Rectangle -955883 true false 15 135 30 150
Rectangle -955883 true false 240 240 255 255
Rectangle -955883 true false 240 225 255 240
Rectangle -955883 true false 240 210 255 225
Rectangle -955883 true false 240 195 255 210
Rectangle -955883 true false 90 120 105 135
Rectangle -955883 true false 75 120 90 135
Rectangle -955883 true false 30 120 45 135
Rectangle -955883 true false 60 120 75 135
Rectangle -955883 true false 45 120 60 135
Rectangle -955883 true false 105 120 120 135
Rectangle -955883 true false 45 135 60 150
Rectangle -955883 true false 30 150 45 165
Rectangle -955883 true false 30 135 45 150
Rectangle -955883 true false 195 210 210 225
Rectangle -955883 true false 240 150 255 165
Rectangle -955883 true false 210 165 225 180
Rectangle -955883 true false 135 180 150 195
Rectangle -955883 true false 15 150 30 165
Rectangle -955883 true false 165 150 180 165
Rectangle -955883 true false 60 165 75 180
Rectangle -955883 true false 15 210 30 225
Rectangle -955883 true false 15 225 30 240
Rectangle -955883 true false 225 150 240 165
Rectangle -955883 true false 150 240 165 255
Rectangle -955883 true false 105 225 120 240
Rectangle -955883 true false 45 240 60 255
Rectangle -16777216 true false 135 15 150 30
Rectangle -16777216 true false 135 30 150 45
Rectangle -16777216 true false 135 45 150 60
Rectangle -16777216 true false 150 75 165 90
Rectangle -16777216 true false 150 60 165 75
Rectangle -16777216 true false 150 45 165 60
Rectangle -16777216 true false 150 30 165 45
Rectangle -16777216 true false 165 90 180 105
Rectangle -16777216 true false 270 90 285 105
Rectangle -16777216 true false 270 75 285 90
Rectangle -16777216 true false 255 105 270 120
Rectangle -16777216 true false 255 90 270 105
Rectangle -16777216 true false 255 75 270 90
Rectangle -16777216 true false 270 165 285 180
Rectangle -16777216 true false 270 150 285 165
Rectangle -955883 true false 90 135 180 180
Rectangle -955883 true false 60 135 75 150
Rectangle -955883 true false 45 150 60 240
Rectangle -955883 true false 60 150 75 165
Rectangle -955883 true false 30 165 45 255
Rectangle -955883 true false 165 135 210 150
Rectangle -955883 true false 180 150 195 255
Rectangle -955883 true false 195 150 210 210
Rectangle -955883 true false 210 150 225 165
Rectangle -955883 true false 225 165 240 255
Rectangle -955883 true false 210 180 225 255
Rectangle -955883 true false 195 225 210 255
Rectangle -955883 true false 165 165 180 255
Rectangle -955883 true false 150 180 165 240
Rectangle -955883 true false 60 180 135 225
Rectangle -955883 true false 105 240 150 255
Rectangle -955883 true false 120 225 135 240
Rectangle -955883 true false 135 195 150 240
Rectangle -955883 true false 60 225 105 255
Rectangle -955883 true false 75 135 90 180
Rectangle -6459832 true false 45 150 82 188
Rectangle -6459832 true false 90 150 127 188
Rectangle -6459832 true false 135 150 172 188
Rectangle -6459832 true false 180 150 217 188
Rectangle -6459832 true false 180 210 217 248
Rectangle -6459832 true false 135 210 172 248
Rectangle -6459832 true false 90 210 127 248
Rectangle -6459832 true false 45 210 82 248

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

upwards
true
0
Rectangle -8630108 true false 165 270 180 285
Rectangle -8630108 true false 165 285 180 300
Rectangle -13345367 true false 150 270 165 285
Rectangle -13345367 true false 150 285 165 300
Rectangle -13840069 true false 135 285 150 300
Rectangle -13840069 true false 135 270 150 285
Rectangle -1184463 true false 120 270 135 285
Rectangle -955883 true false 105 270 120 285
Rectangle -2674135 true false 90 270 105 285
Rectangle -955883 true false 105 285 120 300
Rectangle -1184463 true false 120 285 135 300
Rectangle -2674135 true false 90 285 105 300
Rectangle -2674135 true false 105 150 120 165
Rectangle -2674135 true false 90 90 105 105
Rectangle -2674135 true false 105 135 120 150
Rectangle -2674135 true false 90 210 105 225
Rectangle -2674135 true false 90 105 105 120
Rectangle -2674135 true false 105 60 120 75
Rectangle -2674135 true false 105 45 120 60
Rectangle -2674135 true false 90 15 86 46
Rectangle -2674135 true false 90 120 105 135
Rectangle -2674135 true false 90 195 105 210
Rectangle -2674135 true false 105 165 120 180
Rectangle -2674135 true false 105 75 120 90
Rectangle -2674135 true false 90 180 105 195
Rectangle -2674135 true false 105 225 120 240
Rectangle -2674135 true false 105 240 120 255
Rectangle -2674135 true false 105 255 120 270
Rectangle -955883 true false 120 135 135 150
Rectangle -955883 true false 105 120 120 135
Rectangle -955883 true false 120 150 135 165
Rectangle -955883 true false 105 210 120 225
Rectangle -955883 true false 120 165 135 180
Rectangle -955883 true false 105 180 120 195
Rectangle -955883 true false 105 195 120 210
Rectangle -955883 true false 120 45 135 60
Rectangle -955883 true false 105 90 120 105
Rectangle -955883 true false 105 105 120 120
Rectangle -955883 true false 120 75 135 90
Rectangle -955883 true false 120 60 135 75
Rectangle -955883 true false 120 255 135 270
Rectangle -955883 true false 120 240 135 255
Rectangle -955883 true false 120 225 135 240
Rectangle -1184463 true false 120 105 135 120
Rectangle -1184463 true false 120 120 135 135
Rectangle -1184463 true false 135 60 150 75
Rectangle -1184463 true false 135 75 150 90
Rectangle -1184463 true false 135 135 150 150
Rectangle -1184463 true false 120 30 135 45
Rectangle -1184463 true false 135 45 150 60
Rectangle -1184463 true false 120 195 135 210
Rectangle -1184463 true false 120 180 135 195
Rectangle -1184463 true false 120 210 135 225
Rectangle -1184463 true false 135 150 150 165
Rectangle -1184463 true false 120 90 135 105
Rectangle -1184463 true false 135 165 150 180
Rectangle -1184463 true false 135 255 150 270
Rectangle -1184463 true false 135 240 150 255
Rectangle -1184463 true false 135 225 150 240
Rectangle -13840069 true false 135 90 150 105
Rectangle -13840069 true false 150 150 165 165
Rectangle -13840069 true false 135 120 150 135
Rectangle -13840069 true false 150 135 165 150
Rectangle -13840069 true false 135 105 150 120
Rectangle -13840069 true false 150 45 165 60
Rectangle -13840069 true false 135 30 150 45
Rectangle -13840069 true false 135 180 150 195
Rectangle -13840069 true false 150 165 165 180
Rectangle -13840069 true false 135 195 150 210
Rectangle -13840069 true false 135 210 150 225
Rectangle -13840069 true false 150 60 165 75
Rectangle -13840069 true false 150 75 165 90
Rectangle -13840069 true false 150 240 165 255
Rectangle -13840069 true false 150 255 165 270
Rectangle -13840069 true false 150 225 165 240
Rectangle -13345367 true false 165 75 180 90
Rectangle -13345367 true false 150 90 165 105
Rectangle -13345367 true false 165 60 180 75
Rectangle -13345367 true false 165 45 180 60
Rectangle -13345367 true false 150 30 165 45
Rectangle -13345367 true false 150 105 165 120
Rectangle -13345367 true false 150 180 165 195
Rectangle -13345367 true false 150 210 165 225
Rectangle -13345367 true false 165 165 180 180
Rectangle -13345367 true false 165 150 180 165
Rectangle -13345367 true false 150 120 165 135
Rectangle -13345367 true false 150 195 165 210
Rectangle -13345367 true false 165 225 180 240
Rectangle -13345367 true false 165 240 180 255
Rectangle -13345367 true false 165 135 180 150
Rectangle -13345367 true false 165 255 180 270
Rectangle -8630108 true false 165 180 180 195
Rectangle -8630108 true false 180 165 195 180
Rectangle -8630108 true false 165 210 180 225
Rectangle -8630108 true false 165 105 180 120
Rectangle -8630108 true false 180 135 195 150
Rectangle -8630108 true false 165 90 180 105
Rectangle -8630108 true false 180 75 195 90
Rectangle -8630108 true false 180 60 195 75
Rectangle -8630108 true false 180 150 195 165
Rectangle -8630108 true false 165 120 180 135
Rectangle -8630108 true false 165 15 180 30
Rectangle -8630108 true false 165 30 180 45
Rectangle -8630108 true false 165 195 180 210
Rectangle -8630108 true false 180 45 195 60
Rectangle -8630108 true false 180 255 195 270
Rectangle -8630108 true false 180 240 195 255
Rectangle -8630108 true false 180 225 195 240
Rectangle -1184463 true false 120 0 135 15
Rectangle -1184463 true false 120 15 135 30
Rectangle -8630108 true false 165 0 180 15
Rectangle -13840069 true false 135 0 150 15
Rectangle -13840069 true false 135 15 150 30
Rectangle -955883 true false 105 30 120 45
Rectangle -955883 true false 105 15 120 30
Rectangle -955883 true false 105 0 120 15
Rectangle -13345367 true false 150 0 165 15
Rectangle -13345367 true false 150 15 165 30
Rectangle -2674135 true false 90 270 90 300
Rectangle -2674135 true false 105 225 120 270
Rectangle -2674135 true false 90 180 105 225
Rectangle -2674135 true false 105 135 120 180
Rectangle -2674135 true false 90 90 105 135
Rectangle -2674135 true false 105 45 120 90
Rectangle -2674135 true false 100 1 115 46
Rectangle -2674135 true false 90 270 105 300
Rectangle -1184463 true false 120 270 135 300
Rectangle -1184463 true false 135 225 150 270
Rectangle -1184463 true false 120 180 135 225
Rectangle -1184463 true false 135 135 150 180
Rectangle -1184463 true false 120 90 135 135
Rectangle -1184463 true false 135 45 150 90
Rectangle -1184463 true false 129 0 144 45
Rectangle -955883 true false 105 270 120 300
Rectangle -955883 true false 120 225 135 270
Rectangle -955883 true false 105 180 120 225
Rectangle -955883 true false 120 135 135 180
Rectangle -955883 true false 105 90 120 135
Rectangle -955883 true false 120 45 135 90
Rectangle -13840069 true false 143 0 158 45
Rectangle -13840069 true false 135 270 150 300
Rectangle -13840069 true false 150 225 165 270
Rectangle -13840069 true false 135 180 150 225
Rectangle -13840069 true false 150 135 165 180
Rectangle -13840069 true false 135 90 150 135
Rectangle -13840069 true false 150 45 165 90
Rectangle -955883 true false 112 0 127 45
Rectangle -13345367 true false 150 180 165 225
Rectangle -13345367 true false 165 135 180 180
Rectangle -13345367 true false 165 225 180 270
Rectangle -13345367 true false 150 90 165 135
Rectangle -13345367 true false 165 45 180 90
Rectangle -13345367 true false 164 0 179 45
Rectangle -8630108 true false 165 180 180 225
Rectangle -8630108 true false 180 225 195 270
Rectangle -8630108 true false 180 135 195 180
Rectangle -8630108 true false 165 90 180 135
Rectangle -8630108 true false 180 45 195 90
Rectangle -8630108 true false 172 0 187 45
Rectangle -13345367 true false 150 270 165 300
Rectangle -13345367 true false 165 285 180 285
Rectangle -8630108 true false 165 270 180 300

upwards?
true
0
Rectangle -8630108 true false 165 270 180 285
Rectangle -8630108 true false 165 285 180 300
Rectangle -13345367 true false 150 270 165 285
Rectangle -13345367 true false 150 285 165 300
Rectangle -2674135 true false 105 150 120 165
Rectangle -2674135 true false 105 135 120 150
Rectangle -2674135 true false 105 60 120 75
Rectangle -2674135 true false 105 45 120 60
Rectangle -2674135 true false 90 15 86 46
Rectangle -2674135 true false 105 165 120 180
Rectangle -2674135 true false 105 75 120 90
Rectangle -2674135 true false 105 225 120 240
Rectangle -2674135 true false 105 240 120 255
Rectangle -2674135 true false 105 255 120 270
Rectangle -955883 true false 120 135 135 150
Rectangle -955883 true false 105 120 120 135
Rectangle -955883 true false 120 150 135 165
Rectangle -955883 true false 105 210 120 225
Rectangle -955883 true false 120 165 135 180
Rectangle -955883 true false 105 180 120 195
Rectangle -955883 true false 105 195 120 210
Rectangle -955883 true false 120 45 135 60
Rectangle -955883 true false 105 90 120 105
Rectangle -955883 true false 105 105 120 120
Rectangle -955883 true false 120 75 135 90
Rectangle -955883 true false 120 60 135 75
Rectangle -955883 true false 120 255 135 270
Rectangle -955883 true false 120 240 135 255
Rectangle -955883 true false 120 225 135 240
Rectangle -1184463 true false 118 105 133 120
Rectangle -1184463 true false 120 120 135 135
Rectangle -1184463 true false 135 60 150 75
Rectangle -1184463 true false 135 75 150 90
Rectangle -1184463 true false 135 135 150 150
Rectangle -1184463 true false 120 30 135 45
Rectangle -1184463 true false 135 45 150 60
Rectangle -1184463 true false 120 195 135 210
Rectangle -1184463 true false 120 180 135 195
Rectangle -1184463 true false 120 210 135 225
Rectangle -1184463 true false 135 150 150 165
Rectangle -1184463 true false 120 90 135 105
Rectangle -1184463 true false 135 165 150 180
Rectangle -1184463 true false 135 255 150 270
Rectangle -1184463 true false 135 240 150 255
Rectangle -1184463 true false 135 225 150 240
Rectangle -13840069 true false 135 90 150 105
Rectangle -13840069 true false 150 150 165 165
Rectangle -13840069 true false 135 120 150 135
Rectangle -13840069 true false 150 135 165 150
Rectangle -13840069 true false 135 105 150 120
Rectangle -13840069 true false 150 45 165 60
Rectangle -13840069 true false 135 30 150 45
Rectangle -13840069 true false 135 180 150 195
Rectangle -13840069 true false 150 165 165 180
Rectangle -13840069 true false 135 195 150 210
Rectangle -13840069 true false 135 210 150 225
Rectangle -13840069 true false 150 60 165 75
Rectangle -13840069 true false 150 75 165 90
Rectangle -13840069 true false 150 240 165 255
Rectangle -13840069 true false 150 255 165 270
Rectangle -13840069 true false 150 225 165 240
Rectangle -13345367 true false 165 75 180 90
Rectangle -13345367 true false 150 90 165 105
Rectangle -13345367 true false 165 60 180 75
Rectangle -13345367 true false 165 45 180 60
Rectangle -13345367 true false 150 30 165 45
Rectangle -13345367 true false 150 105 165 120
Rectangle -13345367 true false 150 180 165 195
Rectangle -13345367 true false 150 210 165 225
Rectangle -13345367 true false 165 165 180 180
Rectangle -13345367 true false 165 150 180 165
Rectangle -13345367 true false 150 120 165 135
Rectangle -13345367 true false 150 195 165 210
Rectangle -13345367 true false 165 225 180 240
Rectangle -13345367 true false 165 240 180 255
Rectangle -13345367 true false 165 135 180 150
Rectangle -13345367 true false 165 255 180 270
Rectangle -8630108 true false 165 180 180 195
Rectangle -8630108 true false 180 165 195 180
Rectangle -8630108 true false 165 210 180 225
Rectangle -8630108 true false 165 105 180 120
Rectangle -8630108 true false 180 135 195 150
Rectangle -8630108 true false 165 90 180 105
Rectangle -8630108 true false 180 75 195 90
Rectangle -8630108 true false 180 60 195 75
Rectangle -8630108 true false 180 150 195 165
Rectangle -8630108 true false 165 120 180 135
Rectangle -8630108 true false 165 15 180 30
Rectangle -8630108 true false 165 30 180 45
Rectangle -8630108 true false 165 195 180 210
Rectangle -8630108 true false 180 45 195 60
Rectangle -8630108 true false 180 255 195 270
Rectangle -8630108 true false 180 240 195 255
Rectangle -8630108 true false 180 225 195 240
Rectangle -1184463 true false 120 0 135 15
Rectangle -1184463 true false 120 15 135 30
Rectangle -8630108 true false 165 0 180 15
Rectangle -13840069 true false 135 0 150 15
Rectangle -13840069 true false 135 15 150 30
Rectangle -955883 true false 105 30 120 45
Rectangle -955883 true false 105 15 120 30
Rectangle -955883 true false 105 0 120 15
Rectangle -13345367 true false 150 0 165 15
Rectangle -13345367 true false 150 15 165 30
Rectangle -2674135 true false 90 270 90 300
Rectangle -2674135 true false 105 225 120 270
Rectangle -2674135 true false 96 180 111 225
Rectangle -2674135 true false 105 135 120 180
Rectangle -2674135 true false 96 90 111 135
Rectangle -2674135 true false 105 45 120 90
Rectangle -2674135 true false 96 0 111 45
Rectangle -1184463 true false 135 225 150 270
Rectangle -1184463 true false 135 135 150 180
Rectangle -1184463 true false 126 90 141 135
Rectangle -1184463 true false 135 45 150 90
Rectangle -1184463 true false 125 0 140 45
Rectangle -955883 true false 120 225 135 270
Rectangle -955883 true false 110 180 125 225
Rectangle -955883 true false 120 135 135 180
Rectangle -955883 true false 109 90 124 135
Rectangle -955883 true false 120 45 135 90
Rectangle -13840069 true false 140 0 155 45
Rectangle -13840069 true false 150 225 165 270
Rectangle -13840069 true false 150 135 165 180
Rectangle -13840069 true false 141 90 156 135
Rectangle -13840069 true false 150 45 165 90
Rectangle -955883 true false 110 0 125 45
Rectangle -13345367 true false 157 180 172 225
Rectangle -13345367 true false 165 135 180 180
Rectangle -13345367 true false 165 225 180 270
Rectangle -13345367 true false 160 90 175 135
Rectangle -13345367 true false 165 45 180 90
Rectangle -13345367 true false 154 0 169 45
Rectangle -8630108 true false 168 180 183 225
Rectangle -8630108 true false 180 225 195 270
Rectangle -8630108 true false 180 135 195 180
Rectangle -8630108 true false 171 90 186 135
Rectangle -8630108 true false 180 45 195 90
Rectangle -8630108 true false 169 0 184 45
Rectangle -13345367 true false 165 285 180 285
Rectangle -1184463 true false 124 180 139 225
Rectangle -13840069 true false 138 180 153 225
Rectangle -2674135 true false 95 270 110 315
Rectangle -955883 true false 109 270 124 315
Rectangle -1184463 true false 124 270 139 315
Rectangle -13840069 true false 138 270 153 315
Rectangle -13345367 true false 153 270 168 315
Rectangle -8630108 true false 166 270 181 315

waffle
true
0
Rectangle -6459832 true false 120 120 135 135

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
