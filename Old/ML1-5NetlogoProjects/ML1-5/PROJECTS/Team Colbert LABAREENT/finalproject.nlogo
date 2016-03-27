breed [heroes hero]
breed [monsters monster]
breed [coins coin]

globals [
  level
  score
  life
  health
  dead? 
  level-over?
]

to new
  ca
  if user-yes-or-no? "Are you ready?" [user-message ( "Be prepared for a challenge, Mr. Brown.")]
  set score 0
  set life 10
  set health 12
  set level-over? false
  set dead? false
  setup-level01 
end

to play
  runlevel
  monster-move
  gain-points
  lose-game
end 
  
to setup-level01
  set-patch-size 1.3
  resize-world 0 400 0 400
  import-pcolors "level01.gif"
  set level 1
  hero-setup
  coin-setup01
  setup-finish-line
  monster-setup01
end

to setup-level02
  set-patch-size 1.3
  resize-world 0 400 0 400
  import-pcolors "level02.gif"
  set level 2
  set level-over? false
  hero-setup
  coin-setup01
  setup-finish-line
  monster-setup01
end

to setup-level03
  set-patch-size 1.3
  resize-world 0 400 0 400
  import-pcolors "level03.gif"
  set level 3
  set level-over? false
  hero-setup
  coin-setup01
  setup-finish-line
  monster-setup01
end

to setup-level04
  set-patch-size 2.5
  resize-world 0 400 0 200
  import-pcolors "level04.gif"
  set level 4
  set level-over? false
  hero-setup
  coin-setup02
  setup-finish-line
  monster-setup02
end

to setup-level05
  set-patch-size 2.5
  resize-world 0 400 0 200
  import-pcolors "level05.gif"
  set level 5
  set level-over? false
  hero-setup
  coin-setup02
  setup-finish-line
  monster-setup02
end 

to setup-finish-line
  if level = 1 [ask patches [if pxcor <= 400 and pxcor >= 392 and pycor >= 240 and pycor <= 280 [set pcolor green] ] ]
  if level = 2 [ask patches [if pxcor <= 80 and pxcor >= 40 and pycor >= 390 and pycor <= 400 [set pcolor green] ] ]
  if level = 3 [ask patches [if pxcor <= 8 and pxcor >= 0 and pycor >= 360 and pycor <= 400 [set pcolor green] ] ]
  if level = 4 [ask patches [if pxcor <= 400 and pxcor >= 390 and pycor >= 0 and pycor <= 3 [set pcolor green] ] ]
  if level = 5 [ask patches [if pxcor <= 400 and pxcor >= 390 and pycor >= 0 and pycor <= 3 [set pcolor green] ] ]     
end

to runlevel
  activate
  nextlevel
end

to activate
  ask patches with [pcolor = green] [if count heroes-here > 0 [set level-over? true] ] 
end

to nextlevel
  if level-over? [if level = 1 [setup-level02] ]
  if level-over? [if level = 2 [setup-level03] ]
  if level-over? [if level = 3 [setup-level04] ]
  if level-over? [if level = 4 [setup-level05] ]
  if level-over? [if level = 5 [user-message ( word "Congratulations! You beat our game. ")
      if user-yes-or-no? "Can we get that 100 now?" [user-message ( word "Rock on, Mr. Brown! ") ] ] 
  ]
end  

to lose-game
  ask heroes [if any? monsters in-radius 8 [set health health - 1] ]
  if health < 0 [set life life - 1
    set health 12]
  if life < 0 [set dead? true]
  if dead? [user-message ( word "Better luck next time. You have " score " points. " ) 
    if user-yes-or-no? "Do you want to start over?" [new] ] 
end

to gain-points
  ask coins [if any? heroes in-radius 20 [set score score + 10 
      die] ]
end  

to coin-setup01
  create-coins random 7 + 3
  ask coins [set size 20
    set shape "coin"
    setxy random-xcor random-ycor]
  reset-coins
end

to coin-setup02
  create-coins random 17 + 3
  ask coins [set size 6
    set shape "coin"
    setxy random-xcor random-ycor]
  reset-coins
end

to reset-coins
  if level-over? = true [ask coins [die] ]
end  

