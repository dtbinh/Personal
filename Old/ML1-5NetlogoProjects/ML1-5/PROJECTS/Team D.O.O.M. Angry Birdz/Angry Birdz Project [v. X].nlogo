;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*
breed [clouds cloud]          ;
breed [suns sun]              ;
breed [stars star]            ;
breed [moons moon]            ;
breed [launchers launcher]    ;
breed [birds bird]            ;
breed [birdshots birdshot]    ;
breed [targets target]        ;
breed [eggs egg]              ;
breed [raindrops raindrop]    ;
breed [cheats cheat]          ;
breed [explosives explosive]  ;
breed [points point]          ;
breed [firework]              ;  
breed [explosion]             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*
globals [x-vel y-vel velocity score] ;
                                     ;
birdshots-own [birdpower]            ;
                                     ;
raindrops-own [location]             ;
                                     ;
turtles-own[angles speed time]       ;   
                                     ;
extensions [sound]                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*

;==================================================================================================================================================================================================================================================================;
;==================================================================================================================================================================================================================================================================;
;==================================================================================================================================================================================================================================================================;


to startup
  user-message (word "Hello, Welcome to Angry Birds")
   let input user-input "What is your name???"
   user-message (word "Hi " input)
   ifelse user-yes-or-no? "Is this your first time playing?" 
   [user-message 
     "The KINGPIG has taken your eggs. It is your job, as an angry bird, to take them back. Aim for the pig by pressing start, then adjusting the angle and power of your bird. If you want, you may change your bird via the BirdChooser! Once you kill the pig, you win!" 
     setup1]
   [ifelse user-yes-or-no? "Do you want to me to set the world up?" [setup1] [user-message "Well, I will do it anyways! :P" setup1]]  
end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                             ;
;         * LEVEL 1 *         ;
;                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to setup1
  ca
  set angle 0
  set power 0
  set-patch-size 8
  resize-world -65 65 -30 30
  set-default-shape launchers "launcher2"
  set-default-shape birds BirdChooser
 set-default-shape clouds "cloud"
  set-default-shape birdshots BirdChooser
  ask patches [ set pcolor 97 ]
  ask patches with [ pycor < -25 ]
    [ set pcolor 63 ]
  create-launchers 1
  [set heading angle
    setxy -58 -19
    set color green - 2
    set size 15
    hatch-birds 1 
    [set size 5 
      set color black
      ask myself [ create-link-to myself  [ tie hide-link ]]
      hatch 1 
      [set breed turtles
        set shape "arrow"
        fd 5
        set color red
        set size 3
        ask myself [ create-link-to myself  [ tie hide-link ]]]]]
  create-clouds 5
  [set shape "cloud"
    setxy random-xcor 25
    set color white
    set size 5
    set heading 90]
  create-suns 1
  [set shape "sun"
    set color yellow
    set size 10
    setxy 58 22]
  create-targets 4
  [set shape "kingpig"
    ask target 9 [setxy 49 -23]
    ask target 10 [setxy 35 -23]
    ask target 11 [setxy 42 -17]
    ask target 12 [setxy 41.75 -5.5]
    set size 5]
  setup-territory
 ; crt 1 [set shape "invisible" setxy 54 29  set label word "Score:  " score]
  sound:play-sound "startup.wav"
  display
end

to setup-territory
  ask patches [if pxcor = 32 and pycor > -26 and pycor < -19 [set pcolor brown ]]
  ask patches [if pxcor = 38 and pycor > -26 and pycor < -13 [set pcolor brown ]]
  ask patches [if pxcor = 46 and pycor > -26 and pycor < -13 [set pcolor brown ]]
  ask patches [if pxcor = 52 and pycor > -26 and pycor < -19 [set pcolor brown ]]
  ask patches [if pxcor < 45 and pxcor > 39 and pycor < -7 and pycor > -14 [set pcolor brown]]
  ask patches [if pycor = -20 and pxcor > 32 and pxcor < 52 [set pcolor brown - 1]]
  ask patches [if pycor = -2 and pxcor > 37 and pxcor < 47 [set pcolor brown - 1 ]]
  ask patches [if pycor = -14 and pxcor > 38 and pxcor < 46 [set pcolor brown - 1]]
  ask patches [if pxcor > 31 and pxcor < 34 and pycor < -17 and pycor > -20 [set pcolor blue]]
  ask patches [if pxcor > 35 and pxcor < 38 and pycor < -17 and pycor > -20 [set pcolor blue]]
  ask patches [if pxcor > 31 and pxcor < 34 and pycor < -13 and pycor > -16 [set pcolor blue]]
  ask patches [if pxcor > 35 and pxcor < 38 and pycor < -13 and pycor > -16 [set pcolor blue]]
  ask patches [if pxcor > 33 and pxcor < 36 and pycor < -15 and pycor > -18 [set pcolor blue]]
  ask patches [if pxcor > 46 and pxcor < 49 and pycor < -17 and pycor > -20 [set pcolor blue]]
  ask patches [if pxcor > 50 and pxcor < 53 and pycor < -17 and pycor > -20 [set pcolor blue]]
  ask patches [if pxcor > 48 and pxcor < 51 and pycor < -15 and pycor > -18 [set pcolor blue]]
  ask patches [if pxcor > 46 and pxcor < 49 and pycor < -13 and pycor > -16 [set pcolor blue]]
  ask patches [if pxcor > 50 and pxcor < 53 and pycor < -13 and pycor > -16 [set pcolor blue]]
  ask patches [if pxcor = 38 and pycor < -2 and pycor > -14 [set pcolor 3]]
  ask patches [if pxcor = 46 and pycor < -2 and pycor > -14 [set pcolor 3]] 
