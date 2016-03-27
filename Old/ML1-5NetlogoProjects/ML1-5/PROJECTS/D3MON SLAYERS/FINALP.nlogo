breed [snipers sniper]
breed [targets target]
breed [henchmen henchman]
breed [civilians civilian]
globals [health highest score countscore Endless-score Endless-scorehi level start-level]
breed [zombies zombie]
breed [stuffs stuff]

to new-game
  set start-level 1
  cp
  ct
  set score 0
  set level start-level
  next-level
end

to next-level
  if ( level = 1 )
    [ level-1 ]
  if ( level = 2 )
    [ level-2 ]
  if ( level = 3 )
    [ level-3 ]
  if ( level = 4 )
    [ level-4 ]
  if ( level = 5 )
  [ending]
end

to snipergo
  if mouse-inside? [carefully [set heading towards patch mouse-xcor mouse-ycor
      fd .03] 
    [set heading 0]]
  if mouse-down? and any? targets-here [ask targets-here [if shape = "suit" [set shape "shot" wait .1 die]
      if shape = "targetplane" or shape = "jet" [set shape "explosion" wait .2 die] ] set score score + 50]
  if mouse-down? and any? henchmen-here [ask henchmen-here [die] set score score + 10]
  if score > highest [set highest score]
end

to henchmango
  if mouse-down? and any? snipers in-radius 10 [set color red]
  if color = red [if random 300 = 1 [set health health - 1]]
end

; level 1
to Level-1
  cp
  set score 0
  carefully [ask turtles [ifelse breed = snipers [] [die]]] []
  carefully [ask stuffs [die]] []
  carefully [ask henchmen [die]] [] 
  carefully [ask civilians [die]] []
  carefully [ask targets [die]] []
  cd
  set health 100
  ship
  ocean-sky
  clouds
  t-maker1
  h-maker1
  ifelse count snipers = 1 [] [create-snipers 1 [ set color black 
    set shape "defaultscope"
    set size 5]] 
user-message  (word"See that ship?")
user-message  (word"Of course you do")
user-message  (word"That man in the suit is your target")
user-message  (word"His name is Merope Twain")
user-message  (word"He likes stealing candy from babies...")
user-message  (word"This guy is small time, but still")
user-message  (word"Eliminate him and his men")
user-message  (word"This is your first job, so all eyes are on you")
user-message  (word"You ready?")
user-message  (word"GO!")

  if count snipers > 1 [ask n-of  (count snipers - 1) snipers [die]]
end

to ship 
  Create-stuffs 1 
  ask stuffs [set shape "ship" set size 20 set heading 0] 
  ask patches [if pcolor = 95 [set pcolor green]]
end
  
to ocean-sky
  create-stuffs 1
  ask stuffs with [shape = "default"][ set heading 180 set shape "ocean"set size 35 fd 12]
  ask patches [if pcolor = black [set pcolor sky]]
end

  
  
to clouds
  create-stuffs 7
  ask stuffs with [shape = "default"] [set shape "cloud" set size 6 ]
  ask stuffs with [shape = "cloud"] [ifelse random  2 = 1 [set ycor 14] [set ycor 11]]
  ask stuffs with [shape = "cloud"] [ifelse 2 = 1 [set xcor random 16] [set xcor random -16]] 
 
end

to soar 
  ask stuffs [ifelse shape = "ship"[]
  [set heading 90
  fd .00003]]
  ask stuffs with [shape = "ship"] 
  [set heading 5 set heading 4 set heading 3 set heading 2 set heading 1 set heading 0
   set heading -1  set heading -2 set heading -3 set heading -4 set heading -5 
   set heading -4 set heading -3 set heading -2 set heading -1 set heading 0
   set heading 1  set heading 2 set heading 3 set heading 4  ]
end 



to evergo
  ask snipers [snipergo]
  ask henchmen [henchmango]
  soar
  Dead 
end

to T-maker1
create-targets 1 [set shape "suit"
  setxy 0 1
  set size 4
  set color 138]
end

to h-maker1
  create-henchmen 1
  [set shape "henchman"
    set size 4
    setxy -9 2
    set color grey]
  create-henchmen 1
  [set shape "henchman"
    set size 4
    setxy 9 2
    set color grey]
end
  

to begin
  
  snipermaker
end

to snipermaker
    if count snipers < 1 [create-snipers 1 [set color red
    set shape "defaultscope"
    set size 6
    set heading 0
    set score 50]]
end

; level 2

to level-2
  cp
  
  carefully [ask turtles [ifelse breed = snipers [] [die]]] [] 
  set health 100 
  carefully [ask stuffs [die]] []
  carefully [ask henchmen [die]] [] 
  carefully [ask civilians [die]] []
  carefully [ask targets [die]] []
  ask patches [patch2back]
  crt 1
  turtle2back
  bad-guys
   create-snipers 1 [ set color black 
    set shape "defaultscope"
    set size 5]
