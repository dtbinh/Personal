breed [redplayers redplayer]
breed [soccerballs soccerball]
breed [blueplayers blueplayer]
breed [defenseplayers defenseplayer]
breed [goalkeepers goalkeeper]
breed [cheerleaders cheerleader]

globals [redscore 
         bluescore
         remainingtime
         distancefromsoccerball]

to setup
  setup-field
  setup-soccerball
  setup-players
  ask soccerballs [wait 3 coinflip]
end

to setup-field
  ca
  set redscore 0
  set bluescore 0
  set-patch-size 1
  resize-world -390 390 -248 248
  import-pcolors "SoccerField.jpg"
  set remainingtime duration
end
  
 
to setup-soccerball 
  create-soccerballs 1  
  ask soccerballs [
    set heading 0
    set size 35
    setxy 0 0
    set color black
    set shape "soccerball"]
end

to setup-players
  create-goalkeepers 2
  create-defenseplayers 4
  create-redplayers 3
  create-blueplayers 3
  create-cheerleaders 6
  ask redplayers [
    set size 60
    set heading 0
    set color red 
    set shape "redplayer"]
  ask blueplayers [
    set size 60
    set color blue 
    set heading 0
    set shape "blueplayer"]
  ask goalkeeper 1 [
    set size 60
    set color red
    set heading 0
    set shape "redplayer" 
    setxy 370 0
  ]
  ask goalkeeper 2 [
    set size 60
    set color blue
    set heading 0
    set shape "blueplayer"
    setxy -370 0 
  ]
  ask defenseplayer 3 [
    set size 60
    set heading 0
    set color red
    set shape "redplayer"
    setxy 240 124
    ]
  ask defenseplayer 4 [
    set size 60
    set heading 0
    set color red
    set shape "redplayer"
    setxy 240 -124
  ]
  ask defenseplayer 5 [
    set size 60
    set heading 0
    set color blue
    set shape "blueplayer"
    setxy -240 -124 
  ]
  ask defenseplayer 6 [
    set size 60
    set heading 0
    set color blue
    set shape "blueplayer"
    setxy -240 124
  ]
  ask redplayer 7 [
    setxy 50 0
    set heading 0 
    ]
  ask redplayer 8 [
    setxy -150 124
    set heading 0 
    ]
  ask redplayer 9 [
    setxy -150 -124
    set heading 0
    ]
  ask blueplayer 10 [
    setxy -50 0
    set heading 0
    ]
  ask blueplayer 11 [
    setxy 150 124
    set heading 0
    ]
  ask blueplayer 12 [
    setxy 150 -124
    set heading 0
    ]
  ask cheerleader 13 [
    set color red
    set shape "cheerleader"
    set size 40
    setxy -195 -220]
  ask cheerleader 14 [
    set color red
    set shape "cheerleader"
    set size 40
    setxy 0 -220]
  ask cheerleader 15 [
    set color red
    set shape "cheerleader"
    set size 40
    setxy 195 -220]
  ask cheerleader 16 [
    set color blue
    set shape "cheerleader"
    set size 40
    setxy -195 220]
  ask cheerleader 17 [
    set color blue
    set shape "cheerleader"
    set size 40
    setxy 0 220]
  ask cheerleader 18 [
    set color blue
    set shape "cheerleader"
    set size 40
    setxy 195 220]
end 

to cheer
  ask cheerleaders [
    set heading 90
    wait .3
    fd 30
    wait .3
    bk 60
    wait .3
    fd 30
  ]
end

to shoot
  ask soccerballs [
    kick 
   ]

end


to kick
  if any? redplayers-here
 [ask defenseplayers [defensedefend]
   ask goalkeepers [goalkeeperdefend]
   set heading direction
 repeat force [wait .09 fd 10]
   blueplayercheck
   scorecheck
 ]
   if any? blueplayers-here
 [ask defenseplayers [defensedefend]
   ask goalkeepers [goalkeeperdefend]
  set heading direction
 repeat force [wait .09 fd 10]
   blueplayercheck
   scorecheck
]
end