end
  
to go
  ;if not any? targets [ stop ]
  ask launchers [ set heading angle ]
  every .05
  [ask birdshots
    [setxy (xcor + x-vel) (ycor + y-vel)
      set y-vel (y-vel - .01)
      if (velocity > 1)
      [set x-vel x-vel / velocity
        set y-vel y-vel / velocity
        set velocity 1]
    check-birdshots]
    ask clouds [setxy (xcor + wind / 100) (ycor)]]
   if (count targets = 0) [wait .3 end-message]
   if any? birds [ask birds [set shape BirdChooser]]
   if any? birdshots [ask birdshots [set shape BirdChooser]]
   if Birdchooser = "Mighty-Eagle" and score < 100000000000000 
   [user-message (word "You can only use this in Level 2, PLEASE press Halt and change the BirdChooser immediatly" ) ]
   display   
end

to fire
  sound:stop-music 
  if not any? birdshots
  [ask launchers
    [hatch-birdshots 1 
      [set size 5 set color black
        sound:play-sound "launch.wav"
        set x-vel ( sin angle * ( Power / 100))
        set y-vel ( cos angle * ( Power / 100))
        set velocity Power / 100]]]
end

to check-birdshots
 
   if ( pycor = 30 and hidden? = false )
      [ hide-turtle ]
if ( pycor = 29 and hidden? = true )
      [ show-turtle ]
 if ( hidden? = false )
  [if ( xcor > 64 or ycor < -25 or pcolor = green or pcolor = 3)
    [ask birdshots [die]]
  ask birdshots [if [pcolor] of patch-here = brown [set velocity velocity + .2]]
  ask birdshots [if [pcolor] of patch-here = brown [set velocity velocity + .1]]
    ifelse pxcor < 30 [set pcolor scale-color sky velocity 2 0] [set pcolor 97]]
    if ( any? targets in-radius 2 )
      [ask targets in-radius 2 [sound:play-sound "pig death.wav" die] 
        wait .1 set score score + 500 die]
  if ycor < 25  and count birdshots < 4 and shape = "triplethreatbird" 
  [if mouse-down? [set size 3 hatch-birdshots 1 
      [set heading 0 fd 5 set size 3]]]
  if shape = "bombbird" 
  [if mouse-down? [reset-timer set color red]]
  if color = red and shape = "bombbird" 
  [if timer > 3 
    [ ask neighbors [set pcolor red 
        ask neighbors4 [set pcolor red]]  
    die
    ]]
  if shape = "turbobird" 
  [if mouse-down? [ifelse angle > 75 [set heading 90 fd 7] 
      [set heading 90 fd 10 
        ifelse xcor > 13 [set heading 180 fd 3]
        [set heading 0 fd 3] 
        if xcor > 55 [die]]]]
        display
end
  
to help
  ca
  setup1
  sound:stop-sound
  create-cheats 3
  [set shape "target" set color red set size 1.7 set power 781]
  ask cheat 13 [setxy -51 -16]
  ask cheat 14 [setxy -53 -12]
  ask cheat 15 [setxy -51 -15]
end
  

to end-message
set-patch-size 1
resize-world 0 399 0 436
import-drawing "eggs.jpg"
ifelse user-yes-or-no? "Well done, you got your eggs back! However, I am sorry to say that the PrincePig took them away again! Do you want to recover your eggs again?" [setup2] [user-message "Boohoo, now you have no children, lazy NOOB, goodbye though! :'("]
end

;==================================================================================================================================================================================================================================================================;
;==================================================================================================================================================================================================================================================================;
;==================================================================================================================================================================================================================================================================;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                             ;
;         * LEVEL 2 *         ;
;                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to setup2
  ca
  set-patch-size 8
  resize-world -65 65 -30 30
  set-default-shape launchers "launcher2"
  set-default-shape birds BirdChooser
 set-default-shape stars "star"
  set-default-shape birdshots BirdChooser
  set-default-shape explosives "TNT"
   ask patches [ set pcolor black ]
  ask patches with [ pycor < -25 ]
    [ set pcolor white ]
  create-launchers 1
  [set heading angle
    setxy -58 -19
    set color green - 2
    set size 15
    hatch-birds 1 
    [set size 5 
      set color black
      ask myself [ create-link-to myself  [ tie hide-link ]]
      hatch 1 
      [set breed turtles
        set shape "arrow"
        fd 5
        set color red
        set size 3
        ask myself [ create-link-to myself  [ tie hide-link ]]]]]
  create-stars 20
  [set shape "star"
    setxy random-xcor 25
    set color 45
    set size 2
    set heading 90]
  create-clouds 5
  [set shape "cloud"
    setxy random-xcor 25
    set color white
    set size 4
    set heading 90]
  create-moons 1
  [set shape "moon"
    set color white
    set size 10
    setxy 58 22]
  create-targets 5
  [set shape "kingpig"]
  ask target 29 [setxy 22 -23.5 set size 5]
  ask target 30 [setxy 29 -23.5 set size 5]
  ask target 31 [setxy 16 -23.5 set size 5] 
  ask target 32 [setxy 35 -23.5 set size 5]
  ask target 33 [setxy 26 5.5 set size 5]
  setup2-territory
  
end

