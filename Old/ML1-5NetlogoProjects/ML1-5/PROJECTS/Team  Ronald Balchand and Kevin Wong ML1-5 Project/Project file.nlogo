breed [players player]
breed [enemies enemy]
breed [barrels barrel]
breed [bombs bomb]
breed [enemy-bombs enemy-bomb]
breed [power-ups power-up]
breed [explosions explosion]

enemies-own [
  enemy-lives
  enemy-bomb-variable
  enemy-power
]

enemy-bombs-own [enemy-bomb-timer]

explosions-own [
  explosion-timer]

power-ups-own [power-up-type]

players-own [
  lives
  bomb-power]

bombs-own [bomb-timer]

to startup
  resize-world 0 255 0 223
  set-patch-size 2
  import-pcolors "bomberman-use.jpg"
  startgame
end

to startgame
  ifelse mouse-down? and mouse-xcor < 112 and mouse-xcor > 63 and mouse-ycor < 83 and mouse-ycor > 69 [
    setup ] [startgame]
end

to setup
  ca
  resize-world 0 12 0 12
  set-patch-size 39
  create-players 1
  create-enemies level
  patch-setup
  barrel-setup
  player-setup
  if level = 1 [level-1-setup]
  if level = 2 [level-2-setup]
  if level = 3 [level-3-setup]
  set-default-shape players "person"
  set-default-shape bombs "bomb"
  set-default-shape explosions "x"
  set-default-shape barrels "barrel"
  set-default-shape enemy-bombs "bomb"
end

to powerups-assignment
  ifelse random 4 < 1 [
    ifelse random 5 < 1 [
      ask patch-here [
        sprout-power-ups 1 [
          set shape "boom"
          set power-up-type 1]]] [
    ifelse  random 2 < 1 [
      ask patch-here [
        sprout-power-ups 1 [
          set shape "life"
          set power-up-type 2]]] [
    ask patch-here [
      sprout-power-ups 1 [
        set shape "boom"
        set power-up-type 3]]]]] []
end

to player-setup
  ask players [
    set color blue
    setxy 0 0
    set shape "person"
    set lives 1
    
    set bomb-power 1]
end

to level-1-setup
  ask enemy 1 [
    set shape "person"
    set color red
    setxy 12 0
    set enemy-bomb-variable 1
    set enemy-power 1
    ]
  
end

to level-2-setup
  level-1-setup
  ask enemy 2 [
    set shape "person"
    set color yellow
    setxy 0 12
    set enemy-bomb-variable 2
    set enemy-power 1
    ]
  
end

to level-3-setup
  level-2-setup
  ask enemy 3 [
    set shape "person"
    set color green
    setxy 12 12
    set enemy-bomb-variable 3
    set enemy-power 1 
    ]
end

to patch-setup
  ask patches [
    set pcolor 72
    if pxcor mod 2 = 1 and pycor mod 2 = 1 [
      set pcolor brown
    ]
  ]
end

to barrel-setup
  create-barrels 200
  ask barrels [
    set shape "barrel"
    set color gray
    set size 1
    setxy random 13 random 13
    if pcolor = brown [die]
    if any? other barrels-here [die]
  ]
  ask barrels at-points [
    [0 0] [0 1] [0 2] [1 0] [2 0]
    [0 12] [0 11] [0 10] [1 12] [2 12]
    [12 12] [12 11] [12 10] [11 12] [10 12]
    [12 0] [12 1] [12 2] [11 0] [10 0]]
  [die]
end

to up
  carefully [
    ask player 0 [
      set heading 0
      fd .5
      edge-space
      immortal-box-and-barrel-block]] []
end

to move-left 
  carefully [
    ask player 0 [
      set heading 270
      fd .5
      edge-space
      immortal-box-and-barrel-block]] []
end

to move-right
  carefully [
    ask player 0 [ 
      set heading 90
      fd .5
      edge-space
      immortal-box-and-barrel-block]] []
end

to down
  carefully [
    ask player 0 [
      set heading 180
      fd .5
      edge-space
      immortal-box-and-barrel-block]] []
end

to edge-space
  if not any? patches in-cone .5 0 [
    bk .5]
end

to immortal-box-and-barrel-block
  if pcolor = brown [
    bk .5]
  if any? barrels-here [
    bk .5]
end

to drop-player-bomb
  ask player 0 [
       every 1 [
        
        ask patch-here [
          sprout-bombs 1 [
            player-bomb-setup]]]]
