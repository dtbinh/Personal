patches-own [scene1 scene2 scene3 scene4 scene5 scene6 scene7 scene8
  scene9 scene10 scene11 scene12 scene13 scene14 scene15 scene16 scene17
  scene18 scene19]
to setup
  ask turtles [die]
  user-message "Buffering... Please Wait Patiently"
  import-pcolors "cavee.png"
  ask patches [set scene1 pcolor]
  import-pcolors "3doors.png"
  ask patches [set scene2 pcolor]
  import-pcolors "loser.png"
  ask patches [set scene3 pcolor]
  import-pcolors "ghostworld.png"
  ask patches [set scene4 pcolor]
  import-pcolors "batcave.png"
  ask patches [set scene5 pcolor]
  import-pcolors "cavetunnelview.png"
  ask patches [set scene6 pcolor]
  import-pcolors "riverview.png"
  ask patches [set scene7 pcolor]
  import-pcolors "waterfallview.png"
  ask patches [set scene8 pcolor]
  import-pcolors "gatesofhellview.png"
  ask patches [set scene9 pcolor]
  import-pcolors "gatesofheavenview.png"
  ask patches [set scene10 pcolor]
  import-pcolors "whirlpoolview.png"
  ask patches [set scene11 pcolor]
  import-pcolors "jurrass.png"
  ask patches [set scene12 pcolor]
  import-pcolors "chase.png"
  ask patches [set scene13 pcolor]
  import-pcolors "meetcavemen.png"
  ask patches [set scene14 pcolor]
  import-pcolors "cavemenvillage.png"
  ask patches [set scene15 pcolor]
  import-pcolors "volcano.png"
  ask patches [set scene16 pcolor]
  import-pcolors "volcanotop.png"
  ask patches [set scene17 pcolor]
  import-pcolors "waterfall2.png"
  ask patches [set scene18 pcolor]
  import-pcolors "winner.png"
  ask patches [set scene19 pcolor]
  ask patches [set pcolor black]
  user-message "Please Click Begin and only Begin for a bugless experience"
end

to begin
  ask turtles [die]
  ask patches [set pcolor scene1]
  crt 1 [set shape "personf" set size 10 setxy -11 -13  
    repeat 5 [set heading 90 fd 1 wait .1 set heading 0 fd 1 wait .1]]    
  User-message "Please Click Next and only Next for a bugless experience"
end

to next
  crt 1 [set shape "bear" setxy -12 -2 set heading 0 set size 10 ]
  ask turtles with [shape = "personf"] 
  [set shape "persons" wait 2 set shape "personsf" repeat 3[set heading 90 fd 4 wait .1]]
  ask turtles [die]
  ask patches [set pcolor scene2]
  wait 1
  crt 1 [set shape "personb" set size 10 set heading 0 bk 10 
    set label "Pick 1 of the three doors, your choice seals your fate."]
end

to I
  ask patches [set pcolor scene4]
  ask turtles with [shape = "personb"] [set label "AHHHHHHHHH...AHHHHHHHH"]
  crt 1 [set shape "ghost1" set size 10 set heading 0 setxy -11 9]
  crt 1 [set shape "ghost2" set size 10 set heading 0 setxy 11 9
    set label "Eating time!!!"]
  crt 1 [set shape "ghost3" set size 10 set heading 0 setxy 0 11]
  wait 3
  ask turtles [die]
  ask patches [set pcolor black]
  wait 2
  ask patches [set pcolor scene3]
  user-message "You Lost The Game.. To try again please click Next and only Next for a bugless experience"
end

to II 
  ask patches [set pcolor scene5]
  ask turtles with [shape = "personb"] [set label "Aw dammit"]
  crt 1 [set shape "bat1" set size 5 set heading 0 setxy -11 11] 
  crt 1 [set shape "bat1f" set size 5 set heading 0 setxy 5 11]
  crt 1 [set shape "bat2" set size 5 set heading 0 setxy -5 11]
  crt 1 [set shape "bat2f" set size 5 set heading 0 setxy 11 11]
  wait 3
  ask turtles [die]
  crt 1 [set heading 0 setxy 0 -11 set shape "spazz" set size 10]
  wait 2
  ask turtles [die]
  ask patches [set pcolor scene3]
   user-message "You Lost The Game.. To try again please click Next and only Next for a bugless experience"
end

to III
  ask patches [set pcolor scene6]
  ask turtles with [shape = "personb"] [set label ""]
  wait 2
  ask turtles with [shape = "personb"] [set shape "personf" set label "" setxy -10 8] 
  ask patches [set pcolor scene7] 
  wait 2
  ask patches [set pcolor black]
  ask turtles with [shape = "personf"] [ set shape "personf" set label "" setxy -10 8 
    set label "Hey who turned off the lights?"]
  wait 2 
  ask turtles with [shape = "personf"] [set heading 90 repeat 10 [fd 1 wait .1]
    set heading 180 repeat 10 [fd 1 wait .1]]
  crt 1 [set shape "stalagtite" setxy 0 14 set size 10 
    repeat 10 [set heading 0 bk 1 wait .1 set label "A stalagtite falls and hits you on your head."]] 
  wait 2
  ask turtles [die] 
  crt 1 [set size 10 set shape "personf" 
    set label "You have died, now you see two doors before you." 
    wait 
    2 set label "Select to go to heaven or hell."]
end

to heaven 
  ask patches [set pcolor scene10]
  ask turtles [set label-color black set label " You are about to enter, but trip and fall"]
  wait 3
  ask patches [set pcolor scene6] 
  ask turtles [set label-color white set label " You wake up back in a cave tunnel"]
  wait 3
  ask patches [set pcolor scene7]
  ask turtles [setxy -10 8 set label "" 
    set heading 90 repeat 10 [fd 1 wait .1]
    set heading 180 repeat 10 [fd 1 wait .1]]
  wait 1
  ask turtles with [shape = "personf"] [set heading 0 set shape "splash"
    set label "Oh dear, you tripped and fell into the river!"]
  wait 3
  ask patches [set pcolor scene8]
  ask turtles with [shape = "splash"] [set shape "personsf"]
  ask patches [set pcolor scene8]
  ask turtles [set label "Is that a waterfall..."]
  wait 3
  ask patches [set pcolor scene11] 
  ask turtles with [shape = "personsf"] [set shape "whirlsplash" setxy -13 13 
    set label "After miraculously suriving the fall, you are now being sucked into a whirlpool"
    set heading 180 repeat 20 [fd 1 wait .1]
    set heading 90 repeat 20 [fd 1 wait .1]
    set heading 0 repeat 15 [fd 1 wait .1]
    set heading 270 repeat 15 [fd 1 wait .1]
    set heading 180 repeat 10 [fd 1 wait .1]
    set heading 90 repeat 5 [fd 1 wait .1]] 
  user-message "Please click newworld and only newworld for a bugless experience"
end

to hell
  ask patches [set pcolor scene9]
  ask turtles [set label " You are about to enter, but trip and fall"]
  wait 3
  ask patches [set pcolor scene6] 
  ask turtles [set label " You wake up back in a cave tunnel"]
  wait 3
  ask patches [set pcolor scene7]
  ask turtles [setxy -10 8 set label "" 
    set heading 90 repeat 10 [fd 1 wait .1]
    set heading 180 repeat 10 [fd 1 wait .1]]
  wait .1
  ask turtles with [shape = "personf"] [set heading 0 set shape "splash" 
    set label "Oh dear, you tripped and fell into the river!"]
  wait 3
  ask patches [set pcolor scene8]
  ask turtles with [shape = "splash"] [set shape "personsf"]
  ask patches [set pcolor scene8]
  ask turtles [set label "Is that a waterfall..."]
  wait 3
  ask patches [set pcolor scene11] 
  ask turtles with [shape = "personsf"] [set shape "whirlsplash" setxy -13 13 
    set label "After miraculously suriving the fall, you are now being sucked into a whirlpool"
    set heading 180 repeat 20 [fd 1 wait .1]
    set heading 90 repeat 20 [fd 1 wait .1]
    set heading 0 repeat 15 [fd 1 wait .1]
    set heading 270 repeat 15 [fd 1 wait .1]
    set heading 180 repeat 10 [fd 1 wait .1]
    set heading 90 repeat 5 [fd 1 wait .1 
    set label " "]] 
  user-message "Please click newworld and only newworld for a bugless experience"
end

to newworld
  ask turtles [die]
  ask patches [set pcolor scene12]
  crt 1 [set size 5 set shape "person" set heading 270 setxy 7 -10] 
  crt 1 [set size 4 set shape "dinosaur1f" set heading 0 setxy -13 -11] 
  crt 1 [set size 4 set shape "dinosaur1f" set heading 0 setxy -11 -8]
  crt 1 [set size 4 set shape "dinosaur1f" set heading 0 setxy -9 -11]
  ask turtles with [shape = "person"] [set shape "personsf" 
    set label "Where am I? Are those dinosaurs..?"]
  wait 2
  ask turtles with [shape = "dinosaur1f"] [ repeat 8 [set xcor xcor + 1 wait .1]]
  wait 1
  ask patches [set pcolor scene13]  
  ask turtles [set ycor ycor + 10]
  ask turtles with [shape = "personsf"] [set label "AHHHHHHHHHHH!!!!111!11!1!!111!!1!111!!1"]
  wait 3
  ask patches [set pcolor scene14]
  ask patches with [pcolor = black] [set plabel "Cavemen killed the dinosaurs"]
  ask turtles with [shape = "dinosaur1f"] [die]
  ask turtles with [shape = "personsf"] [set shape "personf" setxy -1 12
    set label "Should I follow these cavemen or should I run?"]
  crt 1 [set shape "caveman1" set size 5 setxy 14 -7 set heading 0 set color red]
  crt 1 [set shape "caveman2" set size 5 setxy -4 1 set heading 0 set color red]
  crt 1 [set shape "caveman3" set size 5 setxy 4 6 set heading 0 set color red]
  crt 1 [set shape "cavewoman" set size 5 setxy 9 3 set heading 0 set color red]
  wait 4
  ask patches with [pcolor = black] [set plabel " "]