to setup2-territory
  ask patches [if pxcor > 18 and pxcor < 21 and pycor < 2 and pycor > -21 [set pcolor white]]
  ask patches [if pxcor > 18 and pxcor < 21 and pycor < -20 and pycor > -26 [set pcolor blue]]
  ask patch 21 -9 [set pcolor blue]
  ask patch 21 -8 [set pcolor blue]
  ask patch 22 -8 [set pcolor blue]
  ask patch 22 -7 [set pcolor blue]
  ask patch 23 -7 [set pcolor blue]
  ask patch 23 -6 [set pcolor blue]
  ask patch 24 -6 [set pcolor blue]
  ask patch 24 -5 [set pcolor blue]
  ask patch 25 -5 [set pcolor blue]
  ask patch 25 -4 [set pcolor blue]
  ask patch 26 -4 [set pcolor blue]
  ask patch 26 -3 [set pcolor blue]
  ask patch 27 -3 [set pcolor blue]
  ask patch 27 -2 [set pcolor blue]
  ask patch 28 -2 [set pcolor blue]
  ask patch 28 -1 [set pcolor blue]
  ask patch 29 -1 [set pcolor blue]
  ask patch 29 0 [set pcolor blue]
  ask patch 30 0 [set pcolor blue]
  ask patch 30 1 [set pcolor blue]
  ask patch 21 1 [set pcolor blue]
  ask patch 21 0 [set pcolor blue]
  ask patch 22 0 [set pcolor blue]
  ask patch 22 -1 [set pcolor blue]
  ask patch 23 -1 [set pcolor blue]
  ask patch 23 -2 [set pcolor blue]
  ask patch 24 -2 [set pcolor blue]
  ask patch 24 -3 [set pcolor blue]
  ask patch 25 -3 [set pcolor blue]
  ask patch 25 -4 [set pcolor blue]
  ask patch 27 -4 [set pcolor blue]
  ask patch 27 -5 [set pcolor blue]
  ask patch 28 -5 [set pcolor blue]
  ask patch 28 -6 [set pcolor blue]
  ask patch 29 -6 [set pcolor blue]
  ask patch 29 -7 [set pcolor blue]
  ask patch 30 -7 [set pcolor blue]
  ask patch 30 -8 [set pcolor blue]
  ask patch 31 -8 [set pcolor blue]
  ask patch 31 -9 [set pcolor blue]
  ask patch 31 1 [set pcolor blue]
  ask patches [if pxcor > 31 and pxcor < 34 and pycor < 2 and pycor > -21 [set pcolor white]]
  ask patches [if pxcor > 31 and pxcor < 34 and pycor < -20 and pycor > -26 [set pcolor blue]]
  ask patches [if pycor = 2 or pycor = 3 and pxcor > 18 and pxcor < 34 [set pcolor brown]]
  ask patch 18 -12 [set pcolor white]
  ask patch 18 -13 [set pcolor white]
  ask patch 17 -13 [set pcolor white]
  ask patch 17 -14 [set pcolor white]
  ask patch 16 -14 [set pcolor white]
  ask patch 16 -15 [set pcolor blue]
  ask patch 15 -15 [set pcolor blue]
  ask patch 15 -16 [set pcolor blue]
  ask patch 14 -16 [set pcolor blue]
  ask patch 14 -17 [set pcolor blue]
  ask patch 13 -17 [set pcolor blue]
  ask patch 13 -18 [set pcolor blue]
  ask patch 12 -18 [set pcolor blue]
  ask patch 12 -19 [set pcolor blue]
  ask patch 11 -19 [set pcolor blue]
  ask patch 11 -20 [set pcolor blue]
  ask patch 10 -20 [set pcolor blue]
  ask patch 10 -21 [set pcolor blue]
  ask patch 9 -21 [set pcolor blue]
  ask patch 9 -22 [set pcolor blue]
  ask patch 8 -22 [set pcolor blue]
  ask patch 8 -23 [set pcolor white]
  ask patch 7 -23 [set pcolor white]
  ask patch 7 -24 [set pcolor white]
  ask patch 6 -24 [set pcolor white]
  ask patch 6 -25 [set pcolor white]
  ask patch 5 -25 [set pcolor white]
  ask patch 34 -12 [set pcolor white]
  ask patch 34 -13 [set pcolor white]
  ask patch 35 -13 [set pcolor white]
  ask patch 35 -14 [set pcolor white]
  ask patch 36 -14 [set pcolor white]
  ask patch 36 -15 [set pcolor blue]
  ask patch 37 -15 [set pcolor blue]
  ask patch 37 -16 [set pcolor blue]
  ask patch 38 -16 [set pcolor blue]
  ask patch 38 -17 [set pcolor blue]
  ask patch 39 -17 [set pcolor blue]
  ask patch 39 -18 [set pcolor blue]
  ask patch 40 -18 [set pcolor blue]
  ask patch 40 -19 [set pcolor blue]
  ask patch 41 -19 [set pcolor blue]
  ask patch 41 -20 [set pcolor blue]
  ask patch 42 -20 [set pcolor blue]
  ask patch 42 -21 [set pcolor blue]
  ask patch 43 -21 [set pcolor blue]
  ask patch 43 -22 [set pcolor blue]
  ask patch 44 -22 [set pcolor blue]
  ask patch 44 -23 [set pcolor white]
  ask patch 45 -23 [set pcolor white]
  ask patch 45 -24 [set pcolor white]
  ask patch 46 -24 [set pcolor white]
  ask patch 46 -25 [set pcolor white]
  ask patch 47 -25 [set pcolor white]
end