to hero-setup
  if level = 1 [create-heroes 1
    ask heroes [
      set size 25
      set shape character
      set color magenta
      setxy 12 140
    ] ]
  if level = 2 [create-heroes 1
    ask heroes [
      set size 25
      set shape character
      set color magenta
      setxy 12 20
    ] ]
  if level = 3 [create-heroes 1
    ask heroes [
      set size 25
      set shape character
      set color magenta
      setxy 12 20
    ] ]
  if level = 4 [create-heroes 1
    ask heroes [
      set size 7
      set shape character
      set color magenta 
      setxy 5 195
    ] ]
  if level = 5 [create-heroes 1
    ask heroes [
      set size 7
      set shape character
      set color magenta
      setxy 5 195
    ] ]
end
       
to monster-move
  if level = 1 [ask monsters [wait 0.01
      ifelse any? patches in-cone 22 30 with [pcolor mod 10 < 1] [set heading random 360] [fd 2] ] ]
  if level = 2 [ask monsters [wait 0.01
      ifelse any? patches in-cone 22 30 with [pcolor mod 10 < 1] [set heading random 360] [fd 2] ] ]
  if level = 3 [ask monsters [wait 0.01
      ifelse any? patches in-cone 22 30 with [pcolor mod 10 < 1] [set heading random 360] [fd 2] ] ]
  if level = 4 [ask monsters [wait 0.01
      ifelse any? patches in-cone 8 30 with [pcolor mod 10 < 1] [set heading random 360] [fd 1] ] ]
  if level = 5 [ask monsters [wait 0.01
      ifelse any? patches in-cone 8 30 with [pcolor mod 10 < 1] [set heading random 360] [fd 1] ] ]
end

to monster-setup01
  create-monsters random 6 + 2
  ask monsters [
    set shape one-of ["spider" "ghost" "ant"]
    set size 26
    setxy random-xcor random-ycor
  ]
end
  
to monster-setup02 
  create-monsters random 12
  ask monsters [
    set shape one-of ["spider" "ghost" "ant"]
    set size 6
    setxy random-xcor random-ycor
  ]
end

to move-left
  ask heroes [
    set heading 270
    if level = 1 [ifelse any? patches in-cone 10 30 with [pcolor mod 10 < 1] [] [fd 1] ] 
    if level = 2 [ifelse any? patches in-cone 10 30 with [pcolor mod 10 < 1] [] [fd 1] ]
    if level = 3 [ifelse any? patches in-cone 8 30 with [pcolor mod 10 < 1] [] [fd 1] ]
    if level = 4 [ifelse any? patches in-cone 4 30 with [pcolor mod 10 < 1] [] [fd .5] ]
    if level = 5 [ifelse any? patches in-cone 4 30 with [pcolor mod 10 < 1] [] [fd .5] ]
  ]
end

to move-right
  ask heroes [
    set heading 90
    if level = 1 [ifelse any? patches in-cone 8 30 with [pcolor mod 10 < 1] [] [fd 1] ]
    if level = 2 [ifelse any? patches in-cone 14 30 with [pcolor mod 10 < 1] [] [fd 1] ] 
    if level = 3 [ifelse any? patches in-cone 13 30 with [pcolor mod 10 < 1] [] [fd 1] ]
    if level = 4 [ifelse any? patches in-cone 4 30 with [pcolor mod 10 < 1] [] [fd .5] ]
    if level = 5 [ifelse any? patches in-cone 4 30 with [pcolor mod 10 < 1] [] [fd .5] ]
  ]
end

to move-up
  ask heroes [
    set heading 0
    if level = 1 [ifelse any? patches in-cone 15 30 with [pcolor mod 10 < 1] [] [fd 1] ]
    if level = 2 [ifelse any? patches in-cone 10 30 with [pcolor mod 10 < 1] [] [fd 1] ]  
    if level = 3 [ifelse any? patches in-cone 14 30 with [pcolor mod 10 < 1] [] [fd 1] ]
    if level = 4 [ifelse any? patches in-cone 4 30 with [pcolor mod 10 < 1] [] [fd .5] ]
    if level = 5 [ifelse any? patches in-cone 4 30 with [pcolor mod 10 < 1] [] [fd .5] ]
  ]
end