end

to followthem
  ask turtles [die]
  ask patches [set pcolor scene15]
  crt 1 [set shape "chieftan" setxy 7 -1 set size 8 set heading 0 set color grey 
    set label-color black set label "Sacrifice him at the summit of the volcano."]  
  crt 1 [set shape "caveman1f" setxy 1 -10 set size 8 set heading 0]   
  crt 1 [set shape "caveman2f" setxy -6 -13 set size 8 set heading 0 set color red]
  crt 1 [set shape "caveman3f" setxy -13 -10 set size 8 set heading 0 set color red]
  crt 1 [set shape "cavewomanf" setxy -1 3 set size 8 set heading 0] 
  crt 1 [set shape "persont" setxy 12 -7 set size 8 set heading 0 set label "They have tied you up."]
  wait 3  
  ask turtles [die]
  ask patches [set pcolor scene16]
  crt 1 
  ask turtles[ set xcor 3 set label "They carry you up the volcano repeating a chant." 
    set color brown]
  wait 3
  ask turtles [die]
  ask patches [set pcolor scene17]
  crt 1 [set shape "chieftan" setxy 11 1 set size 8 set heading 0 set color grey 
    set label-color black set label "Push him in."]
  crt 1 [set shape "caveman1" setxy 3 -10 set size 8 set heading 0]   
  crt 1 [set shape "caveman2" setxy 12 -11 set size 8 set heading 0 set color red]
  crt 1 [set shape "caveman3" setxy 1 10 set size 8 set heading 0 set color grey]
  crt 1 [set shape "firedead" setxy -11 3 set size 8 set label-color black set label "AHHHHH IT BURNS!!!1!"]
  wait 3
  ask turtles [die] 
  ask patches [set pcolor scene3] 
  user-message "You Lost The Game.. To try again please click newworld and only newworld for a bugless experience"
end

to runaway
  ask turtles [die]
  crt 1 [set shape "person" set size 5 setxy -9 12 set label "Please... No more..."]
  crt 1 [set shape "dinosaur2" set size 15 set heading 0 setxy 9 8 set label "The T-Rex steps and kills the cavemen."]
  crt 1 [set shape "deadcave" set heading 0 set size 5 setxy 10 -9]
  crt 1 [set shape "deadcave" set heading 0 set size 5 setxy 7 -14]
  crt 1 [set shape "deadcave" set heading 0 set size 5 setxy 1 -14]
  crt 1 [set shape "deadcave" set heading 0 set size 5 setxy 12 -14]
  wait 1
  ask turtles with [shape = "person"] [set shape "personsf"]
  wait 1
  ask turtles with [shape = "personsf"] [set shape "persons"]
  wait 1
  ask patches [set pcolor scene13] 
  ask turtles with [shape = "deadcave"] [die]
  ask turtles with [shape = "persons"] [setxy -6 -2 set label "WHY IS THIS HAPPENING TO ME?"]
  ask turtles with [shape = "dinosaur2"] [setxy 9 -1 set label "HE SEEMS VERY HUNGRY AND LIKES FUTURISTIC PROCESSED MEAT."]
  crt 1 [set shape "dactyl" setxy 4 13 set size 8 set heading 0 set label "I have no idea why hes chasing you."]
  wait 7
  ask turtles [set label " "]
  ask patches [set pcolor scene12]
  ask turtles with [shape = "persons"] [setxy 0 -2 set label "I'm going to just jump and end this once and for all."]
  wait 4
  ask turtles with [shape = "persons"] [set heading 270 fd 14 set shape "splash" set heading 0 set label " "]
  wait 3
  ask turtles [die]
  ask patches [set pcolor scene18] 
  crt 1 [set shape "personsf" set heading 0 set size 10 setxy -1 12 set label "GOOD BYE CRUEL WORLD"
    repeat 20 [set ycor ycor - 1 wait .1]]
  wait .1
  ask patches [set pcolor scene1]
  ask turtles [setxy -7 -9 set shape "wetperson" set heading 0 set label "Where am I, where are the dinosaurs?"] 
  wait 5
  ask turtles [die]
  ask patches [set pcolor scene19]
  wait 2
  user-message "Moral of the story kids, sucide is not the answer. =] smiley face"
end
  
    
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 
@#$#@#$#@
GRAPHICS-WINDOW
210
10
649
470
16
16
13.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks

BUTTON
57
16
120
49
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
19
65
82
98
NIL
begin
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
91
66
154
99
NIL
next
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
-1
126
62
159
NIL
I
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
63
124
126
157
NIL
II
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
127
128
190
161
NIL
III
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
18
179
91
212
NIL
heaven
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
103
179
166
212
NIL
hell
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
51
242
136
275
NIL
newworld
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
8
308
100
341
NIL
followthem
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
106
308
186
341
NIL
runaway
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

@#$#@#$#@

HOW TO USE IT
-------------
	In order to experience our story flawlessly, you must read and follow all the steps that the messages tell you to. You must click each button and only 1 button at a time to change each scene and move on through out the story.

scene1- cave entrance
scene2- 3 doors
scene3- losing screen
scene4- ghosts
scene5- bats
scene6- path 
scene7- river
scene8- waterfall
scene9- hells door
scene10- heavens door
scene11- whirlpool
scene12- dinoland1
scene13- dinoland2
scene14- dinoland3
scene15- cavemen village
scene16- volcano
scene17- volcano top
scene18- waterfall dino
scene19- winner


CREDITS AND REFERENCES
----------------------
-Cong Jie Li
-Ivan Nie
TEAM C.L.I.N
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

bat1
true
0
Circle -16777216 false false 135 180 30
Line -16777216 false 135 225 150 195
Line -16777216 false 165 120 135 135
Line -16777216 false 135 180 225 150
Line -16777216 false 135 90 165 180
Line -16777216 false 135 90 105 165
Circle -16777216 false false 105 135 60
Circle -6459832 true false 105 135 60
Polygon -6459832 true false 120 150 135 180 225 150 225 120 195 135 195 120 165 135 165 120 135 135 120 165
Circle -6459832 true false 135 180 30
Rectangle -6459832 true false 150 195 180 210
Polygon -16777216 true false 45 105 60 90
Polygon -6459832 true false 105 165 135 90 150 135 105 165
Polygon -6459832 true false 135 195 135 225 150 195 135 195
Line -16777216 false 225 150 225 120
Line -16777216 false 225 120 195 135
Line -16777216 false 195 135 195 120
Line -16777216 false 195 120 165 135
Line -16777216 false 165 135 165 120
Line -16777216 false 135 195 135 225
Line -16777216 false 165 195 180 195
Line -16777216 false 180 195 180 210
Line -16777216 false 180 210 150 210

bat1f
true
0
Circle -16777216 false false 135 180 30
Line -16777216 false 165 225 150 195
Line -16777216 false 135 120 165 135
Line -16777216 false 165 180 75 150
Line -16777216 false 165 90 135 180
Line -16777216 false 165 90 195 165
Circle -16777216 false false 135 135 60
Circle -6459832 true false 135 135 60
Polygon -6459832 true false 180 150 165 180 75 150 75 120 105 135 105 120 135 135 135 120 165 135 180 165
Circle -6459832 true false 135 180 30
Rectangle -6459832 true false 120 195 150 210
Polygon -16777216 true false 255 105 240 90
Polygon -6459832 true false 195 165 165 90 150 135 195 165
Polygon -6459832 true false 165 195 165 225 150 195 165 195
Line -16777216 false 75 150 75 120
Line -16777216 false 75 120 105 135
Line -16777216 false 105 135 105 120
Line -16777216 false 105 120 135 135
Line -16777216 false 135 135 135 120
Line -16777216 false 165 195 165 225
Line -16777216 false 135 195 120 195
Line -16777216 false 120 195 120 210
Line -16777216 false 120 210 150 210

bat2
true
0
Circle -16777216 true false 105 135 60
Polygon -16777216 true false 120 150 135 180 225 150 225 120 195 135 195 120 165 135 165 120 135 135 120 165
Circle -16777216 true false 135 180 30
Rectangle -16777216 true false 150 195 180 210
Polygon -16777216 true false 45 105 60 90
Polygon -16777216 true false 105 165 135 90 150 135 105 165
Polygon -16777216 true false 135 195 135 225 150 195 135 195