end

to player-bomb-setup
  set color blue
  set bomb-timer 3
end
  
to start-game-1
  every .1 [enemy-move]
  every 1 [bomb-detonation]
  every 1 [explosion-preservation]
  every 1 [enemy-bomb-detonation]
  every 1 [
    ask enemies [
      enemy-attack
      go-through-barrels]]
  power-up-pickups
  gameover
end

to bomb-detonation
    ask bombs [
      set color color + 1
      set bomb-timer bomb-timer - 1
      boom-chooser
    ]
end

to boom-chooser
  ask players [
    if bomb-power = 1 [ask bombs with [bomb-timer = 0] [boom-level-1]]
    if bomb-power = 2 [ask bombs with [bomb-timer = 0] [boom-level-2]]
    if bomb-power = 3 [ask bombs with [bomb-timer = 0] [boom-level-3]]
    if bomb-power = 4 [ask bombs with [bomb-timer = 0] [boom-level-4]]
    if bomb-power = 5 [ask bombs with [bomb-timer = 0] [boom-level-5]]
    if bomb-power > 6 [ask bombs with [bomb-timer = 0] [boom-level-max]]
  ]
end

to boom-level-1
  explosion1-spreads
  kill
  watch-out
   
end 

to boom-level-2
  explosion2-spreads
  kill
  watch-out
  
end

to boom-level-3
  explosion3-spreads
  kill
  watch-out
  
end

to boom-level-4
  explosion4-spreads
  kill
  watch-out
  
end

to boom-level-5
  explosion5-spreads
  kill
  watch-out
  
end

to boom-level-max
  explosion-max-spreads
  kill
  watch-out
  
end

to kill
  ask barrels [
    if any? explosions-here [
      powerups-assignment
      die]]
end

to watch-out
  ask players [
    if any? explosions-here [
      set lives lives - 1
      if lives < 1 [
        die]]]
  ask enemies [
    if any? explosions-here [
      set enemy-lives enemy-lives - 1
      if enemy-lives < 1 [
        die]]]
end

to explosion1-spreads
  set breed explosions
  ask patches at-points [
    [0 0] [0 1] [0 2] [0 -1] [0 -2]
    [1 0] [2 0] [-1 0] [-2 0]]
  [if pcolor = 72 [ 
    sprout-explosions 1 [ 
      explosion-setup]]]
  carefully [
    ask explosions-at 0 2 [
      if [pcolor] of patch-at 0 1 = brown [
        die
      ]
    ]] []
  carefully [
    ask explosions-at 2 0 [
      if [pcolor] of patch-at 1 0 = brown [
        die
      ]
    ]] []
  carefully [
    ask explosions-at 0 -2 [
      if [pcolor] of patch-at 0 -1 = brown [
        die
      ]
    ]] []
  carefully [
    ask explosions-at -2 0 [
      if [pcolor] of patch-at -1 0 = brown [
        die
      ]
    ]] []
end

to explosion2-spreads
  set breed explosions
  ask patches at-points [
    [0 0] [0 1] [0 2] [0 -1] [0 -2]
    [1 0] [2 0] [-1 0] [-2 0] [0 3]
    [0 -3] [3 0] [-3 0]]
  [if pcolor = 72 [
    sprout-explosions 1 [
      explosion-setup]]]
    carefully [
    ask explosions at-points [[0 2] [0 3]] [
      if [pcolor] of patch-at 0 1 = brown [
        die]]] []
  carefully [
    ask explosions at-points [[2 0] [3 0]] [
      if [pcolor] of patch-at 1 0 = brown [
        die]]] []
  carefully [
    ask explosions at-points [[0 -2] [0 -3]] [
      if [pcolor] of patch-at 0 -1 = brown [
        die]]] []
  carefully [
    ask explosions at-points [[-2 0] [-3 0]] [
      if [pcolor] of patch-at -1 0 = brown [
        die]]] []
end

