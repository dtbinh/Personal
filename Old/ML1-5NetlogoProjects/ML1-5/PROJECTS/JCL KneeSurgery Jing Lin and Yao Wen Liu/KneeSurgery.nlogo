patches-own [nextcolor]

to start
  Openingpage
user-message (word "Hello Sir, Welcome to JCL's Virtual Surgery Game")
   let input user-input "What is your Name?!"
   user-message (word "Nice to meet you. " input)
   ifelse user-yes-or-no? "Is this your first time playing a surgery game?" 
   [user-message  "Don't worry about it, Today, We still need your help in replacing a man's knee so that he can walk again."]
   [user-message "Awesome!!!!, Today, We need your help in replacing a man's knee so that he can walk again."] 
   ifelse user-yes-or-no? "Would You like to start now?!" 
   [BackgroundStory setup2.0 turtlesetup] [user-message "We shall try this again until you want to select yes" start]
   end

to BackgroundStory
  ca 
  ask patches [set pcolor white
  if pycor <= 259 and pycor >= 128 [set pcolor gray]]
  crt 1 
  [set shape "pavement" set size 150 
   setxy 74 197 stamp 
   set xcor xcor + 166 stamp 
   set xcor xcor + 166 stamp 
   set xcor xcor + 166 stamp
   setxy 80 230 set shape "car" stamp set xcor xcor + 150 set shape "car side" stamp
   setxy 300 36 set size 50 set shape "ball basketball" set color 26 stamp
   set size 200
   setxy 54 349 set shape "house bungalow" set color blue stamp
   setxy 187 374 set shape "tree pine" set color green stamp
   setxy 351 353 set shape "building store" set color sky stamp
   setxy 68 95 set shape "run" set size 150 set color 27 
   ]
  crt 1 
  [setxy 330 30 set label-color black
   set label "Mr. Brown is on his weekly jog around Stuyvesant during 8th period"
   wait 1
   ask turtles with [shape = "run"] [set shape "run1" set xcor xcor + 50]
   ask turtles with [size = 1] [set label "Mr. brown: I CAN DO A 22 200 meters!"]
   wait 1
   ask turtles with [shape = "run1"] [set shape "run2" set xcor xcor + 100]
   ask turtles with [size = 1] [set label "WAHOOOO IM FLYING"]
   wait 1
   ask turtles with [shape = "run2"] [set shape "run1" set xcor xcor + 100]
   ask turtles with [size = 1] [set label "IM SO FASTTT"]
   wait 1
   ask turtles with [shape = "run1"] [set shape "fall1" set xcor xcor + 50]
   ask turtles with [size = 1] [set label "Whoaaaa"]
   wait 1
   ask turtles with [shape = "fall1"] [set shape "fall2" set ycor 73 ]  
   ask turtles with [size = 1] [set label "OWWWWIE"]]
  crt 1 
  [setxy 400 201 set size 200 set color red set shape "ambulance" set label "WEEERUUUU"]
  wait 1
  crt 1
  [setxy 439 161 set shape "person doctor" set label-color black 
   set label "You need some help bro! You broke your knee!"
   set size 100]
  wait 1
  ask turtles with [size = 1] [set label "Ok...Let's go"]
  ask turtles with [size = 1 or shape = "person doctor" or shape = "fall2"] [die] 
  wait 1
  ask turtles with [shape = "ambulance"] [set xcor xcor + 20 wait 0.5 set xcor xcor + 20 wait 0.5]
end

to intro
  ca 
  set-patch-size 1
  resize-world 0 600 0 498
  ask patches [set pcolor white]
  crt 1 
  [set xcor 155
  set ycor 420
  set heading 0
  set shape "yao"
  set size 150
  set color cyan]
  wait .5
  crt 1
  [
  set xcor 295
  set ycor 425
  set heading 0
  set shape "wen"
  set size 150]
  wait .5
  crt 1
  [set xcor 435
  set ycor 410
  set heading 0
  set shape "liu"
  set size 150]
  wait .5
  crt 1
  [set xcor 295
  set ycor 335
  set heading 0
  set shape "and"
  set size 150]
  wait .5
  crt 1
  [set xcor 190
  set ycor 235
  set heading 0
  set shape "jing"
  set size 150]
  wait .5
  crt 1
  [set xcor 375
  set ycor 240
  set heading 0
  set shape "lin"
  set size 150]
  wait .5
  crt 1
  [set xcor 137
  set ycor 125
  set heading 0
  set shape "pres"
  set size 300]
  wait .5
  crt 1
  [set xcor 412
  set ycor 109
  set heading 0
  set shape "ents"
  set size 300]
  wait .5
  crt 1
  [set xcor 575
   set ycor 130
   set heading 0
   set shape "exclaim"
   set size 220]
  wait .75
end

to Openingpage
  intro
  ca
  set-patch-size 1
  resize-world 0 600 0 498
  import-pcolors "Openingpage.jpg"
  Openingturtles
  end

to Openingturtles
  crt 1 
  [set xcor 500
  set ycor 415
  set heading 0
  set shape "jcl's"
  set size 105
  set color cyan]
  wait 1
  crt 1
  [
  set xcor 130
  set ycor 29
  set heading 0
  set shape "jur"
  set size 105]
  wait 1
  crt 1
  [set xcor 215
  set ycor 35
  set heading 0
  set shape "GER"
  set size 105]
  wait 1
  crt 1
  [set xcor 276
  set ycor 36
  set heading 0
  set shape "y"
  set size 105]
  wait 1
  crt 1
  [set xcor 358
  set ycor 36
  set heading 0
  set shape "ga"
  set size 105]
  wait 1
  crt 1
  [set xcor 438
  set ycor 36
  set heading 0
  set shape "me"
  set size 105]
  end

to setup2.0
  ca
  import-pcolors "SurgeryRoom.png"
end

to turtlesetup
  crt 1
  [set shape "stapler" set label "stapler" set color blue setxy 333 49]
  crt 1
  [set shape "cap" set label "cap" set color green setxy 290 450]
  crt 1 
  [set shape "airmask" set label "airmask" set color gray setxy 290 410]
  crt 1
  [set shape "betadine" set label "betadine" set color brown setxy 290 370]
  crt 1 
  [set shape "iv drip" set label "iv drip" set color gray setxy 290 330]
  crt 1 
  [set shape "sponge" set label "sponge" set color white setxy 290 290]
  crt 1 
  [set shape "scalpel" set label "scalpel" set color black setxy 290 250]
  crt 1 
  [set shape "sheet" set label "sheet" set color sky setxy 290 210]
  crt 1 
  [set shape "marker" set label "marker" set color yellow setxy 290 170]
  crt 1
  [set shape "tongs1" set label "tongs" set color 3 setxy 290 130] 
  crt 1
  [set shape "cement" set label "cement" setxy 290 90]
  crt 1
  [set shape "patella component" set label "PaC" set color gray setxy 290 40]
  crt 1
  [set shape "bone saw" set label "bonesaw" set color black setxy 350 440]
  crt 1 
  [set shape "drill" set label "drill" set color pink setxy 350 390]
  crt 1
  [set shape "bovie" set label "bovie" set color yellow setxy 350 340]
  crt 1
  [set shape "rongeur" set label "rogenur" set color magenta setxy 350 290]
  crt 1 
  [set shape "jig" set label "jig" set color green setxy 350 240]
  crt 1 
  [set shape "mallet" set label "mallet" set color 4 setxy 350 190]
  crt 1
  [set shape "femoral component" set label "FM" set color gray setxy 350 140]
  crt 1 
  [set shape "metal tray component" set label "MTC" set color gray setxy 350 90]
  crt 1
  [set shape "plastic component" set label "PC" set color 6 setxy 350 40]
  ask turtles [set size 50
  set label-color violet] 
  RightKneeSetup
  reset-timer
end

to RightKneeSetup
  crt 1 
  [set shape "Knee" set size 250 setxy 500 240 set color 27 stamp die]
end

to SetupSurgery
   setup2.0
   turtlesetup
end

to setup 
  ca
  set-patch-size 1
  resize-world 0 600 0 477
  import-pcolors "body.jpg"
  ask patches [if not (pcolor = black) [set pcolor 27]]
  ask patches [if pycor < 13 [set pcolor black]]
  ask patches with [pcolor = 27]
   [if count neighbors with [pcolor = black] > 3 [set pcolor black]] 
  ask patches [table headrest armrest]
  vshift
  EquipmentTable
end

to equipment-table
  crt 1
  [set size 500
  set shape "equipmenttable"
  setxy 190 227
   die]
end

to table
  if pxcor >= 230 and pxcor <= 368 and pycor >= 3 and pycor <= 388
  [if not (pcolor = 27) [set pcolor blue]]
end
  
to headrest
  if pxcor >= 258 and pxcor <= 337 and pycor <= 419 and pycor >= 380
  [if not (pcolor = 27) [set pcolor blue]]
  if pxcor >= 241 and pxcor <= 355 and pycor >= 419 and pycor <= 469
  [if not (pcolor = 27) [set pcolor blue]]
end

to armrest
  if pxcor >= 178 and pxcor <= 230
  [if pxcor * 2 - 117 >= pycor and pxcor * 2 - 240 <= pycor 
    [if not (pcolor = 27) [set pcolor blue]]]
  if pxcor >= 368 and pxcor <= 418
  [if 1087 - (pxcor * 2) >= pycor and 955 - (pxcor * 2) <= pycor 
    [if not (pcolor = 27) [set pcolor blue]]]
end

to shift 
  ask patches [set nextcolor [pcolor] of patch-at 0 150]
  ask patches [set pcolor nextcolor]
end
  
to vshift
  ask patches [set nextcolor [pcolor] of patch-at 160 0]
  ask patches [set pcolor nextcolor]
end

to EquipmentTable
  ask patches [if pxcor >= 270 and pxcor <= 400 and pycor >= 10 and pycor <= 460 [set pcolor white]]
end

to Drag
  let turtles-inrange turtles with [distancexy mouse-xcor mouse-ycor < 30]
  if mouse-inside? 
  [if any? turtles-inrange
     [ask min-one-of turtles-inrange [distancexy mouse-xcor mouse-ycor]
          [face patch mouse-xcor mouse-ycor fd 1.5]]]
end

to Drag2.0
  if mouse-inside? [if distancexy mouse-xcor mouse-ycor < 50 [facexy mouse-xcor mouse-ycor fd 3]]
end

to blanket
  if count turtles = 21
  [ask turtles with [shape = "sheet"]
    [Drag2.0 if pcolor = 27 [
        user-message (word "The blanket covers all parts of the body except the area being opearated on")
         BlanketCover die]]]
end

to BlanketCover
  ask patches with [pxcor > 17 and pxcor < 261 and pycor > 190 and pycor < 387] [set pcolor sky]
  ask patches with [pxcor > 17 and pycor < 214 and pxcor < 150 and pycor > 12 and pycor < 215] 
  [set pcolor sky]