bat2f
true
0
Circle -16777216 true false 135 135 60
Polygon -16777216 true false 180 150 165 180 75 150 75 120 105 135 105 120 135 135 135 120 165 135 180 165
Circle -16777216 true false 135 180 30
Rectangle -16777216 true false 120 195 150 210
Polygon -16777216 true false 255 105 240 90
Polygon -16777216 true false 195 165 165 90 150 135 195 165
Polygon -16777216 true false 165 195 165 225 150 195 165 195

bear
true
0
Polygon -1 true false 90 105 105 105 105 75 90 60 90 105
Polygon -1 true false 255 90 270 90 270 60 255 45 255 90
Polygon -1 true false 270 90 285 90 285 60 270 45 270 90
Polygon -6459832 true false 210 165 240 165 255 165 300 135 300 90 285 75 255 75 240 90 240 105 255 120 225 135 195 135 210 165
Circle -6459832 true false 135 120 90
Polygon -1 true false 195 225 195 210 210 195 210 240 195 240 195 225
Circle -6459832 true false 150 75 30
Polygon -6459832 true false 195 135 150 135 150 150 165 150 180 165 195 135
Circle -6459832 true false 135 90 60
Polygon -2674135 true false 150 90 165 105 150 105 150 90
Rectangle -6459832 true false 180 105 195 120
Circle -6459832 true false 120 75 30
Polygon -6459832 true false 210 90 180 105 180 135 210 150 225 135 195 120 225 105
Line -16777216 false 225 135 195 120
Line -16777216 false 225 105 195 120
Line -16777216 false 225 135 210 150
Polygon -16777216 true false 210 90 225 105 225 90 210 90
Line -16777216 false 210 150 195 150
Line -1184463 false 195 150 180 135
Polygon -1184463 true false 210 90 180 105 180 135 195 150 210 150 225 135 195 120 225 105 210 90
Polygon -6459832 true false 135 135 120 150 165 150 165 135 135 135
Rectangle -6459832 true false 105 135 135 150
Polygon -6459832 true false 225 195 210 210 210 240 240 270 240 300 195 300 195 285 165 255 150 255 135 270 120 285 120 300 75 300 75 270 105 240 105 165 225 165
Polygon -6459832 true false 225 195 225 240 210 255 180 225 195 180 225 195
Circle -6459832 true false 75 210 30
Polygon -1 true false 255 75 270 60
Circle -6459832 true false 90 120 90
Polygon -6459832 true false 135 165 105 165 90 165 45 135 45 90 60 75 90 75 105 90 105 105 90 120 120 135 150 135 135 165
Line -16777216 false 270 60 270 75
Line -16777216 false 285 60 285 75
Polygon -16777216 true false 195 60 210 60
Polygon -1 true false 285 75 300 75 300 60 285 45 285 75
Polygon -6459832 true false 240 105 285 75 300 75 300 135 240 135 240 105
Line -16777216 false 285 60 285 75
Polygon -1 true false 240 90 240 75 255 60 255 90 240 90
Line -16777216 false 255 60 255 75
Polygon -6459832 true false 105 105 105 135 45 135 45 75 60 75
Polygon -1 true false 60 90 45 90 45 60 60 45 60 90
Polygon -1 true false 75 90 60 90 60 60 75 45 75 90
Polygon -1 true false 90 90 75 90 75 60 90 45 90 90
Line -16777216 false 90 60 90 75
Line -16777216 false 75 60 75 90
Line -16777216 false 60 60 60 90
Line -16777216 false 105 105 105 120
Circle -6459832 true false 75 120 90
Line -16777216 false 105 120 135 120
Line -16777216 false 45 135 105 180
Circle -6459832 true false 88 148 95
Circle -6459832 true false 84 204 42
Line -16777216 false 90 210 90 225
Line -16777216 false 105 240 90 225
Circle -6459832 true false 131 206 67
Polygon -1 true false 240 285 255 300 240 300 240 285
Polygon -1 true false 225 285 240 300 225 300 225 285
Polygon -1 true false 210 285 225 300 210 300 210 285
Polygon -1 true false 120 285 135 300 120 300 120 285
Polygon -1 true false 105 285 120 300 105 300 105 285
Polygon -1 true false 90 285 105 300 90 300 90 285
Line -16777216 false 195 150 180 165
Circle -6459832 true false 114 114 42

bearf
true
0
Polygon -1 true false 210 105 195 105 195 75 210 60 210 105
Polygon -1 true false 45 90 30 90 30 60 45 45 45 90
Polygon -1 true false 30 90 15 90 15 60 30 45 30 90
Polygon -6459832 true false 90 165 60 165 45 165 0 135 0 90 15 75 45 75 60 90 60 105 45 120 75 135 105 135 90 165
Circle -6459832 true false 75 120 90
Polygon -1 true false 105 225 105 210 90 195 90 240 105 240 105 225
Circle -6459832 true false 120 75 30
Polygon -6459832 true false 105 135 150 135 150 150 135 150 120 165 105 135
Circle -6459832 true false 105 90 60
Polygon -2674135 true false 150 90 135 105 150 105 150 90
Rectangle -6459832 true false 105 105 120 120
Circle -6459832 true false 150 75 30
Polygon -6459832 true false 90 90 120 105 120 135 90 150 75 135 105 120 75 105
Line -16777216 false 75 135 105 120
Line -16777216 false 75 105 105 120
Line -16777216 false 75 135 90 150
Polygon -16777216 true false 90 90 75 105 75 90 90 90
Line -16777216 false 90 150 105 150
Line -1184463 false 105 150 120 135
Polygon -1184463 true false 90 90 120 105 120 135 105 150 90 150 75 135 105 120 75 105 90 90
Polygon -6459832 true false 165 135 180 150 135 150 135 135 165 135
Rectangle -6459832 true false 165 135 195 150
Polygon -6459832 true false 75 195 90 210 90 240 60 270 60 300 105 300 105 285 135 255 150 255 165 270 180 285 180 300 225 300 225 270 195 240 195 165 75 165
Polygon -6459832 true false 75 195 75 240 90 255 120 225 105 180 75 195
Circle -6459832 true false 195 210 30
Polygon -1 true false 45 75 30 60
Circle -6459832 true false 120 120 90
Polygon -6459832 true false 165 165 195 165 210 165 255 135 255 90 240 75 210 75 195 90 195 105 210 120 180 135 150 135 165 165
Line -16777216 false 30 60 30 75
Line -16777216 false 15 60 15 75
Polygon -16777216 true false 105 60 90 60
Polygon -1 true false 15 75 0 75 0 60 15 45 15 75
Polygon -6459832 true false 60 105 15 75 0 75 0 135 60 135 60 105
Line -16777216 false 15 60 15 75
Polygon -1 true false 60 90 60 75 45 60 45 90 60 90
Line -16777216 false 45 60 45 75
Polygon -6459832 true false 195 105 195 135 255 135 255 75 240 75
Polygon -1 true false 240 90 255 90 255 60 240 45 240 90
Polygon -1 true false 225 90 240 90 240 60 225 45 225 90
Polygon -1 true false 210 90 225 90 225 60 210 45 210 90
Line -16777216 false 210 60 210 75
Line -16777216 false 225 60 225 90
Line -16777216 false 240 60 240 90
Line -16777216 false 195 105 195 120
Circle -6459832 true false 135 120 90
Line -16777216 false 195 120 165 120
Line -16777216 false 255 135 195 180
Circle -6459832 true false 117 148 95
Circle -6459832 true false 174 204 42
Line -16777216 false 210 210 210 225
Line -16777216 false 195 240 210 225
Circle -6459832 true false 102 206 67
Polygon -1 true false 60 285 45 300 60 300 60 285
Polygon -1 true false 75 285 60 300 75 300 75 285
Polygon -1 true false 90 285 75 300 90 300 90 285
Polygon -1 true false 180 285 165 300 180 300 180 285
Polygon -1 true false 195 285 180 300 195 300 195 285
Polygon -1 true false 210 285 195 300 210 300 210 285
Line -16777216 false 105 150 120 165
Circle -6459832 true false 144 114 42

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

caveman1
true
0
Polygon -1184463 true false 90 105 60 135 90 165 120 135 150 120 105 90
Polygon -1184463 true false 120 195 105 225 105 255 150 255 150 195 180 195 180 255 225 255 225 240 210 225 210 180 135 180 120 195
Rectangle -1184463 true false 165 120 225 195
Polygon -6459832 true false 120 75 135 60 150 60 165 60 165 90 180 105 180 120 195 135 195 150 210 165 210 180 225 195 225 225 210 195 210 225 195 195 180 210 180 195 165 210 165 195 165 225 150 195 135 225 135 210 120 225 105 195 120 165 120 135 120 75
Circle -1184463 true false 90 75 60
Polygon -1184463 true false 165 60 180 60 195 75 210 90 225 120 240 150 240 180 210 180 210 165 210 150 195 135 180 120 180 105 165 90 165 60
Polygon -16777216 true false 90 75 90 105 105 90 105 105 120 90 120 105 135 90 135 105 150 90 135 75 120 75 105 75 90 90
Line -16777216 false 210 180 210 150
Line -16777216 false 210 150 180 120
Line -16777216 false 180 120 180 105
Line -16777216 false 180 105 165 90
Line -16777216 false 165 90 165 60
Line -16777216 false 210 180 225 180
Rectangle -1184463 true false 90 225 120 255
Line -16777216 false 105 225 120 225
Line -16777216 false 105 120 135 120
Circle -16777216 false false 90 75 60
Polygon -1184463 true false 90 165 60 165 45 150 75 120
Polygon -6459832 true false 45 150 30 135 15 135 0 120 0 90 15 75 45 75 60 90 60 120 60 135 105 180 90 195 60 165
Line -16777216 false 60 135 90 165
Polygon -1184463 true false 60 135 45 150 75 180 90 165 60 135
Line -16777216 false 60 165 75 150
Line -16777216 false 45 150 60 135
Line -16777216 false 75 165 90 150
Line -16777216 false 75 135 60 150
Polygon -1 true false 60 135 90 165 105 150 75 120 60 135