to start2
  ;if not any? targets [ stop ]
  ask launchers [ set heading angle ]
  every .05
  [ask birdshots
    [setxy (xcor + x-vel) (ycor + y-vel)
      set y-vel (y-vel - .01)
      if (velocity > 1)
      [set x-vel x-vel / velocity
        set y-vel y-vel / velocity
        set velocity 1]
     check-birdshots2]
    ask clouds [setxy (xcor + wind / 100) (ycor)]]
  every .05[
  create-raindrops 1
  [setxy random-xcor max-pycor
    set shape "ball"
    set heading 180
    fd 0.5 - random-float 1.0
    set size .5
    set color white
    set location "falling"]
  ask raindrops [ fd random-float 2 ]]
  if count raindrops > 150 [ask one-of raindrops [die]]
  if (count targets = 0) [wait .3 end-message2 stop]
     if any? birds [ask birds [set shape BirdChooser]]
   if any? birdshots [ask birdshots [set shape BirdChooser]]
   if Birdchooser = "Mighty-Eagle" and score < 500 
   [user-message (word "You can only use this once you acquire at least 500 points, PLEASE press Halt and change the BirdChooser immediatly" ) ]
  display
end



to check-birdshots2
  if ( pycor = -30 and hidden? = false )
      [ hide-turtle ]
if ( pycor = 30 and hidden? = true )
      [ show-turtle ]
 if ( hidden? = false )
  [if ( xcor > 64 or ycor < -26 or pcolor = white)
    [ask birdshots [die]]]
  ask birdshots [if [pcolor] of patch-here = brown [set velocity velocity + .2]]
  ask birdshots [if [pcolor] of patch-here = brown [set velocity velocity + .1]]
   if ( any? targets in-radius 2 )
      [ask targets in-radius 2 [sound:play-sound "pig death.wav" die] 
        wait .1 set score score + 500 
        die]
    ifelse pxcor < 4 [set pcolor scale-color white velocity 2 0] [set pcolor black]
  if xcor > 5  and count birdshots < 4 and shape = "triplethreatbird" 
  [if mouse-down? [hatch-birdshots 1 
      [set heading 0 fd 5]]]
  if shape = "bombbird" 
  [if mouse-down? [reset-timer set color red]]
  if color = red and shape = "bombbird" 
  [if timer > 3
    [ask neighbors [set pcolor red 
        ask neighbors4 [set pcolor red]]  
    die]]
  if shape = "turbobird" 
  [if mouse-down?  [ifelse angle > 75 [set heading 90 fd 7] 
      [set heading 90 fd 10 
        ifelse xcor > 13 [set heading 180 fd 3]
       [set heading 0 fd 3] 
        if xcor > 55 [die]]]]
end

to eagleizer
  if shape = "mighty-eagle"
  [repeat 3 [ask birdshots 
    [ carefully 
      [move-to target 29 if any? targets-here 
        [ask targets-here [die]]  display ]
        [carefully 
          [move-to target 30 if any? targets-here 
            [ask targets-here [die]]  display ]
            [carefully 
              [move-to target 31 if any? targets-here 
                [ask targets-here [die]]  display]
              [carefully 
                [move-to target 32 if any? targets-here 
                  [ask targets-here [die]]  display]
                 [carefully
                   [move-to target 33 if any? targets-here
                     [ask targets-here [die]] display]
                   [ask birdshots [die]]]]]]]]]
end

to end-message2
  if count targets = 0
  [setup-fireworks] 
end

to setup-fireworks
ca
set-patch-size 13
resize-world -16 16 -16 16
ask patches
[if pycor < -15
[set pcolor white]]
set-default-shape firework "firework"
set-default-shape explosion "star"
end

to release
  every .05[
if (random 20 < 2)
[create-firework 1
[let temp 
  (((1 + random 13) * 10) + (3 + random 6))
set color temp
setxy (random 7 - 3) -15
set heading 0
set angle 20
set time (random 7 + 18)
set speed 1]]
ask firework
[if(time < 0)
[hatch-explosion (random 10 + 15) 
[set heading random 360
set angle 45
set time 5
set speed 1]
die]]
ask explosion
[if(time < 0)
[die]]
ask turtles
[fd speed
lt random angle
rt random angle
set time (time - 1)]]
display
end

  
;==================================================================================================================================================================================================================================================================;
;==================================================================================================================================================================================================================================================================;
;==================================================================================================================================================================================================================================================================;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                    ;
;       Make your own level!         ;
;                                    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


to own-level
  ca
  set angle 0
  set power 0
  set-patch-size 8
  resize-world -65 65 -30 30
  set-default-shape launchers "launcher2"
  set-default-shape birds BirdChooser
 set-default-shape clouds "cloud"
  set-default-shape birdshots BirdChooser
  ask patches [ set pcolor 97 ]
  ask patches with [ pycor < -25 ]
    [ set pcolor 63 ]
  create-launchers 1
  [set heading angle
    setxy -58 -19
    set color green - 2
    set size 15
    hatch-birds 1 
    [set size 5 
      set color black
      ask myself [ create-link-to myself  [ tie hide-link ]]
      hatch 1 
      [set breed turtles
        set shape "arrow"
        fd 5
        set color red
        set size 3
        ask myself [ create-link-to myself  [ tie hide-link ]]]]]
  create-clouds 5
  [set shape "cloud"
    setxy random-xcor 25
    set color white
    set size 5
    set heading 90]
  create-suns 1
  [set shape "sun"
    set color yellow
    set size 10
    setxy 58 22]
  create-targets 1
  [set size 5 set shape "kingpig"
   setxy 19 -27]
end

to drag
  if mouse-down? 
  [let candidate min-one-of targets [distancexy mouse-xcor mouse-ycor]
    if [distancexy mouse-xcor mouse-ycor] of candidate < 1 
    [watch candidate
      while [mouse-down?] 
      [display
       ask subject [ setxy mouse-xcor mouse-ycor ]]
      reset-perspective]]
  ask patch 19 -27 [if count targets-here = 0 [ask patch 19 -27 [sprout-targets 1 [set size 5 set shape "kingpig" ]]]]
  display
