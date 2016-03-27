patches-own [origcolor]
breed [penguins penguin]
breed [polar-bears polar-bear]
breed [targets target]
globals [
 level
 score
]

to setup1
  world
  set level 1
  ask patches [p-setup]
  create-penguins 1 [
    set shape "penguin"
    setxy 12 10]
  create-targets 1 [
    set shape "target"
    set color red
    setxy 7 6]
  ask penguins [
    if (count patches in-radius 1 with [pcolor = 99]) < 1 [
      ask penguins [die] 
      user-message "Select Level to Restart"
    ]
  ]
  ask penguins [
    if xcor = 7 and ycor = 6 [
    user-message "Click Level 2!"
  ]
  ]
  
end

to world
  ca
  resize-world 0 15 0 15
  set-patch-size 30
end


to p-setup
  set pcolor 2
  if (pxcor > 3) and (pxcor < 13) and pycor = 10 [set pcolor 99]
  if pxcor = 4 and (pycor <= 9) and (pycor > 5) [set pcolor 99]
  if pycor = 6 and pxcor <= 7 and pxcor >= 5 [set pcolor 99]
  if pxcor = 12 and pycor = 10 [set pcolor 65]
end

to setup2
  world
  set level 2
  ask patches [p-setup2]
  create-penguins 1 [
    set shape "penguin"
    setxy 13 8]
  create-targets 1 [
    set shape "target"
    set color red
    setxy 11 11]
  create-polar-bears 1 [
    set shape "polar bear"
    setxy 2 11
  ]
  create-polar-bears 1 [
    set shape "polar bear"
    setxy 1 7
  ]
  create-polar-bears 1 [
    set shape "polar bear"
    setxy 8 6
  ]
  
end

to p-setup2
  set pcolor 2
  if pycor = 11 and pxcor < 12 and pxcor > 1 [set pcolor 99]
  if pxcor >= 2 and pxcor <= 4 and pycor >= 9 and pycor <= 10 [set pcolor 99]
  if pxcor >= 1 and pxcor <= 14 and pycor >= 5 and pycor <= 8 [set pcolor 99]
  if pxcor = 1 and pycor = 6 [set pcolor 2]
  if pxcor >= 6 and pxcor <= 8 and pycor = 8 [set pcolor 2]
  if pxcor = 12 and pycor = 8 [set pcolor 2]
  if pxcor = 14 and pycor = 8 [set pcolor 2]
  if pxcor >= 1 and pxcor <= 5 and pycor = 5 [set pcolor 2]
  if pxcor >= 9 and pxcor <= 11 and pycor = 5 [set pcolor 2]
  if pxcor = 13 and pycor = 8 [set pcolor 65]
end
  
to waddle-right
  if breed = penguins [
    set heading 90
    ifelse any? patches in-cone 1 30 with [pcolor = 2 or pcolor = 95] [ ] [fd 1
  ]
  if breed = penguins [
    ask patch-at-heading-and-distance 270 1 [if pcolor = 99
      [set pcolor 95]]]]
end

to waddle-left 
  if breed = penguins [
  set heading -90 
  ifelse any? patches in-cone 1 30 with [pcolor = 2 or pcolor = 95] [ ] [fd 1
  ask patch-at-heading-and-distance 90 1 [if pcolor = 99
      [set pcolor 95]]]]

end

to waddle-up
  if breed = penguins [
  set heading 360
   ifelse any? patches in-cone 1 30 with [pcolor = 2 or pcolor = 95] [ ] [fd 1
    ask patch-at-heading-and-distance 180 1 [if pcolor = 99
      [set pcolor 95]]]]
end

to waddle-down
  if breed = penguins [
  set heading 180
   ifelse any? patches in-cone 1 30 with [pcolor = 2 or pcolor = 95] [ ] [fd 1
   ask patch-at-heading-and-distance 360 1 [if pcolor = 99
      [set pcolor 95] ]]]
end