caveman1f
true
0
Polygon -1184463 true false 210 105 240 135 210 165 180 135 150 120 195 90
Polygon -1184463 true false 180 195 195 225 195 255 150 255 150 195 120 195 120 255 75 255 75 240 90 225 90 180 165 180 180 195
Rectangle -1184463 true false 75 120 135 195
Polygon -6459832 true false 180 75 165 60 150 60 135 60 135 90 120 105 120 120 105 135 105 150 90 165 90 180 75 195 75 225 90 195 90 225 105 195 120 210 120 195 135 210 135 195 135 225 150 195 165 225 165 210 180 225 195 195 180 165 180 135 180 75
Circle -1184463 true false 150 75 60
Polygon -1184463 true false 135 60 120 60 105 75 90 90 75 120 60 150 60 180 90 180 90 165 90 150 105 135 120 120 120 105 135 90 135 60
Polygon -16777216 true false 210 75 210 105 195 90 195 105 180 90 180 105 165 90 165 105 150 90 165 75 180 75 195 75 210 90
Line -16777216 false 90 180 90 150
Line -16777216 false 90 150 120 120
Line -16777216 false 120 120 120 105
Line -16777216 false 120 105 135 90
Line -16777216 false 135 90 135 60
Line -16777216 false 90 180 75 180
Rectangle -1184463 true false 180 225 210 255
Line -16777216 false 195 225 180 225
Line -16777216 false 195 120 165 120
Circle -16777216 false false 150 75 60
Polygon -1184463 true false 210 165 240 165 255 150 225 120
Polygon -6459832 true false 255 150 270 135 285 135 300 120 300 90 285 75 255 75 240 90 240 120 240 135 195 180 210 195 240 165
Line -16777216 false 240 135 210 165
Polygon -1184463 true false 240 135 255 150 225 180 210 165 240 135
Line -16777216 false 240 165 225 150
Line -16777216 false 255 150 240 135
Line -16777216 false 225 165 210 150
Line -16777216 false 225 135 240 150
Polygon -1 true false 240 135 210 165 195 150 225 120 240 135

caveman2
true
0
Polygon -1184463 true false 75 120 75 75 45 75 45 150 105 150 105 120 75 120
Polygon -1184463 true false 105 240 105 255 90 255 90 270 120 270 135 270 135 255 135 240 135 225 165 225 165 240 165 255 180 270 195 255 180 240 180 150 195 165 195 195 225 195 225 150 165 105
Polygon -1184463 true false 75 120 105 105 120 120 75 120
Polygon -6459832 true false 165 150 195 225 195 240 180 225 180 240 165 225 165 240 150 225 150 240 135 225 135 240 120 225 120 240 105 225 105 240 90 225 90 150 105 105 165 150
Circle -1184463 true false 101 56 67
Polygon -1184463 true false 105 105 105 90
Polygon -16777216 true false 105 105 120 120 135 105 135 120 150 105 165 120 165 105 180 150 165 150 150 165 150 150 135 165 135 150 105 165 105 135 75 165 105 105
Polygon -16777216 true false 135 90 150 75 150 90 135 90
Polygon -16777216 true false 120 90 105 75 105 90 120 90
Line -16777216 false 105 105 150 105
Polygon -16777216 true false 165 105 150 105 165 120 165 105
Polygon -1184463 true false 75 90 75 120
Rectangle -6459832 true false 75 180 195 195
Line -16777216 false 90 180 180 180
Line -16777216 false 90 195 180 195
Rectangle -6459832 true false 225 180 255 195
Polygon -7500403 true true 75 165 75 210 30 195

caveman2f
true
0
Polygon -1184463 true false 225 120 225 75 255 75 255 150 195 150 195 120 225 120
Polygon -1184463 true false 195 240 195 255 210 255 210 270 180 270 165 270 165 255 165 240 165 225 135 225 135 240 135 255 120 270 105 255 120 240 120 150 105 165 105 195 75 195 75 150 135 105
Polygon -1184463 true false 225 120 195 105 180 120 225 120
Polygon -6459832 true false 135 150 105 225 105 240 120 225 120 240 135 225 135 240 150 225 150 240 165 225 165 240 180 225 180 240 195 225 195 240 210 225 210 150 195 105 135 150
Circle -1184463 true false 132 56 67
Polygon -1184463 true false 195 105 195 90
Polygon -16777216 true false 195 105 180 120 165 105 165 120 150 105 135 120 135 105 120 150 135 150 150 165 150 150 165 165 165 150 195 165 195 135 225 165 195 105
Polygon -16777216 true false 165 90 150 75 150 90 165 90
Polygon -16777216 true false 180 90 195 75 195 90 180 90
Line -16777216 false 195 105 150 105
Polygon -16777216 true false 135 105 150 105 135 120 135 105
Polygon -1184463 true false 225 90 225 120
Rectangle -6459832 true false 105 180 225 195
Line -16777216 false 210 180 120 180
Line -16777216 false 210 195 120 195
Rectangle -6459832 true false 45 180 75 195
Polygon -7500403 true true 225 165 225 210 270 195

caveman3
true
0
Rectangle -6459832 true false 215 21 233 274
Polygon -1184463 true false 147 85 233 84 233 126 181 129 178 184 197 225 198 257 207 276 177 274 162 251 164 215 144 198 99 198 98 226 98 248 49 248 44 220 79 221 78 197 80 149 56 145 41 194 29 186 17 178 46 81 157 85
Polygon -1184463 true false 64 71 67 98 80 115 112 119 133 104 134 75 65 72
Polygon -16777216 true false 78 54 38 62 57 72 43 82 69 87 64 96 98 78 133 94 122 77 155 84 136 70 162 62 116 54 79 52
Line -16777216 false 76 101 117 102
Polygon -6459832 true false 180 84 203 100 186 110 206 125 183 134 197 223 179 213 168 230 147 207 135 240 111 207 96 224 83 202 67 212 53 126 43 130 44 113 32 117 44 81 63 85 66 97 81 118 112 120 136 102 137 83 177 84
Line -16777216 false 60 85 81 117
Line -16777216 false 80 116 115 116
Line -16777216 false 117 116 131 96
Polygon -7500403 true true 211 27 225 -1 241 43 226 32 206 43 210 24

caveman3f
true
0
Rectangle -6459832 true false 67 21 85 274
Polygon -1184463 true false 153 85 67 84 67 126 119 129 122 184 103 225 102 257 93 276 123 274 138 251 136 215 156 198 201 198 202 226 202 248 251 248 256 220 221 221 222 197 220 149 244 145 259 194 271 186 283 178 254 81 143 85
Polygon -1184463 true false 236 71 233 98 220 115 188 119 167 104 166 75 235 72
Polygon -16777216 true false 222 54 262 62 243 72 257 82 231 87 236 96 202 78 167 94 178 77 145 84 164 70 138 62 184 54 221 52
Line -16777216 false 224 101 183 102
Polygon -6459832 true false 120 84 97 100 114 110 94 125 117 134 103 223 121 213 132 230 153 207 165 240 189 207 204 224 217 202 233 212 247 126 257 130 256 113 268 117 256 81 237 85 234 97 219 118 188 120 164 102 163 83 123 84
Line -16777216 false 240 85 219 117
Line -16777216 false 220 116 185 116
Line -16777216 false 183 116 169 96
Polygon -7500403 true true 89 27 75 -1 59 43 74 32 94 43 90 24

cavewoman
true
0
Polygon -1184463 true false 105 105 90 105 60 195 90 195 105 195 120 120 105 105
Circle -1184463 true false 90 45 60
Polygon -1184463 true false 105 90 90 180 90 255 75 255 75 270 120 270 120 210 135 210 135 270 180 270 180 255 165 255 165 180 150 105 135 75 105 105
Circle -1184463 true false 103 88 32
Polygon -6459832 true false 105 150 165 150 180 240 165 225 165 240 150 225 135 255 135 225 120 255 105 225 105 270 90 240 75 255 90 150 105 150
Polygon -6459832 true false 90 135 105 105 150 105 165 135
Line -16777216 false 90 135 90 150
Polygon -1184463 true false 150 105 165 105 195 195 165 195 150 195 135 120 150 105
Polygon -16777216 true false 90 90 105 60 105 75 120 60 120 75 120 60 120 75 135 60 135 75 150 60 150 90 150 135 165 120 165 60 150 45 105 45 90 60
Line -16777216 false 105 90 120 90