end

to color-map
  if mouse-down? 
  [ask patch mouse-xcor mouse-ycor [ set pcolor color-chooser]]
  display
end

to start3
  ;if not any? targets [ stop ]
  ask launchers [ set heading angle ]
  every .05
  [ask birdshots
    [setxy (xcor + x-vel) (ycor + y-vel)
      set y-vel (y-vel - .01)
      if (velocity > 1)
      [set x-vel x-vel / velocity
        set y-vel y-vel / velocity
        set velocity 1]
     check-birdshots3]
    ask clouds [setxy (xcor + wind / 100) (ycor)]]
  ask birdshots [set color black]
  display
end

to check-birdshots3
  if ( pycor = -30 and hidden? = false )
      [ hide-turtle ]
if ( pycor = 30 and hidden? = true )
      [ show-turtle ]
 if ( hidden? = false )
  [if ( xcor > 64 or ycor < -26 or pcolor = white or pcolor = green or pcolor = 3)
    [ask birdshots [die]]]
  ask birdshots [if [pcolor] of patch-here = brown 
    [set velocity velocity + .2 set score score + 10]]
  ask birdshots [if [pcolor] of patch-here = brown 
    [set velocity velocity + .1 set score score + 5]]
   if ( any? targets in-radius 2 )
      [ask targets in-radius 2 [sound:play-sound "pig death.wav" die] 
        wait .1 set score score + 500 
        die]
    set pcolor scale-color sky velocity 2 0
  if xcor > 5  and count birdshots < 4 and shape = "triplethreatbird" 
  [if mouse-down? [hatch-birdshots 1 
      [set heading 0 fd 5]]]
  if shape = "bombbird" 
  [if mouse-down? [reset-timer set color red]]
  if color = red and shape = "bombbird" 
  [if timer > 3
    [reset-timer ask neighbors [set pcolor red 
        ask neighbors4 [set pcolor red]]  
    die]]
  if shape = "turbobird" 
  [if mouse-down? [ifelse angle > 75 [set heading 90 fd 7] 
      [set heading 90 fd 10 
        ifelse xcor > 13 [set heading 180 fd 3]
        [set heading 0 fd 3] 
        if xcor > 55 [die]]]]
  display
end

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++;  
  



@#$#@#$#@
GRAPHICS-WINDOW
238
10
677
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
1
1
1
tick

BUTTON
113
183
168
216
Start *1*
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

SLIDER
23
10
208
43
angle
angle
1
90
1
1
1
NIL
HORIZONTAL

SLIDER
23
49
208
82
power
power
1
1000
1
1
1
NIL
HORIZONTAL

BUTTON
74
141
162
174
NIL
fire
NIL
1
T
OBSERVER
NIL
F
NIL
NIL

SLIDER
5
385
124
418
wind
wind
-100
100
50
1
1
NIL
HORIZONTAL

CHOOSER
46
88
184
133
BirdChooser
BirdChooser
"LittleRedBird" "TurboBird" "EggDropBird" "TripleThreatBird" "BombBird" "Mighty-Eagle"
0

MONITOR
169
468
226
513
NIL
score
17
1
11

BUTTON
111
241
166
274
Start *2*
start2
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
170
183
233
216
Need Help?
help
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

TEXTBOX
130
381
246
433
Wind does not affect \nspeed of bird. It only \nmakes the clouds move \nfaster or slower.
10
125.0
1

BUTTON
46
241
107
274
Reset Lvl 2
setup2
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
46
183
111
216
Reset Lvl 1
setup1
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
45
296
142
329
Reset Own Level
own-level
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
45
334
104
367
NIL
Drag
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

CHOOSER
6
436
144
481
Color-Chooser
Color-Chooser
35 105 9.9 55 3
0

BUTTON
107
335
198
368
Color The Map
Color-Map
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

TEXTBOX
20
488
170
564
35 = brown = Wood\n105 = blue = Glass\n9.9 = white = Death\n55 = green = Land-Shaper\n3 = gray = Steel [death]
11
25.0
1

BUTTON
144
295
237
328
Start *Own Map*
start3
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
238
10
361
43
MIGHTY - EAGLE
eagleizer
NIL
1
T
TURTLE
NIL
NIL
NIL
NIL

TEXTBOX
3
191
44
219
Level 1
13
55.0
1

TEXTBOX
3
249
48
267
Level 2
13
15.0
1

TEXTBOX
5
306
38
370
Own \n\nLevel
13
105.0
1

BUTTON
170
242
233
275
Fireworks!
release
T
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
This is our rendition of Angry Birds, a popular mobile game made by Rovio. Our rendition features two levels, and a make-your-own level. The birds are angry because the pigs stole their eggs. You have to get them back!  


HOW IT WORKS 
------------
-Angle and power are sliders and global variables that are used in the function fire. They are the basic physics of the game. The fire function uses sin, and cos to ensure the birds are accurately flying throught the air. 

-The BirdChooser lets one choose a bird of their choice.
Selections are:
"LittleRedBird"
"TurboBird"
"EggDropBird"
"TripleThreatBird"
"BombBird"
"Mighty-Eagle" ~only level 2, and after acquiring 500 points, can this bird be used.

-startup starts immediately after opening the netlogo file. The user-messages are part of the startup function, and show directions if you are a first-time user. At the end of startup, it makes a call to setup1

-setup1 forms the locations of the pigs, launcher, birds, and the patches. It also makes the floor green.

-Reset Lvl 1 resets the first level. It calls on setup1 to setup the first level with the slingshot and all the clouds and the pigs in their habitat. 