end

to cap
  if count turtles = 20
  [ask turtles with [shape = "cap"]
  [Drag2.0 if pcolor = 27 and pycor > 420 
    [user-message (word "The cap makes sure that bacteria from the head does not contaminate the surgery")
        setxy 140 440 set size 80 stamp die]]]
end

to AirMask 
  if count turtles = 19
  [ask turtles with [shape = "airmask"]
  [Drag2.0 if pcolor = 27 and pycor > 400 [
      user-message (word "The airmask gives the patient a steady supply of healthy air and also prevents the oral cavity from being a source of infection")
        setxy 142 410 set size 80 stamp die]]]
end

to iv-drip
  if count turtles = 18
  [ask turtles with [shape = "iv drip"] 
    [Drag2.0 if pxcor < 220 [
        user-message (word "The iv-drip supplies the patient with anesthesia") 
          set shape "ivdrip2.0" setxy 245 325 set size 350 stamp die]]]
end

to sponge-edit
  if count turtles > 15 and count turtles < 18
  [ask turtles with [shape = "sponge"]
  [ Drag2.0 carefully [if distance one-of turtles with [shape = "betadine"] < 10 
    [set color 25 ask turtles with [shape = "betadine"] [die]]] []
   SpongeSterilize]]
end

to SpongeSterilize
  if pycor < 150 and pcolor = 27
   [user-message (word "the sponge is used to clean the body before surgery")
     ask patches with [pycor < 215 and pxcor > 140 and pcolor = 27] [set pcolor 25]
     set size 250 setxy 498 240 set shape "knee" set color 25 stamp die]
end

to marker-edit
  if count turtles = 15
  [ask turtles with [shape = "marker"]
  [Drag2.0 if (pcolor = 25 and pycor < 150) [
      user-message (word "the marker is used to draw the place of incision")
      set shape "marker1" setxy 170 146 stamp die]]]
end

to scalpel-edit 
  if count turtles = 14
  [ask turtles with [shape = "scalpel"]
  [Drag2.0 if (pcolor = 25 and pycor < 150) [
      user-message (word "the scalpel is used to cut open the area undergoing the surgery")
      set shape "scalpel1" setxy 170 146 stamp 
      setxy 498 240 set size 100 stamp die]]]
end

to tongs 
  if count turtles = 13
  [ask turtles with [shape = "tongs1"] 
  [Drag2.0 if pcolor = 25 and pycor < 170
    [user-message (word "the tongs are used to open up the skin after the scalpel has made its incision")
      setxy 498 240 set shape "knee" set size 250 set color 25
       stamp setxy 173 148 set shape "knee" set color 25 set size 80 stamp
     wait 0.2 set shape "tongs2" 
     set shape "underskin1" stamp
     set shape "tongs3" wait 0.2 set shape "underskin2" stamp
     set shape "tongs4" wait 0.2 set shape "underskin3" stamp
     set shape "tongs5" wait 0.2 set shape "underskin4" stamp 
     wait 0.2 stamp-erase
     wait 0.2 set shape "kneetongs" stamp
     setxy 498 240 set size 150 set shape "underskin4" stamp 
     set shape "kneeblood" set size 250 stamp die]]]
end

to bovie
  if count turtles = 12
  [ask turtles with [shape = "bovie"]
  [Drag2.0 if pcolor = 25 and pycor < 150 [
    user-message (word "the bovie is used to burn off any blood around the area being operated on")
    setxy 173 145
    set size 80
    set shape "knee (sq)"
    stamp
    setxy 498 240
    set size 250
    stamp  die]]]
end


to Rongeur
  if count turtles = 11
  [ask turtles with [shape = "rongeur"] 
  [Drag2.0 if pcolor = 25 and pycor < 150 
    [user-message (word "the rongeur is used to shape the bone before it is cut")
      setxy 173 148 set size 80 set shape "kneerongeur" stamp
      setxy 498 240 set size 250 set shape "kneerongeur" stamp die]]]
end

to Drill
  if count turtles = 10
  [ask turtles with [shape = "drill"] 
  [Drag2.0 if pcolor = 25 and pycor < 150 [
      user-message (word "the drill is used to make a hole into the bone so that the jig can be placed inside")
      set shape "kneedrilled"
      setxy 173 148 set size 80 stamp setxy 498 240 set size 250 stamp die]]]
end

to Jig
  if count turtles = 9 
  [ask turtles with [shape = "jig"]
  [Drag2.0 if pcolor = 25 and pycor < 150 
    [user-message (word "the jig is used to insert a metal plate onto the bone to make sawing easier")
      set shape "kneejig" setxy 173 148 set size 80 stamp 
      setxy 498 240 set size 250 set shape "kneejig" stamp die]]]
end

to Mallet
  if count turtles = 8
  [ask turtles with [shape = "mallet"]
    [Drag2.0 if pcolor = 25 and pycor < 150
      [user-message (word "the mallet is used to hammer the two screws into the bone")
        setxy 173 148 set shape "kneemallet" set size 80 stamp
        setxy 498 240 set size 250 stamp die]]]
end

to Saw
  if count turtles = 7
  [ask turtles with [shape = "bone saw"] 
  [Drag2.0 if pcolor = 25 and pycor < 140 [
     user-message (word "the saw is used to cut off parts of the bone in order to place the metal plates on")
     set shape "kneesawed1"
     setxy 173 148 set size 80 
     stamp set shape "kneesawed2" stamp wait 0.2
     set shape "kneesawed3" stamp wait 0.2 
     set shape "kneesawed4" stamp
     set size 280
     set shape "Knee"
     setxy 498 240
     stamp-erase
     set shape "Kneesawed1"
     set size 250
     stamp
     wait 0.2
     set shape "kneesawed2" stamp
     wait 0.2
     set shape "kneesawed3" stamp
     wait 0.2
     set shape "kneesawed4" stamp
     die]]]
end

to Cement 
  if count turtles = 6
  [ask turtles with [shape = "cement"] 
  [Drag2.0 if pcolor = 25 and pycor < 170 [
    user-message (word "the cement is used to attach the metal components to bones")
    setxy 173 148 set shape "kneecement" set size 80 stamp 
    set size 250 setxy 498 240 set shape "kneecement" stamp die]]]
end

to FemoralComponent
  if count turtles = 5
  [ask turtles with [shape = "femoral component"]
    [Drag2.0 if pcolor = 25 and pycor < 170 
      [user-message (word "the femoral component is the metal component that attaches to the femur")
        setxy 173 152 set size 25 stamp setxy 498 252 set size 80 stamp die]]]
end

to MetalTrayComponent
  if count turtles = 4 
  [ask turtles with [shape = "metal tray component"]
    [Drag2.0 if pcolor = 25 and pycor < 150 
      [user-message (word "the Metal Tray component is inserted into the tibia bone for support")
        setxy 174 147 set size 35 stamp setxy 497 235 set size 100 stamp die]]]
end

to PlasticComponent
  if count turtles = 3 
  [ask turtles with [shape = "plastic component"]
    [Drag2.0 if pcolor = 25 and pycor < 150
      [user-message (word "the Plastic Component is inserted between the metal tray component and the patella component to act as a shock absorber")
        setxy 175 150 set size 40 stamp
        setxy 500 245 set size 100 stamp die]]]
end

to PatellaComponent
  if count turtles = 2
  [ask turtles with [shape = "patella component"]
    [Drag2.0 if pcolor = 25 and pycor < 150
      [user-message (word "the patella component is attached to the patella bone")
        setxy 180 150 set size 20 stamp
        setxy 525 245 set size 45 stamp die]]]
end

to Stapler
  if count turtles = 1
  [ask turtles with [shape = "stapler"]
    [Drag2.0 if pcolor = 25 and pycor < 150 
      [user-message (word "the stapler is used to close the incision")
        setxy 173 148 set shape "knee" set size 80 set color orange stamp
        setxy 498 240 set size 250 stamp user-message (word "WAHOOO GOOD JOB") die]]]
end
  
to beginSurgery!
  blanket
  cap
  AirMask
  iv-drip
  sponge-edit
  marker-edit
  scalpel-edit
  bovie
  tongs
  Rongeur
  Drill
  Jig
  Mallet
  Saw
  Cement
  FemoralComponent
  MetalTrayComponent
  PlasticComponent
  PatellaComponent
  Stapler
  FinishedUp
  Failed
end

to femursetup
  crt 1
  [set xcor 172
  set ycor 172
  set color white
  set shape "femur 1"
  set size 70] 
  wait .5
  crt 1 
  [set xcor 172
  set ycor 172
  set color white
  set shape "femur 2"
  set size 70] 
  wait .5
  crt 1 
  [set xcor 172
  set ycor 172
  set color white
  set shape "femur 3"
  set size 70]
  wait .5
  crt 1
  [set xcor 172
  set ycor 172
  set color white
  set shape "femur 4"
  set size 70]  
  wait .5
  crt 1
  [set xcor 172
  set ycor 172
  set color white
  set shape "femur 5"
  set size 70] 
  wait .5
  crt 1
  [set xcor 172
  set ycor 172
  set color white
  set shape "femur 6"
  set size 70]
  wait .5
  crt 1
  [set xcor 172
  set ycor 172
  set color white
  set shape "femur 7"
  set size 70] 
  end

to FinishedUp
  if count turtles = 0 and (LevelofDifficulty * 20 - timer) / 60 >= 0 
  [ca
   ask patches [set pcolor white]
  crt 1 
  [set xcor 155
    set ycor 435
    set shape "con"
    set size 175]
  wait .5
  crt 1
  [set xcor 315
    set ycor 452
    set shape "grat"
    set size 175]
  wait .5
  crt 1
  [set xcor 462
    set ycor 433
    set shape "z!!!"
    set size 175]
  wait .5
  crt 1
  [set xcor 185
    set ycor 320
    set shape "than"
    set size 175]
  wait .5
  crt 1
  [set xcor 285
    set ycor 330
    set shape "k"
    set size 130]
  wait .5
  crt 1
  [set xcor 410
    set ycor 328
    set shape "you"
    set size 175]
  wait .5
  crt 1
  [set xcor 310
    set ycor 210
    set shape "for"
    set size 175]
  wait .5
  crt 1
  [set xcor 205
    set ycor 85
    set shape "play"
    set size 175]
  wait .5
  crt 1
  [set xcor 387
    set ycor 85
    set shape "ing"
    set size 175]
  ifelse user-yes-or-no? "Would You like to Play Again!?" 
   [start] [user-message "We shall try this again until you want to select yes" failed]]
end