cavewomanf
true
0
Polygon -1184463 true false 195 105 210 105 240 195 210 195 195 195 180 120 195 105
Circle -1184463 true false 150 45 60
Polygon -1184463 true false 195 90 210 180 210 255 225 255 225 270 180 270 180 210 165 210 165 270 120 270 120 255 135 255 135 180 150 105 165 75 195 105
Circle -1184463 true false 165 88 32
Polygon -6459832 true false 195 150 135 150 120 240 135 225 135 240 150 225 165 255 165 225 180 255 195 225 195 270 210 240 225 255 210 150 195 150
Polygon -6459832 true false 210 135 195 105 150 105 135 135
Line -16777216 false 210 135 210 150
Polygon -1184463 true false 150 105 135 105 105 195 135 195 150 195 165 120 150 105
Polygon -16777216 true false 210 90 195 60 195 75 180 60 180 75 180 60 180 75 165 60 165 75 150 60 150 90 150 135 135 120 135 60 150 45 195 45 210 60
Line -16777216 false 195 90 180 90

cheiftanf
true
0
Polygon -1184463 true false 225 210 225 270 255 300 195 300 180 270 180 210 225 210
Polygon -1184463 true false 105 210 105 270 75 300 135 300 150 270 150 210 105 210
Polygon -1184463 true false 195 90 255 135 270 165 285 165 285 210 225 210 225 165 240 165 195 120 195 90
Rectangle -16777216 false false 225 180 240 210
Circle -1 true false 30 0 30
Rectangle -1 true false 60 15 90 30
Rectangle -6459832 true false 30 15 45 240
Polygon -1184463 true false 195 120 210 150 240 195 135 195 135 105 195 105 195 120
Circle -1184463 true false 147 56 67
Polygon -6459832 true false 150 90 120 90 105 105 105 165 90 195 90 240 105 225 120 240 135 225 150 240 165 225 180 240 195 225 210 240 225 225 240 240 240 195 150 150 150 105 150 90
Polygon -1184463 true false 120 105 120 135 75 135 45 105 15 105 15 60 60 60 60 75 75 105 120 105
Rectangle -16777216 false false 45 60 60 75
Rectangle -16777216 false false 15 60 45 75
Rectangle -16777216 false false 15 75 45 90
Rectangle -16777216 false false 15 90 45 105
Polygon -1 true false 30 15 60 90 75 45 60 0 30 0 30 15
Polygon -16777216 true false 45 0 60 15 45 30 30 15 45 0
Polygon -16777216 true false 60 30 45 45 60 60 60 30
Line -16777216 false 60 0 75 45
Polygon -1 true false 105 30 90 0 90 30 105 30
Polygon -1 true false 30 0 30 30 0 30 0 0 15 15 30 15
Line -16777216 false 195 120 240 195
Circle -16777216 false false 147 56 67
Polygon -7500403 true true 210 60 210 90 195 75 180 90 180 75 165 90 150 75 150 105 135 75 150 45 195 45 225 90 210 75
Rectangle -16777216 false false 270 165 285 180
Rectangle -16777216 false false 270 180 285 210
Rectangle -16777216 false false 255 180 270 210
Rectangle -16777216 false false 240 180 255 210
Polygon -16777216 true false 120 180 135 195 120 210 120 225 105 210 120 180
Polygon -16777216 true false 135 135 150 165 120 165 120 150 135 135
Polygon -16777216 true false 165 180 180 210 165 210 150 195 165 180
Polygon -16777216 true false 225 210 225 225 210 225 210 210 225 195 225 210
Polygon -16777216 true false 135 90 120 90 135 105 135 120 150 105 135 90
Polygon -16777216 true false 195 180 210 180 210 195 195 210 195 180
Rectangle -1184463 true false 15 45 45 60
Rectangle -16777216 false false 15 45 45 60

chieftan
true
0
Polygon -1184463 true false 75 210 75 270 45 300 105 300 120 270 120 210 75 210
Polygon -1184463 true false 195 210 195 270 225 300 165 300 150 270 150 210 195 210
Polygon -1184463 true false 105 90 45 135 30 165 15 165 15 210 75 210 75 165 60 165 105 120 105 90
Rectangle -16777216 false false 60 180 75 210
Circle -1 true false 240 0 30
Rectangle -1 true false 210 15 240 30
Rectangle -6459832 true false 255 15 270 240
Polygon -1184463 true false 105 120 90 150 60 195 165 195 165 105 105 105 105 120
Circle -1184463 true false 86 56 67
Polygon -6459832 true false 150 90 180 90 195 105 195 165 210 195 210 240 195 225 180 240 165 225 150 240 135 225 120 240 105 225 90 240 75 225 60 240 60 195 150 150 150 105 150 90
Polygon -1184463 true false 180 105 180 135 225 135 255 105 285 105 285 60 240 60 240 75 225 105 180 105
Rectangle -16777216 false false 240 60 255 75
Rectangle -16777216 false false 255 60 285 75
Rectangle -16777216 false false 255 75 285 90
Rectangle -16777216 false false 255 90 285 105
Polygon -1 true false 270 15 240 90 225 45 240 0 270 0 270 15
Polygon -16777216 true false 255 0 240 15 255 30 270 15 255 0
Polygon -16777216 true false 240 30 255 45 240 60 240 30
Line -16777216 false 240 0 225 45
Polygon -1 true false 195 30 210 0 210 30 195 30
Polygon -1 true false 270 0 270 30 300 30 300 0 285 15 270 15
Line -16777216 false 105 120 60 195
Circle -16777216 false false 86 56 67
Polygon -7500403 true true 90 60 90 90 105 75 120 90 120 75 135 90 150 75 150 105 165 75 150 45 105 45 75 90 90 75
Rectangle -16777216 false false 15 165 30 180
Rectangle -16777216 false false 15 180 30 210
Rectangle -16777216 false false 30 180 45 210
Rectangle -16777216 false false 45 180 60 210
Polygon -16777216 true false 180 180 165 195 180 210 180 225 195 210 180 180
Polygon -16777216 true false 165 135 150 165 180 165 180 150 165 135
Polygon -16777216 true false 135 180 120 210 135 210 150 195 135 180
Polygon -16777216 true false 75 210 75 225 90 225 90 210 75 195 75 210
Polygon -16777216 true false 165 90 180 90 165 105 165 120 150 105 165 90
Polygon -16777216 true false 105 180 90 180 90 195 105 210 105 180
Rectangle -1184463 true false 255 45 285 60
Rectangle -16777216 false false 255 45 285 60

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

dactyl
true
0
Polygon -1184463 true false 135 150 120 165 120 180 135 165 135 180 150 165 150 180 165 165 135 150
Polygon -6459832 true false 150 105 135 90 135 75 90 30 60 30 15 180 90 90 120 135 150 105
Polygon -6459832 true false 90 60 45 30 90 90 60 135 105 105 120 90 120 75 90 60
Polygon -6459832 true false 90 60 105 60 135 45 135 60 120 75
Polygon -1184463 true false 105 60 90 75 105 75 105 60
Polygon -6459832 true false 135 90 150 105 165 90 165 75 225 30 300 180 195 75 240 120 195 135 150 135 150 105 135 105
Line -16777216 false 300 180 210 90
Polygon -6459832 true false 120 75 150 105 255 180 180 180 120 135 120 120 120 105 105 90 120 75
Polygon -6459832 true false 135 60 150 45 135 45
Polygon -6459832 true false 60 135 45 135 90 90
Polygon -6459832 true false 45 30 30 15 15 15 90 90
Line -16777216 false 15 15 90 90
Line -16777216 false 90 90 45 135
Line -16777216 false 45 135 60 135
Line -16777216 false 90 60 45 30
Line -16777216 false 90 60 105 60
Line -16777216 false 105 60 135 45
Line -16777216 false 135 60 120 75
Line -16777216 false 150 105 135 105
Polygon -2674135 true false 45 135 75 75 90 90 45 135
Line -16777216 false 150 180 165 165
Polygon -6459832 true false 120 135 150 165 165 180 180 165 120 135
Polygon -1184463 true false 165 165 150 180 150 195 165 180 165 195 180 180 180 195 195 180 165 165
Line -16777216 false 150 180 195 180
Line -16777216 false 120 165 150 165
Line -16777216 false 120 75 135 105

deadbloody 
false
0
Polygon -2674135 true false 15 195 0 210 15 240 30 255 75 270 135 270 165 270 180 285 225 285 240 270 270 270 300 240 300 225 300 210 285 150 225 135 135 120 75 135 15 195
Circle -1184463 true false 5 110 80
Polygon -13345367 true false 90 195 195 180 285 210 300 195 300 165 225 150 300 135 300 105 285 90 195 120 90 105
Rectangle -1184463 true false 79 128 94 173
Polygon -1184463 true false 90 105 150 60 180 75 105 135
Polygon -1184463 true false 90 195 150 240 180 225 105 165
Polygon -1184463 true false 30 180 45 180 30 165 45 150 30 135 45 120 30 120
Polygon -16777216 true false 30 180 45 180 30 165 45 150 30 150 45 120 30 120 45 105 0 120 0 195 45 195 30 180
Polygon -16777216 true false 75 285 75 255
Polygon -2674135 true false 60 120 75 135 75 165 60 180 45 165 45 135 60 120