- Start 1 calls "go" and it asks the birdshots to set their xcor to current xcor + x-vel and y-cor to current ycor + y-vel. This is where the physics is. It tells yvel to be set to (y-vel - .01), based on these codes:
      set x-vel x-vel / velocity
      set y-vel y-vel / velocity
It also tells clouds to move, and updates the birdshots to the chosen bird. 
It then makes a call to "check-birdshots" which makes turtles hide if pycor = 30, and reveals it when the birdshot comes back down to pycor 29. It asks birds to lower velocity if it encounters blue patches or brown patches or white patches. It tells a bird if a pig is in radius of 2, then to kill that pig and die with it. It also sets the code for each specific bird's abilities. Lastly, it tells the bird to record its path by setting the patch under it pcolor of scale-color sky referring to velocity of 2 and 0. Each pig killed gives you 500 points.

-Need Help? basically gives you the direction of where to shoot at, setting a target in front of the arrow.

-When one successfully completes level 1, there is a drawing imported and asks if you want to start level 2. 

-Level 2 is much harder than Level 1. However, you can use the Mighty Eagle once you get 500 points! 

-The Mighty Eagle button makes the bird an eagle, and then makes it move-to all targets carefully. This is the ultimate cheat, so use it if you are stumped with Level 2!

-Start2 is similar to Start1, but has a black background, and IT SNOWS!!!!!!!!!!!!!!!!!!
and the territory is different. 

-When successfully completing level 2, a black screen with a white floor comes up. Press the "fireworks" button to see a show of fireworks. Fireworks uses 3 turtles-own variables (angles, speed, time).

-Wind Slider only controls movement of the clouds. 

-Own-Level is basically Level 1, except there is no territory. The pigs in the green area are for your use. 

-To drag a pig, it lets candidate equal to the nearest pig from mouse-xcor mouse-ycor. If the candidate is less than 1, and the mouse is down, it forms a halo around a pig which follows the mouse. It then asks this "subject" which is subject to the mouse's controls, to set its x and y coordinates to that of the mouse's. It then resets the perspective to get rid of the halo. If one picks up a pig, patch 19 -27 immediatly sprouts a new one. 

-To color your map, just choose a color in the color chooser and if the mouse it down, it paints patches that color. 

-For start3 and check-birdshots3, refer back to start 1 (go) and check-birdshots1 respectively.

- ask myself [ create-link-to myself  [ tie hide-link ]]
  this line of code creates a link between the arrow and the bird, and shifts the arrow according to the angle slider.

Special Abilites of Birds:
"TripleThreatBird" divides into 3 small birds once mouse is pressed.
"TurboBird" gives a little boost when mouse is pressed.
"BombBird" becomes a bomb after 3 seconds when mouse is pressed.
"Mighty-Eagle" kills all pigs instantly, only in 2nd level with more than 500 points. 


HOW TO USE IT
-------------
First, you go through the user-messages. Then press start 1 or start 2 depending on your level. Once its started, you choose your bird, set the angle and power and try to hit the pigs. You have beaten the level once you have killed all the pigs. Also note that in Level 1, you cannot go through gray patches. Note that in level 2, you cannot go through the white walls. (Hint: you have to use a special bird).  

When using the Eagle, you have to set angle and power to anything of choice, then press fire and press the mighty eagle button.

When Level 2 is completed, to start the fireworks, press the fireworks button.
PLEASE do not cheat by pressing mouse down too many times when TurboBird is used, or by setting the score directly with the command center, unless you are Mr. Brown.

CREDITS AND REFERENCES
----------------------
By Ruzeb Chowdhury and Tasif Kazi AKA Team D.O.O.M.
[Deadly Orangutans Operating Miniguns ]

Lunar Lander for bird physics.
WE ARE VERY GRATEFUL TO THE NETLOGO DICTIONARY AND ITS CREATORS.


@#$#@#$#@
default
true
0
Polygon -7500403 true true 105 255 150 45 195 255 105 255

500
true
0
Line -13840069 false 90 105 135 105
Line -13840069 false 90 105 90 150
Line -13840069 false 90 150 119 149
Line -13840069 false 119 148 134 165
Line -13840069 false 135 168 120 195
Line -13840069 false 120 195 90 195
Line -13840069 false 90 105 135 105
Line -13840069 false 90 105 135 105
Line -13840069 false 90 105 135 105
Line -13840069 false 90 105 135 105
Line -13840069 false 90 105 135 105
Line -13840069 false 90 105 90 150
Line -13840069 false 90 105 90 150
Line -13840069 false 90 105 90 150
Line -13840069 false 90 105 90 150
Line -13840069 false 90 105 90 150
Line -13840069 false 90 105 90 150
Line -13840069 false 90 150 119 149
Line -13840069 false 90 150 119 149
Line -13840069 false 90 150 119 149
Line -13840069 false 90 150 119 149
Line -13840069 false 90 150 119 149
Line -13840069 false 90 150 119 149
Line -13840069 false 119 148 134 165
Line -13840069 false 119 148 134 165
Line -13840069 false 119 148 134 165
Line -13840069 false 119 148 134 165
Line -13840069 false 119 148 134 165
Line -13840069 false 119 148 134 165
Line -13840069 false 135 168 120 195
Line -13840069 false 135 168 120 195
Line -13840069 false 135 168 120 195
Line -13840069 false 135 168 120 195
Line -13840069 false 135 168 120 195
Line -13840069 false 135 168 120 195
Line -13840069 false 135 168 120 195
Line -13840069 false 120 195 90 195
Line -13840069 false 120 195 90 195
Line -13840069 false 120 195 90 195
Line -13840069 false 120 195 90 195
Line -13840069 false 120 195 90 195
Line -13840069 false 120 195 90 195
Line -13840069 false 120 195 90 195
Line -13840069 false 120 195 90 195
Line -13840069 false 120 195 90 195
Circle -13840069 false false 137 109 76
Circle -13840069 false false 137 109 76
Circle -13840069 false false 137 109 76
Circle -13840069 false false 137 109 76
Circle -13840069 false false 137 109 76
Circle -13840069 false false 137 109 76
Circle -13840069 false false 137 109 76
Circle -13840069 false false 137 109 76
Circle -13840069 false false 137 109 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76
Circle -13840069 false false 216 110 76

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