to explosion3-spreads
  set breed explosions
  ask patches at-points [
    [0 0] [0 1] [0 2] [0 -1] [0 -2]
    [1 0] [2 0] [-1 0] [-2 0] [0 3]
    [0 -3] [3 0] [-3 0] [0 4] [4 0]
    [-4 0] [0 -4]]
  [if pcolor = 72 [
    sprout-explosions 1 [
      explosion-setup]]]
  carefully [
    ask explosions at-points  [
      [0 2] [0 3] [0 4]]
    [if [pcolor] of patch-at 0 1 = brown [
      die]]] []
  carefully [
    ask explosions at-points [
      [2 0] [3 0] [4 0]]
    [if [pcolor] of patch-at 1 0 = brown [
      die]]] []
  carefully [
    ask explosions at-points [
      [0 -2] [0 -3] [-4 0]]
    [if [pcolor] of patch-at 0 -1 = brown [
      die]]] []
  carefully [
    ask explosions at-points [
      [-2 0] [-3 0] [-4 0]]
    [if [pcolor] of patch-at -1 0 = brown [
      die]]] []
end

to explosion4-spreads
  set breed explosions
  ask patches at-points [
    [0 0] [0 1] [0 2] [0 -1] [0 -2]
    [1 0] [2 0] [-1 0] [-2 0] [0 3]
    [0 -3] [3 0] [-3 0] [4 0] [0 4]
    [-4 0] [0 -4] [0 5] [0 -5] [-5 0] [5 0]]
  [if pcolor = 72 [
    sprout-explosions 1 [
      explosion-setup]]]
  carefully [
    ask explosions at-points  [
      [0 2] [0 3] [0 4] [0 5]]
    [if [pcolor] of patch-at 0 1 = brown [
      die]]] []
  carefully [
    ask explosions at-points [
      [2 0] [3 0] [4 0] [5 0]]
    [if [pcolor] of patch-at 1 0 = brown [
      die]]] []
  carefully [
    ask explosions at-points [
      [0 -2] [0 -3] [0 -4] [0 -5]]
    [if [pcolor] of patch-at 0 -1 = brown [
      die]]] []
  carefully [
    ask explosions at-points [
      [-2 0] [-3 0] [-4 0] [-5 0]]
    [if [pcolor] of patch-at -1 0 = brown [
        die]]] []
end

to explosion5-spreads
  set breed explosions
  ask patches at-points [
    [0 0] [0 1] [0 2] [0 -1] [0 -2]
    [1 0] [2 0] [-1 0] [-2 0] [0 3]
    [0 -3] [3 0] [-3 0] [4 0] [0 4]
    [-4 0] [0 -4] [0 5] [0 -5] [-5 0] [5 0]
    [6 0] [0 6] [-6 0] [0 -6]]
  [if pcolor = 72 [
    sprout-explosions 1 [
      explosion-setup]]]
  carefully [
    ask explosions at-points  [
      [0 2] [0 3] [0 4] [0 5] [0 6]]
    [if [pcolor] of patch-at 0 1 = brown [
      die]]] []
  carefully [
    ask explosions at-points [
      [2 0] [3 0] [4 0] [5 0] [6 0]]
    [if [pcolor] of patch-at 1 0 = brown [
      die]]] []
  carefully [
    ask explosions at-points [
      [0 -2] [0 -3] [0 -4] [0 -5] [0 -6]]
    [if [pcolor] of patch-at 0 -1 = brown [
      die]]] []
  carefully [
    ask explosions at-points [
      [-2 0] [-3 0] [-4 0] [-5 0] [-6 0]]
    [if [pcolor] of patch-at -1 0 = brown [
      die]]] []
end

to explosion-max-spreads
  set breed explosions
  ask patches at-points [
    [0 0] [0 1] [0 2] [0 -1] [0 -2]
    [1 0] [2 0] [-1 0] [-2 0] [0 3]
    [0 -3] [3 0] [-3 0] [4 0] [0 4]
    [-4 0] [0 -4] [0 5] [0 -5] [-5 0] [5 0]
    [6 0] [0 6] [-6 0] [0 -6]
    [7 0] [0 7] [-7 0] [-7 0]]
  [if pcolor = 72 [
    sprout-explosions 1 [
      explosion-setup]]]
  carefully [
    ask explosions at-points  [
      [0 2] [0 3] [0 4] [0 5] [ 0 6] [0 7]]
    [if [pcolor] of patch-at 0 1 = brown [
      die]]] []
  carefully [
    ask explosions at-points [
      [2 0] [3 0] [4 0] [5 0] [6 0] [7 0]]
    [if [pcolor] of patch-at 1 0 = brown [
      die]]] []
  carefully [
    ask explosions at-points [
      [0 -2] [0 -3] [0 -4] [-5 0] [-6 0] [-7 0]]
    [if [pcolor] of patch-at 0 -1 = brown [
      die]]] []
  carefully [
    ask explosions at-points [
      [-2 0] [-3 0] [-4 0] [0 -5] [0 -6] [0 -7]]
    [if [pcolor] of patch-at -1 0 = brown [
      die]]] []