to move-down
  ask heroes [
    set heading 180
    if level = 1 [ifelse any? patches in-cone 15 30 with [pcolor mod 10 < 1] [] [fd 1] ]
    if level = 2 [ifelse any? patches in-cone 14 30 with [pcolor mod 10 < 1] [] [fd 1] ]  
    if level = 3 [ifelse any? patches in-cone 14 30 with [pcolor mod 10 < 1] [] [fd 1] ]
    if level = 4 [ifelse any? patches in-cone 4 30 with [pcolor mod 10 < 1] [] [fd .5] ]
    if level = 5 [ifelse any? patches in-cone 4 30 with [pcolor mod 10 < 1] [] [fd .5] ]
  ]
end 
@#$#@#$#@
GRAPHICS-WINDOW
210
10
741
562
-1
-1
1.3
1
10
1
1
1
0
0
0
1
0
400
0
400
0
0
1
ticks

BUTTON
7
208
70
241
Left
move-left
NIL
1
T
TURTLE
NIL
A
NIL
NIL

BUTTON
133
207
196
240
Right
move-right
NIL
1
T
TURTLE
NIL
D
NIL
NIL

BUTTON
70
176
133
209
Up
move-up
NIL
1
T
TURTLE
NIL
W
NIL
NIL

BUTTON
70
240
133
273
Down
move-down
NIL
1
T
TURTLE
NIL
S
NIL
NIL

CHOOSER
22
104
180
149
character
character
"person" "person construction" "person farmer" "person lumberjack"
0

BUTTON
20
43
83
76
New
new\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
117
43
180
76
PLAY
play
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

MONITOR
73
291
130
336
NIL
score
17
1
11

MONITOR
19
353
76
398
NIL
health
17
1
11

MONITOR
134
351
191
396
NIL
life
17
1
11

TEXTBOX
29
425
216
509
Click New to set up the game. \nCLick PLAY to start the game. \n\nObjective: Complete all 5 levels. \n	                  Collect all the coins.\n    
11
0.0
1

@#$#@#$#@
WHAT IS IT?
-----------
Hello players from U.S.A., Canada, South America, and the former Soviet Union. Unfortunately, this game has been censored to most of our Asian and European viewers due to levels of awesomeness causing the computers to crash. We present you with a game called LABAREENT. In this game, you get to choose to be one of our rocking characters and then play the levels of the maze. Sounds fun, doesn't it? Sounds kind of easy too? Yeah we thought that too, so we added some monsters. BOOO! Now there is a challenge. To win the game you must get through all 5 of our levels alive. Alive, you say? Yes alive, we have set up a custom health and life bar so you know how many chances you have left until game over. And just to spruce it up a bit we made coins. Coins, you say? Yes coins, you will be collecting these to earn a score. The goal is to beat all 5 levels while earning the highest score possible.


HOW IT WORKS
------------
On the Interface tab you will choose a character. After choosing a character, click new followed by play. To move your character press the A-Left, S-Down, D-Right, W-Up buttons to move your character or just click from the interface tab. The goal is to get on the green patch of the level which is also known as the finish line. While moving towards the finish line you want to collect as many coins as possible. Good Luck!


HOW TO USE IT
-------------
New: Sets up a new game with reset state variables however it doesn't work without play.

PLAY: Click play which is a forever button to run the game. This will initiate all the level changes and control turtles/patches.

Move Left: "A key". Moves the hero/character left.

Move Down: "S key". Moves the hero/character down.

Move Right: "D key". Moves the hero/character right.

Move Up: "W key". Moves the hero/character up.

Character: A chooser which chooses the shape of your hero. After you choose the shape, click new and then play.


THINGS TO NOTICE
----------------
Keep looking at your score, health, and lives. Make sure you don't take any risks if your health is too low!


THINGS TO TRY
-------------
Try collecting all the coins to get the highest possible score. 


EXTENDING THE MODEL
-------------------
If we were able to extend the model we would try incorporating:

1. Fighting the monsters with a sort of gun mechanism
2. Stun Bombs
3. Wormholes


NETLOGO FEATURES
----------------
We incorporated things we learned from each topic of Netlogo.


RELATED MODELS
--------------
We had some help from the Pacman model.


CREDITS AND REFERENCES
----------------------
Made possible by the brains of Team Colbert: Colleen Fang & Robert Melamed