ball
true
0
Circle -7500403 true true 75 75 148

bombbird
false
14
Circle -16777216 true true 71 63 175
Polygon -16777216 true true 118 61 128 68
Polygon -16777216 true true 150 75 150 15 180 15 165 75
Circle -1 true false 108 84 30
Circle -16777216 true true 120 99 12
Circle -1 true false 174 88 30
Circle -16777216 true true 188 101 12
Polygon -2674135 true false 145 94 147 91 112 75 110 82 143 98
Polygon -2674135 true false 168 92 175 98 208 82 200 76 177 87
Circle -1 true false 150 78 16
Polygon -1184463 true false 151 15 183 15 176 30 151 25
Polygon -955883 true false 140 151 210 161 196 169 136 159 140 150
Polygon -955883 true false 136 158 148 185 192 172

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

drop
false
0
Circle -7500403 true true 73 133 152
Polygon -7500403 true true 219 181 205 152 185 120 174 95 163 64 156 37 149 7 147 166
Polygon -7500403 true true 79 182 95 152 115 120 126 95 137 64 144 37 150 6 154 165

egg
false
0
Circle -7500403 true true 96 76 108
Circle -7500403 true true 72 104 156
Polygon -7500403 true true 221 149 195 101 106 99 80 148

eggdropbird
false
0
Circle -1 true false 67 66 175
Polygon -16777216 true false 118 61 128 68
Polygon -16777216 true false 130 69 113 56 124 48 144 67 138 31 157 31 155 65 167 37 179 47 170 63 130 71
Polygon -16777216 true false 66 157 53 151 50 162 66 162 40 172 46 180 68 170 54 186 66 187 69 179 65 159
Polygon -16777216 false false 105 118 130 119 126 136 105 134 104 117
Circle -16777216 true false 117 124 10
Polygon -16777216 false false 188 122 213 123 209 140 188 138 187 121
Circle -16777216 true false 198 129 10
Rectangle -16777216 true false 96 114 134 120
Rectangle -16777216 true false 182 121 220 127
Circle -7500403 true true 104 136 28
Circle -7500403 true true 185 140 28
Polygon -1 true false 127 174 150 176 133 183
Polygon -955883 true false 138 140 133 162 140 190 160 204 187 196 191 180 172 166 177 141 170 124 151 121
Polygon -2674135 true false 167 161 169 168 183 179 180 190 156 195 143 179 142 166 143 157 151 151 163 151 167 153 170 168

firework
true
0
Rectangle -7500403 true true 105 75 195 300
Polygon -1 true false 60 75 240 75 150 0 60 75
Polygon -1 true false 105 90 195 120 195 150 105 120
Polygon -1 true false 105 165 195 195 195 225 105 195 105 165
Polygon -1 true false 105 240 195 270 195 300 105 270 105 240 105 270

invisible
true
0

kingpig
false
0
Circle -13840069 true false 75 90 180
Circle -13840069 true false 85 87 38
Circle -13840069 true false 123 70 40
Circle -1 true false 84 159 42
Circle -1 true false 204 159 42
Circle -10899396 true false 92 94 21
Circle -10899396 true false 132 74 21
Circle -16777216 true false 90 178 11
Circle -16777216 true false 231 177 11
Polygon -10899396 true false 94 149 113 141 122 154 95 148 125 156
Polygon -10899396 true false 203 153 216 140 236 150 202 153
Circle -10899396 true false 121 139 90
Circle -10899396 true false 141 191 48
Circle -16777216 true false 145 176 21
Circle -16777216 true false 168 175 21
Line -16777216 false 192 221 140 221
Polygon -1184463 true false 193 107 196 68 209 86 223 77 223 94 246 92 216 123 193 108
Circle -11221820 true false 192 94 10
Circle -11221820 true false 205 99 10
Circle -11221820 true false 216 106 10

launcher2
false
0
Polygon -6459832 true false 100 70 97 185 142 206 142 290 171 290 169 209 211 189 209 72 170 67 169 180 135 181 134 64 100 71

littleredbird
false
0
Circle -2674135 true false 60 94 198
Polygon -1184463 true false 227 172 272 142 257 172 272 172 287 172 227 187 227 172 240 180
Circle -1 true false 135 150 60
Circle -16777216 true false 150 165 30
Polygon -2674135 true false 134 84 110 77 125 92 95 92 129 115 153 97
Polygon -2674135 true false 165 165 180 180
Polygon -16777216 true false 180 135 210 150 195 150 165 135 180 135
Polygon -16777216 true false 167 135 152 135 197 150
Polygon -16777216 true false 214 251 145 278
Polygon -1 true false 230 233 198 284 229 264 252 229 260 186