deadcave
true
0
Polygon -2674135 true false 15 135 15 165 15 180 45 210 75 225 120 240 135 240 180 255 210 255 225 270 270 240 300 210 285 180 285 135 255 120 210 120 180 105 150 150 90 120 75 150 15 135
Polygon -1184463 true false 60 165 60 270 120 270 105 195 255 225 285 180 255 150 240 180 180 150 255 135 270 75 225 75 210 105 75 105 60 165
Polygon -6459832 true false 60 105 180 90 210 90 195 105 210 120 195 150 225 180 195 210 225 225 150 225 75 135
Circle -1184463 true false 15 105 60

deadcavef
true
0
Polygon -2674135 true false 285 135 285 165 285 180 255 210 225 225 180 240 165 240 120 255 90 255 75 270 30 240 0 210 15 180 15 135 45 120 90 120 120 105 150 150 210 120 225 150 285 135
Polygon -1184463 true false 240 165 240 270 180 270 195 195 45 225 15 180 45 150 60 180 120 150 45 135 30 75 75 75 90 105 225 105 240 165
Polygon -6459832 true false 240 105 120 90 90 90 105 105 90 120 105 150 75 180 105 210 75 225 150 225 225 135
Circle -1184463 true false 225 105 60

dinosaur1
true
0
Circle -13840069 true false 88 73 62
Polygon -13840069 true false 105 90 75 105 60 105 60 120 90 120 60 135 135 135 105 90
Polygon -2674135 true false 120 90 105 105 120 105 120 90
Polygon -13840069 true false 135 135 150 150 150 165 135 180 120 180 105 180 105 165 90 165 90 195 150 195 165 180 180 195 195 195 210 195 225 210 225 225 240 240 225 255 180 270 150 270 135 285 210 285 270 240 270 210 270 195 285 165 300 135 285 90 225 45 165 15 120 15 60 30 120 30 165 30 180 45 225 90 240 105 225 120 180 120 165 120 135 90 135 135
Rectangle -13840069 true false 30 150 30 135
Rectangle -13840069 true false 120 120 135 135
Polygon -1184463 true false 180 270 180 255 165 240 150 255 165 255 165 270 180 270
Polygon -16777216 true false 90 165 75 180
Polygon -1184463 true false 90 165 75 180 90 180 75 195 90 195 90 165
Line -16777216 false 105 120 90 120
Polygon -2674135 true false 105 75 120 60 135 60 105 90 105 75 105 60 120 45 105 45 90 60 90 90 105 90
Line -16777216 false 210 195 195 180
Line -16777216 false 195 180 210 165
Line -16777216 false 210 165 225 150

dinosaur1f
true
0
Circle -13840069 true false 150 73 62
Polygon -13840069 true false 195 90 225 105 240 105 240 120 210 120 240 135 165 135 195 90
Polygon -2674135 true false 180 90 195 105 180 105 180 90
Polygon -13840069 true false 165 135 150 150 150 165 165 180 180 180 195 180 195 165 210 165 210 195 150 195 135 180 120 195 105 195 90 195 75 210 75 225 60 240 75 255 120 270 150 270 165 285 90 285 30 240 30 210 30 195 15 165 0 135 15 90 75 45 135 15 180 15 240 30 180 30 135 30 120 45 75 90 60 105 75 120 120 120 135 120 165 90 165 135
Rectangle -13840069 true false 270 150 270 135
Rectangle -13840069 true false 165 120 180 135
Polygon -1184463 true false 120 270 120 255 135 240 150 255 135 255 135 270 120 270
Polygon -16777216 true false 210 165 225 180
Polygon -1184463 true false 210 165 225 180 210 180 225 195 210 195 210 165
Line -16777216 false 195 120 210 120
Polygon -2674135 true false 195 75 180 60 165 60 195 90 195 75 195 60 180 45 195 45 210 60 210 90 195 90
Line -16777216 false 90 195 105 180
Line -16777216 false 105 180 90 165
Line -16777216 false 90 165 75 150

dinosaur2
true
0
Line -16777216 false 180 240 195 210
Polygon -10899396 true false 135 150 135 180 120 195 120 210 135 195 150 210 150 195 150 165 135 150
Polygon -10899396 true false 135 105 120 135 135 150 135 165 150 180 165 210 150 225 150 240 180 240 195 210 195 165 165 105 135 105
Polygon -10899396 true false 60 45 75 45 90 30 105 30 120 45 135 45 135 60 150 90 150 120 150 135 135 165 120 165 105 195 75 195 60 195 45 165 60 150 30 105 60 60 45 45 60 45
Polygon -2674135 true false 30 105 90 105 105 90 120 90 105 105 105 150 90 180 60 180 45 165 60 150 45 120 30 105
Polygon -1184463 true false 30 105 30 120 45 105 30 105
Polygon -1184463 true false 60 105 75 105 60 120 60 105
Polygon -1184463 true false 45 105 45 120 60 105 45 105
Polygon -1184463 true false 75 180 90 180 75 165 75 180
Polygon -1184463 true false 75 105 90 105 75 120 75 105
Polygon -1184463 true false 60 180 75 180 60 165 60 180
Polygon -1184463 true false 60 180 45 150 45 165 60 180
Polygon -1184463 true false 90 180 90 150 105 165 90 180
Polygon -1184463 true false 90 105 90 120 105 90
Polygon -1184463 true false 105 90 105 105 105 120 120 90
Polygon -1184463 true false 105 165 90 135 105 150 105 165
Line -16777216 false 135 45 105 45
Line -16777216 false 135 45 105 60
Polygon -2674135 true false 120 60 105 75 120 75 120 60
Polygon -16777216 true false 195 105 210 120 195 120 195 105
Polygon -16777216 true false 90 75 75 90 90 90 90 75
Polygon -10899396 true false 135 90 165 90 195 90 210 90 240 90 225 75 210 60 195 60 180 45 165 45 150 30 135 30 165 15 180 30 195 30 210 45 225 45 270 90 285 120 270 135 270 150 240 180 180 180 165 195 135 165 135 90
Line -16777216 false 150 90 150 135
Line -16777216 false 150 135 135 165
Polygon -10899396 true false 180 165 180 195 195 210 195 225 180 210 165 225 165 210 165 180 180 165
Line -16777216 false 165 210 195 210
Polygon -1184463 true false 120 195 120 210 135 195 120 195
Polygon -1184463 true false 150 195 150 210 135 195 150 195
Polygon -1184463 true false 165 210 165 225 180 210 165 210
Polygon -1184463 true false 195 210 195 225 180 210 195 210
Line -16777216 false 150 180 165 165
Line -16777216 false 135 165 150 180
Polygon -10899396 true false 225 135 210 165 225 180 225 195 240 210 255 240 240 255 240 270 270 270 285 240 285 195 255 135 225 135
Line -16777216 false 180 180 180 195
Line -16777216 false 180 195 195 210
Line -16777216 false 195 210 195 225
Line -16777216 false 180 210 195 225
Line -16777216 false 180 210 165 225
Line -16777216 false 150 180 165 195
Line -16777216 false 165 195 165 225
Line -16777216 false 180 180 225 180
Polygon -1184463 true false 165 225 150 240 150 255 165 240 165 225
Polygon -1184463 true false 180 225 180 240 165 255 165 240 180 225 180 240
Polygon -1184463 true false 150 225 135 240 135 255 150 240 150 225
Polygon -1184463 true false 240 255 240 270 225 285 240 270 240 255
Polygon -1184463 true false 240 255 240 270 225 285 240 270 240 255
Polygon -1184463 true false 270 255 255 270 255 285 270 270 270 255
Polygon -1184463 true false 255 255 240 270 240 285 255 270 255 255
Polygon -1184463 true false 240 255 225 270 225 285 240 270 240 255
Line -16777216 false 225 180 210 165
Line -16777216 false 210 165 225 135
Polygon -10899396 true false 30 105 60 105 60 90 45 75 30 75 30 105
Polygon -16777216 true false 30 75 45 90 30 90 30 75
Line -16777216 false 225 180 225 195
Line -16777216 false 225 195 240 210
Line -16777216 false 240 210 255 240
Line -16777216 false 255 240 240 255
Line -16777216 false 270 270 285 240
Line -16777216 false 285 240 285 195
Line -16777216 false 285 195 255 135
Line -16777216 false 270 150 270 135
Line -16777216 false 270 135 285 120
Line -16777216 false 285 120 270 90
Line -16777216 false 270 90 225 45
Line -16777216 false 225 45 210 45
Line -16777216 false 180 45 165 45
Line -16777216 false 195 30 180 30
Line -16777216 false 210 60 195 60
Line -16777216 false 195 30 210 45
Line -16777216 false 165 15 180 30
Line -16777216 false 165 15 135 30
Line -16777216 false 150 30 135 30
Line -16777216 false 150 30 165 45
Line -16777216 false 180 45 195 60
Line -16777216 false 210 60 240 90
Line -16777216 false 240 90 150 90
Line -16777216 false 150 90 135 60
Line -16777216 false 135 45 135 60
Line -16777216 false 120 45 105 30
Line -16777216 false 105 30 90 30
Line -16777216 false 90 30 75 45
Line -16777216 false 75 45 45 45
Line -16777216 false 45 45 60 60
Line -16777216 false 60 60 45 75
Line -16777216 false 45 75 30 75
Line -16777216 false 30 90 30 105
Line -16777216 false 45 165 60 195
Line -16777216 false 60 195 105 195
Line -16777216 false 105 195 120 165
Line -16777216 false 120 165 135 165
Line -16777216 false 135 165 135 180
Line -16777216 false 135 180 120 195
Line -16777216 false 150 180 150 195
Line -16777216 false 150 180 165 210
Line -16777216 false 165 210 150 225
Line -16777216 false 195 180 195 210

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