Major credz to Topher Brown Mykolyk who bestowed his great knowledge on us!
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

ant
true
0
Polygon -6459832 true false 150 19 120 30 120 45 130 66 144 81 127 96 129 113 144 134 136 185 121 195 114 217 120 255 135 270 165 270 180 255 188 218 181 195 165 184 157 134 170 115 173 95 156 81 171 66 181 42 180 30
Polygon -13345367 true false 150 167 159 185 190 182 225 212 255 257 240 212 200 170 154 172
Polygon -13345367 true false 161 167 201 150 237 149 281 182 245 140 202 137 158 154
Polygon -13345367 true false 155 135 185 120 230 105 275 75 233 115 201 124 155 150
Line -13345367 false 120 36 75 45
Line -13345367 false 75 45 90 15
Line -13345367 false 180 35 225 45
Line -13345367 false 225 45 210 15
Polygon -13345367 true false 145 135 115 120 70 105 25 75 67 115 99 124 145 150
Polygon -13345367 true false 139 167 99 150 63 149 19 182 55 140 98 137 142 154
Polygon -13345367 true false 150 167 141 185 110 182 75 212 45 257 60 212 100 170 146 172

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

bee 2
true
0
Polygon -1184463 true false 195 150 105 150 90 165 90 225 105 270 135 300 165 300 195 270 210 225 210 165 195 150
Rectangle -16777216 true false 90 165 212 185
Polygon -16777216 true false 90 207 90 226 210 226 210 207
Polygon -16777216 true false 103 266 198 266 203 246 96 246
Polygon -6459832 true false 120 150 105 135 105 75 120 60 180 60 195 75 195 135 180 150
Polygon -6459832 true false 150 15 120 30 120 60 180 60 180 30
Circle -16777216 true false 105 30 30
Circle -16777216 true false 165 30 30
Polygon -7500403 true true 120 90 75 105 15 90 30 75 120 75
Polygon -16777216 false false 120 75 30 75 15 90 75 105 120 90
Polygon -7500403 true true 180 75 180 90 225 105 285 90 270 75
Polygon -16777216 false false 180 75 270 75 285 90 225 105 180 90
Polygon -7500403 true true 180 75 180 90 195 105 240 195 270 210 285 210 285 150 255 105
Polygon -16777216 false false 180 75 255 105 285 150 285 210 270 210 240 195 195 105 180 90
Polygon -7500403 true true 120 75 45 105 15 150 15 210 30 210 60 195 105 105 120 90
Polygon -16777216 false false 120 75 45 105 15 150 15 210 30 210 60 195 105 105 120 90
Polygon -16777216 true false 135 300 165 300 180 285 120 285

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

cat
false
0
Line -7500403 true 285 240 210 240
Line -7500403 true 195 300 165 255
Line -7500403 true 15 240 90 240
Line -7500403 true 285 285 195 240
Line -7500403 true 105 300 135 255
Line -16777216 false 150 270 150 285
Line -16777216 false 15 75 15 120
Polygon -7500403 true true 300 15 285 30 255 30 225 75 195 60 255 15
Polygon -7500403 true true 285 135 210 135 180 150 180 45 285 90
Polygon -7500403 true true 120 45 120 210 180 210 180 45
Polygon -7500403 true true 180 195 165 300 240 285 255 225 285 195
Polygon -7500403 true true 180 225 195 285 165 300 150 300 150 255 165 225
Polygon -7500403 true true 195 195 195 165 225 150 255 135 285 135 285 195
Polygon -7500403 true true 15 135 90 135 120 150 120 45 15 90
Polygon -7500403 true true 120 195 135 300 60 285 45 225 15 195
Polygon -7500403 true true 120 225 105 285 135 300 150 300 150 255 135 225
Polygon -7500403 true true 105 195 105 165 75 150 45 135 15 135 15 195
Polygon -7500403 true true 285 120 270 90 285 15 300 15
Line -7500403 true 15 285 105 240
Polygon -7500403 true true 15 120 30 90 15 15 0 15
Polygon -7500403 true true 0 15 15 30 45 30 75 75 105 60 45 15
Line -16777216 false 164 262 209 262
Line -16777216 false 223 231 208 261
Line -16777216 false 136 262 91 262
Line -16777216 false 77 231 92 261

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