user-message  (word"The boss liked what you did on the ship")
user-message  (word"This one isn't quite as easy")
user-message  (word"Your target is an old solviet arms smuggler")
user-message  (word"Latley he's been trying to get his hands on some weapons grade uranium")
user-message  (word"We need to take this guy out before he gets the chance")
user-message  (word"Take out your target and anyone else at the plant")
user-message  (word"This mission MUST succeed")
user-message  (word"The world's counting on ya today boy")
user-message  (word"Give em' hell")

  if count snipers > 1 [ask n-of  (count snipers - 1) snipers [die]]
end

to patch2back
  ifelse pycor > 5 [set pcolor sky] [set pcolor green - 4]
  if pycor < -7 [set pcolor grey - 3]
end

to turtle2back
antenne
power-plant
end

to antenne
  create-turtles 1 [
  set shape "antenna"
  set size 15
  setxy 11 6
  set size 15]
  
  create-turtles 1
  [set shape "antenna"
  setxy -6 6
  set size 5
  ]
  
  create-turtles 1
  [set shape "antenna"
  setxy -13 6
  set size 2]
end

to power-plant
  
  create-turtles 1
  [set shape "duke nukem"
  set size 20
  set xcor -9.3
  set ycor -2]
  
  create-turtles 1
  [set shape "reactor"
  set xcor 1.7
  set ycor -2
  set size 15]
end

to bad-guys
  create-targets 1 [set size 4
    setxy 7 -9
    set shape "suit"]
  create-targets 1 [set size 4
    setxy 10 -9
    set shape "suit"]
  create-henchmen 1 [set size 4
    set shape "henchman"
    setxy -13 -13]
  create-henchmen 1 [set size 4
    set shape "henchman"
    setxy -1 -12]
  create-henchmen 1 [set size 4
    set shape "henchman"
    setxy 14 -13]
  create-henchmen 1 [set size 4
    set shape "henchman"
    setxy 5 -13]
end

to tutorial
  ca
  user-message  (word"Why hello there!!!")
  user-message  (word"My name's Jimmeh and i'll be your guide for this game.")
  user-message  (word"Is this your first time playing? (click halt if it is not...)")
  user-message  (word"I am the leader of a band of vigalantee snipers who roam the world destroying evil")
  user-message  (word"Cool?")
  user-message  (word"OF COURSE")
  user-message  (word"Now Chris Brown")
  user-message  (word"It is time...")
  user-message  (word"For you")
  user-message  (word"TO JOIN")
  user-message  (word"THE XXXD3MONSLAYERZZZ")
  user-message  (word"Now")
  user-message  (word"Let my assistant show you the ropes")
  create-targets 1 [set color red
    set size 4
    set shape "suit"]
  user-message  (word"Hello")
  user-message  (word"My name is Ocean Pineapple")
  user-message  (word"See that guy?")
  user-message  (word"That's a target")
  user-message  (word"You like killing targets...")
  user-message  (word"Comprende?")
  user-message  (word"Now that that's sorted out, kill that bath sturgen")
  user-message  (word"(always keep evergo on while playing this game or your sniper will not follow")
  user-message  (word"Oh and one last thing") 
  create-snipers 1 [set shape "defaultscope"
    set color grey
    set size 4]
  set health 100
  user-message  (word"See that scope?")
  user-message  (word"That's you")
  user-message  (word"You primarily kill targets by clicking their heads")
  user-message  (word"But sometimes... Well i'll just leave the details up to you")
  user-message  (word"Now, stop procrastinating and get on with it")
  if count targets = 0 [user-message  (word"Tutorial complete")]
  if count snipers > 1 [ask n-of  (count snipers - 1) snipers [die]]
end

to dead
  ifelse (count targets = 0) and (count henchmen = 0)
    [ifelse Health > 1 and count snipers = 1 [
        cp 
        ask turtles [die] 
        user-message  (word"Nice shootin'") 
        set level level + 1 
        next-level]
      []]
    [if Health < 1  [
    User-Message (word "Mission Failed") 
    User-Message (word "Try Again If You Have the The Guts") 
    cp
    ask turtles [die]
    set health 1
  stop]]
end

;LEVEL 3
to level-3
  cp
  
  carefully [ask turtles [ifelse breed = snipers [] [die]]] []
  if count snipers > 1 [ask n-of  (count snipers - 1) snipers [die]] 
  carefully [ask stuffs [die]] []
  carefully [ask henchmen [die]] [] 
  carefully [ask civilians [die]] []
  carefully [ask targets [die]] []
  baddies
  set health 100
  create-stuffs 1
  ask stuffs [
  set shape "condo"
  set size 16
  setxy 9.5 3
  stamp
  
  set shape "apt"
  set size 13
  setxy -12.55 3.9
  stamp
  
  set shape "store"
  set size 12
  setxy -3.2 1.6
  stamp
  
  set shape "srt"
  set size 15
  setxy 9 -5
  stamp
  setxy -5 -5
  stamp
  setxy -9 -5
  stamp
  die
  ]
  ask patches [if pycor = -3 or pycor = -8 [set pcolor grey]]
  ask patches [if pycor  < -8 [set pcolor green]]
  ask patches [if pycor > -3 [set pcolor sky]]
  create-snipers 1 [ set color black 
    set shape "defaultscope"
    set size 5]
  
  user-message  (word"You're quickly moving up I see")
  user-message  (word"But even Jimmeh himself couldn't pull this off")
  user-message  (word"There's something going down right now")
  user-message  (word"Tons of scum from around the world gathering in this one spot")
  user-message  (word"Nobody gets away")
  
  if count snipers > 1 [ask n-of  (count snipers - 1) snipers [die]]
  end