firedead
false
0
Line -16777216 false 180 105 240 30
Polygon -2674135 true false 90 135 105 165 135 150 150 165 195 150 210 165 255 150 270 165 270 195 225 225 210 240 150 225 120 240 75 195 75 165 90 135
Polygon -955883 true false 90 150 90 180 105 195 120 225 135 210 180 210 195 225 255 180 240 165 210 180 195 165 150 165 120 180 90 150
Polygon -1184463 true false 105 165 120 195 210 210 240 180 210 195 195 180 120 180 105 165
Polygon -1184463 true false 210 120 255 60 240 30 180 105
Circle -1184463 true false 125 5 80
Rectangle -1184463 true false 142 79 187 94
Polygon -1184463 true false 120 30 120 45 135 30 150 45 165 30 180 45 180 30
Polygon -16777216 true false 135 30 135 45 150 30 165 45 165 30 195 45 195 30 210 45 195 0 120 0 120 45 135 30
Polygon -16777216 true false 15 75 45 75
Polygon -2674135 true false 150 60 165 75 180 75 195 60 180 45 165 45 150 60
Polygon -13345367 true false 120 90 210 90 195 195 135 195 120 90
Polygon -1184463 true false 120 120 75 60 90 30 150 105
Line -16777216 false 240 30 255 60
Line -16777216 false 255 60 210 120
Line -16777216 false 75 60 120 120
Line -16777216 false 90 30 75 60
Line -16777216 false 150 105 90 30

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

ghost1
true
0
Circle -1 true false 45 60 150
Polygon -16777216 true false 75 105 90 120 60 120 60 105 75 105
Polygon -16777216 true false 120 105 105 120 135 120 135 105 120 105
Line -16777216 false 60 150 135 150
Line -16777216 false 75 135 75 150
Line -16777216 false 75 150 75 165
Line -16777216 false 90 135 90 165
Line -16777216 false 105 135 105 165
Line -16777216 false 120 135 120 165
Line -16777216 false 120 180 120 195
Line -16777216 false 120 195 150 180
Line -16777216 false 120 180 150 150
Polygon -1 true false 60 150 30 180 30 195 60 180 60 150
Circle -16777216 false false 45 60 150
Polygon -1 true false 195 150 210 165 225 150 225 180 210 195 120 210
Line -16777216 false 195 150 210 165
Line -16777216 false 210 165 225 150
Line -16777216 false 225 150 225 180
Line -16777216 false 225 180 210 195
Line -16777216 false 210 195 135 210
Line -16777216 false 45 165 30 180
Line -16777216 false 30 180 30 195
Line -16777216 false 30 195 60 180

ghost2
true
0
Line -16777216 false 105 120 60 165
Polygon -1 true false 75 75 45 90 60 105 75 120 90 120 105 135 105 150 120 165 135 180 150 180 165 180 195 180 210 180 240 165 255 150 270 120 270 90 240 60 255 45 225 45 210 60 225 90 225 105 195 120 165 105 135 90 135 75 150 60 165 60 180 45 195 45 180 30 165 30 150 45 135 45 105 45 30 90 75 120
Polygon -1 true false 45 90 75 120 75 75 45 90
Line -16777216 false 30 90 45 90
Line -16777216 false 45 90 60 90
Line -16777216 false 60 90 75 105
Line -16777216 false 75 105 90 105
Line -16777216 false 90 105 105 90
Circle -16777216 true false 73 58 32
Polygon -1 true false 90 135 60 165 45 165 45 180 60 180 60 195 75 195 75 180 90 180 90 165 120 135 105 120 90 135
Line -16777216 false 75 165 90 165
Polygon -1 true false 135 135 150 165 150 180 135 180 135 210 150 195 150 210 165 210 165 195 180 210 180 180 165 180 165 135 135 135
Line -16777216 false 135 180 150 180
Line -16777216 false 150 180 150 135
Line -16777216 false 165 180 180 180
Line -16777216 false 165 180 165 135
Line -16777216 false 60 105 60 75
Line -16777216 false 75 90 75 120
Line -16777216 false 90 90 90 120
Line -16777216 false 30 90 75 120
Line -16777216 false 30 90 105 45
Line -16777216 false 105 45 150 45
Line -16777216 false 150 45 165 30
Line -16777216 false 165 30 180 30
Line -16777216 false 180 30 195 45
Line -16777216 false 180 45 195 45
Line -16777216 false 150 60 165 60
Line -16777216 false 165 60 180 45
Line -16777216 false 135 75 150 60
Line -16777216 false 75 120 90 120
Line -16777216 false 45 165 60 165
Line -16777216 false 45 180 60 180
Line -16777216 false 75 180 90 180
Line -16777216 false 60 195 75 195
Line -16777216 false 60 180 60 195
Line -16777216 false 75 180 75 195
Line -16777216 false 90 165 90 180
Line -16777216 false 105 150 90 165
Line -16777216 false 105 150 135 180
Line -16777216 false 90 135 105 150
Line -16777216 false 135 90 195 120
Line -16777216 false 135 75 135 90
Line -16777216 false 45 165 45 180
Line -16777216 false 195 120 225 105
Line -16777216 false 225 90 225 105
Line -16777216 false 210 60 225 90
Line -16777216 false 210 60 225 45
Line -16777216 false 225 45 255 45
Line -16777216 false 255 45 240 60
Line -16777216 false 240 60 270 90
Line -16777216 false 270 90 270 120
Line -16777216 false 270 120 255 150
Line -16777216 false 255 150 240 165
Line -16777216 false 240 165 210 180
Line -16777216 false 210 180 180 180
Line -16777216 false 180 180 180 210
Line -16777216 false 165 195 180 210
Line -16777216 false 135 180 135 210
Line -16777216 false 135 210 150 195
Line -16777216 false 150 195 150 210
Line -16777216 false 165 195 165 210
Line -16777216 false 150 210 165 210

ghost3
true
0
Polygon -1 true false 90 105 90 75 90 60 105 45 120 45 135 45 165 60 180 75 195 90 195 105 210 135 225 165 240 195 255 225 255 240 240 240 225 270 210 240 195 255 165 240 165 270 135 240 120 270 105 240 90 270 90 210 90 105
Polygon -1 true false 195 90 255 225 240 225 180 105 195 90
Polygon -16777216 true false 135 75 135 90 150 90 150 75 135 75
Polygon -16777216 true false 105 75 105 90 120 90 120 75 105 75
Rectangle -16777216 true false 120 105 135 135
Rectangle -1 true false 45 120 105 150
Rectangle -1 true false 180 90 240 135
Rectangle -16777216 false false 180 90 240 120
Line -16777216 false 195 90 195 120
Line -16777216 false 210 90 210 120
Line -16777216 false 225 90 225 120
Rectangle -16777216 false false 180 120 195 135
Rectangle -1 true false 30 120 75 150
Rectangle -1 true false 15 150 45 165
Rectangle -1 true false 15 120 30 150
Line -16777216 false 45 135 30 135
Line -16777216 false 30 135 30 150
Line -16777216 false 30 150 45 150

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
Circle -1184463 true false 110 5 80
Polygon -13345367 true false 195 90 180 195 210 285 195 300 165 300 150 225 135 300 105 300 90 285 120 195 105 90
Rectangle -1184463 true false 128 79 173 94
Polygon -1184463 true false 105 90 60 150 75 180 135 105
Polygon -1184463 true false 195 90 240 150 225 180 165 105
Polygon -1184463 true false 180 30 180 45 165 30 150 45 135 30 120 45 120 30
Polygon -16777216 true false 180 30 180 45 165 30 150 45 150 30 120 45 120 30 105 45 120 0 195 0 195 45 180 30
Polygon -16777216 true false 285 75 255 75
Line -16777216 false 165 60 120 60

personb
false
0
Circle -1184463 true false 110 5 80
Rectangle -1184463 true false 128 79 173 94
Polygon -1184463 true false 105 90 60 150 75 180 135 105
Polygon -1184463 true false 195 90 240 150 225 180 165 105
Polygon -1184463 true false 180 30 180 45 165 30 150 45 135 30 120 45 120 30
Polygon -16777216 true false 285 75 255 75
Polygon -13345367 true false 195 90 180 195 210 285 195 300 165 300 150 225 135 300 105 300 90 285 120 195 105 90
Polygon -16777216 true false 105 30 105 75 120 45 135 60 150 45 150 75 180 45 180 60 195 45 210 75 195 30 180 15 150 15 120 15 105 30
Polygon -16777216 true false 105 30 120 0 165 0 180 0 210 60 210 75
Polygon -16777216 true false 105 30 105 60 135 45