coin
false
0
Circle -7500403 true true 60 60 180
Circle -16777216 false false 60 60 180
Circle -7500403 true true 75 45 180
Circle -16777216 false false 75 45 180
Circle -8630108 true false 60 60 180
Circle -1184463 true false 75 45 180

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cow skull
false
0
Polygon -7500403 true true 150 90 75 105 60 150 75 210 105 285 195 285 225 210 240 150 225 105
Polygon -16777216 true false 150 150 90 195 90 150
Polygon -16777216 true false 150 150 210 195 210 150
Polygon -16777216 true false 105 285 135 270 150 285 165 270 195 285
Polygon -7500403 true true 240 150 263 143 278 126 287 102 287 79 280 53 273 38 261 25 246 15 227 8 241 26 253 46 258 68 257 96 246 116 229 126
Polygon -7500403 true true 60 150 37 143 22 126 13 102 13 79 20 53 27 38 39 25 54 15 73 8 59 26 47 46 42 68 43 96 54 116 71 126

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

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

ghost
false
0
Polygon -955883 true false 30 165 13 164 -2 149 0 135 -2 119 0 105 15 75 30 75 58 104 43 119 43 134 58 134 73 134 88 104 73 44 78 14 103 -1 193 -1 223 29 208 89 208 119 238 134 253 119 240 105 238 89 240 75 255 60 270 60 283 74 300 90 298 104 298 119 300 135 285 135 285 150 268 164 238 179 208 164 208 194 238 209 253 224 268 239 268 269 238 299 178 299 148 284 103 269 58 284 43 299 58 269 103 254 148 254 193 254 163 239 118 209 88 179 73 179 58 164
Line -16777216 false 189 253 215 253
Circle -16777216 true false 102 30 30
Polygon -16777216 true false 165 105 135 105 120 120 105 105 135 75 165 75 195 105 180 120
Circle -16777216 true false 160 30 30

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

mouse side
false
0
Polygon -7500403 true true 38 162 24 165 19 174 22 192 47 213 90 225 135 230 161 240 178 262 150 246 117 238 73 232 36 220 11 196 7 171 15 153 37 146 46 145
Polygon -7500403 true true 289 142 271 165 237 164 217 185 235 192 254 192 259 199 245 200 248 203 226 199 200 194 155 195 122 185 84 187 91 195 82 192 83 201 72 190 67 199 62 185 46 183 36 165 40 134 57 115 74 106 60 109 90 97 112 94 92 93 130 86 154 88 134 81 183 90 197 94 183 86 212 95 211 88 224 83 235 88 248 97 246 90 257 107 255 97 270 120
Polygon -16777216 true false 234 100 220 96 210 100 214 111 228 116 239 115
Circle -16777216 true false 246 117 20
Line -7500403 true 270 153 282 174
Line -7500403 true 272 153 255 173
Line -7500403 true 269 156 268 177

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

person construction
false
0
Rectangle -7500403 true true 123 76 176 95
Polygon -1 true false 105 90 60 195 90 210 115 162 184 163 210 210 240 195 195 90
Polygon -13345367 true false 180 195 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285
Circle -7500403 true true 110 5 80
Line -16777216 false 148 143 150 196
Rectangle -16777216 true false 116 186 182 198
Circle -1 true false 152 143 9
Circle -1 true false 152 166 9
Rectangle -16777216 true false 179 164 183 186
Polygon -955883 true false 180 90 195 90 195 165 195 195 150 195 150 120 180 90
Polygon -955883 true false 120 90 105 90 105 165 105 195 150 195 150 120 120 90
Rectangle -16777216 true false 135 114 150 120
Rectangle -16777216 true false 135 144 150 150
Rectangle -16777216 true false 135 174 150 180
Polygon -955883 true false 105 42 111 16 128 2 149 0 178 6 190 18 192 28 220 29 216 34 201 39 167 35
Polygon -6459832 true false 54 253 54 238 219 73 227 78
Polygon -16777216 true false 15 285 15 255 30 225 45 225 75 255 75 270 45 285