to baddies
  create-targets 1 [setxy -7 -1
    set shape "suit"
    set size 3]
  create-targets 1 [setxy -13 -1
    set shape "suit"
    set size 3]
  create-targets 1 [setxy -4 -1
    set shape "suit"
    set size 3]
  create-targets 1 [setxy -0 -1
    set shape "suit"
    set size 3]
  create-targets 1 [setxy 4 -1
    set shape "suit"
    set size 3]
  create-targets 1 [setxy 6.5 -1
    set shape "suit"
    set size 3]
  create-targets 1 [setxy 15 -1
    set shape "suit"
    set size 3]
  create-henchmen 1 [setxy 13 -10
    set shape "henchman"
    set size 3]
  create-henchmen 1 [setxy -13 11.2
    set shape "henchman"
    set size 3]
  create-henchmen 1 [setxy -6 -1
    set shape "henchman"
    set size 2]
  create-henchmen 1 [setxy -12 -11
    set shape "henchman"
    set size 3]
  create-henchmen 1 [setxy 10 8
    set shape "henchman"
    set size 3]
  create-henchmen 1 [setxy 1 -9
    set shape "henchman"
    set size 3]
  create-henchmen 1 [setxy -3 4
    set shape "henchman"
    set size 3]
  create-henchmen 1 [setxy 7 2.3
    set shape "henchman"
    set size 2]
end
to level-4
  cp
  
  carefully [ask turtles [ifelse breed = snipers [] [die]]] []
create-turtles 1 [set size 500
  set shape "square"
  set color black
  stamp
  die
]
create-turtles 1 [set size 7
  set shape "moon"
  set color white
  setxy -12 12
]
create-targets 1 [set size 7
  set shape "Jet"
  set color white
  setxy -5 -5
]
create-targets 1 [set size 7
  set shape "targetplane"
  set color white
  setxy 0 0
]
create-targets 1 [set size 7
  set shape "Jet"
  set color white
  setxy 5 -5
]
create-targets 1 [set size 7
  set shape "Jet"
  set color white
  setxy -12 -12
]
create-targets 1 [set size 7
  set shape "Jet"
  set color white
  setxy 12 -12
]
create-turtles 1 [set size 1
  set shape "star"
  set color yellow
  setxy 12 12
  stamp
  setxy 12 7
  stamp
  setxy -7 6
  stamp
  setxy -14 3
  stamp
  setxy 0 9
  stamp
  setxy 15 15
  stamp
  setxy -14 -2
  stamp
  setxy 8 4
  stamp
  setxy -1 -3
  stamp
  setxy 11 -3
  stamp
  setxy -4 -12
  stamp
  setxy 3 -15
  stamp
  setxy 2 -10
  stamp
]

create-snipers 1 [set shape "defaultscope"
    set color grey
    set size 4]

user-message  (word"I knew that that was a setup!")
user-message  (word"Chris, Everything's gone")
user-message  (word"Our whole orginization...")
user-message  (word"gone...")
user-message  (word"If I ever get the chance I'll kill whoever did this with my bare hands!")
user-message  (word"Wait...")
user-message  (word"Chris! Look up!")
user-message  (word"It must have been a bombing run!")
user-message  (word"You know what to do...")
if count snipers > 1 [ask n-of  (count snipers - 1) snipers [die]]
end

to ending
  user-message  (word"Well we got em'.")
  user-message  (word"That's it for now.")
  user-message  (word"The orginization is...")
  user-message  (word"Well there isn't an orginization anymore.")
  user-message  (word"Nevertheless...")
  user-message  (word"We will rebuild.")
  user-message  (word"We will continue to fight.")
  user-message  (word"Because we are...")
  user-message  (word"The Demon Slayers!")
  if score > highest [set highest score]
  create-turtles 1 [set shape "square"
    set size 500
    set color black
    stamp
    die]
  create-turtles 1 [set shape "ending"
    set color red
    set size 40]
  wait 3
  
user-message  (word"This has been a D3MON Slayers Production")

user-message  (word"In Association with Grade Grubbers International")

user-message  (word"Funded by Super P and Super C Entertainment")

end

; ZOMBIES

to zomb-go
  ask snipers [zomboni]
  if score > highest [set highest score]
  every 2 [create-zombies random 10[
    ifelse random 2 = 1 [set xcor random 15] [set xcor random -15]
    ifelse random 2 = 1 [set ycor random 15] [set ycor random -15]
  set shape "zombie"
  set size 4
  set color green - 3]]
  if count zombies > 30 [user-message  (word"Tastes like brains!!! Oh, wait...") 
    if (endless-score > endless-scorehi) [set endless-scorehi endless-score] stop]
  