end

to drop-enemy-bomb
  if color = green [drop-enemy3-bomb]
  if color = yellow [drop-enemy2-bomb]
  if color = red [drop-enemy1-bomb]
end

to drop-enemy1-bomb
  ask enemy 1 [
        ask patch-here [
        sprout-enemy-bombs 1 [
          enemy-bomb-setup]]]
end

to drop-enemy2-bomb
  ask enemy 2 [
    
      ask patch-here [
        sprout-enemy-bombs 1 [
          enemy-bomb-setup]]]
end

to drop-enemy3-bomb
  ask enemy 3 [
   
      ask patch-here [
        sprout-enemy-bombs 1 [
          enemy-bomb-setup]]]
end


to enemy-bomb-setup
  ask enemies [
  if enemy-bomb-variable = 1 [ask enemy-bombs-here [set color red]]
  if enemy-bomb-variable = 2 [ask enemy-bombs-here [set color yellow]]
  if enemy-bomb-variable = 3 [ask enemy-bombs-here [set color green]]
  ask enemy-bombs-here [set enemy-bomb-timer 3]]
end

to get-away
  set heading towards one-of neighbors4 with [pcolor = 72]
  repeat enemy-power * 2 + 1 [every .5 [
      fd .5
      immortal-box-and-barrel-block]]
end
  
to enemy-attack
  ask neighbors4  [
   if any? players-here [
     ask enemies-here[
     drop-enemy-bomb
     ]
     if any? enemy-bombs-here [
       ask enemies-here [get-away]]]]
end

to go-through-barrels
   ask neighbors4 [
    if any? barrels-here [
      if random 100 < 25 [ask enemies [drop-enemy-bomb]]]]
   get-away
end
        
to enemy-move
  ask enemies [
    fd .5
    immortal-box-and-barrel-block
  ]
end

to explosion-setup
  set color red
  set explosion-timer 2
end

to explosion-preservation
  ask explosions [
    set explosion-timer explosion-timer - 1
    if explosion-timer = 0 [
      ask explosions-here [die]]]
end

to power-up-pickups
  ask players [
    if any? power-ups-here [
      ask power-ups-here [
        if power-up-type = 1 [ 
          ask players [ 
            set lives lives + 1]
          ask power-ups-here [die]]
        if power-up-type = 2 [
          ask players [ 
            set bomb-power bomb-power + 1]
          ask power-ups-here [die]]
        if power-up-type = 3 [
          ask players [
            set bomb-power bomb-power + 1]
          ask power-ups-here [die]]]]]
  ask enemies [
    if any? power-ups-here [
      ask power-ups-here [
        if power-up-type = 1 [ 
          ask enemies-here [ 
            set enemy-lives enemy-lives + 1]
          ask power-ups-here [die]]
        if power-up-type = 2 [
          ask enemies-here [ 
            set enemy-power enemy-power + 1]
          ask power-ups-here [die]]
        if power-up-type = 3 [
          ask enemies-here [
            set enemy-power enemy-power + 1]
          ask power-ups-here [die]]]]]
end

to enemy-bomb-detonation
  ask enemy-bombs [
    set color color + 1
    set enemy-bomb-timer enemy-bomb-timer - 1
    enemy-boom-chooser]
end

to enemy-boom-chooser
  ask enemies [
    if enemy-power = 1 [ask enemy-bombs with [enemy-bomb-timer = 0] [boom-level-1]]
    if enemy-power = 2 [ask enemy-bombs with [enemy-bomb-timer = 0] [boom-level-2]]
    if enemy-power = 3 [ask enemy-bombs with [enemy-bomb-timer = 0] [boom-level-3]]
    if enemy-power = 4 [ask enemy-bombs with [enemy-bomb-timer = 0] [boom-level-4]]
    if enemy-power = 5 [ask enemy-bombs with [enemy-bomb-timer = 0] [boom-level-5]]
    if enemy-power > 6 [ask enemy-bombs with [enemy-bomb-timer = 0] [boom-level-max]]
  ]
end

to gameover
  if count players = 0 or  count enemies = 0[
    wait 1
    resize-world 0 160 0 106
    set-patch-size 3
    import-pcolors "bomberman-game-lose.jpg"
    wait 3
    startup
  ]