person farmer
false
0
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Polygon -1 true false 60 195 90 210 114 154 120 195 180 195 187 157 210 210 240 195 195 90 165 90 150 105 150 150 135 90 105 90
Circle -7500403 true true 110 5 80
Rectangle -7500403 true true 127 79 172 94
Polygon -13345367 true false 120 90 120 180 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 180 90 172 89 165 135 135 135 127 90
Polygon -6459832 true false 116 4 113 21 71 33 71 40 109 48 117 34 144 27 180 26 188 36 224 23 222 14 178 16 167 0
Line -16777216 false 225 90 270 90
Line -16777216 false 225 15 225 90
Line -16777216 false 270 15 270 90
Line -16777216 false 247 15 247 90
Rectangle -6459832 true false 240 90 255 300

person graduate
false
0
Circle -16777216 false false 39 183 20
Polygon -1 true false 50 203 85 213 118 227 119 207 89 204 52 185
Circle -7500403 true true 110 5 80
Rectangle -7500403 true true 127 79 172 94
Polygon -8630108 true false 90 19 150 37 210 19 195 4 105 4
Polygon -8630108 true false 120 90 105 90 60 195 90 210 120 165 90 285 105 300 195 300 210 285 180 165 210 210 240 195 195 90
Polygon -1184463 true false 135 90 120 90 150 135 180 90 165 90 150 105
Line -2674135 false 195 90 150 135
Line -2674135 false 105 90 150 135
Polygon -1 true false 135 90 150 105 165 90
Circle -1 true false 104 205 20
Circle -1 true false 41 184 20
Circle -16777216 false false 106 206 18
Line -2674135 false 208 22 208 57

person lumberjack
false
0
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Polygon -2674135 true false 60 196 90 211 114 155 120 196 180 196 187 158 210 211 240 196 195 91 165 91 150 106 150 135 135 91 105 91
Circle -7500403 true true 110 5 80
Rectangle -7500403 true true 127 79 172 94
Polygon -6459832 true false 174 90 181 90 180 195 165 195
Polygon -13345367 true false 180 195 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285
Polygon -6459832 true false 126 90 119 90 120 195 135 195
Rectangle -6459832 true false 45 180 255 195
Polygon -16777216 true false 255 165 255 195 240 225 255 240 285 240 300 225 285 195 285 165
Line -16777216 false 135 165 165 165
Line -16777216 false 135 135 165 135
Line -16777216 false 90 135 120 135
Line -16777216 false 105 120 120 120
Line -16777216 false 180 120 195 120
Line -16777216 false 180 135 210 135
Line -16777216 false 90 150 105 165
Line -16777216 false 225 165 210 180
Line -16777216 false 75 165 90 180
Line -16777216 false 210 150 195 165
Line -16777216 false 180 105 210 180
Line -16777216 false 120 105 90 180
Line -16777216 false 150 135 150 165
Polygon -2674135 true false 100 30 104 44 189 24 185 10 173 10 166 1 138 -1 111 3 109 28

person service
false
0
Polygon -7500403 true true 180 195 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285
Polygon -1 true false 120 90 105 90 60 195 90 210 120 150 120 195 180 195 180 150 210 210 240 195 195 90 180 90 165 105 150 165 135 105 120 90
Polygon -1 true false 123 90 149 141 177 90
Rectangle -7500403 true true 123 76 176 92
Circle -7500403 true true 110 5 80
Line -13345367 false 121 90 194 90
Line -16777216 false 148 143 150 196
Rectangle -16777216 true false 116 186 182 198
Circle -1 true false 152 143 9
Circle -1 true false 152 166 9
Rectangle -16777216 true false 179 164 183 186
Polygon -2674135 true false 180 90 195 90 183 160 180 195 150 195 150 135 180 90
Polygon -2674135 true false 120 90 105 90 114 161 120 195 150 195 150 135 120 90
Polygon -2674135 true false 155 91 128 77 128 101
Rectangle -16777216 true false 118 129 141 140
Polygon -2674135 true false 145 91 172 77 172 101