end

to zomboni
    if mouse-inside? [carefully [set heading towards patch mouse-xcor mouse-ycor
      fd .03] 
    [set heading 0]]
  if mouse-down? and any? zombies-here [ask zombies-here [die] set endless-score endless-score
     + 1]
end

to endless-setup
  cp 
  ct
  create-snipers 1 [set shape "defaultscope"
    set color grey
    set size 4]
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
0
0
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
132
435
204
468
NIL
EverGo
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
107
82
140
NIL
Level-1
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

MONITOR
6
10
63
67
Score
score
1
1
14

MONITOR
93
10
182
67
High Score
highest
1
1
14

BUTTON
9
144
83
177
NIL
level-2
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
102
137
182
170
NIL
Tutorial
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

MONITOR
106
76
176
133
NIL
HEALTH
1
1
14

BUTTON
9
186
83
219
NIL
level-3
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
95
173
190
206
New Game
new-game
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
9
226
83
259
NIL
level-4
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
263
82
296
NIL
Ending
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
58
351
183
384
ENDLESS MODE
zomb-go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

MONITOR
8
302
110
347
Zombore
Endless-score
17
1
11

MONITOR
139
303
204
348
Hi Zomb
Endless-scorehi
17
1
11

TEXTBOX
62
387
212
429
Can you survive?\n\n(Check info tab for details)
11
0.0
1

BUTTON
4
436
124
469
NIL
Endless-Setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

@#$#@#$#@
WHAT IS IT?
-----------
	This is an ordinary Stickman Sniper Game. It has an amazing backstory and story throughout the game that accompanies actual game playing.
	 Also, An endless zombies mode accompanies the game.

HOW IT WORKS
------------
		ALWAYS KEEP EVERGO ON DURING NORMAL PLAY (not zombies)
	This game revolves around the scope. You are the scope. It determines where your shots are fired, your health and encircles your soul. Shoot marked targets in the head for kills. If a shot is within 10 patches of a Henchman, he will be alerted and begin to fire at you. Henchmen may heve already been alerted when you approached, so be ready for an instant gunfight. Kills raise your score, fifty points for each target and ten points for each Henchman. Levels procede in order and an not be repeated unless the entire game is completed or you start again from level 1.



		EVERGO MUST BE OFF FOR ZOMBIES
	In Zombies mode, zombies will appear approxamately every three ticks in packs less than ten. If there are more than 30 zombies on the screen at a time, the game is lost and high score is recorded. 


CREDITS AND REFERENCES
----------------------
Credit for this game goes to Peter Lucido and Cristian Pedraza ALONE.
This game is under copywright as of 2012 by D3mon Slayers productions. 
Any attempt to acquire this game illegitimately or illeagilly will be prosecuted to the full extent of the law.
(we still oppose SOPA!)

@#$#@#$#@
default
false
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

ambulance
false
7
Circle -16777216 true false 219 159 42
Circle -16777216 true false 39 159 42
Rectangle -1 true false 15 90 210 195
Polygon -7500403 true false 296 190 296 150 259 134 244 104 210 105 210 190
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Circle -16777216 true false 84 174 42
Rectangle -1 true false 288 143 297 158
Rectangle -1184463 true false 289 180 298 172
Rectangle -2674135 true false 15 165 298 173
Line -16777216 false 210 90 210 195
Rectangle -16777216 true false 83 116 128 133
Rectangle -16777216 true false 153 111 176 134
Line -7500403 false 165 105 165 135
Rectangle -1 true false 15 186 33 195
Line -13345367 false 30 135 60 120
Line -13345367 false 60 135 30 120
Line -13345367 false 45 112 45 142
Line -13345367 false 30 135 60 120
Line -13345367 false 30 135 60 120
Line -13345367 false 30 135 60 120
Line -13345367 false 30 135 60 120
Line -13345367 false 30 135 60 120
Line -13345367 false 30 135 60 120
Line -13345367 false 30 135 60 120
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 60 135 30 120
Line -13345367 false 60 135 30 120
Line -13345367 false 60 135 30 120
Line -13345367 false 60 135 30 120
Line -13345367 false 60 135 30 120
Line -13345367 false 60 135 30 120
Line -13345367 false 60 135 30 120
Line -13345367 false 60 135 30 120
Line -13345367 false 60 135 30 120
Line -13345367 false 60 135 30 120
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Line -13345367 false 45 112 45 142
Polygon -2674135 true false 225 105 225 90 240 90 240 105 225 105
Circle -7500403 true false 90 180 30
Circle -7500403 true false 240 180 30