mighty-eagle
false
3
Polygon -955883 true false 137 116 154 106 158 90 165 70 170 65 188 59 206 60 214 61 225 63 243 62 256 66 270 70 284 77 298 94 298 107 294 118 287 125 277 138 268 141 260 145 255 145 253 138 261 131 270 129 273 121 268 118 261 115 252 116 232 118 215 121 204 122 189 122 181 123 172 123 154 123 254 118 238 136 226 144 211 147 195 150 183 150 169 146 156 142 151 131 134 137 128 134 116 133
Polygon -1 true false 180 55 152 52 138 50 126 50 116 49 109 52 102 61 98 65 89 76 83 91 79 106 76 117 72 126 72 138 69 144 68 160 69 166 84 166 77 168 94 169 103 165 114 163 131 177 151 175 170 177 200 171 200 157 193 139 179 135 172 133 162 129 152 130
Polygon -955883 true false 160 128 163 131 133 125 121 127 123 127 121 126 123 122 142 122 152 124 159 124
Polygon -16777216 true false 190 70 210 70 203 74 194 75
Polygon -955883 true false 158 125 183 57 175 61 163 67 160 74 154 79 147 86 142 103 132 111 128 122
Polygon -6459832 true true 200 173 207 182 214 191 218 202 216 210 212 224 200 232 178 243 150 244 132 240 107 242 83 240 72 228 66 217 66 211 68 204 71 205 69 203 68 197 69 198 66 198 67 197 72 193 71 194 69 194 68 196 69 195 70 189 70 182 70 175 68 154
Circle -16777216 false false 111 61 18
Circle -16777216 true false 116 64 8
Polygon -8630108 true false 112 75 109 79 109 82 109 83 113 87 118 90 127 84 127 77
Polygon -6459832 true true 68 205 37 195 76 192
Polygon -6459832 true true 69 205 57 211 73 212
Polygon -1 true false 69 153 75 168 80 174 88 179 96 181 105 186 119 190 136 193 157 197 175 191 188 184 201 173
Polygon -16777216 true false 134 72 105 64 94 79 89 76 99 59 85 69 83 64 96 54 109 53 84 47 99 42 111 48 106 43 112 44 138 65
Polygon -16777216 true false 130 50 125 29 139 24 144 54
Polygon -16777216 true false 146 54 142 29 157 29 155 54
Polygon -16777216 true false 161 53 169 31 180 34 178 43 175 44 172 49 172 53 174 55 179 56
Rectangle -1 true false 148 128 165 135
Rectangle -1 true false 120 118 128 135

moon
false
0
Polygon -7500403 true true 177 11 86 42 32 114 32 189 81 249 136 275 207 278 283 243 209 237 154 220 115 189 97 134 112 81 134 55

sardines
false
0
Polygon -1 true false 120 231 270 163 280 124 129 191
Polygon -1 true false 130 198 30 139 170 79 281 126
Polygon -1 true false 31 137 30 180 120 229 130 192
Polygon -2064490 true false 90 143 135 173 135 143 105 143
Polygon -2064490 true false 134 144 164 99 209 99 194 129
Circle -1 true false 183 102 8
Line -7500403 true 128 190 279 124
Line -7500403 true 128 189 120 227
Line -7500403 true 32 141 128 191

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

sun
false
0
Circle -7500403 true true 75 75 150
Polygon -7500403 true true 300 150 240 120 240 180
Polygon -7500403 true true 150 0 120 60 180 60
Polygon -7500403 true true 150 300 120 240 180 240
Polygon -7500403 true true 0 150 60 120 60 180
Polygon -7500403 true true 60 195 105 240 45 255
Polygon -7500403 true true 60 105 105 60 45 45
Polygon -7500403 true true 195 60 240 105 255 45
Polygon -7500403 true true 240 195 195 240 255 255

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tnt
true
0
Rectangle -6459832 true false 97 90 240 209
Rectangle -2674135 true false 110 120 225 172
Line -16777216 false 129 133 129 163
Line -16777216 false 113 133 143 133
Line -16777216 false 205 135 205 165
Line -16777216 false 219 135 189 135
Line -16777216 false 150 135 150 165
Line -16777216 false 150 135 180 165
Line -16777216 false 180 135 180 165

triplethreatbird
false
0
Circle -13791810 true false 80 77 174
Circle -1 true false 122 110 48
Circle -16777216 true false 147 127 18
Polygon -13791810 true false 159 63 134 57 149 72 119 72 153 95 180 76
Polygon -2674135 true false 165 165 180 180
Polygon -16777216 true false 214 251 145 278
Circle -1 true false 174 113 42
Circle -16777216 true false 199 130 16
Polygon -955883 true false 238 180 170 144 140 174
Polygon -955883 true false 135 240 120 225 165 270
Polygon -955883 true false 142 174 165 196 209 180
Polygon -16777216 true false 81 168 53 161 53 174 81 170 63 190 76 196 81 168
Polygon -2674135 true false 129 150 131 165 142 172 158 155 147 159 134 155 129 150
Polygon -2674135 true false 214 148 219 162 209 168 185 153 196 157 208 151 214 145

turbobird
false
0
Polygon -1184463 true false 150 30 43 252 153 207 270 255
Polygon -1184463 true false 42 249 270 255 153 202 44 248
Circle -1 true false 110 146 32
Polygon -6459832 true false 116 132 111 145 147 156 146 156 144 146
Circle -1 true false 164 147 32
Polygon -6459832 true false 161 160 193 149 189 136 167 148 160 160
Circle -16777216 true false 121 158 12
Circle -16777216 true false 173 161 12
Polygon -1 true false 99 248 129 229 174 224 213 235 231 251
Polygon -955883 true false 156 205 144 223 173 232 191 223 211 224 180 198 169 191 144 221
Line -16777216 false 209 223 157 210

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

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