to Failed
  if (LevelofDifficulty * 20 - timer) / 60 <= 0 and count turtles > 0 and count patches with [pcolor = blue] > 0 
  [ca
    ask patches [set pcolor white]
  crt 1
  [set xcor 300
    set ycor 461
    set shape "you"
    set size 168]
  crt 1
  [set xcor 300
    set ycor 344
    set shape "have"
    set size 168]
  crt 1
  [set xcor 220
    set ycor 209
    set shape "fail"
    set size 168]
  crt 1
  [set xcor 410
    set ycor 199
    set shape "ed"
    set size 168]
  crt 1
  [set xcor 235
    set ycor 79
    set shape "us"
    set size 168]
  crt 1
  [set xcor 400
    set ycor 79
    set shape "!!!"
    set size 168]
  ask n-of 5 turtles [die]
  ask turtles [setxy 200 299
    set shape "person" set color orange wait 0.1
    setxy 225 299 set shape "run" wait 0.1 
    setxy 250 299 set shape "jump1" wait 0.1
    setxy 275 299 set shape "jump2" wait 0.1
    setxy 300 299 set shape "jump3" wait 0.1
    setxy 325 299 set shape "yay" wait 0.1]
   ifelse user-yes-or-no? "Would You like to Restart Sir!?" 
   [start] [user-message "We shall try this again until you want to select yes" failed]]
end




  
  




    
    
    
    
@#$#@#$#@
GRAPHICS-WINDOW
203
10
814
540
-1
-1
1.0
1
10
1
1
1
0
1
1
1
0
600
0
498
0
0
1
ticks

BUTTON
-1
138
109
171
NIL
BeginSurgery!
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
-1
106
64
139
NIL
Start
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

MONITOR
-3
203
57
248
TimeLeft
(LevelofDifficulty * 20 - timer) / 60
2
1
11

SLIDER
-1
170
171
203
LevelofDifficulty
LevelofDifficulty
0
100
99
1
1
NIL
HORIZONTAL

@#$#@#$#@
WHAT IS IT?
-----------
	Our game is called Knee Surgery and it essentially is, as the name implies, knee surgery. The game revolves around a male patient who is in dire need of new knee parts because his old ones have corroded away. Specifically, the patient's left knee has corroded away. The player's job is to try to go through the surgical procedure without messing up the surgery. 

	In the beginning, the patient is lying down on a table and a equipment tray contains all the tools that the player needs to correctly carry out the surgery. There is a large number of tools that must be used in the correct sequence. Failure to do so will result in the tools being stagnant; a tool will not move unless it is supposed to move. This mechanism is never broken.

	Each tool is moved just by placing the mouse next to the appropriate tool. It follows the mouse until it reaches the body. When it reaches the body, a series of reactions takes place. The tool transforms or alters a part of the body and then dies. The surgery proceeds this way until all the tools have been used. When this occurs, the game is finished. 