antenna
false
2
Line -2674135 false 105 300 120 210
Line -2674135 false 195 300 180 210
Line -2674135 false 120 210 120 150
Line -2674135 false 180 210 180 150
Line -2674135 false 120 150 135 75
Line -2674135 false 180 150 165 75
Line -2674135 false 135 75 135 45
Line -2674135 false 165 75 165 45
Line -2674135 false 135 45 150 0
Line -2674135 false 165 45 150 0
Line -2674135 false 135 75 165 45
Line -2674135 false 135 45 165 75
Line -2674135 false 120 150 165 75
Line -2674135 false 180 150 135 75
Line -2674135 false 120 210 180 150
Line -2674135 false 120 150 180 210
Line -2674135 false 120 210 195 300
Line -2674135 false 180 210 105 300
Line -2674135 false 120 210 180 210
Line -2674135 false 150 210 150 180
Line -2674135 false 150 210 150 255
Line -2674135 false 150 180 150 105
Line -2674135 false 150 60 150 15
Line -7500403 false 120 150 75 300
Line -7500403 false 180 150 225 300
Line -7500403 false 165 75 255 300
Line -7500403 false 180 150 255 300
Line -7500403 false 120 150 45 300
Line -7500403 false 135 75 45 300

apt
false
5
Rectangle -6459832 true false 60 30 240 300
Rectangle -1 true false 90 120 120 150
Rectangle -1 true false 180 120 210 150
Rectangle -1 true false 90 180 120 210
Rectangle -1 true false 180 180 210 210
Line -16777216 false 180 150 210 120
Line -16777216 false 180 120 210 150
Line -16777216 false 90 210 120 180
Line -16777216 false 90 180 120 210
Line -16777216 false 180 210 210 180
Line -16777216 false 180 180 210 210
Rectangle -1 true false 135 255 165 300
Polygon -5825686 true false 135 255 120 255 150 225 180 255 150 255
Line -16777216 false 150 255 150 300
Line -16777216 false 90 120 120 150
Line -16777216 false 90 150 120 120
Rectangle -1 true false 180 60 210 90
Rectangle -1 true false 90 60 120 90
Line -16777216 false 180 60 210 90
Line -16777216 false 90 60 120 90
Line -16777216 false 180 90 210 60
Line -16777216 false 90 90 120 60
Line -7500403 false 75 -15 75 30
Line -16777216 false 75 30 90 30
Line -7500403 false 75 30 60 15
Line -7500403 false 75 15 60 0
Line -7500403 false 75 30 90 15
Line -7500403 false 75 15 90 0
Line -16777216 false 75 30 60 30

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

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cloud
false
0
Circle -1 true false 45 75 150
Circle -1 true false 120 75 150
Circle -1 true false 195 90 120
Circle -1 true false 0 90 120

condo
false
4
Polygon -6459832 true false 2 180 227 180 152 150 32 150
Rectangle -2674135 true false 270 75 285 255
Rectangle -2064490 true false 75 135 270 255
Rectangle -1 true false 124 195 187 256
Rectangle -1 true false 210 195 255 240
Rectangle -1 true false 90 150 135 180
Rectangle -1 true false 210 150 255 180
Line -16777216 false 270 135 270 255
Rectangle -2064490 true false 15 180 75 255
Polygon -6459832 true false 60 135 285 135 240 90 105 90
Line -16777216 false 75 135 75 180
Rectangle -1 true false 30 195 93 240
Line -16777216 false 60 135 285 135
Line -16777216 false 255 105 285 135
Line -16777216 false 0 180 75 180
Line -16777216 false 60 195 60 240
Line -16777216 false 154 195 154 255

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

defaultscope
false
0
Circle -2674135 false false 44 44 212
Line -2674135 false 45 150 255 150
Line -2674135 false 150 45 150 255
Circle -2674135 true false 129 129 42

dot
false
0
Circle -7500403 true true 90 75 120
Rectangle -7500403 true true 135 180 165 300

duke nukem
false
2
Polygon -7500403 true false 60 285 240 285 210 180 195 105 210 45 90 45 105 105 90 180 60 285
Polygon -1184463 true false 150 135 135 105 165 105 150 135
Polygon -1184463 true false 150 135 165 150
Polygon -1184463 true false 150 135 180 150 165 165 150 135
Polygon -1184463 true false 150 135 135 150
Polygon -1184463 true false 150 135 120 150 135 165 150 135
Polygon -16777216 true false 135 165 165 165 150 135 135 165
Polygon -16777216 true false 150 135 120 150 120 120 135 105 150 135
Polygon -16777216 true false 165 105 180 120 180 150 150 135 165 105
Line -2674135 false 90 45 210 45
Line -16777216 false 60 285 75 270
Line -16777216 false 75 270 90 285
Line -16777216 false 90 285 105 270
Line -16777216 false 105 270 120 285
Line -16777216 false 120 285 135 270
Line -16777216 false 135 270 150 285
Line -16777216 false 150 285 165 270
Line -16777216 false 165 270 180 285
Line -16777216 false 180 285 195 270
Line -16777216 false 195 270 210 285
Line -16777216 false 210 285 225 270
Line -16777216 false 225 270 240 285
Line -16777216 false 60 270 75 285
Line -16777216 false 75 285 90 270
Line -16777216 false 90 270 105 285
Line -16777216 false 105 285 120 270
Line -16777216 false 120 270 135 285
Line -16777216 false 135 285 150 270
Line -16777216 false 150 270 165 285
Line -16777216 false 165 285 180 270
Line -16777216 false 180 270 195 285
Line -16777216 false 195 285 210 270
Line -16777216 false 210 270 225 285
Line -16777216 false 225 285 240 270