person student
false
0
Polygon -13791810 true false 135 90 150 105 135 165 150 180 165 165 150 105 165 90
Polygon -7500403 true true 195 90 240 195 210 210 165 105
Circle -7500403 true true 110 5 80
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Polygon -1 true false 100 210 130 225 145 165 85 135 63 189
Polygon -13791810 true false 90 210 120 225 135 165 67 130 53 189
Polygon -1 true false 120 224 131 225 124 210
Line -16777216 false 139 168 126 225
Line -16777216 false 140 167 76 136
Polygon -7500403 true true 105 90 60 195 90 210 135 105

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

shark
false
0
Polygon -7500403 true true 283 153 288 149 271 146 301 145 300 138 247 119 190 107 104 117 54 133 39 134 10 99 9 112 19 142 9 175 10 185 40 158 69 154 64 164 80 161 86 156 132 160 209 164
Polygon -7500403 true true 199 161 152 166 137 164 169 154
Polygon -7500403 true true 188 108 172 83 160 74 156 76 159 97 153 112
Circle -16777216 true false 256 129 12
Line -16777216 false 222 134 222 150
Line -16777216 false 217 134 217 150
Line -16777216 false 212 134 212 150
Polygon -7500403 true true 78 125 62 118 63 130
Polygon -7500403 true true 121 157 105 161 101 156 106 152

sheep
false
0
Rectangle -7500403 true true 151 225 180 285
Rectangle -7500403 true true 47 225 75 285
Rectangle -7500403 true true 15 75 210 225
Circle -7500403 true true 135 75 150
Circle -16777216 true false 165 76 116

spider
false
0
Polygon -13791810 true false 75 150 90 195 210 195 225 150 255 120 255 45 180 0 120 0 45 45 45 120
Circle -1184463 true false 165 60 60
Circle -1184463 true false 75 60 60
Polygon -11221820 true false 225 150 285 195 285 285 255 300 255 210 180 165
Polygon -11221820 true false 75 150 15 195 15 285 45 300 45 210 120 165
Polygon -2674135 true false 210 210 225 285 195 285 165 165
Polygon -2674135 true false 90 210 75 285 105 285 135 165
Rectangle -2674135 true false 135 165 165 270

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

wolf
false
0
Polygon -7500403 true true 75 225 97 249 112 252 122 252 114 242 102 241 89 224 94 181 64 113 46 119 31 150 32 164 61 204 57 242 85 266 91 271 101 271 96 257 89 257 70 242
Polygon -7500403 true true 216 73 219 56 229 42 237 66 226 71
Polygon -7500403 true true 181 106 213 69 226 62 257 70 260 89 285 110 272 124 234 116 218 134 209 150 204 163 192 178 169 185 154 189 129 189 89 180 69 166 63 113 124 110 160 111 170 104
Polygon -6459832 true true 252 143 242 141
Polygon -6459832 true true 254 136 232 137
Line -16777216 false 75 224 89 179
Line -16777216 false 80 159 89 179
Polygon -6459832 true true 262 138 234 149
Polygon -7500403 true true 50 121 36 119 24 123 14 128 6 143 8 165 8 181 7 197 4 233 23 201 28 184 30 169 28 153 48 145
Polygon -7500403 true true 171 181 178 263 187 277 197 273 202 267 187 260 186 236 194 167
Polygon -7500403 true true 187 163 195 240 214 260 222 256 222 248 212 245 205 230 205 155
Polygon -7500403 true true 223 75 226 58 245 44 244 68 233 73
Line -16777216 false 89 181 112 185
Line -16777216 false 31 150 47 118
Polygon -16777216 true false 235 90 250 91 255 99 248 98 244 92
Line -16777216 false 236 112 246 119
Polygon -16777216 true false 278 119 282 116 274 113
Line -16777216 false 189 201 203 161
Line -16777216 false 90 262 94 272
Line -16777216 false 110 246 119 252
Line -16777216 false 190 266 194 274
Line -16777216 false 218 251 219 257
Polygon -16777216 true false 230 67 228 54 222 62 224 72
Line -16777216 false 246 67 234 64
Line -16777216 false 229 45 235 68
Line -16777216 false 30 150 30 165

wolf face
false
0
Polygon -7500403 true true 105 180 75 180 45 75 45 0 105 45 195 45 255 0 255 75 225 180 195 180 165 300 135 300 105 180 75 180
Polygon -16777216 true false 225 90 210 135 150 90
Polygon -16777216 true false 75 90 90 135 150 90

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