to setup3
  world
  set level 3
  ask patches [p-setup3]
  create-penguins 1 [
    set shape "penguin"
    setxy 1 1]
  create-targets 1 [
    set shape "target"
    set color red
    setxy 7 7]
  create-polar-bears 1 [
    set shape "polar bear"
    setxy 6 8
    set heading 90
  ]
  create-polar-bears 1 [
    set shape "polar bear"
    setxy 7 8
    set heading 90
  ]
  create-polar-bears 1 [
    set shape "polar bear"
    setxy 6 7
    set heading 90
  ]
  create-polar-bears 1 [
    set shape "polar bear"
    setxy 8 8
    set heading 90
  ]
  create-polar-bears 1 [
    set shape "polar bear"
    setxy 8 7
    set heading 90
  ]
  create-polar-bears 1 [
    set shape "polar bear"
    setxy 6 6
    set heading 90
  ]
  create-polar-bears 1 [
    set shape "polar bear"
    setxy 8 6
    set heading 90
  ]
end

to p-setup3
  set pcolor 99
  if pxcor >= 2 and pxcor <= 4 and pycor >= 11 and pycor <= 13 [set pcolor 2]
  if pxcor >= 11 and pxcor <= 13 and pycor >= 11 and pycor <= 13 [set pcolor 2]
  if pxcor >= 11 and pxcor <= 13 and pycor >= 2 and pycor <= 4 [set pcolor 2]
  if pxcor >= 2 and pxcor <= 4 and pycor >= 2 and pycor <= 4 [set pcolor 2]
  if pxcor >= 5 and pxcor <= 10 and pxcor != 7 and pxcor != 8 and pycor = 11 [set pcolor 2]
  if pxcor >= 5 and pxcor <= 10 and pxcor != 7 and pxcor != 8 and pycor = 4 [set pcolor 2]
  if pxcor = 4 and pycor >= 5 and pycor <= 10 and pycor != 8 and pycor != 7 [set pcolor 2]
  if pxcor = 11 and pycor >= 5 and pycor <= 10 and pycor != 8 and pycor != 7 [set pcolor 2]
  if pxcor = 0 and pycor <= 15 and pycor >= 0 [set pcolor 2]
  if pycor = 15 and pxcor >= 1 and pxcor <= 15 [set pcolor 2]
  if pxcor = 15 and pycor < 15 and pycor > 0 [set pcolor 2]
  if pycor = 0 and pxcor >= 1 and pxcor <= 15 [set pcolor 2]
  if pxcor = 1 and pycor = 1 [set pcolor green]
end

to rescue 
  ca
  create-penguins 1000 [
    set shape "penguin"
    set size 2
    setxy random-xcor random-ycor
    fd 1]
  user-message "You have successfully released your species from prison! VICTORY TO THOSE THAT WADDLE!\n"
end

@#$#@#$#@
GRAPHICS-WINDOW
320
10
810
521
-1
-1
30.0
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
15
0
15
0
0
1
ticks

BUTTON
241
60
315
93
Level 1
setup1\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
85
59
182
92
Waddle Up
waddle-up\n
NIL
1
T
TURTLE
NIL
W
NIL
NIL

BUTTON
132
95
210
128
Waddle Right
waddle-right
NIL
1
T
TURTLE
NIL
D
NIL
NIL

BUTTON
55
96
128
129
Waddle Left
waddle-left
NIL
1
T
TURTLE
NIL
A
NIL
NIL

BUTTON
88
134
172
167
Waddle Down
waddle-down
NIL
1
T
TURTLE
NIL
S
NIL
NIL

BUTTON
241
95
315
128
Level 2
setup2\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
243
132
317
165
Level 3
setup3
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

MONITOR
266
10
317
55
Score
count patches with [pcolor = 95] * 10
17
1
11

MONITOR
207
10
264
55
level
level
1
1
11

TEXTBOX
42
233
192
317
THIN ICE\n\nStart by selecting one of the three levels listed on the upper right. We suggest you start with level 1. 
11
0.0
1

TEXTBOX
42
324
192
408
If stranded on ice, select level to restart.\nOnce you reach a target, you can go on to the next level. 
11
0.0
1

BUTTON
46
447
169
480
Success March
rescue
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

TEXTBOX
46
410
196
438
Upon completion of level 3 click this: 
11
0.0
1