ending
false
0
Rectangle -2674135 true false 30 105 45 210
Rectangle -2674135 true false 45 105 90 120
Rectangle -2674135 true false 45 150 90 165
Rectangle -2674135 true false 135 105 150 210
Rectangle -2674135 true false 120 105 135 120
Rectangle -2674135 true false 150 105 165 120
Rectangle -2674135 true false 120 195 135 210
Rectangle -2674135 true false 150 195 165 210
Rectangle -2674135 true false 195 105 210 210
Polygon -2674135 true false 270 210 210 105 210 150 210 135 255 210 270 210 270 105 255 105 255 210
Polygon -2674135 true false 255 210 270 210 255 180 255 210

explosion
false
0
Circle -2674135 true false 159 39 42
Circle -955883 true false 18 18 175
Circle -955883 true false 28 133 95
Circle -2674135 true false 98 98 134
Circle -955883 true false 178 43 95
Circle -2674135 true false 41 191 67
Circle -955883 true false 45 165 90
Circle -955883 true false 203 113 134
Circle -955883 true false 163 193 95
Circle -955883 true false 93 213 85

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

factory
false
0
Rectangle -7500403 true true 76 194 285 270
Rectangle -7500403 true true 36 95 59 231
Rectangle -16777216 true false 90 210 270 240
Line -7500403 true 90 195 90 255
Line -7500403 true 120 195 120 255
Line -7500403 true 150 195 150 240
Line -7500403 true 180 195 180 255
Line -7500403 true 210 210 210 240
Line -7500403 true 240 210 240 240
Line -7500403 true 90 225 270 225
Circle -1 true false 37 73 32
Circle -1 true false 55 38 54
Circle -1 true false 96 21 42
Circle -1 true false 105 40 32
Circle -1 true false 129 19 42
Rectangle -7500403 true true 14 228 78 270

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

guyv3
false
0
Circle -7500403 true true 110 110 80
Polygon -7500403 true true 105 180 120 285 150 285 180 285 195 180
Rectangle -7500403 true true 127 169 172 184
Polygon -7500403 true true 195 180 240 240 225 270 165 195
Polygon -7500403 true true 105 180 60 240 75 270 135 195
Rectangle -7500403 false true 165 255 165 285

henchman
false
5
Rectangle -7500403 true false 124 150 177 169
Polygon -1 true false 105 165 60 270 90 285 115 237 184 238 210 285 240 270 195 165
Polygon -13345367 true false 180 270 120 270 90 360 105 375 135 375 150 300 165 375 195 375 210 360
Circle -7500403 true false 111 83 80
Line -16777216 false 148 218 150 271
Rectangle -16777216 true false 116 261 182 273
Circle -1 true false 152 195 9
Circle -1 true false 152 226 9
Rectangle -16777216 true false 179 164 183 186
Polygon -955883 true false 180 165 195 165 195 240 195 270 150 270 150 195 180 165
Polygon -955883 true false 120 165 105 165 105 240 105 270 150 270 150 195 120 165
Rectangle -16777216 true false 135 204 150 210
Rectangle -16777216 true false 135 234 150 240
Rectangle -16777216 true false 135 264 150 270
Polygon -955883 true false 107 121 113 95 130 81 151 79 180 85 192 97 194 107 222 108 218 113 203 118 169 114
Polygon -16777216 true false 206 187 223 180 196 151 183 161 180 163 193 164 205 188
Polygon -16777216 true false 65 273 41 295 46 305 72 277 64 270
Circle -2674135 true false 123 120 16
Circle -2674135 true false 157 121 16
Polygon -16777216 true false 111 130 122 163 143 181 177 164 191 132 114 132

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

jet
false
15
Polygon -7500403 true false 120 105 120 60 135 15 150 0 165 15 180 60 180 105 255 240 180 225 195 270 150 240 105 270 120 225 45 240 120 105 120 60
Polygon -2674135 true false 135 240 120 255 90 285 135 255 105 285 150 255 150 270 150 225 135 240
Polygon -2674135 true false 150 225 210 285 165 255 195 285 150 255 150 225
Polygon -2674135 true false 150 255 135 285 135 270 135 255 150 255 165 285 165 255 150 255
Line -2674135 false 61 214 75 233
Line -2674135 false 72 192 101 227
Line -2674135 false 241 219 226 234
Line -2674135 false 197 225 226 195
Polygon -13345367 true false 120 225 180 225 180 105 180 60 165 15 150 0 135 15 120 60 120 105 120 225
Polygon -955883 true false 120 225 105 270 150 225 195 270 180 225 120 225

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

moon
false
0
Polygon -7500403 true true 175 7 83 36 25 108 27 186 79 250 134 271 205 274 281 239 207 233 152 216 113 185 104 132 110 77 132 51