to blueplayercheck
  ask soccerballs [ifelse any? blueplayers  in-cone 360 10 or any? redplayers in-cone 360 10 [redplayercheck][fd 50]]
end
to redplayercheck
  ifelse any? redplayers in-cone 360 10 [resetup coinflip] [ask soccerballs[ fd 50 wait .5 scorecheck resetup coinflip]]
end 


to go
  cheer
  defensedefend
  goalkeeperdefend
  gameovercheck
  halftimecheck
  clock
end

to gameover
  if bluescore > redscore [user-message "Blue team wins!" wait 5  setup]
  if redscore > bluescore [user-message "Red team wins!" wait 5 setup]
  if redscore = bluescore [user-message "It's a tie!" wait 5 setup]
  end 

to coinflip
  ask soccerballs [ifelse random 100 > 50 [setxy 50 0] [setxy -50 0]]
end 


to scorecheck
  ask soccerball 0 [if xcor > 370 and ycor < 35 and ycor > -35 [user-message "Point for Blue" set bluescore bluescore + 1 wait 1 resetup coinflip]
                   if xcor < -370 and ycor < 35 and ycor > -35 [user-message "Point for Red" set redscore redscore + 1 wait 1 resetup coinflip]]
      end 

to clock
  every 1 [set remainingtime remainingtime - 1]
end 

to halftimecheck
  if remainingtime = duration / 2 [user-message "Halftime"]
end

to gameovercheck
  if remainingtime = 0 [gameover]
end 


to defensedefend
  ask defenseplayers [
    repeat 100 [
      wait .001 
      fd 60 
      wait .001 
      bk 120 
      wait .001 
      fd 60
      ]]
end 

to goalkeeperdefend
  ask goalkeepers [
    repeat 100 [
      wait .001 
      fd 30 
      wait .001 
      bk 60 
      wait .001 
      fd 30
      ]]
end

to resetup
   ask goalkeeper 1 [
    set size 60
    set color red
    set heading 0
    set shape "redplayer" 
    setxy 370 0
  ]
  ask goalkeeper 2 [
    set size 60
    set color blue
    set heading 0
    set shape "blueplayer"
    setxy -370 0 
  ]
  ask defenseplayer 3 [
    set size 60
    set heading 0
    set color red
    set shape "redplayer"
    setxy 240 124
    ]
  ask defenseplayer 4 [
    set size 60
    set heading 0
    set color red
    set shape "redplayer"
    setxy 240 -124
  ]
  ask defenseplayer 5 [
    set size 60
    set heading 0
    set color blue
    set shape "blueplayer"
    setxy -240 -124 
  ]
  ask defenseplayer 6 [
    set size 60
    set heading 0
    set color blue
    set shape "blueplayer"
    setxy -240 124
  ]
  ask redplayer 7 [
    setxy 50 0
    set heading 0 
    ]
  ask redplayer 8 [
    setxy -150 124
    set heading 0 
    ]
  ask redplayer 9 [
    setxy -150 -124
    set heading 0
    ]
  ask blueplayer 10 [
    setxy -50 0
    set heading 0
    ]
  ask blueplayer 11 [
    setxy 150 124
    set heading 0
    ]
  ask blueplayer 12 [
    setxy 150 -124
    set heading 0
    ]
   ask cheerleader 13 [
    set color red
    set shape "cheerleader"
    set size 40
    setxy -195 -220]
  ask cheerleader 14 [
    set color red
    set shape "cheerleader"
    set size 40
    setxy 0 -220]
  ask cheerleader 15 [
    set color red
    set shape "cheerleader"
    set size 40
    setxy 195 -220]
  ask cheerleader 16 [
    set color blue
    set shape "cheerleader"
    set size 40
    setxy -195 220]
  ask cheerleader 17 [
    set color blue
    set shape "cheerleader"
    set size 40
    setxy 0 220]
  ask cheerleader 18 [
    set color blue
    set shape "cheerleader"
    set size 40
    setxy 195 220]