@#$#@#$#@
WHAT IS IT?
-----------
The world has been frozen by the Blizzard. Now, all that remains is ice, snow, and winter creatures. Our project consists of a one-player game of thin ice in which the player is a super cute and courageous penguin named Mumble standing on a thin sheet of ice during the freezing Ice Age. Mumble and his penguin colony lived on the North Pole while the mighty polar bears ruled the South Pole. Both species never met and had never intended to do so until the world became one, the North Pole met the South Pole. Neither species wanted to be dominated by the other and therefore, they fought in the great Ice War. The polar bears won, resulting in the imprisonment of the penguins. There was only one hope for this species and that was Mumble. Smaller than the rest of his fellow penguins, Mumble was thought to be weak and useless. However, he was the only penguin small enough to escape the bearsÕ prison and so he was sent to save penguin-kind.

HOW IT WORKS
------------
There are three levels in Mumble's journey. The first level is fairly simple. Mumble moves in one path, melting the patches behind him as he aims for the target. The more patches a player melts, the more points they will receive. However, Mumble can not enter the water of the melted patches as he will suffer hypothermia if he does. Thus, it is important for the player not to surround Mumble with water with no way out. Level 2 is a bit more complex as the amount of land has increased and there are now polar bear guards as the bears catch on to what Mumble's mission is. Mumble is to avoid bumping into these polar bears and to strategically melt as many patches possible. Level 3 is the most difficult level as it consists of seven polar bears guarding the ultimate goal, the target. Additionally, there are rock structures surrounding this target and Mumble has to move around them. Once a player wins the game, he/she is revealed a screen full of Mumble's species, rescued by a little penguin everyone had underestimated.


CREDITS AND REFERENCES
----------------------
By Stephanie Wong and Anni Zhang
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

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

penguin
false
0
Circle -16777216 true false 73 133 152
Polygon -16777216 true false 219 181 205 152 185 120 174 95 163 64 156 37 149 7 147 166
Polygon -16777216 true false 64 197 90 165 105 135 111 110 122 79 129 52 135 21 139 180
Circle -16777216 true false 86 11 127
Line -16777216 false 120 60 150 90
Line -16777216 false 150 90 180 60
Circle -1 true false 89 149 122
Circle -13791810 true false 105 45 30
Circle -13791810 true false 165 45 30
Polygon -1184463 true false 135 90 150 120 165 90 135 90 150 120
Polygon -1184463 true false 105 270 90 285 105 285 105 300 120 285 135 300 135 285
Polygon -1184463 true false 165 285 165 300 180 285 195 300 195 285 210 285 195 270
Polygon -16777216 true false 105 135 45 225 75 210
Polygon -16777216 true false 180 120 255 225 225 210

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

petals
false
0
Circle -7500403 true true 117 12 66
Circle -7500403 true true 116 221 67
Circle -7500403 true true 41 41 67
Circle -7500403 true true 11 116 67
Circle -7500403 true true 41 191 67
Circle -7500403 true true 191 191 67
Circle -7500403 true true 221 116 67
Circle -7500403 true true 191 41 67
Circle -7500403 true true 60 60 180

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

polar bear
false
1
Circle -1 true false 76 96 108
Circle -1 true false 122 75 150
Polygon -1 true false 150 90 101 90 99 179 165 180
Circle -1 true false 15 45 120
Circle -1 true false 234 69 42
Circle -1 true false 105 45 30
Circle -1 true false 15 45 30
Polygon -1 true false 90 150 75 225 60 225 60 240 90 240 105 195 120 180
Polygon -1 true false 120 195 120 255 105 255 105 270 150 270 150 195
Polygon -1 true false 225 195 255 255 225 255 225 270 270 270 270 255 270 150
Polygon -1 true false 180 210 195 240 180 240 180 255 210 255 210 210
Polygon -1184463 true false 60 60 45 30 60 45 75 15 90 45 105 30 90 60 60 60
Polygon -16777216 true false 60 120 90 120 75 135 60 120
Circle -16777216 true false 90 90 30
Circle -16777216 true false 30 90 30

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