ocean
false
0
Rectangle -13345367 true false 0 105 300 225
Polygon -13345367 true false 0 105 60 75 30 105 45 90 90 75 105 105 90 75 105 105 135 75 150 105 150 90 210 75 180 105 195 90 255 75 285 105 270 90 300 75 300 105
Circle -13345367 true false 135 90 30
Circle -13345367 true false -21 84 42

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

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

reactor
false
8
Rectangle -7500403 true false 60 195 240 300
Circle -7500403 true false 60 105 180
Line -16777216 false 86 130 212 128
Line -16777216 false 71 151 228 150
Line -16777216 false 120 109 175 109
Rectangle -1 true false 135 255 165 300
Line -16777216 false 59 181 241 181

sheep
false
0
Rectangle -7500403 true true 151 225 180 285
Rectangle -7500403 true true 47 225 75 285
Rectangle -7500403 true true 15 75 210 225
Circle -7500403 true true 135 75 150
Circle -16777216 true false 165 76 116

ship
true
6
Polygon -6459832 true false 0 150 15 210 45 255 240 255 285 210 300 150 0 150 60 150 60 60 105 60 105 150 105 105 135 105 135 150 150 150 180 150 180 105 210 60 240 60 270 105 270 150
Circle -16777216 true false 39 174 42
Circle -16777216 true false 159 174 42
Circle -16777216 true false 99 174 42
Circle -7500403 true false 45 180 30
Circle -7500403 true false 105 180 30
Polygon -7500403 true false 225 75 210 105 240 105 225 75 210 75
Polygon -7500403 true false 210 75 195 105 255 105 240 75
Circle -7500403 true false 60 30 30
Circle -7500403 true false 60 45 30
Circle -7500403 true false 105 60 30
Circle -7500403 true false 105 75 30
Circle -7500403 true false 105 90 30
Circle -7500403 true false 75 30 30
Circle -7500403 true false 60 15 30
Circle -7500403 true false 75 15 30
Circle -7500403 true false 75 45 30
Circle -7500403 true false 105 30 30
Circle -7500403 true false 105 45 30
Circle -16777216 true false 219 174 42
Circle -7500403 true false 225 180 30
Circle -7500403 true false 165 180 30
Rectangle -1184463 true false 105 105 135 150
Rectangle -2674135 true false 60 60 105 150
Circle -7500403 true false 60 -15 30
Circle -7500403 true false 90 -15 30
Circle -7500403 true false 90 0 30
Circle -7500403 true false 75 0 30
Circle -7500403 true false 60 0 30
Circle -7500403 true false 105 15 30

shot
false
0
Rectangle -1 true false 120 180 180 270
Polygon -13345367 true false 135 180 150 195 135 270 150 285 165 270 150 195 165 180
Polygon -16777216 true false 120 180 105 180 60 285 90 300 116 244 120 285 90 375 105 390 135 390 150 315 165 390 195 390 210 375 180 285 183 243 210 300 240 285 195 180 180 180 150 255
Circle -7500403 true true 110 95 80
Rectangle -7500403 true true 127 166 172 181
Line -16777216 false 172 180 161 184
Line -16777216 false 128 180 139 184
Polygon -13345367 true false 195 315 195 390 270 360 270 285
Rectangle -13791810 true false 180 315 195 390
Polygon -14835848 true false 180 316 195 316 270 286 255 286
Polygon -13345367 true false 209 292 209 306 244 292 243 278
Line -16777216 false 180 180 150 255
Line -16777216 false 120 180 150 255
Polygon -16777216 true false 150 90 150 105 165 120 165 135 195 135 180 105 150 90
Line -2674135 false 150 90 150 105
Line -2674135 false 150 105 165 120
Line -2674135 false 165 120 165 135
Line -2674135 false 165 135 195 135
Line -2674135 false 165 135 195 135
Line -2674135 false 165 135 195 135
Line -2674135 false 165 135 195 135
Line -2674135 false 165 120 165 135
Line -2674135 false 165 120 165 135
Line -2674135 false 150 105 165 120
Line -2674135 false 150 105 165 120
Line -2674135 false 150 90 150 105
Line -2674135 false 150 90 150 105

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

srt
false
8
Rectangle -7500403 true false 0 120 300 195
Line -16777216 false 0 120 300 120
Line -16777216 false 0 120 300 120
Line -16777216 false 0 120 300 120
Line -16777216 false 0 120 300 120
Line -16777216 false 0 120 300 120
Line -16777216 false 0 195 300 195
Line -16777216 false 0 195 300 195
Line -16777216 false 0 195 300 195
Line -16777216 false -15 195 285 195
Line -16777216 false 0 195 300 195
Line -16777216 false 0 195 300 195
Line -16777216 false 0 195 300 195
Rectangle -1184463 true false 60 150 90 165
Rectangle -1184463 true false 285 150 300 165
Rectangle -1184463 true false 195 150 225 165
Rectangle -1184463 true false 150 150 180 165
Rectangle -1184463 true false 105 150 135 165
Rectangle -1184463 true false 240 150 270 165
Rectangle -1184463 true false 15 150 45 165

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