end 


    
@#$#@#$#@
GRAPHICS-WINDOW
195
10
986
538
390
248
1.0
1
10
1
1
1
0
0
0
1
-390
390
-248
248
0
0
1
ticks

BUTTON
4
117
70
150
Pre-Game
Setup\n
NIL
1
T
OBSERVER
NIL
S
NIL
NIL

SLIDER
9
200
181
233
Force
Force
1
40
1
1
1
NIL
HORIZONTAL

SLIDER
8
236
180
269
Direction
Direction
0
360
0
10
1
NIL
HORIZONTAL

BUTTON
79
117
177
150
Play
Go
T
1
T
OBSERVER
NIL
G
NIL
NIL

BUTTON
53
162
108
195
Shoot
Shoot
NIL
1
T
OBSERVER
NIL
P
NIL
NIL

TEXTBOX
20
348
170
513
Welcome. This is the 2 player soccer game by Tim and Promie. We are PROMIEthium and AnTIMony. The Rules are simple. You have to score as many goals as you can in the given time. Whoever has the most goals wins. \n             Begin
12
95.0
0

MONITOR
108
10
179
55
NIL
RedScore
17
1
11

MONITOR
0
10
73
55
NIL
BlueScore
17
1
11

SLIDER
8
271
180
304
Duration
Duration
0
360
0
10
1
NIL
HORIZONTAL

MONITOR
58
64
128
109
Time Left
remainingtime
17
1
11

@#$#@#$#@
WHAT IS IT?
-----------
As you can probably tell, this is a simple soccer game--one that consists of 6 players for each team, with a total of 12 players. There is one goalkeeper per team, one forward player, two attacking midfielders, and two defense players. It's a two-player game in which the players take turns to attempt to make goals. Whoever makes the most goals within the given time wins.


HOW IT WORKS
------------
To start the game, you must set the time duration by using the slider, 'Duration.' Then, click on the 'Pre-Game' button to set up the field and the positions of the players and cheerleaders. After that, click 'Play' and begin playing. Next, set the angle at which you want to shoot the ball using the slider 'Direction.' You can set the amount of force you want to put onto the ball by using the slider 'Force.' Once you are ready to shoot the ball, click the button 'Shoot.' 


CREDITS AND REFERENCES
----------------------
Tim Antelepyan and Promie Faruque
	AKA	
AnTIMony and PROMIEthium
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

blueplayer
true
14
Polygon -7500403 true false 105 105 75 150 105 150 120 135 120 195 180 195 180 135 195 150 225 150 195 105 165 105 150 135 135 105 105 105
Rectangle -7500403 true false 135 150 150 165
Polygon -8630108 true false 149 160 150 161
Circle -1 true false 118 39 63
Polygon -1 true false 120 191 107 256 145 256 149 220 164 255 195 255 180 193 150 172
Polygon -7500403 true false 112 229 148 230 146 240 109 240 113 228
Polygon -7500403 true false 190 229 154 230 156 240 193 240 188 229
Polygon -2674135 true false 120 105 105 105 75 150 105 150 120 135 120 195 150 180 180 195 180 135 195 150 225 150 195 105 180 105 150 135 135 120 120 105
Polygon -2674135 true false 120 105 135 105 135 120 165 120 165 105 180 105 150 135 120 105
Polygon -7500403 true false 135 105 165 105 165 120 135 120 135 105
Polygon -13345367 true false 135 105 105 105 75 150 105 150 120 135 120 195 150 180 180 195 180 135 195 150 225 150 195 105 165 105 165 120 135 120 135 105

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

cheerleader
false
10
Circle -7500403 true false 110 5 80
Polygon -7500403 true false 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true false 127 79 172 94
Polygon -7500403 true false 195 90 240 150 225 180 165 105
Polygon -7500403 true false 105 90 60 150 75 180 135 105
Polygon -1184463 true false 120 30 180 30 180 105 210 105 210 15 165 0 120 0 90 15 90 105 120 105 120 30
Polygon -13345367 true true 120 195 180 195 210 255 90 255 120 195
Circle -13345367 true true 26 146 67
Circle -13345367 true true 221 146 67
Polygon -1 true false 120 90 150 105 180 90 195 90 225 120 195 150 180 135 180 195 120 195 120 135 105 150 75 120 105 90 120 90

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