end
@#$#@#$#@
GRAPHICS-WINDOW
411
11
933
490
-1
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
0
255
0
223
0
0
1
ticks

CHOOSER
23
31
161
76
Level
Level
1 2 3
2

BUTTON
73
97
136
130
NIL
Up
NIL
1
T
OBSERVER
NIL
W
NIL
NIL

BUTTON
6
130
69
163
Left
move-left
NIL
1
T
OBSERVER
NIL
A
NIL
NIL

BUTTON
69
130
140
163
NIL
Down
NIL
1
T
OBSERVER
NIL
S
NIL
NIL

BUTTON
140
130
209
163
Right
move-right
NIL
1
T
OBSERVER
NIL
D
NIL
NIL

BUTTON
221
130
284
163
Bomb
drop-player-bomb
NIL
1
T
TURTLE
NIL
/
NIL
NIL

BUTTON
197
37
301
70
START GAME
start-game-1
T
1
T
OBSERVER
NIL
1
NIL
NIL

TEXTBOX
67
239
306
269
Press START then START GAME to begin
12
0.0
1

TEXTBOX
64
264
338
421
You are the blue person and your objective is to drop bombs and eliminate your enemies.  Be careful!  If you are too close to a bomb when it explodes, you will lose a life.  If you have 0 lives left, you lose!  Brown blocks cannot be destroyed by bombs, but the gray ones can be destroyed.  Sometimes, they will drop power-ups, which you can collect by picking them up.
12
0.0
1

@#$#@#$#@
WHAT IS IT?
-----------
Bomberman


HOW IT WORKS
------------
You start at the bottom left corner of the world.
To win, you must destroy all enemies.
To lose, you must lose all of your lives.
Bombs can be used to destroy the gray blocks, enemies, and yourself.
The range of the bomb's explosions, and the number of lives you have can be increased by getting power-ups.
Bombs detonate after three seconds.


CREDITS AND REFERENCES
----------------------
Ronald Balchand
Kevin Wong
January 2012
ML1-5
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

barrel
false
2
Rectangle -955883 true true 30 30 270 270
Rectangle -16777216 false false 30 45 270 75
Rectangle -16777216 false false 30 90 270 120
Rectangle -16777216 false false 30 135 270 165
Rectangle -16777216 false false 30 180 270 210
Rectangle -16777216 false false 30 225 270 255

bomb
false
14
Circle -16777216 true true 30 45 240
Rectangle -16777216 true true 90 45 210 90
Line -6459832 false 135 30 150 45
Line -6459832 false 135 30 105 15
Line -6459832 false 105 15 75 15
Polygon -1184463 true false 75 0 60 15 75 30 90 15 75 0

bomb+
false
15
Rectangle -13345367 true false 30 30 270 270
Rectangle -7500403 true false 60 60 240 240
Circle -16777216 true false 86 101 127
Rectangle -16777216 true false 120 90 180 120
Line -16777216 false 150 90 135 75
Line -16777216 false 135 75 120 75
Polygon -1184463 true false 105 60 90 75 105 90 120 75 105 60
Line -2674135 false 120 150 120 180
Line -2674135 false 135 165 105 165
Line -2674135 false 165 135 165 195

boom
false
0
Rectangle -1184463 true false 45 45 255 255
Circle -2674135 true false 53 68 134
Circle -2674135 true false 60 120 120
Circle -2674135 true false 150 60 60
Circle -2674135 true false 141 81 108
Circle -2674135 true false 153 153 85
Circle -2674135 true false 54 204 42
Rectangle -13345367 true false 15 15 30 285
Rectangle -13345367 true false 15 15 285 30
Rectangle -13345367 true false 270 15 285 285
Rectangle -13345367 true false 15 270 270 285

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

life
false
0
Rectangle -13345367 true false 30 30 270 270
Rectangle -16777216 true false 60 60 240 240
Line -2674135 false 75 135 75 165
Line -2674135 false 75 165 90 165
Line -2674135 false 120 135 120 165
Line -2674135 false 150 135 150 165
Line -2674135 false 150 135 165 135
Line -2674135 false 150 150 165 150
Line -2674135 false 195 135 195 165
Line -2674135 false 195 165 210 165
Line -2674135 false 195 150 210 150
Line -2674135 false 195 135 210 135

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