store
false
0
Rectangle -955883 true false 30 45 45 240
Rectangle -5825686 false false 30 45 45 165
Rectangle -8630108 true false 15 165 285 255
Rectangle -1 true false 120 195 180 255
Line -7500403 true 150 195 150 255
Rectangle -1 true false 30 180 105 240
Rectangle -1 true false 195 180 270 240
Line -16777216 false 0 165 300 165
Polygon -10899396 true false 0 165 45 135 60 90 240 90 255 135 300 165
Rectangle -955883 true false 0 0 75 45
Rectangle -16777216 false false 0 0 75 45

suit
false
0
Rectangle -1 true false 120 180 180 270
Polygon -13345367 true false 135 180 150 195 135 270 150 285 165 270 150 195 165 180
Polygon -16777216 true false 120 180 105 180 60 285 90 300 116 244 120 285 90 375 105 390 135 390 150 315 165 390 195 390 210 375 180 285 183 243 210 300 240 285 195 180 180 180 150 255
Circle -7500403 true true 110 95 80
Rectangle -7500403 true true 127 166 172 181
Line -16777216 false 172 180 161 184
Line -16777216 false 128 180 139 184
Polygon -13345367 true false 195 315 195 390 270 360 270 285
Rectangle -13791810 true false 180 315 195 390
Polygon -14835848 true false 180 316 195 316 270 286 255 286
Polygon -13345367 true false 209 292 209 306 244 292 243 278
Line -16777216 false 180 180 150 255
Line -16777216 false 120 180 150 255

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

targetplane
false
15
Polygon -2674135 true false 225 165 195 210 210 195 210 210 225 195 225 210 225 165 255 210 240 195 240 210 225 195
Circle -1 true true 210 135 30
Circle -1 true true 60 135 30
Polygon -2674135 true false 75 165 45 210 60 195 60 210 75 195 75 210 75 165 105 210 90 195 90 210 75 195
Polygon -7500403 true false 150 0 135 15 120 60 120 105 30 180 15 195 120 180 120 240 120 270 150 300 180 270 180 240 180 180 285 195 270 180 180 105 180 60 165 15
Line -16777216 false 120 60 180 105
Line -16777216 false 120 105 180 60
Line -955883 false 120 105 180 180
Line -955883 false 180 105 120 180
Line -2674135 false 120 180 180 270
Line -2674135 false 180 180 120 270

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

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

van side
false
0
Polygon -7500403 true true 26 147 18 125 36 61 161 61 177 67 195 90 242 97 262 110 273 129 260 149
Circle -16777216 true false 43 123 42
Circle -16777216 true false 194 124 42
Polygon -16777216 true false 45 68 37 95 183 96 169 69
Line -7500403 true 62 65 62 103
Line -7500403 true 115 68 120 100
Polygon -1 true false 271 127 258 126 257 114 261 109
Rectangle -16777216 true false 19 131 27 142

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

zombie
false
0
Circle -7500403 true true 110 110 80
Polygon -7500403 true true 105 195 120 300 90 390 105 405 135 405 150 330 165 405 195 405 210 390 180 300 195 195
Rectangle -7500403 true true 127 184 172 199
Rectangle -7500403 true true 45 195 135 240
Line -16777216 false 120 135 135 150
Line -16777216 false 150 135 165 150
Line -16777216 false 150 150 165 135
Line -16777216 false 120 150 135 135
Line -16777216 false 120 150 135 135
Line -16777216 false 120 150 135 135
Line -16777216 false 120 150 135 135
Line -16777216 false 120 150 135 135
Line -16777216 false 120 150 135 135
Line -16777216 false 120 150 135 135
Line -16777216 false 120 150 135 135
Line -16777216 false 120 150 135 135
Line -16777216 false 120 150 135 135
Line -16777216 false 120 150 135 135
Line -16777216 false 120 135 135 150
Line -16777216 false 120 135 135 150
Line -16777216 false 120 135 135 150
Line -16777216 false 120 135 135 150
Line -16777216 false 120 135 135 150
Line -16777216 false 120 135 135 150
Line -16777216 false 120 135 135 150
Line -16777216 false 120 135 135 150
Line -16777216 false 150 135 165 150
Line -16777216 false 150 135 165 150
Line -16777216 false 150 135 165 150
Line -16777216 false 150 135 165 150
Line -16777216 false 150 135 165 150
Line -16777216 false 150 135 165 150
Line -16777216 false 150 135 165 150
Line -16777216 false 150 135 165 150
Line -16777216 false 150 135 165 150
Line -16777216 false 150 135 165 150
Line -16777216 false 150 150 165 135
Line -16777216 false 150 150 165 135
Line -16777216 false 150 150 165 135
Line -16777216 false 150 150 165 135
Line -16777216 false 150 150 165 135
Line -16777216 false 150 150 165 135
Line -16777216 false 150 150 165 135
Line -16777216 false 150 150 165 135
Line -16777216 false 150 150 165 135
Line -16777216 false 150 150 165 135

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