redplayer
true
14
Polygon -7500403 true false 105 105 75 150 105 150 120 135 120 195 180 195 180 135 195 150 225 150 195 105 165 105 150 135 135 105 105 105
Rectangle -7500403 true false 135 150 150 165
Polygon -8630108 true false 149 160 150 161
Circle -1 true false 118 39 63
Polygon -1 true false 120 191 107 256 145 256 149 220 164 255 195 255 180 193 150 172
Polygon -7500403 true false 112 229 148 230 146 240 109 240 113 228
Polygon -7500403 true false 190 229 154 230 156 240 193 240 188 229
Polygon -2674135 true false 120 105 105 105 75 150 105 150 120 135 120 195 150 180 180 195 180 135 195 150 225 150 195 105 180 105 150 135 135 120 120 105
Polygon -2674135 true false 120 105 135 105 135 120 165 120 165 105 180 105 150 135 120 105
Polygon -7500403 true false 135 105 165 105 165 120 135 120 135 105

sheep
false
0
Rectangle -7500403 true true 151 225 180 285
Rectangle -7500403 true true 47 225 75 285
Rectangle -7500403 true true 15 75 210 225
Circle -7500403 true true 135 75 150
Circle -16777216 true false 165 76 116

soccerball
false
14
Circle -1 true false 65 65 170
Polygon -16777216 true true 135 120 120 135 135 165 165 165 180 135 150 105 135 120
Line -16777216 true 165 165 180 180
Line -16777216 true 180 135 195 135
Line -16777216 true 150 105 150 90
Line -16777216 true 120 135 105 135
Line -16777216 true 135 165 120 180
Line -16777216 true 120 180 135 210
Line -16777216 true 135 210 165 210
Line -16777216 true 165 210 180 180
Line -16777216 true 195 135 210 150
Line -16777216 true 150 90 120 75
Line -16777216 true 120 75 105 90
Line -16777216 true 105 90 90 105
Line -16777216 true 90 105 105 135
Line -16777216 true 120 180 105 180
Line -16777216 true 105 180 90 165
Line -16777216 true 90 165 105 135
Line -16777216 true 150 90 180 75
Line -16777216 true 195 135 210 105
Line -16777216 true 210 105 180 75
Polygon -16777216 true true 105 135 90 165 60 165 60 105 90 105
Polygon -16777216 true true 210 150 195 135 210 105 225 105 240 150 210 150
Polygon -16777216 true true 120 75 150 90 180 75 180 60 120 60 120 75
Line -16777216 true 210 150 210 165
Line -16777216 true 180 180 195 180
Line -16777216 true 195 180 210 165
Line -16777216 true 165 210 180 225
Line -16777216 true 195 225 210 210
Line -16777216 true 210 210 195 180
Polygon -16777216 true true 210 210 195 180 180 180 165 210 180 225 195 225 210 210
Polygon -16777216 true true 105 180 120 180 135 210 120 240 90 210 90 195 105 180

soccerplayer
true
0
Polygon -7500403 true true 105 105 75 150 105 150 120 135 120 195 180 195 180 135 195 150 225 150 195 105 165 105 150 135 135 105 105 105
Rectangle -7500403 true true 135 150 150 165
Polygon -8630108 true false 149 160 150 161
Circle -1 true false 118 54 63
Circle -7500403 true true 123 68 23
Circle -7500403 true true 151 66 25
Polygon -1 true false 120 191 107 256 145 256 149 220 164 255 195 255 180 193 150 172
Polygon -7500403 true true 112 229 148 230 146 240 109 240 113 228
Polygon -7500403 true true 190 229 154 230 156 240 193 240 188 229

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