HOW IT WORKS
------------
	Knee Surgery relies on a few complex concepts to function. First and foremost, the importation of pictures for its opening, its surgery and its ending would take too long if we did not develop an alternative method than the traditional "import-pcolors" and then the file name. This traditional method is ineffective because it will transform all the patches one at a time and since Knee Surgery employs over two thousand patches, this would take quite some time. The alternative would be to "export the view" once we have imported the picture we wanted and save it to a different file in which the "import-pcolors" from this file would already be defined. This being the case, the actual picture would only take one second to import.

	The second breakthrough that we made or second challenge was to get turtles to line up appropriately. When the game first starts, the words SURGERY GAME!!! are actually many turtles strung together. They are turtles with shapes "SUR", "GER", "Y", "GA", and "ME!!". It is different to coordinate the movement and placement of all five of these turtles. To solve this, the makers of Knee Surgery manually set the x and y coordinates of the turtles to a certain number. This also applies to the turtles or tools that are set up on the equipment table. Originally, a simple algorithm was established. It was setxy (desired pxcor) (who mod (count turtles + 1) + (degree of movement) * 40. In this respect, the turtles would space themselves out evenly at any desired xcor. 

	However, when the number of turtles exceeded 12, this grew very complicated to carry out because the turtles would start overlapping due to the fact that their ycor would start exceeding the limits of the length of the world, and then wrap around. To solve this, we tried to ask n-of turtles to set their xcor to a number and the rest to set their xcor to a different number. However, the who number would mess things up in this case because if we have turtles with who numbers 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 and we ask 12 of the turtles to set their xcor to a certain number and the rest to a different xcor. If who mod 15 is used for both stes of turtles, sometimes, intimate factors such as labels and turtle sizes can interfere. Labels can interfere because if they are too long, they string out to ridiculous lengths, jutting into the personal spaces of other tools. In addition, some turtle shapes are designed to be bigger than others, and if they are all placed with a simple algorithm, there is a strong possibility that some will overlap. Again, to solve this problem, we manually coded all the turtles by setting their xcors to one of two different values and setting their ycors to multiples of 40. 

	Another wall that we ran into wasa how we could make only one turtle move when we used our "Drag" function. In the beginning, we were faced with two alternatives. One was to use the following function in the drag function: if distancexy mouse-xcor mouse-ycor < 30 [facexy mouse-xcor mouse-ycor]. The other choice was to simply make the turtles stationary. They would just be iconic. The problem with the first method is that if more than one turtles are within a certain distance of the mouse, then they would ALL congregate at the mouse. This is disastrous when we only want one of the turtles to follow the mouse. The second option is just as inefficient because if we use it, then the player loses the ability to interact with the game on another level. Our solution at the time was to use min-one-of which would negate any confusion by selecting the turtle that is the closest to the mouse. Yet, this also has its setbacks because more than one turtle can move towards the mouse at the same time. In the end, the answer was so radical, so simple that we were shocked. If the command for drag was placed only in the code for each specific tool, meaning in each tool's own specific setup and function, then we can negate all problems. So, we simply used: if mouse-inside? [if distancexy mouse-xcor mouse-ycor < 300 [facexy mouse-xcor mouse-ycor fd 3]]. This code encompasses all that we tried to do in four days. It is our final, elegant solution. 

	In addition, we also had the problem of figuring out how to make each turtle "special". How could we make the Drag function respond to turtles only if they satisfy a requirement? The answer was count turtles. Since after being used, turtles die, we used a simple count turtles function to determine if a turtle should "Drag". If count turtles corresponded to a certain number, then certain tools will be able to use the Drag function. If not, they won't be able to. 

	One more problem we tackled was how realistic the game should be. Right off the bat, we had to stick with a tan colored person because it was too difficult to make the person different shades of color. In addition, we also had to sacrifice some realism when we made turtle shapes for different phases of the operation. For example, for scalpel, we made lines along the body, but we struggled with how realistic the cuts should look. In the end, we compromised realism with efficiency. 

	One of our most important debates was whether to make the surgery with patches or turtles. Should we make the changes, the incisions, the knee replacements, the drilling, the cementing with patches or turtles and how so? We chose to use turtles in the end because as mentioned before, we have over two thousand patches and to commandeer each of them with precision, accuracy and speed is a pain and a headache that we didn't deal with. We chose turtles in the end because their shapes were customizable and they were easy to duplicate and manipulate. 

	Now that we had turtles, we had to figure out how to make the colors of the turtles stay after we kill them because if there were too many turtles in the same place, the labels would mess each other up and we would have to figure out another mechanism to distinguish the turtles for the Drag function. In order to do that, we employed the help of two functions: stamp and stamp-erase. They allow us to set turtle shapes onto the screen and then conveniently allow the turtles to die. 

	Lastly, we have a separate unique function call for each turtle, each tool that allows them to distinguish themselves from one another. 
	
	The last problem we encountered was trying to juxtapose the forver setting BeginSurgery! with the one time setting ending function. This would cause the entire thing to blow up if they were put next to each other. Reluctantly, we made the two into two separate functions because putting them together would require us to use the stop function which is taboo for our instructor.

HOW TO USE IT
-------------
To play the game, first press Start and then press BeginSurgery!


THINGS TO NOTICE
----------------
The tools should be moved with moderation. Please do not whirl the mouse all over the world. In addition, a message box will appear every time a tool is used to explain that tool's function.


EXTENDING THE MODEL
-------------------
To make this game more complicated, one could try coding everything in patch context instead of turtle context which would be very painful. 

NETLOGO FEATURES
----------------
This model uses NetLogo's strange export view and import view properties.

RELATED MODELS
--------------
The basis for our project was from this website:
http://www.surgerygames.org/oyna.php?ID=106

CREDITS AND REFERENCES
----------------------
Mr. Brown 
Netlogo Dictionary
Tian Ci Lin
Timothy Ong
Online Websites for Pictures
SurgeryGames.org
Jing Lin
Yao Wen Liu
@#$#@#$#@
default
false
0
Rectangle -7500403 false true 45 150 75 150
Line -7500403 true 75 150 225 150
Circle -16777216 true false 129 129 42
Circle -1 true false 75 75 150
Circle -16777216 true false 129 129 42
Circle -11221820 true false 108 108 85
Circle -11221820 true false 135 135 30
Circle -16777216 true false 129 129 42
Line -2674135 false 90 135 105 150
Polygon -2674135 false false 90 135 90 150
Line -2674135 false 120 90 135 90
Line -2674135 false 165 195 180 210
Line -2674135 false 105 180 90 195

!!!
false
0
Polygon -7500403 true true 75 60 75 240 105 240 105 60
Rectangle -7500403 true true 195 60 225 240
Rectangle -7500403 true true 135 60 165 240
Circle -7500403 true true 69 249 42
Circle -7500403 true true 129 249 42
Circle -7500403 true true 189 249 42

airmask
false
0
Circle -13791810 false false 135 135 30
Polygon -13791810 true false 150 105 120 135 120 195 180 195 180 135
Circle -11221820 true false 133 141 34
Polygon -11221820 true false 150 165 270 180 255 165 150 150

ambulance
false
0
Rectangle -7500403 true true 30 90 210 195
Polygon -7500403 true true 296 190 296 150 259 134 244 104 210 105 210 190
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Circle -16777216 true false 69 174 42
Rectangle -1 true false 288 158 297 173
Rectangle -1184463 true false 289 180 298 172
Rectangle -2674135 true false 29 151 298 158
Line -16777216 false 210 90 210 195
Rectangle -16777216 true false 83 116 128 133
Rectangle -16777216 true false 153 111 176 134
Line -7500403 true 165 105 165 135
Rectangle -7500403 true true 14 186 33 195
Line -13345367 false 45 135 75 120
Line -13345367 false 75 135 45 120
Line -13345367 false 60 112 60 142

and
false
0
Rectangle -7500403 true true 15 195 75 210
Rectangle -7500403 true true 15 150 30 210
Rectangle -7500403 true true 15 135 75 150
Rectangle -7500403 true true 75 135 90 225
Polygon -7500403 true true 120 135 105 135 105 210 105 225 120 225 120 165 165 165 165 225 180 225 180 150 120 150
Polygon -7500403 true true 255 105 255 225 195 225 195 165 210 165 210 210 240 210 240 105
Rectangle -7500403 true true 195 165 255 180

apple
false
0
Polygon -7500403 true true 33 58 0 150 30 240 105 285 135 285 150 270 165 285 195 285 255 255 300 150 268 62 226 43 194 36 148 32 105 35
Line -16777216 false 106 55 151 62
Line -16777216 false 157 62 209 57
Polygon -6459832 true false 152 62 158 62 160 46 156 30 147 18 132 26 142 35 148 46
Polygon -16777216 false false 132 25 144 38 147 48 151 62 158 63 159 47 155 30 147 18

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

ball basketball
false
0
Circle -7500403 true true 26 26 247
Polygon -16777216 false false 30 150 30 165 45 195 75 225 120 240 180 240 225 225 255 195 270 165 270 150 270 135 255 105 225 75 180 60 120 60 75 75 45 105 30 135
Line -16777216 false 30 150 270 150
Circle -16777216 false false 26 26 247

betadine
false
0
Circle -13791810 true false 89 89 123
Circle -1 true false 107 98 88
Circle -6459832 true false 120 105 59

bone saw
false
0
Circle -7500403 true true 0 60 120
Polygon -7500403 true true 60 60 210 60 210 180 120 180 90 270 60 270 75 180
Circle -7500403 true true 168 78 85
Rectangle -7500403 true true 210 105 270 135
Polygon -7500403 true true 270 105 330 105 285 135 270 135

bovie
false
0
Polygon -7500403 true true 30 75 150 195 180 165 90 45 75 30
Circle -7500403 true true 15 15 90
Polygon -1184463 true false 150 135 120 165 135 180 165 150
Polygon -13791810 true false 90 135 105 150 135 120 120 105
Circle -7500403 true true 150 165 60
Polygon -7500403 true true 180 210 210 270 225 255 195 195
Polygon -7500403 true true 225 255 225 285 210 270

building store
false
0
Rectangle -7500403 true true 30 45 45 240
Rectangle -16777216 false false 30 45 45 165
Rectangle -7500403 true true 15 165 285 255
Rectangle -16777216 true false 120 195 180 255
Line -7500403 true 150 195 150 255
Rectangle -16777216 true false 30 180 105 240
Rectangle -16777216 true false 195 180 270 240
Line -16777216 false 0 165 300 165
Polygon -7500403 true true 0 165 45 135 60 90 240 90 255 135 300 165
Rectangle -7500403 true true 0 0 75 45
Rectangle -16777216 false false 0 0 75 45

cap
false
0
Circle -2674135 false false 116 116 67
Circle -2674135 false false 86 131 67
Circle -2674135 false false 146 131 67
Circle -2674135 false false 60 105 60
Circle -2674135 false false 86 101 67
Circle -2674135 false false 146 101 67
Circle -2674135 false false 180 105 60
Circle -2674135 false false 96 96 108
Circle -2674135 false false 108 108 85
Circle -2674135 false false 51 111 108
Circle -2674135 false false 141 111 108
Circle -2674135 false false 78 123 85
Circle -2674135 false false 43 103 95
Circle -2674135 false false 148 118 92
Circle -2674135 false false 176 131 67
Circle -2674135 false false 43 103 95
Circle -2674135 true false 48 108 85
Circle -2674135 true false 168 108 85
Circle -2674135 true false 86 86 67
Circle -2674135 true false 33 108 85
Circle -2674135 true false 60 105 60
Circle -2674135 true false 116 86 67
Circle -2674135 true false 111 96 108
Circle -2674135 true false 63 123 85
Circle -2674135 true false 51 96 108
Circle -2674135 true false 148 133 95
Circle -2674135 true false 206 131 67
Circle -2674135 true false 116 146 67
Circle -2674135 true false 153 93 85
Circle -2674135 true false 56 146 67
Circle -2674135 true false 71 161 67

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

car side
false
0
Polygon -7500403 true true 19 147 11 125 16 105 63 105 99 79 155 79 180 105 243 111 266 129 253 149
Circle -16777216 true false 43 123 42
Circle -16777216 true false 194 124 42
Polygon -16777216 true false 101 87 73 108 171 108 151 87
Line -8630108 false 121 82 120 108
Polygon -1 true false 242 121 248 128 266 129 247 115
Rectangle -16777216 true false 12 131 28 143

cement
false
0
Circle -14835848 true false 86 86 127
Circle -14835848 true false 48 78 85
Circle -14835848 true false 81 36 108
Circle -14835848 true false 153 63 85
Circle -14835848 true false 41 146 67
Circle -14835848 true false 176 131 67

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cloud
false
0
Circle -7500403 true true 13 118 94
Circle -7500403 true true 86 101 127
Circle -7500403 true true 51 51 108
Circle -7500403 true true 118 43 95
Circle -7500403 true true 158 68 134

con
false
0
Polygon -7500403 true true 15 105 75 105 75 90 0 90 0 210 75 210 75 195 15 195
Polygon -7500403 true true 90 135 90 210 165 210 165 135 150 135 150 195 105 195 105 150 150 150 150 135
Polygon -7500403 true true 180 135 180 210 195 210 195 165 225 165 225 210 240 210 240 150 195 150 195 135

drill
false
0
Rectangle -7500403 true true 30 60 180 150
Polygon -7500403 true true 45 150 30 240 75 240 90 150
Rectangle -7500403 true true 135 75 225 135
Rectangle -7500403 true true 195 90 285 120

ed
false
0
Polygon -7500403 true true 15 60 15 240 135 240 135 210 45 210 45 165 135 165 135 135 45 135 45 90 135 90 135 60
Polygon -7500403 true true 225 60 240 60 240 240 225 240 225 225 180 225 180 165 195 165 195 210 225 210 225 180 195 180 195 165 225 165

ents
false
0
Polygon -7500403 true true 15 105 15 210 75 210 75 195 30 195 30 165 75 165 75 150 30 150 30 120 75 120 75 105
Polygon -7500403 true true 90 150 90 210 105 210 105 180 120 180 135 180 135 210 150 210 150 165 105 165 105 150
Polygon -7500403 true true 180 105 180 135 165 135 165 150 180 150 180 210 195 210 195 150 210 150 210 135 195 135 195 105
Polygon -7500403 true true 285 150 285 135 225 135 225 180 270 180 270 195 225 195 225 210 285 210 285 165 240 165 240 150

exclaim
false
0
Rectangle -7500403 true true 120 15 180 195
Circle -7500403 true true 117 207 66

fail
false
0
Polygon -7500403 true true 0 60 0 255 30 255 30 165 90 165 90 135 30 135 30 90 90 90 90 60
Polygon -7500403 true true 105 165 105 240 165 240 165 255 180 255 180 165 165 165 165 225 120 225 120 180 165 180 165 165 120 165
Rectangle -7500403 true true 210 150 210 180
Rectangle -7500403 true true 195 150 225 255
Circle -7500403 true true 189 84 42
Rectangle -7500403 true true 255 60 285 255

fall1
false
0
Circle -955883 true false 188 130 67
Rectangle -955883 true false 108 137 198 197
Polygon -955883 true false 155 239 177 169 194 171 172 237 189 264 180 273
Polygon -955883 true false 144 109 166 179 183 177 163 117 204 92 188 84
Polygon -955883 true false 123 151 77 135 26 136 37 152 74 151 109 164
Polygon -955883 true false 126 183 86 221 29 198 40 182 79 199 112 170

fall2
false
0
Circle -955883 true false 111 85 67
Polygon -955883 true false 117 144 176 144 201 175 245 164 249 181 198 191 176 170 176 232 116 234 117 175
Polygon -955883 true false 161 232 206 185 244 233 224 237 207 211 173 237
Polygon -955883 true false 158 206 203 159 241 207 221 211 204 185 170 211
Polygon -955883 true false 149 152 160 173 222 127 212 110

femoral component
false
0
Circle -7500403 true true 45 45 120
Circle -7500403 true true 135 45 120
Rectangle -7500403 true true 74 150 120 180
Rectangle -7500403 true true 182 153 225 185
Polygon -7500403 true true 74 179 100 201 122 201 119 179
Polygon -7500403 true true 181 185 192 203 230 204 226 185
Polygon -7500403 true true 240 75 270 90 240 90
Rectangle -7500403 true true 120 60 180 75

femur 1
false
0
Circle -7500403 true true 88 238 62
Rectangle -7500403 true true 120 225 165 270
Circle -7500403 true true 131 236 67

femur 2
false
0
Circle -7500403 true true 90 240 58
Rectangle -7500403 true true 120 180 165 270
Circle -7500403 true true 131 236 67

femur 3
false
0
Circle -7500403 true true 88 238 62
Rectangle -7500403 true true 120 135 165 270
Circle -7500403 true true 131 236 67

femur 4
false
0
Circle -7500403 true true 88 238 62
Circle -7500403 true true 131 236 67
Rectangle -7500403 true true 120 75 165 270

femur 5
false
0
Circle -7500403 true true 88 238 62
Circle -7500403 true true 131 236 67
Rectangle -7500403 true true 120 30 165 255

femur 6
false
0
Circle -7500403 true true 88 238 62
Circle -7500403 true true 131 236 67
Rectangle -7500403 true true 120 45 165 270
Circle -7500403 true true 86 11 67

femur 7
false
0
Circle -7500403 true true 90 240 60
Circle -7500403 true true 131 236 67
Rectangle -7500403 true true 120 30 165 255
Circle -7500403 true true 73 -2 62
Circle -7500403 true true 105 -15 90

for
false
0
Polygon -7500403 true true 30 75 30 210 45 210 45 135 90 135 90 120 45 120 45 90 90 90 90 75 90 90 90 75
Polygon -7500403 true true 105 150 105 210 165 210 165 150 150 150 150 195 120 195 120 165 150 165 150 150
Polygon -7500403 true true 195 135 195 210 210 210 210 150 255 150 255 135 210 135

ga
false
0
Rectangle -7500403 true true 30 75 60 75
Polygon -13791810 true false 45 105 105 105 105 120 60 120 60 195 105 195 105 165 90 165 90 150 135 150 135 165 120 165 120 210 45 210 45 105
Polygon -13791810 true false 135 210 180 105 225 210 210 210 195 180 165 180 150 210 135 210 180 135 195 165 165 165
Polygon -13840069 true false 165 165 135 210 165 165

ger
false
0
Rectangle -13840069 true false 150 120 150 135
Rectangle -13840069 true false 255 105 255 150
Polygon -13840069 true false 30 105 90 105 90 120 45 120 45 195 90 195 90 165 60 165 60 150 120 150 120 165 105 165 105 210 30 210 30 105
Polygon -13840069 true false 135 105 135 210 195 210 195 195 150 195 150 165 195 165 195 150 150 150 150 120 195 120 195 105 135 105
Polygon -13840069 true false 210 105 210 210 225 210 225 165 255 165 270 210 285 210 270 165 270 105 210 105 225 120 225 150 255 150 255 120 225 120

grat
false
0
Polygon -7500403 true true 0 90 0 165 45 165 45 225 0 225 0 240 60 240 60 150 15 150 15 105 45 105 45 150 60 150 60 90
Polygon -7500403 true true 75 165 75 240 90 240 90 180 120 180 120 165 90 165
Polygon -7500403 true true 135 180 135 240 180 240 180 255 195 255 195 180 180 180 180 225 150 225 150 195 180 195 180 180
Polygon -7500403 true true 225 105 225 165 210 165 210 180 225 180 225 240 240 240 240 180 255 180 255 165 240 165 240 105

have
false
0
Polygon -7500403 true true 0 60 0 240 15 240 15 165 45 165 45 240 60 240 60 60 45 60 45 135 15 135 15 75 15 60
Polygon -7500403 true true 75 150 75 225 135 225 135 240 150 240 150 150 135 150 135 210 90 210 90 165 135 165 135 150
Polygon -7500403 true true 165 150 195 240 225 150 210 150 195 195 180 150
Polygon -7500403 true true 240 150 240 240 285 240 285 225 255 225 255 195 285 195 285 180 255 180 255 150 285 150 285 135 240 135 240 150

heart
false
0
Circle -2674135 true false 90 120 60
Circle -2674135 true false 86 86 67
Rectangle -2674135 true false 90 120 105 165
Circle -2674135 true false 84 129 42
Circle -2674135 true false 129 84 42
Circle -2674135 true false 146 101 67
Circle -2674135 true false 133 133 95
Rectangle -2674135 false false 195 135 240 120
Rectangle -2064490 true false 195 120 240 135
Rectangle -2064490 true false 195 150 225 165
Rectangle -2064490 true false 60 150 90 165
Rectangle -2064490 true false 60 120 90 135
Rectangle -13345367 true false 105 180 120 225
Circle -2674135 true false 101 146 67
Rectangle -13345367 true false 90 60 105 105
Rectangle -13345367 true false 105 75 120 105
Circle -2674135 true false 135 75 30
Circle -2674135 true false 135 60 30
Circle -2674135 true false 135 45 30
Circle -2674135 true false 150 45 30
Circle -2674135 true false 165 45 30
Rectangle -2674135 true false 135 15 150 60
Rectangle -2674135 true false 165 15 180 60
Circle -2674135 true false 180 45 30
Rectangle -2674135 true false 195 15 210 60
Circle -2674135 true false 146 116 67
Circle -2674135 true false 84 114 42
Circle -2674135 true false 90 90 30
Rectangle -8630108 true false 60 90 90 105
Rectangle -8630108 true false 180 75 210 90
Line -2674135 false 150 15 150 45
Circle -2674135 true false 135 45 30
Circle -2674135 true false 150 45 30
Circle -2674135 true false 180 45 30
Circle -2674135 true false 114 69 42
Rectangle -2674135 true false 135 60 165 75
Line -2674135 false 180 105 180 165
Line -13345367 false 165 120 195 180
Line -13345367 false 150 135 210 180
Line -13345367 false 195 135 165 180
Line -13345367 false 180 120 180 195
Line -2064490 false 165 135 195 180
Line -2064490 false 195 150 165 195
Line -2064490 false 165 165 210 210
Line -2064490 false 135 120 165 180
Line -13345367 false 165 135 150 195
Circle -6459832 true false 84 84 42
Polygon -6459832 true false 120 120 90 150 90 120 105 120 120 120
Circle -6459832 true false 75 120 30
Circle -1184463 true false 90 165 30
Circle -1184463 true false 105 180 28
Circle -2674135 true false 120 165 30
Circle -2674135 true false 90 150 30
Rectangle -2674135 true false 150 270 180 270
Rectangle -2674135 true false 105 165 135 180
Line -13345367 false 105 180 120 195
Line -13345367 false 105 180 120 195
Line -2064490 false 90 180 135 195
Line -2674135 false 120 180 105 195
Line -13345367 false 105 180 120 210
Rectangle -6459832 true false 90 105 120 120
Line -13345367 false 105 120 120 135
Line -2064490 false 120 120 105 135
Line -13345367 false 105 150 120 120
Line -2064490 false 105 135 120 150
Circle -2674135 true false 150 75 30
Circle -8630108 true false 165 75 30

house bungalow
false
0
Rectangle -7500403 true true 210 75 225 255
Rectangle -7500403 true true 90 135 210 255
Rectangle -16777216 true false 165 195 195 255
Line -16777216 false 210 135 210 255
Rectangle -16777216 true false 105 202 135 240
Polygon -7500403 true true 225 150 75 150 150 75
Line -16777216 false 75 150 225 150
Line -16777216 false 195 120 225 150
Polygon -16777216 false false 165 195 150 195 180 165 210 195
Rectangle -16777216 true false 135 105 165 135

ing
false
0
Rectangle -7500403 true true 15 90 45 225
Circle -7500403 true true 9 39 42
Polygon -7500403 true true 75 120 75 225 90 225 90 150 135 150 135 225 150 225 150 135 90 135 90 120
Polygon -7500403 true true 180 135 180 210 225 210 225 270 180 270 180 285 240 285 240 210 240 135 225 135 225 195 195 195 195 150 225 150 225 135
Rectangle -7500403 true true 255 45 285 180
Circle -7500403 true true 249 189 42

iv drip
false
0
Line -7500403 true 90 135 180 105
Line -7500403 true 90 135 195 150
Line -7500403 true 195 150 105 165
Line -7500403 true 105 165 165 180
Line -7500403 true 0 330 0 345
Line -7500403 true 165 180 180 165
Line -7500403 true 165 180 150 195
Line -7500403 true 150 195 180 195
Line -7500403 true 180 165 180 195
Rectangle -7500403 true true 180 75 225 120

ivdrip2.0
false
0
Line -7500403 true 180 180 137 241
Line -7500403 true 180 90 180 180
Polygon -7500403 true true 180 90 150 75 150 45 210 45 210 75 180 90
Polygon -7500403 true true 136 240 131 240 144 240 136 251 125 240

jcl's
false
0
Polygon -7500403 true true -15 60 75 60 75 90 45 90 45 240 -30 240 -30 210 15 210 15 90 -15 90
Polygon -7500403 true true 60 150 120 150 120 180 90 180 90 210 120 210 120 240 60 240
Polygon -7500403 true true 135 75 135 240 165 240 165 75
Circle -7500403 true true 180 135 30
Polygon -7500403 true true 195 135 210 165 195 180
Polygon -7500403 true true 240 150 285 150 285 135 225 135 225 195 270 195 270 225 225 225 225 240 285 240 285 180 240 180

jig
false
0
Polygon -7500403 true true 104 123 134 127 154 144 169 161 181 177 182 197 159 194 141 177 125 161 111 145 109 129 109 123 107 124
Polygon -7500403 true true 139 130 157 111 164 118 143 138
Polygon -7500403 true true 164 158 183 140 189 148 170 164
Polygon -7500403 true true 148 102 197 158 208 148 160 92 149 101
Polygon -7500403 true true 156 150 284 158 283 169 149 158
Line -7500403 true 192 95 175 112
Line -7500403 true 207 109 188 128

jing
false
0
Polygon -7500403 true true 15 75 90 75 90 90 60 90 60 210 0 210 0 195 45 195 45 90 15 90
Rectangle -7500403 true true 90 135 120 210
Circle -7500403 true true 90 90 30
Polygon -7500403 true true 150 135 135 135 135 210 150 210 150 165 180 165 180 210 195 210 195 150 150 150
Polygon -7500403 true true 225 105 285 105 285 90 210 90 210 210 270 210 270 195 270 180 285 180 285 165 255 165 240 165 240 180 255 180 255 195 225 195

jump1
false
0
Circle -955883 true false 119 14 62
Rectangle -955883 true false 140 52 160 100
Polygon -955883 true false 150 90 90 90 60 135 90 135 105 105 120 105 120 180 180 180 180 105 195 105 210 135 240 135 210 90 150 90 135 90 120 90 90 90
Polygon -955883 true false 130 164 97 223 58 217 55 234 101 247 145 179 130 164 128 179
Polygon -955883 true false 163 163 130 222 91 216 88 233 134 246 178 178 163 163 161 178

jump2
false
0
Circle -955883 true false 119 14 62
Rectangle -955883 true false 140 52 160 100
Polygon -955883 true false 150 90 90 90 60 135 90 135 105 105 120 105 120 180 180 180 180 105 195 105 210 135 240 135 210 90 150 90 135 90 120 90 90 90
Polygon -955883 true false 130 164 90 240 45 240 45 255 105 255 145 179 130 164 128 179
Polygon -955883 true false 163 163 125 243 90 240 90 255 135 255 178 178 163 163 161 178

jump3
false
0
Circle -955883 true false 119 14 62
Rectangle -955883 true false 140 52 160 100
Polygon -955883 true false 150 90 90 90 60 135 90 135 105 105 120 105 120 180 180 180 180 105 195 105 210 135 240 135 210 90 150 90 135 90 120 90 90 90
Polygon -955883 true false 130 164 90 210 45 180 45 195 90 225 145 179 130 164 128 179
Polygon -955883 true false 163 163 128 225 81 212 78 231 135 240 178 178 163 163 161 178

jur
false
0
Rectangle -8630108 true false 30 90 90 105
Rectangle -13840069 true false 30 105 30 120
Rectangle -8630108 true false 30 105 45 150
Rectangle -8630108 true false 30 135 90 150
Rectangle -8630108 true false 75 150 90 195
Rectangle -8630108 true false 30 180 75 195
Rectangle -8630108 true false 105 90 120 195
Rectangle -8630108 true false 120 180 150 195
Rectangle -13840069 true false 150 180 165 195
Rectangle -8630108 true false 150 90 165 195
Rectangle -8630108 true false 180 90 195 195
Rectangle -8630108 true false 195 90 240 105
Rectangle -8630108 true false 225 105 240 150
Rectangle -8630108 true false 180 135 240 150
Line -8630108 false 240 150 255 195
Line -13840069 false 225 150 240 195
Line -8630108 false 240 195 255 195
Polygon -8630108 true false 225 150 240 195 255 195 240 195 240 150
Polygon -8630108 true false 240 195 255 195 240 150

k
false
0
Polygon -7500403 true true 120 60 120 255 135 255 135 180 180 255 195 255 150 150 195 60 180 60 135 150 135 60

knee
false
2
Polygon -955883 true true 90 0 105 150 90 285 210 300 195 150 210 0

knee (sq)
false
0
Polygon -955883 true false 90 0 105 150 90 285 210 300 195 150 210 0
Rectangle -1 true false 135 45 165 120
Circle -2674135 true false 129 114 42
Circle -1 true false 148 103 34
Circle -1 true false 118 103 34
Polygon -1 true false 120 150 135 165 135 210 165 210 165 165 180 150
Polygon -1184463 true false 165 120 180 120 165 165 150 165
Rectangle -1 true false 173 131 196 153

kneeblood
false
0
Polygon -955883 true false 88 0 103 150 88 285 208 300 193 150 208 0
Rectangle -1 true false 135 45 165 120
Circle -2674135 true false 129 114 42
Rectangle -1 true false 135 150 165 210
Rectangle -2064490 true false 135 135 165 150
Polygon -1184463 true false 135 105 120 135 135 165
Polygon -1184463 true false 165 105 180 135 165 165
Circle -1 true false 118 103 34
Polygon -1184463 true false 159 117 172 117 160 164 140 165
Circle -1 true false 148 103 34
Circle -2674135 true false 132 134 10
Circle -2674135 true false 144 131 10
Circle -2674135 true false 159 141 12
Circle -2674135 true false 142 140 10
Circle -2674135 true false 133 140 10

kneecement
false
0
Polygon -955883 true false 90 0 105 150 90 285 210 300 195 150 210 0
Rectangle -1 true false 135 45 165 120
Circle -2674135 true false 129 114 42
Circle -14835848 true false 145 100 40
Circle -14835848 true false 115 101 40
Polygon -1 true false 120 150 135 165 135 210 165 210 165 165 180 150
Circle -16777216 true false 140 113 18
Circle -14835848 true false 173 134 21
Rectangle -14835848 true false 121 150 178 156

kneedrilled
false
0
Polygon -955883 true false 90 0 105 150 90 285 210 300 195 150 210 0
Rectangle -1 true false 135 45 165 120
Circle -2674135 true false 129 114 42
Circle -1 true false 145 100 40
Circle -1 true false 115 101 40
Polygon -1 true false 120 150 135 165 135 210 165 210 165 165 180 150
Circle -16777216 true false 143 112 18
Circle -1 true false 168 131 28

kneejig
false
0
Polygon -955883 true false 90 0 105 150 90 285 210 300 195 150 210 0
Rectangle -1 true false 135 45 165 120
Circle -2674135 true false 129 114 42
Circle -6459832 true false 145 100 40
Circle -6459832 true false 115 101 40
Polygon -1 true false 120 150 135 165 135 210 165 210 165 165 180 150
Circle -16777216 true false 143 112 18
Polygon -7500403 true true 115 101 184 101 184 137 115 139 115 109
Line -7500403 true 120 75 120 120
Line -7500403 true 180 75 180 120
Rectangle -16777216 true false 120 114 180 129
Rectangle -7500403 true true 117 76 126 106
Rectangle -7500403 true true 172 75 181 104

kneemallet
false
0
Polygon -955883 true false 90 0 105 150 90 285 210 300 195 150 210 0
Rectangle -1 true false 135 45 165 120
Circle -2674135 true false 129 114 42
Circle -6459832 true false 145 100 40
Circle -6459832 true false 115 101 40
Polygon -1 true false 120 150 135 165 135 210 165 210 165 165 180 150
Circle -16777216 true false 143 112 18
Polygon -7500403 true true 115 101 184 101 184 137 115 139 115 109
Rectangle -16777216 true false 129 114 171 128

kneerongeur
false
0
Polygon -955883 true false 88 0 103 150 88 285 208 300 193 150 208 0
Rectangle -1 true false 135 60 165 120
Circle -2674135 true false 129 114 42
Rectangle -1 true false 135 150 165 210
Rectangle -2064490 true false 135 135 165 150
Polygon -1184463 true false 135 105 120 135 135 165
Polygon -1184463 true false 165 105 180 135 165 165
Circle -1 true false 118 103 34
Polygon -1184463 true false 159 117 172 117 160 164 140 165
Circle -1 true false 148 103 34
Circle -1 true false 165 135 30

kneesawed1
false
0
Polygon -955883 true false 90 0 105 150 90 285 210 300 195 150 210 0
Rectangle -1 true false 135 45 165 120
Circle -2674135 true false 129 114 42
Circle -6459832 true false 145 100 40
Circle -6459832 true false 115 101 40
Polygon -1 true false 120 150 135 165 135 225 165 225 165 165 180 150
Circle -16777216 true false 142 114 16
Rectangle -7500403 true true 120 90 180 105
Line -7500403 true 120 75 120 105
Line -7500403 true 180 75 180 105
Circle -1 true false 168 132 26

kneesawed2
false
0
Polygon -955883 true false 90 0 105 150 90 285 210 300 195 150 210 0
Rectangle -1 true false 135 45 165 120
Circle -2674135 true false 129 114 42
Circle -6459832 true false 145 100 40
Circle -6459832 true false 115 101 40
Polygon -1 true false 120 150 135 165 135 210 165 210 165 165 180 150
Circle -16777216 true false 142 114 16
Rectangle -7500403 true true 120 135 180 150
Rectangle -6459832 true false 120 105 180 105
Rectangle -6459832 true false 120 105 180 105
Rectangle -6459832 true false 118 99 182 116
Circle -1 true false 174 137 22

kneesawed3
false
0
Polygon -955883 true false 90 0 105 150 90 285 210 300 195 150 210 0
Rectangle -1 true false 135 45 165 120
Circle -2674135 true false 129 114 42
Circle -6459832 true false 153 107 28
Circle -6459832 true false 119 105 32
Polygon -1 true false 120 150 135 165 135 210 165 210 165 165 180 150
Circle -16777216 true false 142 113 16
Rectangle -6459832 true false 122 141 180 150
Rectangle -6459832 true false 120 105 180 105
Rectangle -6459832 true false 120 105 180 105
Rectangle -6459832 true false 118 99 182 116
Circle -1 true false 174 124 23

kneesawed4
false
0
Polygon -955883 true false 90 0 105 150 90 285 210 300 195 150 210 0
Rectangle -1 true false 135 45 165 120
Circle -2674135 true false 129 114 42
Circle -6459832 true false 153 107 28
Circle -6459832 true false 119 105 32
Polygon -1 true false 120 150 135 165 135 210 165 210 165 165 180 150
Circle -16777216 true false 142 113 16
Rectangle -6459832 true false 122 141 180 150
Rectangle -6459832 true false 120 105 180 105
Rectangle -6459832 true false 120 105 180 105
Rectangle -6459832 true false 118 99 182 116
Circle -6459832 true false 174 124 23

kneesideprofile
false
0
Polygon -955883 true false 265 124 36 130 78 282 134 277 115 181 273 183
Polygon -1 true false 140 169 136 144 102 146 112 168
Polygon -1 true false 69 185 71 211 100 213 96 185
Circle -1 true false 88 148 24
Circle -1 true false 45 140 38
Circle -1 true false 81 140 37
Polygon -2064490 true false 71 174 94 176 93 189 70 186 71 175
Rectangle -1 true false 97 178 114 198

kneesideprofile2.0
false
0
Polygon -955883 true false 265 124 36 130 78 282 134 277 115 181 273 183
Polygon -1 true false 140 169 136 144 102 146 112 168
Polygon -1 true false 69 185 71 211 100 213 96 185
Circle -1 true false 88 148 24
Circle -1 true false 45 140 38
Circle -1 true false 81 140 37
Polygon -2064490 true false 71 174 94 176 93 189 70 186 71 175
Rectangle -1 true false 97 178 114 198
Circle -6459832 true false 54 151 6
Circle -6459832 true false 60 153 7
Circle -6459832 true false 52 161 6
Circle -6459832 true false 59 161 6
Circle -6459832 true false 67 157 6
Circle -6459832 true false 90 152 10
Circle -6459832 true false 96 141 10
Circle -6459832 true false 102 157 9
Circle -6459832 true false 90 167 8

kneesideprofilecement
false
0
Polygon -955883 true false 265 124 36 130 78 282 134 277 115 181 273 183
Polygon -1 true false 140 169 136 144 102 146 112 168
Polygon -1 true false 69 185 71 211 100 213 96 185
Circle -1 true false 88 148 24
Circle -1 true false 47 142 34
Circle -1 true false 81 140 37
Polygon -2064490 true false 71 174 94 176 93 189 70 186 71 175
Rectangle -1 true false 97 178 114 198
Circle -6459832 true false 54 151 6
Circle -6459832 true false 60 153 7
Circle -6459832 true false 52 161 6
Circle -6459832 true false 59 161 6
Circle -6459832 true false 67 157 6
Circle -6459832 true false 90 152 10
Circle -6459832 true false 96 141 10
Circle -6459832 true false 102 157 9
Circle -6459832 true false 90 167 8
Circle -14835848 true false 44 142 40
Circle -14835848 true false 79 138 42

kneesideprofilejig
false
0
Polygon -955883 true false 265 124 36 130 78 282 134 277 115 181 273 183
Polygon -1 true false 140 169 136 144 102 146 112 168
Polygon -1 true false 69 185 71 211 100 213 96 185
Circle -1 true false 88 148 24
Circle -1 true false 47 142 34
Circle -1 true false 81 140 37
Polygon -2064490 true false 71 174 94 176 93 189 70 186 71 175
Rectangle -1 true false 97 178 114 198
Circle -6459832 true false 54 151 6
Circle -6459832 true false 60 153 7
Circle -6459832 true false 52 161 6
Circle -6459832 true false 59 161 6
Circle -6459832 true false 67 157 6
Circle -6459832 true false 90 152 10
Circle -6459832 true false 96 141 10
Circle -6459832 true false 102 157 9
Circle -6459832 true false 90 167 8
Polygon -7500403 true true 46 146 48 176 120 175 118 136 46 135 46 157
Line -7500403 true 60 111 60 136
Line -7500403 true 98 113 98 138
Polygon -16777216 true false 57 158 64 148 76 145 97 146 106 155 107 167 91 167 75 170 60 162

kneesideprofilemallet
false
0
Polygon -955883 true false 265 124 36 130 78 282 134 277 115 181 273 183
Polygon -1 true false 140 169 136 144 102 146 112 168
Polygon -1 true false 69 185 71 211 100 213 96 185
Circle -1 true false 88 148 24
Circle -1 true false 47 142 34
Circle -1 true false 81 140 37
Polygon -2064490 true false 71 174 94 176 93 189 70 186 71 175
Circle -6459832 true false 54 151 6
Circle -6459832 true false 60 153 7
Circle -6459832 true false 52 161 6
Circle -6459832 true false 59 161 6
Circle -6459832 true false 67 157 6
Circle -6459832 true false 90 152 10
Circle -6459832 true false 96 141 10
Circle -6459832 true false 102 157 9
Circle -6459832 true false 90 167 8
Polygon -7500403 true true 46 146 48 176 120 175 118 136 46 135 46 157
Polygon -16777216 true false 57 158 64 148 76 145 97 146 106 155 107 167 91 167 75 170 60 162
Circle -1 true false 90 177 27

kneesideprofilerog.
false
0
Polygon -955883 true false 265 123 36 129 78 281 134 276 115 180 273 182
Polygon -1 true false 140 169 136 144 102 146 112 168
Polygon -1 true false 69 185 72 214 98 213 96 185
Circle -1 true false 88 148 24
Circle -1 true false 45 140 38
Circle -1 true false 81 140 37
Polygon -2064490 true false 72 177 94 182 93 189 70 186 71 175
Circle -1 true false 99 179 14

kneetongs
false
0
Polygon -955883 true false 88 0 103 150 88 285 208 300 193 150 208 0
Rectangle -1 true false 135 45 165 120
Circle -2674135 true false 129 114 42
Rectangle -1 true false 135 150 165 210
Rectangle -2064490 true false 135 135 165 150
Polygon -1184463 true false 135 105 120 135 135 165
Polygon -1184463 true false 165 105 180 135 165 165
Circle -1 true false 118 103 34
Polygon -1184463 true false 159 117 172 117 160 164 140 165
Circle -1 true false 148 103 34
Rectangle -1 false false 165 135 195 165
Rectangle -1 true false 165 135 195 165

lin
false
0
Polygon -7500403 true true 45 75 45 225 105 225 105 210 60 210 60 75
Rectangle -7500403 true true 135 135 165 225
Circle -7500403 true true 135 90 30
Polygon -7500403 true true 210 150 195 150 195 225 210 225 210 180 240 180 240 225 255 225 255 165 210 165

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

liu
false
0
Polygon -7500403 true true 45 90 45 210 105 210 105 195 60 195 60 90
Rectangle -7500403 true true 135 135 165 210
Circle -7500403 true true 135 90 30
Polygon -7500403 true true 195 150 195 210 240 210 240 225 255 225 255 150 240 150 240 195 210 195 210 150

mallet
false
0
Rectangle -7500403 true true 135 150 180 270
Rectangle -7500403 true true 150 105 165 150
Rectangle -7500403 true true 120 75 195 105
Rectangle -7500403 true true 195 45 255 135

marker
false
0
Circle -1184463 true false 135 90 30
Line -1184463 false 135 105 135 195
Line -1184463 false 165 105 165 195
Line -1184463 false 135 195 165 195
Line -1184463 false 135 195 150 225
Line -1184463 false 165 195 150 225
Rectangle -955883 true false 150 195 150 210

marker1
false
0
Rectangle -16777216 true false 76 38 226 45
Rectangle -16777216 true false 148 38 154 255
Rectangle -16777216 true false 76 144 227 150
Rectangle -16777216 true false 75 250 228 255

me
false
0
Polygon -2674135 true false 15 75 15 210 30 210 30 135 60 210 90 135 90 210 105 210 105 105 90 105 60 180 30 105 15 105
Polygon -2674135 true false 135 105 195 105 195 120 135 120 135 150 195 150 195 165 135 165 135 195 195 195 195 210 120 210 120 105 135 105
Rectangle -2674135 true false 210 45 240 180
Circle -13840069 true false 210 195 30
Rectangle -13840069 true false 255 45 285 180
Circle -2674135 true false 255 195 30

metal tray component
false
0
Rectangle -7500403 true true 90 135 210 150
Rectangle -7500403 true true 145 139 160 184

patella component
false
0
Circle -7500403 true true 90 90 120

patellar jig
true
0
Circle -7500403 true true 116 116 67
Polygon -7500403 true true 120 165 75 255 105 255 135 180 165 180 180 255 210 255 180 165 150 150 240 60 210 45 150 135 135 60 135 45 105 45
Circle -16777216 true false 129 129 42

pavement
false
0
Rectangle -1184463 true false 90 150 210 165

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

person doctor
false
0
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Polygon -13345367 true false 135 90 150 105 135 135 150 150 165 135 150 105 165 90
Polygon -7500403 true true 105 90 60 195 90 210 135 105
Polygon -7500403 true true 195 90 240 195 210 210 165 105
Circle -7500403 true true 110 5 80
Rectangle -7500403 true true 127 79 172 94
Polygon -1 true false 105 90 60 195 90 210 114 156 120 195 90 270 210 270 180 195 186 155 210 210 240 195 195 90 165 90 150 150 135 90
Line -16777216 false 150 148 150 270
Line -16777216 false 196 90 151 149
Line -16777216 false 104 90 149 149
Circle -1 true false 180 0 30
Line -16777216 false 180 15 120 15
Line -16777216 false 150 195 165 195
Line -16777216 false 150 240 165 240
Line -16777216 false 150 150 165 150

plastic component
false
0
Rectangle -1 true false 94 128 199 166
Circle -1 true false 80 126 42
Circle -1 true false 175 126 42

play
false
0
Polygon -7500403 true true 0 60 0 210 15 210 15 120 60 120 60 60 45 60 45 105 15 105 15 75 45 75 45 60
Polygon -7500403 true true 75 60 75 210 90 210 90 60
Polygon -7500403 true true 105 135 105 210 165 210 165 225 180 225 180 135 165 135 165 195 120 195 120 150 165 150 165 135
Polygon -7500403 true true 210 135 195 135 225 210 180 285 210 285 255 210 285 135 270 135 240 195

pres
false
0
Polygon -7500403 true true 15 90 15 225 30 225 30 150 30 105 60 105 60 150 75 150 75 90
Rectangle -7500403 true true 15 150 75 165
Polygon -7500403 true true 90 150 90 225 105 225 105 165 135 165 135 150
Polygon -7500403 true true 150 180 150 225 195 225 195 210 165 210 165 195 195 195 195 180
Rectangle -7500403 true true 150 150 165 195
Rectangle -7500403 true true 150 150 195 165
Rectangle -7500403 true true 180 150 195 195
Polygon -7500403 true true 225 165 270 165 270 150 210 150 210 195 255 195 255 210 210 210 210 225 270 225 270 180 225 180

pumpkin
false
0
Polygon -7500403 false true 148 30 107 33 74 44 33 58 15 105 0 150 30 240 105 285 135 285 150 270 165 285 195 285 255 255 300 150 268 62 225 43 196 36
Polygon -7500403 true true 33 58 0 150 30 240 105 285 135 285 150 270 165 285 195 285 255 255 300 150 268 62 226 43 194 36 148 32 105 35
Polygon -16777216 false false 108 40 75 57 42 101 32 177 79 253 124 285 133 285 147 268 122 222 103 176 107 131 122 86 140 52 154 42 193 66 204 101 216 158 212 209 188 256 164 278 163 283 196 285 234 255 257 199 268 137 251 84 229 52 191 41 163 38 151 41
Polygon -6459832 true false 133 50 171 50 167 32 155 15 146 2 117 10 126 23 130 33
Polygon -16777216 false false 117 10 127 26 129 35 132 49 170 49 168 32 154 14 145 1

rongeur
false
0
Polygon -7500403 true true 75 120 60 210 75 210 90 120 120 120 135 165 135 225 210 225 210 150 135 165 135 120 255 90 225 90 240 75 210 90 75 90
Polygon -7500403 true true 120 120 120 165 135 165

run
false
0
Circle -955883 true false 119 14 62
Rectangle -955883 true false 140 52 160 100
Polygon -955883 true false 150 90 90 90 60 135 90 135 105 105 120 105 120 180 180 180 180 105 195 105 210 135 240 135 210 90 150 90 135 90 120 90 90 90
Polygon -955883 true false 128 177 117 220 77 205 69 220 114 238 122 240 127 241 142 179
Polygon -955883 true false 150 175 180 220 157 252 180 250 198 225 173 177 153 175

run1
false
0
Circle -955883 true false 98 41 86
Polygon -955883 true false 113 100 70 109 36 140 21 182 46 189 61 137 113 130 113 205 173 205 173 130 248 160 263 130 218 115 194 109
Polygon -955883 true false 122 192 72 262 93 272 132 214 137 197
Polygon -955883 true false 142 195 158 273 186 265 171 198

run2
false
0
Circle -955883 true false 105 60 78
Polygon -955883 true false 115 177 60 252 79 264 125 199 130 182
Polygon -955883 true false 140 186 160 272 185 271 169 189
Polygon -955883 true false 111 118 27 137 32 161 110 142 102 196 172 195 175 146 219 171 264 144 253 126 229 144 185 123

scalpel
false
0
Circle -7500403 true true 135 75 30
Line -7500403 true 135 105 135 195
Line -7500403 true 135 90 135 105
Line -7500403 true 165 90 165 195
Line -7500403 true 135 195 165 195
Line -7500403 true 150 195 150 255
Line -7500403 true 150 255 165 225
Line -7500403 true 150 225 165 225

scalpel1
false
0
Rectangle -2674135 true false 76 38 226 45
Rectangle -2674135 true false 148 38 154 255
Rectangle -2674135 true false 76 144 227 150
Rectangle -2674135 true false 75 250 228 255

sheet
false
0
Rectangle -11221820 true false 90 90 210 240

sponge
false
0
Circle -7500403 true true 101 101 67
Circle -7500403 true true 30 75 90
Circle -7500403 true true 84 144 42
Circle -7500403 true true 86 41 67
Circle -7500403 true true 129 69 42

stapler
false
0
Polygon -7500403 true true 30 75 30 165 75 165 75 75
Polygon -7500403 true true 75 75 240 90 270 120 255 165 75 150
Polygon -7500403 true true 255 150 120 240 90 210 195 150
Polygon -16777216 true false 255 150 285 180 285 165 270 135

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

stomach
false
0
Circle -2064490 true false 150 75 90
Circle -2064490 true false 105 135 90
Circle -2064490 true false 144 144 42
Circle -2064490 true false 159 114 42
Rectangle -2064490 true false 150 120 180 135
Circle -2064490 true false 144 129 42
Circle -2064490 true false 165 150 30
Rectangle -2064490 false false 165 45 180 90
Circle -2064490 true false 90 180 30
Circle -2064490 true false 84 174 42
Circle -2064490 true false 75 195 30
Rectangle -2064490 false false 45 75 45 120
Rectangle -2064490 false false 75 210 90 270
Circle -2064490 true false 159 144 42
Circle -2064490 true false 180 150 30
Rectangle -2064490 true false 165 45 180 90
Rectangle -2064490 true false 75 225 90 270
Rectangle -2064490 true false 75 210 75 240
Rectangle -2064490 true false 75 210 90 240

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

than
false
0
Polygon -7500403 true true 0 90 75 90 75 105 45 105 45 210 30 210 30 105 15 105 0 105
Polygon -7500403 true true 90 90 90 210 105 210 105 165 120 165 120 210 135 210 135 150 105 150 105 90
Polygon -7500403 true true 150 150 150 210 195 210 195 225 210 225 210 150 195 150 195 195 165 195 165 165 195 165 195 150
Polygon -7500403 true true 225 135 225 210 240 210 240 165 270 165 270 210 285 210 285 150 240 150 240 135

tongs1
false
0
Rectangle -7500403 true true 105 120 135 135
Rectangle -7500403 true true 105 135 120 195
Rectangle -7500403 true true 105 180 135 195
Rectangle -7500403 true true 120 150 135 165
Rectangle -7500403 true true 60 150 105 165
Rectangle -7500403 true true 165 120 180 195
Rectangle -7500403 true true 150 120 165 135
Rectangle -7500403 true true 150 150 165 165
Rectangle -7500403 true true 165 180 150 195
Rectangle -7500403 true true 150 180 165 195
Rectangle -7500403 true true 180 150 225 165

tongs2
false
0
Rectangle -7500403 true true 90 120 120 135
Rectangle -7500403 true true 90 135 105 195
Rectangle -7500403 true true 90 180 120 195
Rectangle -7500403 true true 105 150 120 165
Rectangle -7500403 true true 45 150 90 165
Rectangle -7500403 true true 180 120 195 195
Rectangle -7500403 true true 165 120 180 135
Rectangle -7500403 true true 165 150 180 165
Rectangle -7500403 true true 165 180 150 195
Rectangle -7500403 true true 165 180 180 195
Rectangle -7500403 true true 195 150 240 165

tongs3
false
0
Rectangle -7500403 true true 75 120 105 135
Rectangle -7500403 true true 75 135 90 195
Rectangle -7500403 true true 75 180 105 195
Rectangle -7500403 true true 90 150 105 165
Rectangle -7500403 true true 30 150 75 165
Rectangle -7500403 true true 195 120 210 195
Rectangle -7500403 true true 180 120 195 135
Rectangle -7500403 true true 180 150 195 165
Rectangle -7500403 true true 165 180 150 195
Rectangle -7500403 true true 180 180 195 195
Rectangle -7500403 true true 210 150 255 165

tongs4
false
0
Rectangle -7500403 true true 60 120 90 135
Rectangle -7500403 true true 60 135 75 195
Rectangle -7500403 true true 60 180 90 195
Rectangle -7500403 true true 75 150 90 165
Rectangle -7500403 true true 15 150 60 165
Rectangle -7500403 true true 210 120 225 195
Rectangle -7500403 true true 195 120 210 135
Rectangle -7500403 true true 195 150 210 165
Rectangle -7500403 true true 165 180 150 195
Rectangle -7500403 true true 195 180 210 195
Rectangle -7500403 true true 225 150 270 165

tongs5
false
0
Rectangle -7500403 true true 45 120 75 135
Rectangle -7500403 true true 45 135 60 195
Rectangle -7500403 true true 45 180 75 195
Rectangle -7500403 true true 60 150 75 165
Rectangle -7500403 true true 0 150 45 165
Rectangle -7500403 true true 225 120 240 195
Rectangle -7500403 true true 210 120 225 135
Rectangle -7500403 true true 210 150 225 165
Rectangle -7500403 true true 165 180 150 195
Rectangle -7500403 true true 210 180 225 195
Rectangle -7500403 true true 240 150 285 165

tree pine
false
0
Rectangle -6459832 true false 120 225 180 300
Polygon -7500403 true true 150 240 240 270 150 135 60 270
Polygon -7500403 true true 150 75 75 210 150 195 225 210
Polygon -7500403 true true 150 7 90 157 150 142 210 157 150 7

underskin1
false
0
Rectangle -2064490 true false 105 75 105 255
Rectangle -2064490 true false 120 75 180 225
Circle -1 true false 116 101 67
Circle -2064490 true false 120 195 30
Circle -2064490 true false 116 176 67
Circle -2064490 true false 144 174 42
Circle -2064490 true false 105 195 30
Circle -2064490 true false 99 54 42
Circle -2064490 true false 105 90 30
Circle -2064490 true false 105 105 30
Circle -2064490 true false 105 120 30
Circle -2064490 true false 99 159 42
Circle -2064490 true false 99 129 42
Circle -2064490 true false 120 45 60
Circle -2064490 true false 144 144 42
Circle -2064490 true false 144 84 42
Circle -2064490 true false 144 114 42

underskin2
false
0
Rectangle -2064490 true false 105 75 105 255
Rectangle -2064490 true false 120 75 180 225
Circle -1 true false 116 101 67
Circle -2064490 true false 120 195 30
Circle -2064490 true false 114 191 67
Circle -2064490 true false 144 174 42
Circle -2064490 true false 102 192 36
Circle -2064490 true false 95 55 42
Circle -2064490 true false 100 89 30
Circle -2064490 true false 99 105 30
Circle -2064490 true false 100 120 30
Circle -2064490 true false 92 159 42
Circle -2064490 true false 93 129 42
Circle -2064490 true false 120 45 60
Circle -2064490 true false 144 144 42
Circle -2064490 true false 144 84 42
Circle -2064490 true false 144 114 42

underskin3
false
0
Rectangle -2064490 true false 105 75 105 255
Rectangle -2064490 true false 120 75 180 225
Circle -1 true false 116 101 67
Circle -2064490 true false 120 195 30
Circle -2064490 true false 114 191 67
Circle -2064490 true false 144 174 42
Circle -2064490 true false 102 192 36
Circle -2064490 true false 94 56 56
Circle -2064490 true false 100 89 30
Circle -2064490 true false 99 105 30
Circle -2064490 true false 100 120 30
Circle -2064490 true false 92 159 42
Circle -2064490 true false 93 129 42
Circle -2064490 true false 142 50 50
Circle -2064490 true false 154 142 46
Circle -2064490 true false 154 84 42
Circle -2064490 true false 150 114 42

underskin4
false
0
Rectangle -2064490 true false 105 75 105 255
Rectangle -2064490 true false 120 75 180 225
Circle -1 true false 116 101 67
Circle -2064490 true false 120 195 30
Circle -2064490 true false 114 191 67
Circle -2064490 true false 144 174 42
Circle -2064490 true false 102 192 36
Circle -2064490 true false 94 56 56
Circle -2064490 true false 100 89 30
Circle -2064490 true false 99 105 30
Circle -2064490 true false 100 120 30
Circle -2064490 true false 92 159 42
Circle -2064490 true false 93 129 42
Circle -2064490 true false 138 47 68
Circle -2064490 true false 155 137 52
Circle -2064490 true false 163 84 42
Circle -2064490 true false 158 110 48

underskin5
false
0
Rectangle -2064490 true false 105 75 105 255
Rectangle -2064490 true false 105 75 195 255
Circle -2064490 true false 88 73 95
Circle -2064490 true false 84 69 42
Circle -2064490 true false 84 144 42
Circle -2064490 true false 86 176 67
Circle -2064490 true false 99 54 42
Circle -2064490 true false 135 60 30
Circle -2064490 true false 150 60 30
Circle -2064490 true false 159 69 42
Circle -2064490 true false 180 90 30
Circle -2064490 true false 174 69 42
Circle -2064490 true false 174 99 42
Circle -2064490 true false 165 135 60
Circle -2064490 true false 174 174 42
Circle -2064490 true false 180 210 30
Circle -2064490 true false 90 225 30
Circle -2064490 true false 99 219 42
Circle -2064490 true false 129 219 42
Circle -2064490 true false 159 219 42
Circle -2064490 true false 114 39 42
Circle -2064490 true false 144 39 42
Circle -2064490 true false 174 39 42
Circle -2064490 true false 120 15 60
Circle -2064490 true false 165 30 30
Circle -2064490 true false 129 9 42
Circle -2064490 true false 105 15 30
Rectangle -2064490 true false 90 75 120 240
Circle -2064490 true false 90 30 60
Rectangle -2064490 true false 120 225 150 255
Circle -2064490 true false 120 240 30
Circle -1 true false 116 101 67
Line -2674135 false 150 240 150 30

us
false
0
Polygon -7500403 true true 0 75 0 255 135 255 135 75 105 75 105 225 30 225 30 75
Polygon -7500403 true true 180 105 285 105 285 75 150 75 150 180 255 180 255 225 150 225 150 255 285 255 285 150 180 150 180 105

wen
false
0
Polygon -7500403 true true 15 135 30 240 60 240 75 150 90 240 120 240 135 135 105 225 75 135 45 225
Polygon -7500403 true true 150 135 150 240 210 240 210 225 165 225 165 195 210 195 210 180 165 180 165 150 210 150 210 135
Polygon -7500403 true true 225 135 225 240 240 240 240 180 270 240 285 240 285 135 270 135 270 210 240 135

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

y
false
0
Polygon -2064490 true false 135 150 135 210 165 210 165 150 195 105 105 105 135 150

yao
false
0
Rectangle -7500403 true true 30 135 60 225
Polygon -7500403 true true 0 90 30 90 45 150 30 150
Polygon -7500403 true true 60 90 90 90 60 150 45 150
Rectangle -7500403 true true 195 225 270 225
Rectangle -7500403 true true 90 210 150 225
Rectangle -7500403 true true 90 150 105 210
Rectangle -7500403 true true 105 150 150 165
Rectangle -7500403 true true 150 150 165 240
Rectangle -7500403 true true 195 210 270 225
Rectangle -7500403 true true 195 150 210 225
Rectangle -7500403 true true 255 150 270 225
Rectangle -7500403 true true 195 150 270 165

yay
false
0
Circle -955883 true false 119 14 62
Rectangle -955883 true false 140 52 160 100
Polygon -955883 true false 129 158 129 248 144 248 144 158 129 158 129 173 129 158 144 158
Polygon -955883 true false 158 163 158 249 174 249 173 163 158 163
Rectangle -955883 true false 120 90 180 165
Polygon -955883 true false 60 60 90 60 120 90 135 120 105 105 75 75 60 60
Polygon -955883 true false 240 60 210 60 180 90 165 120 195 105 225 75 240 60
Circle -16777216 true false 134 30 10
Circle -16777216 true false 156 30 10
Circle -16777216 true false 145 46 10
Polygon -16777216 true false 135 58 134 56 149 64 165 60 170 57 171 60 167 64 152 75 130 62 129 60 131 54

you
false
0
Polygon -7500403 true true 15 90 38 137 45 150 45 225 60 225 60 150 65 138 90 90 75 90 53 136 30 90
Polygon -7500403 true true 180 150 180 225 195 225 225 225 225 240 240 240 240 150 225 150 225 210 195 210 195 150
Polygon -7500403 true true 90 165 90 225 150 225 150 165 135 165 135 210 105 210 105 180 135 180 135 165

z!!!
false
0
Polygon -7500403 true true 30 120 90 120 30 210 120 210 120 195 75 195 120 120 120 105 30 105
Rectangle -7500403 true true 150 60 180 165
Circle -7500403 true true 150 180 30
Rectangle -7500403 true true 195 60 225 165
Circle -7500403 true true 195 180 30
Rectangle -7500403 true true 240 60 270 165
Circle -7500403 true true 240 180 30

@#$#@#$#@
NetLogo 4.1.3
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="experiment" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <metric>count turtles</metric>
  </experiment>
</experiments>
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