personf
false
0
Circle -1184463 true false 110 5 80
Polygon -13345367 true false 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -1184463 true false 127 79 172 94
Polygon -1184463 true false 195 90 240 150 225 180 165 105
Polygon -1184463 true false 105 90 60 150 75 180 135 105
Polygon -1184463 true false 120 30 120 45 135 30 150 45 165 30 180 45 180 30
Polygon -16777216 true false 120 30 120 45 135 30 150 45 150 30 180 45 180 30 195 45 180 0 105 0 105 45 120 30
Polygon -16777216 true false 15 75 45 75
Line -16777216 false 135 60 180 60

persons
false
0
Polygon -1184463 true false 105 120 60 60 75 30 135 105
Circle -1184463 true false 110 5 80
Polygon -13345367 true false 195 90 180 195 210 285 195 300 165 300 150 225 135 300 105 300 90 285 120 195 105 90
Rectangle -1184463 true false 128 79 173 94
Polygon -1184463 true false 195 120 240 60 225 30 165 105
Polygon -1184463 true false 180 30 180 45 165 30 150 45 135 30 120 45 120 30
Polygon -16777216 true false 180 30 180 45 165 30 150 45 150 30 120 45 120 30 105 45 120 0 195 0 195 45 180 30
Polygon -16777216 true false 285 75 255 75
Line -16777216 false 165 60 120 60
Circle -1 true false 144 9 42
Circle -1 true false 99 9 42
Polygon -2674135 true false 120 60 120 75 165 75 165 60

personsf
false
0
Polygon -1184463 true false 195 120 240 60 225 30 165 105
Circle -1184463 true false 110 5 80
Polygon -13345367 true false 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -1184463 true false 127 79 172 94
Polygon -1184463 true false 105 120 60 60 75 30 135 105
Polygon -1184463 true false 120 30 120 45 135 30 150 45 165 30 180 45 180 30
Polygon -16777216 true false 120 30 120 45 135 30 150 45 150 30 180 45 180 30 195 45 180 0 105 0 105 45 120 30
Polygon -16777216 true false 15 75 45 75
Line -16777216 false 135 60 180 60
Circle -1 true false 114 9 42
Circle -1 true false 159 9 42
Polygon -2674135 true false 180 60 180 75 135 75 135 60

persont
false
0
Circle -1184463 true false 110 5 80
Polygon -13345367 true false 195 90 180 195 210 285 195 300 165 300 150 225 135 300 105 300 90 285 120 195 105 90
Rectangle -1184463 true false 128 79 173 94
Polygon -1184463 true false 135 90 90 150 105 180 165 105
Polygon -1184463 true false 165 90 210 150 195 180 135 105
Polygon -1184463 true false 180 30 180 45 165 30 150 45 135 30 120 45 120 30
Polygon -16777216 true false 180 30 180 45 165 30 150 45 150 30 120 45 120 30 105 45 120 0 195 0 195 45 180 30
Polygon -16777216 true false 285 75 255 75
Line -16777216 false 165 60 120 60
Polygon -2674135 true false 165 60 165 75 120 75 120 60
Polygon -6459832 true false 120 90 195 90 210 120 225 165 225 210 210 270 165 285 135 285 105 270 90 225 75 165 90 105 90 90 120 90
Line -16777216 false 90 120 210 120
Line -16777216 false 75 150 210 150
Line -16777216 false 75 180 225 180
Line -16777216 false 90 210 225 210
Line -16777216 false 90 240 210 240
Line -16777216 false 105 270 210 270

persontf
false
0
Circle -1184463 true false 110 5 80
Polygon -13345367 true false 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -1184463 true false 127 79 172 94
Polygon -1184463 true false 165 90 210 150 195 180 135 105
Polygon -1184463 true false 135 90 90 150 105 180 165 105
Polygon -1184463 true false 120 30 120 45 135 30 150 45 165 30 180 45 180 30
Polygon -16777216 true false 120 30 120 45 135 30 150 45 150 30 180 45 180 30 195 45 180 0 105 0 105 45 120 30
Polygon -16777216 true false 15 75 45 75
Line -16777216 false 135 60 180 60
Polygon -2674135 true false 135 60 135 75 180 75 180 60
Polygon -6459832 true false 180 90 105 90 90 120 75 165 75 210 90 270 135 285 165 285 195 270 210 225 225 165 210 105 210 90 180 90
Line -16777216 false 210 120 90 120
Line -16777216 false 225 150 90 150
Line -16777216 false 225 180 75 180
Line -16777216 false 210 210 75 210
Line -16777216 false 210 240 90 240
Line -16777216 false 195 270 90 270

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

spazz
false
0
Circle -1184463 true false 5 110 80
Polygon -13345367 true false 90 195 195 180 285 210 300 195 300 165 225 150 300 135 300 105 285 90 195 120 90 105
Rectangle -1184463 true false 79 128 94 173
Polygon -1184463 true false 90 105 150 60 180 75 105 135
Polygon -1184463 true false 90 195 150 240 180 225 105 165
Polygon -1184463 true false 30 180 45 180 30 165 45 150 30 135 45 120 30 120
Polygon -16777216 true false 30 180 45 180 30 165 45 150 30 150 45 120 30 120 45 105 0 120 0 195 45 195 30 180
Polygon -16777216 true false 15 75 45 75
Circle -2674135 true false 45 150 30
Polygon -1 true false 15 195 30 180 60 165 60 180 75 195 75 210 60 210 60 195 30 195 45 210 15 210 15 195
Polygon -1 true false 30 195 45 180 60 195 75 180 90 195 105 210 90 210 75 210 45 225 30 210 30 195
Line -16777216 false 45 135 60 150
Line -16777216 false 60 135 45 150

splash
true
0
Polygon -13345367 true false 75 225 30 150 30 90 45 75 75 90 90 150 105 60 120 30 150 15 195 60 180 135 195 165 225 120 225 75 240 60 270 90 285 135 270 180 240 240 210 255 165 255 90 255 75 225
Polygon -11221820 true false 120 255 45 150 45 105 60 90 90 180 120 60 150 45 180 60 165 120 165 180 195 210 225 150 240 105 240 90 255 120 255 180 195 255 120 255
Polygon -13791810 true false 135 255 60 135 60 120 120 210 120 90 150 75 165 105 150 210 180 225 225 180 240 120 240 165 180 255 135 255

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

stalagtite
true
0
Polygon -6459832 true false 105 45 195 45 150 255 105 45
Line -16777216 false 105 75 135 75
Line -16777216 false 165 90 180 90
Line -16777216 false 120 105 150 105
Line -16777216 false 135 135 165 135
Line -16777216 false 135 165 150 165
Line -16777216 false 135 195 150 195
Line -16777216 false 150 180 165 180
Polygon -6459832 true false 105 45 90 30
Polygon -6459832 true false 105 45 105 30 120 45 120 30 135 45 135 30 150 45 165 30 165 45 180 30 180 45 195 30 195 45
Polygon -6459832 true false 135 45 150 30 165 45

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

wetperson
false
0
Polygon -11221820 true false 15 180 0 210 15 240 45 270 90 270 165 285 225 270 240 285 285 255 285 225 300 180 270 165 255 120 195 150 150 120 105 135 75 120 45 135 15 180
Polygon -1184463 true false 90 180 150 225 180 210 105 150
Circle -1184463 true false 5 110 80
Polygon -13345367 true false 90 105 195 120 285 90 300 105 300 135 225 150 300 165 300 195 285 210 195 180 90 195
Rectangle -1184463 true false 79 127 94 172
Polygon -1184463 true false 105 135 165 180 195 165 120 105
Polygon -1184463 true false 30 120 45 120 30 135 45 150 30 165 45 180 30 180
Polygon -16777216 true false 30 120 45 120 30 135 45 150 30 150 45 180 30 180 45 195 0 180 0 105 45 105 30 120
Polygon -16777216 true false 75 15 75 45
Line -16777216 false 60 135 60 180

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

whirlsplash
false
0
Polygon -13345367 true false 75 120 60 120 30 165 30 195 45 255 105 285 150 270 195 285 240 270 270 285 285 240 285 195 270 150 255 120 195 120 150 120 105 120 75 120
Polygon -13791810 true false 90 120 45 165 60 225 105 255 150 240 180 255 225 255 255 225 270 195 255 150 240 120 180 135 135 150 90 120
Polygon -11221820 true false 105 150 75 180 90 210 135 240 165 225 195 240 225 210 240 210 240 180 225 150 210 135 180 150 165 135 135 150 105 135 105 150
Polygon -1184463 true false 195 120 240 60 225 30 165 105
Circle -1184463 true false 110 5 80
Rectangle -1184463 true false 127 79 172 94
Polygon -1184463 true false 120 30 120 45 135 30 150 45 165 30 180 45 180 30
Polygon -16777216 true false 120 30 120 45 135 30 150 45 150 30 180 45 180 30 195 45 180 0 105 0 105 45 120 30
Polygon -16777216 true false 15 75 45 75
Line -16777216 false 135 60 180 60
Circle -1 true false 114 9 42
Circle -1 true false 159 9 42
Polygon -2674135 true false 180 60 180 75 135 75 135 60
Polygon -13345367 true false 105 90 120 195 180 195 195 90 105 90
Polygon -1184463 true false 105 120 60 60 75 30 135 105

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 4.1.1
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
