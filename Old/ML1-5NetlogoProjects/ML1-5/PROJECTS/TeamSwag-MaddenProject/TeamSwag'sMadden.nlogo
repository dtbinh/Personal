
Breed[Quarterbacks Quarterback]
Breed[NoBallQuarterbacks NoBallQuarterback]
Breed[Linemen Lineman]
Breed[Runningbacks Runningback]
Breed[Fullbacks Fullback]
Breed[Widerecievers Widereciever]
Breed[D-Linemen D-Lineman]
Breed[Linebackers Linebacker]
Breed[D-backs D-back]
Breed[Kickers Kicker]
Breed[Fbcarriers Fbcarrier]
Breed[Tightends Tightend]
Breed[Balls Ball]
turtles-own[aim]
Patches-own[reset_color]

Globals[Clock Time_Left
  Quarter
  Down
  Yards_left
  Your_Score
  Enemy_score
  Last_hit
  LineOfScrim
  TempScore
  tackled_at
  ]

;______setups
to setup
  ca
  set-patch-size 1
  resize-world -320 320 -209 209
  import-pcolors "football_field2.jpg"
  set clock 0
  set Quarter 1
  ask patches [setupfield set reset_color pcolor]
  reset-timer
  set LineOfScrim Min-pxcor
  set down 1
  user-message "Welcome to the manly sport of football! If it's your first time playing, please check the info tab."
  ifelse user-yes-or-no? "Are you a guy?" 
    [Ifelse user-yes-or-no? "Are you Mr. Brown?" [user-message "Hi"][user-message "Join Stuy Peglegs, we gun hit da championchipz next year"]] [user-message "Good luck"]
  end

To setupkickoff
  set lineofScrim min-pxcor
  ask turtles [die]
  reset
  ;ask patches [if pxcor = LineOfScrim [set pcolor 125]] You don't need this in kick off
    create-balls 1 
    ask balls [setxy 180 48 set shape "football" set size 15]
    create-d-backs 10 [d-backsetupKO]
   create-kickers 1[kickersetupKO]
   create-linemen 10 [linemensetupKO]
   ask n-of 5 linemen [set xcor -128 set ycor -50 + random 100]
   create-runningbacks 1[returnersetupKO]
   ask turtles [set aim -1]
   set down 0
end


To reset
  ask patches [set pcolor reset_color]
end

;_______________________________________________________________________Main Setup
to setupPostions
  ask turtles [die]
  create-linemen 5[linemensetup]
  create-d-linemen 4[d-linemensetup]
  create-runningbacks 1[RBSetup]
  create-fullbacks 1 [FBSetup]
  create-QuarterBacks 1[QBsetup] 
  create-Linebackers 3[LBSetup]
  create-D-backs 4 [Dbacksetup]
  create-Widerecievers 2 [WRSetup]
  create-tightends 1 [TESetup]
  create-balls 1 [Ballsetup]
end



to FBsetup
  set shape "fullback"
  set size 45
  set color blue
  carefully [set xcor lineofScrim - 80 set ycor 0] [carefully [set xcor lineofscrim - 10 set ycor 0][set xcor lineofscrim set ycor 0]]
  set heading 90
end

to TESetup
  set shape "lineman(o/r)"
  set size 45
  set color blue
  set xcor lineofScrim set ycor 75
  set heading 90
end

to WRsetup
  set shape "widereciever"
  set size 45
  set color blue
  set heading 90
  set xcor lineofScrim set ycor 100
  ask one-of widerecievers [set xcor lineofScrim set ycor -100]
  if any? other widerecievers-here [ask one-of widerecievers [set xcor lineofscrim set ycor (ycor * -1)]]
end

to linemensetup
  set shape "lineman(o/r)"
  set size 45
  set color blue
  set xcor lineofScrim set ycor -37.5 + random 75
  set heading 90
end

to d-linemensetup
  set shape "dlineman(main)"
  set size 45
  set heading 270
  carefully [set xcor lineofScrim + 20 set ycor -37.5 + random 75][set xcor lineofscrim + 5 set ycor -37.5 + random 75]
  set color red
end

to RBsetup
  set shape "runningback"
  set size 45
  set heading 100
   carefully [set xcor lineofScrim - 100 set ycor 0] [carefully [set xcor lineofscrim - 25 set ycor 0] [set xcor lineofscrim set ycor 0]]
    set color blue
end

to QBsetup
  carefully [setxy lineofScrim - 35 0] [carefully [setxy lineofscrim - 10 0][set xcor lineofscrim set ycor 0]]
  set shape "Quarterback"
  set size 45
  set color blue
  set heading 90
end

to Ballsetup
  carefully [setxy lineofScrim - 35 0] [carefully [setxy lineofscrim - 10 0][set xcor lineofscrim set ycor 0]]
  set shape "football"
  set size 12
  set color brown
 end

to LBSetup
  set shape "linebacker"
  set size 45
  set color red
  set heading 270
  ask linebackers [carefully [setxy LineofScrim + 65 42 ask one-of linebackers [setxy LineofScrim + 65 -75 ask linebackers [if any? linebackers-here [ask other linebackers-here [setxy LineofScrim + 65 -106 ]
         ]]]][setxy lineofScrim + 7.5 74 ask one-of linebackers [setxy Lineofscrim + 7.5 -57.5 ask linebackers [if any? linebackers-here [ask other linebackers-here [setxy LineofScrim + 7.5 -106]]]]]]
end

to Dbacksetup
   set shape "dback"
  set size 45
  set color red
  set heading 270
  carefully [setxy LineOfScrim + 100 -125 + random 150][setxy Lineofscrim + 12.5 random 150]
  
end

;__________________________________________________________________________________________________________________________________Setupostions


;___________________________________________________________________________________________________________________________________KickOFF

to runkickoff
  set clock timer
  if clock >= 60 [reset-timer set Time_left Time_left + 1]
  if Time_left >= 20 [set Quarter Quarter + 1 set Time_left 0]   
  
  
ifelse ((count fbcarriers = 1) or (count runningbacks = 1))
 [
ask kickers
 [carefully 
   [set heading towards one-of balls runmove] [carefully 
     [set heading towards one-of runningbacks ocollide] [set heading towards one-of fbcarriers ocollide]]]
 
ask balls [if any? kickers in-radius 10 [setxy ((random 200) - 315) (-130 + random 270) 
    if any? fbcarriers in-radius 1000 [die]]]
ask balls [if any? fbcarriers in-radius 100 [die]]

ask linemen [ifelse is-turtle? aim [set heading towards aim dcollide]
    [set aim one-of d-backs
       set heading towards aim dcollide]]

ask d-backs [carefully [set heading towards one-of runningbacks ocollide] [set heading towards one-of fbcarriers ocollide]]

ask runningbacks [set heading towards one-of balls runmove 
  if any? balls in-radius 30 [set breed fbcarriers set shape "ballcarrier" set color blue]]

ask fbcarriers [movetomouse runcollide runmove]

 If any? fbcarriers with [pcolor = blue] [Score stop]]
 
[countdowns set yards_Left 0 stop]
if quarter > 4
[Ifelse your_score > enemy_score [user-message "Victory! Hope you had fun" stop]
  [Ifelse your_score < enemy_score [user-message "Defeat! Hope you enjoyed this game though" stop] 
    [user-message "Tie! Hope you had fun" stop]]]
end





to D-backsetupKO
  set size 45
  set color red
  set shape "dback"
  ifelse random 2 = 1 [set xcor 135 set ycor 0 + random 160][set xcor 135 set ycor 0 - random 160]
  set heading 270
end

to kickersetupKO
  set shape "kicker"
  set size 45
  set color red
  setxy 233 48
  set heading 235
end

to returnersetupKO
  set shape "runningback"
  set size 45
  set color blue
  setxy -237.5 7.5
  set heading 90
end

to linemensetupKO
  set shape "linemanKO"
  set color blue
  set size 45
  set xcor -50 set ycor -25 + random 50
  set heading 90
end

to setupField
  if pxcor < Min-pxcor + 10 [set pcolor red]
  if pxcor > Max-pxcor - 10 [set pcolor blue]
end


;basic rules that they have to follow

;BTW i changed their speed to test something you can change it back if you want

to runcollide ;for runningbacks and widerecievers
  if any? D-Linemen in-radius 5 [ifelse random 3 = 1 [fd (12 - difficulty + lag_adjustment)/ 3][set tackled_at xcor if tackled_at > lineofScrim + 10 [set lineofScrim tackled_at]  die]]; IM NOT SURE IF I SHOULD PUT LINE OF DISCRIM HERE BECAUSE WE'RE NOT DOING BLUE TEAM
  if any? Linebackers in-radius 10 [ifelse random 3 > 2 [fd (12 - difficulty + lag_adjustment)/ 3] [set tackled_at xcor if tackled_at > lineofScrim + 10 [set lineofScrim tackled_at]  die]]
  if any? D-backs in-radius 10 [ifelse random 3 > 2 [fd (12 - difficulty + lag_adjustment)/ 3] [set tackled_at xcor if tackled_at > lineofScrim + 10 [set lineofScrim tackled_at]  die]]
  if any? kickers in-radius 10 [ifelse random 3 > 2 [fd (12 - difficulty + lag_adjustment)/ 3] [set tackled_at xcor if tackled_at > lineofScrim + 10 [set lineofScrim tackled_at] die]]
end

to qbruncollide
   if any? D-Linemen in-radius 5 [set tackled_at xcor if tackled_at > lineofScrim + 10 [set lineofScrim tackled_at]  die
     ]
end


to dcollide
  ;ifelse any? D-Linemen in-radius 40 [stop ] [fd 3]
  ;ifelse any? Linebackers in-radius 40 [stop ]  [fd 3 ]
  ifelse any? D-backs in-radius 30 [stop ]  [fd ((difficulty / 1.5) + (lag_adjustment / 1.5)) ]
end

to Dcollide2
  ifelse any? D-Linemen in-radius 30 [stop ] [fd ((difficulty / 1.5) + (lag_adjustment / 1.5)) ]
end

to ocollide
  ifelse any? linemen in-radius 30 [bk random 7 fd random difficulty - .6] [fd ((difficulty / 4.5) + lag_adjustment / 2)] 
  ifelse any? tightends in-radius 30 [bk random 7 fd random difficulty - .6] [fd ((difficulty / 4.5) + lag_adjustment / 2)] 
   ifelse any? fullbacks in-radius 30 [bk random 7 fd random difficulty - .6] [fd ((difficulty / 4.5) + lag_adjustment / 2)] 
  ;ifelse any? linemen in-radius 40 [set heading towards min-one-of linemen [distance myself] ] [fd 3] 
  ;ifelse any? fbcarriers in-radius 70 [stop] [fd 2]
  ;ifelse any? widerecievers in-radius 25 [] [fd 1 ]
  ;ifelse any? runningbacks in-radius 25 [] [fd 1 ]
  ;ifelse any? quarterbacks in-radius 25 [] [fd 1 ] 
  ;ifelse any? tightends in-radius 25 [] [fd 1 ]
end

to ocollide2
  ifelse any? linemen in-radius 30 [bk random 7 fd random difficulty - .6] [bk (((difficulty / 4.5) + lag_adjustment / 2)) / 10] 
  ifelse any? tightends in-radius 30 [bk random 7 fd random difficulty - .6] [bk (((difficulty / 4.5) + lag_adjustment / 2)) / 10] 
   ifelse any? fullbacks in-radius 30 [bk random 7 fd random difficulty - .6] [bk (((difficulty / 4.5) + lag_adjustment / 2)) / 10] 
  ;ifelse any? linemen in-radius 40 [set heading towards min-one-of linemen [distance myself] ] [fd 3] 
  ;ifelse any? fbcarriers in-radius 70 [stop] [fd 2]
  ;ifelse any? widerecievers in-radius 25 [] [fd 1 ]
  ;ifelse any? runningbacks in-radius 25 [] [fd 1 ]
  ;ifelse any? quarterbacks in-radius 25 [] [fd 1 ] 
  ;ifelse any? tightends in-radius 25 [] [fd 1 ]
end


;to block
  ;bk random 5 fd random 5
;end

to runmove
  fd (7.2 - difficulty) + (lag_adjustment / 1.5)
end

to qbrunmove
  fd (7.5 - difficulty) + (lag_adjustment / 1.4)
end
;the only problem here is if u dont score in 10 downs, it makes an error, can u fix it? Its nothing big but it just looks bad


to countdowns
ifelse tackled_at > LineOfScrim + 10 
[
  set Lineofscrim tackled_at set yards_left 10]
[
  set down down + 1 
  set yards_left 10 - abs tackled_at - LineOfScrim]
if down > 6
[user-message "We're out of downs, it's their ball now" enemyscore]
stop
end

;Im leaving this out for now

;To Count-Downs
 ; Ifelse (abs Tackled_At - LineofScrim) > 10 [set Down 1 set Yards_left 10 ][set Down Down + 1 set Yards_Left 10 - abs Tackled_at - LineofScrim ]
  ;If Down > 4 
 ; end

To field-goal
  ifelse down = 6
  [if user-yes-or-no? "It's 6th down, want to try for a field goal?" [if random 2 = 1 [set your_score your_score + 3 user-message "Good shot!" enemyscore]]]
  [user-message "Best time to do it is 6th down. Wait til then."]
end
  


;This is how downs will work 
;Tackled_at is Fbcarrier-own variable and you set it as the xcor when hes "tackled"
;it calculates the Downs and yards to first 
;Wasn't sure what you wanted me to do when it gets to fourth down so yea



;_________________________________________________________________________________________________________________ plays

to runplay
  if down >= 7 [countdowns stop]
  set clock timer 
   if clock >= 60 [reset-timer set Time_left Time_left + 1]
  if Time_left >= 3 [set Quarter Quarter + 1 set Time_left 0] 
  ;This is for the timer 
if plays = "Dive_run" [Dive_run]
if plays = "Sweep_run" [Sweep_run]
if plays = "QBSneak_run" [QBSneak_run]
if plays = "Hail_Mary!_pass" [Hail_Mary!_pass ]
if plays = "Double_Vertical_pass" [Double_Vertical_pass]
if (((count runningbacks = 0) and (count fbcarriers = 0)) 
  or  ((count widerecievers = 1) and (count fbcarriers = 0)) 
  or (count quarterbacks = 0 and (count fbcarriers = 0))) 
[stop] 
if any? fbcarriers with [pcolor = blue][score stop]
if lineofscrim < -310 [user-message "They forced you all the way back, it's their ball" enemyscore]
if quarter > 4
[Ifelse your_score > enemy_score [user-message "Victory! Hope you had fun" stop]
  [Ifelse your_score < enemy_score [user-message "Defeat! Hope you enjoyed this game though" stop] 
    [user-message "Tie! Hope you had fun" stop]]]
end

;______________________________________________________________________________________________________

to dive_run
 every 100 [set down down + 1]
 ifelse any? runningbacks or any? fbcarriers
 [
 ifelse count runningbacks = 1
 [ask runningbacks [carefully [set heading towards one-of quarterbacks 
     runmove
     runcollide
     if any? quarterbacks in-radius 30          
    [set breed fbcarriers
    set shape "ballcarrier"
    movetomouse
    runcollide
    ]]
      []]]
 [
 
 ask fbcarriers [set breed fbcarriers set shape "ballcarrier" movetomouse runmove runcollide]]
 
 ask linemen [ifelse is-turtle? aim [set heading towards aim dcollide]
    [set aim one-of d-linemen
       set heading towards aim dcollide]]
 
 ask widerecievers [set heading towards one-of d-backs  dcollide2]
 ask tightends [set heading towards one-of linebackers dcollide2]
 ask balls [vanish set size 0]
 ask linebackers [ifelse count fbcarriers = 0 [bk (lag_adjustment / 6)]
 [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 2) + (difficulty / 20)) ocollide][]]]
 ask d-backs [ifelse count fbcarriers = 0 [bk (lag_adjustment / 3)] 
   [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 2) + (difficulty / 20)) ocollide][]]]
 ask d-linemen 
   [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 3) + (difficulty / 30)) ocollide][]]
 ask quarterbacks [bk 3 if any? fbcarriers in-radius 100 [set breed Noballquarterbacks set shape "noballquarterback"]]
 ask noballquarterbacks [ ]
 ask fullbacks [ifelse is-turtle? aim [set heading towards aim dcollide2]
    [set aim one-of linebackers
       set heading towards aim runmove dcollide]]][countdowns]
 ;if any? fbcarriers with [pcolor = blue] [score stop]

end

;_________________________________________________________________________________________________________

to Sweep_run
every 100 [set down down + 1]
 ifelse any? runningbacks or any? fbcarriers
 [ifelse count runningbacks = 1
 [ask runningbacks [carefully [set heading towardsxy (lineofscrim - 15) 150
     runmove
     runcollide
     if any? quarterbacks in-radius 30          
    [set breed fbcarriers
    set shape "ballcarrier"
    movetomouse
    runcollide
    ]]
      []]]
 [
 
 ask fbcarriers [set breed fbcarriers set shape "ballcarrier" movetomouse runmove runcollide]]
 
 ask linemen [ifelse is-turtle? aim [set heading towards aim dcollide]
    [set aim one-of d-backs
       set heading towards aim dcollide]]
 ask balls [vanish set size 0]
 ask widerecievers [set heading towards one-of d-backs  dcollide2]
 ask tightends [set heading towards one-of linebackers dcollide2]
ask linebackers [ifelse count fbcarriers = 0 [bk (lag_adjustment / 6)]
 [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 2) + (difficulty / 20)) ocollide][]]]
 ask d-backs [ifelse count fbcarriers = 0 [bk (lag_adjustment / 3)] 
   [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 2) + (difficulty / 20)) ocollide][]]]
 ask d-linemen [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 3) + (difficulty / 30)) ocollide][]]
 ask quarterbacks [set heading towardsxy (lineofscrim - 10) 160 runmove
   if any? fbcarriers in-radius 100 [set breed Noballquarterbacks set shape "noballquarterback"]]
 ask noballquarterbacks [ ]
 ask fullbacks [ifelse is-turtle? aim [set heading towards aim dcollide2]
    [set aim one-of linebackers
       set heading towards aim runmove dcollide]]][countdowns]
end

;________________________________________________________________________________________________________

to QBSneak_Run
every 100 [set down down + 1]
 ifelse any? quarterbacks or any? fbcarriers
 [ifelse count quarterbacks = 1
 [ask quarterbacks [carefully [set heading towardsxy (lineofscrim - 15) -175
     fd 1
     runcollide
     if (abs (175 + ycor)) < 5         
    [set breed fbcarriers
    set shape "ballcarrier"
    movetomouse
    runcollide
    ]]
      []]]
 [
 
 ask fbcarriers [set breed fbcarriers set shape "ballcarrier" movetomouse qbrunmove runcollide]]
 ask balls [vanish set size 0]
 ask linemen [ifelse is-turtle? aim [set heading towards aim dcollide]
    [set aim one-of d-backs
       set heading towards aim dcollide]]
 
 ask widerecievers [set heading towards one-of d-backs  dcollide2]
 ask tightends [set heading towards one-of linebackers dcollide2]
 ask linebackers [ifelse count fbcarriers = 0 [bk (lag_adjustment / 6)]
 [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 2) + (difficulty / 20)) ocollide][]]]
 ask d-backs [ifelse count fbcarriers = 0 [bk (lag_adjustment / 3)] 
   [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 2) + (difficulty / 20)) ocollide][]]]
 ask d-linemen [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 3) + (difficulty / 30)) ocollide][]]
 ask runningbacks [fd .5]
 ask fullbacks [ifelse is-turtle? aim [set heading towards aim dcollide2]
    [set aim one-of linebackers
       set heading towards aim runmove dcollide]]]
 [countdowns]
end

;______________________________________________________________________________________

to Hail_Mary!_pass
every 100 [set down down + 1]
ask tightends [set heading towards one-of linebackers dcollide2]
 ask linebackers [ifelse count fbcarriers = 0 [bk (lag_adjustment / 6)]
 [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 2) + (difficulty / 20)) ocollide][]]]
 ask d-backs [ifelse count fbcarriers = 0 [carefully 
     [set heading towards one-of widerecievers in-radius 150 runmove carefully 
         [set heading towards one-of widerecievers in-radius 50 runmove][]] []]
         
   [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 2) + (difficulty / 20)) ocollide][]]]
 ask d-linemen [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 3) + (difficulty / 30)) ocollide][carefully [set heading towards one-of quarterbacks]
     []
     ]]
 
 ask runningbacks [set heading towardsxy 300 0 fd 0.01]
 ask widerecievers [set heading towardsxy 310 0 fd (lag_adjustment / 3) if xcor > lineofscrim + 200 []]
  ask linemen [ifelse is-turtle? aim [carefully [set heading towards aim dcollide] []]
    [set aim one-of d-linemen
       set heading towards aim dcollide]]
 ask fullbacks [ifelse is-turtle? aim [set heading towards aim dcollide2]
    [set aim one-of linebackers
       set heading towards aim runmove dcollide]]
  ifelse (any? quarterbacks or any? fbcarriers)
  [ifelse count quarterbacks = 1
    [if mouse-down?
      [ask quarterbacks 
        [set breed noballQuarterbacks set shape "noballQuarterback"]
      ask patch mouse-xcor mouse-ycor 
     [ifelse any? d-backs in-radius 20 [user-message "DEFLECTED" stop]
     
     [ifelse any? widerecievers in-radius 10 [ask widerecievers in-radius 20 [set breed fbcarriers set shape "ballcarrier" 
        ask balls [die]]][user-message "Missed" stop]]
     ]]]
    
    [ifelse any? fbcarriers 
      [ask fbcarriers [movetomouse runmove runcollide]]
      [countdowns]]]
    [Stop]
end





;________________________________________________________________________________________________KISSINGER these are driving me nuts :(

to Double_Vertical_pass  
every 100 [set down down + 1]
  
 ask tightends [set heading towards one-of linebackers dcollide2]
 ask linebackers [ifelse count fbcarriers = 0 [bk (lag_adjustment / 12)]
 [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 2) + (difficulty / 20)) ocollide][]]]
 ask d-backs [ifelse count fbcarriers = 0 [carefully 
     [set heading towards one-of widerecievers in-radius 150 runmove carefully 
         [set heading towards one-of widerecievers in-radius 50 runmove][]] []]
         
   [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 2) + (difficulty / 20)) ocollide][]]]
 ask d-linemen [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 3) + (difficulty / 30)) ocollide][carefully [set heading towards one-of quarterbacks]
     []
     ]]
 
 ask runningbacks [set heading towardsxy 300 0 fd 0.01]
 ask widerecievers [fd (lag_adjustment / 4) rt random 4 lt random 4]
  ask linemen [ifelse is-turtle? aim [carefully [set heading towards aim dcollide] []]
    [set aim one-of d-linemen
       set heading towards aim dcollide]]
 ask fullbacks [ifelse is-turtle? aim [set heading towards aim dcollide2]
    [set aim one-of linebackers
       set heading towards aim runmove dcollide]]
  ifelse (any? quarterbacks or any? fbcarriers)
  [ifelse count quarterbacks = 1
    [if mouse-down?
      [ask quarterbacks 
        [set breed noballQuarterbacks set shape "noballQuarterback"]
      ask patch mouse-xcor mouse-ycor 
     [ifelse any? d-backs in-radius 20 [user-message "DEFLECTED" stop]
     
     [ifelse any? widerecievers in-radius 10 [ask widerecievers in-radius 20 [set breed fbcarriers set shape "ballcarrier" 
        ask balls [die]]][user-message "Missed" stop]]
     ]]]
    
    [ifelse any? fbcarriers 
      [ask fbcarriers [movetomouse runmove runcollide]]
      [countdowns]]]
    [Stop]
   
 
 
 ;[set breed fbcarriers][if xcor > (lineofscrim + 150)[fd 0.05 * lag_adjustment ]]]
 ;ask fbcarriers [set shape "ballcarrier" movetomouse qbrunmove runcollide]
 ;ask linemen [ifelse is-turtle? aim [set heading towards aim dcollide]
    ;[set aim one-of d-backs
     ;  set heading towards aim dcollide]]
  ;ask tightends [set heading towards one-of linebackers dcollide2]
 ;ask linebackers [ifelse count fbcarriers = 0 [bk (lag_adjustment / 6)]
 ;[carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 2) + (difficulty / 20)) ocollide][]]]
 ;ask d-backs [ifelse count fbcarriers = 0 [bk (lag_adjustment / 3)] 
  ; [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 2) + (difficulty / 20)) ocollide][]]]
 ;ask d-linemen [carefully [set heading towards one-of fbcarriers fd ((lag_adjustment / 3) + (difficulty / 30)) ocollide][]]
 ;ask runningbacks [fd .5]
 ;ask fullbacks [ifelse is-turtle? aim [set heading towards aim dcollide2]
   ; [set aim one-of linebackers
    ;   set heading towards aim runmove dcollide]]]

 ;countdowns

end

;_____________________________________________________________________________________________


;PASS RELATED STUFF

to movetomouse
    if mouse-down? [facexy mouse-xcor mouse-ycor]
end

to qbcollide
ifelse any? D-Linemen in-radius 3 []
  [set tackled_at xcor if tackled_at > lineofScrim + 10 [set lineofScrim tackled_at]  die]
end

to vanish
  if count fbcarriers > 0 [die]
end

  

  
  
;___________________________________________________________________________________________________________________Scoring

to score
  set your_score your_score + 6
  user-message "TOUCHDOWN YEA!!"
  ifelse user-yes-or-no? "Want to try for two point conversion?" [ifelse random 2 = 1 
    [set your_score your_score + 2 user-message "Nice, got it" enemyscore] [user-message ":(, maybe next time" enemyscore]]
  [user-message "Alright lets kick it in then!" ifelse random 3 < 2 [Set your_score your_score + 1 user-message "Nice, got it" enemyscore][user-message "HOWD WE MISS?" enemyscore]]
end
     

to enemyscore
  user-message "The enemy now has the ball, we'll see if they scored"
  ifelse random 10 - Difficulty <= 1 [set enemy_score enemy_score + 7 
    user-message "Dang it, they scored, let's get em back!"
    user-message "Time for kickoff!"
    setupKickoff] [ifelse random 3 = 1 [set enemy_score enemy_score + 3
      user-message "Phew, only a field goal! Start this kick off!"
      setupkickoff][set enemy_score enemy_score + 0
      user-message "HAHA, they got nothing. Start kickoff!"
      setupkickoff]]
end


@#$#@#$#@
GRAPHICS-WINDOW
577
16
1228
466
320
209
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
-320
320
-209
209
0
0
1
ticks

SLIDER
1051
545
1223
578
Difficulty
Difficulty
1
6
1
1
1
NIL
HORIZONTAL

CHOOSER
388
321
557
366
Plays
Plays
"Dive_run" "Sweep_run" "QBSneak_run" "Double_Vertical_pass" "Hail_Mary!_pass"
4

MONITOR
28
565
175
662
Your Score
0 + Your_Score
17
1
24

MONITOR
177
565
349
662
Enemy Score
0 + Enemy_Score
17
1
24

BUTTON
7
10
96
43
SetupField
Setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
1
71
104
104
SetupKickOff
SetupKickOff
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

BUTTON
303
322
385
366
NIL
SetupPostions
NIL
1
T
OBSERVER
NIL
Q
NIL
NIL

BUTTON
303
367
558
474
Run Play
runplay
T
1
T
OBSERVER
NIL
W
NIL
NIL

MONITOR
418
617
475
662
Down
Down
17
1
11

MONITOR
352
616
409
661
Quarter
Quarter
17
1
11

MONITOR
353
565
497
610
Minutes Left in Quarter
3 - Time_left
1
1
11

MONITOR
500
566
558
611
seconds
60 - clock
1
1
11

MONITOR
6
325
99
370
Linemen
count Linemen
17
1
11

MONITOR
99
324
201
369
D-linemen
count D-linemen
17
1
11

MONITOR
6
369
126
414
Runningbacks
count runningbacks
17
1
11

MONITOR
130
459
215
504
Kickers
count kickers
17
1
11

BUTTON
108
71
213
104
Start Kick Off
RunKickOff
T
1
T
OBSERVER
NIL
S
NIL
NIL

BUTTON
470
481
555
544
Field Goal
Field-goal
NIL
1
T
OBSERVER
NIL
F
NIL
NIL

TEXTBOX
99
11
202
39
<-- Press this first\n      and only once!
11
0.0
1

TEXTBOX
5
112
210
196
A game always begins with a kick off. You only have to set it up once, but once it's set up, you can start it to start the game. \nNote: After anyone scores, a kick off will be automatically set up, just recognize it and start it up!
11
0.0
1

TEXTBOX
317
482
467
538
If it's 6th down and you think you can't score, try a field goal (An attempt to kick for THREE points).
11
0.0
1

MONITOR
6
413
126
458
Quarterbacks
count quarterbacks
17
1
11

MONITOR
5
458
131
503
Widerecievers
Count widerecievers
17
1
11

MONITOR
4
502
106
547
Tightends
Count tightends
17
1
11

MONITOR
125
368
228
413
Defensive Backs
count d-backs
17
1
11

MONITOR
125
414
234
459
Linebackers
count linebackers\n
17
1
11

TEXTBOX
2
539
567
558
____________________________Game Stats________________________________
15
15.0
1

MONITOR
479
617
557
662
Yards to TD
((620 - (lineofscrim + 310))/ 7) + 5
0
1
11

MONITOR
106
502
169
547
Fullbacks
Count fullbacks
17
1
11

SLIDER
1046
471
1218
504
Lag_Adjustment
Lag_Adjustment
1
15
1.5
0.5
1
NIL
HORIZONTAL

TEXTBOX
579
467
729
676
l\nl\nl\nl\nl\nlGame \nlSettings\nl \nl\nl\nl
15
15.0
1

TEXTBOX
61
299
211
317
Position Count
13
0.0
1

TEXTBOX
852
471
1039
529
If your computer is experiencing lag, increase the adjustment.\nNote: Use only if the top adjustment doesn't work
11
0.0
1

TEXTBOX
919
540
1060
652
Opponents\n1: Mental Institute\n2: Stuy Peglegs\n3: Average High School\n4: Notre Dame\n5: NFL\n6: The Gods playing football\n
11
42.0
1

TEXTBOX
1062
511
1212
539
Changing the difficulty will strongly effect the play
11
0.0
1

TEXTBOX
13
52
163
70
Kick Off Stuff
14
113.0
1

TEXTBOX
254
62
559
314
                            Controls for Lazy People\n1. Check the Info Tab for full details\n2. A game begins with a kickoff, start it once it's set.\n3. After the kick off, a person will be given 6 downs (chances) to get the ball to the other side. \nFootball Trivia: In real football, people go 10 yards a time with 4 downs, but here we made it simpler for you!\n4. Set up positions anytime it is your ball and not Kick Off (Unless you want to kick a field goal)\n5. After you set up, choose a play (Plan), then run the play.\n6. If it is a RUN play, a person will almost immediately get the ball and run it. (Details in Info Tab) Tell the guy to move by clicking where you want him to go.\n7. If it is a PASS play, you will have two recievers go into the open. Click on one of them if you want them to have the ball. But make sure you click exactly on them. When he gets the ball, click to move him.\n8. Repeat Set Up Positions and Run Play until game's over.
11
0.0
1

TEXTBOX
229
10
515
66
Note: If things are too slow or too fast, adjust it using the slider above before using our lag adjustment.
11
0.0
1

@#$#@#$#@
WELCOME TO TEAM SWAG'S MADDEN NETLOGO FOOTBALL GAME (TSMNFG)
-----------
This model is an attempt to re-create a football game. We are stretching our minds to create more than just a stimulation, but a game that can hopefully satisfy an eager mind for more than two minutes. Generally the rules stay the same but there are slight changes. In this model, two different teams face a battle of brawn and brain to triumph in score and glory. You are the head offensive coach of the Blue team and will have to make the right decisions to lead your team to victory.


FEATURES
------------
Although this is just a basic reconstruction of Madden, here are some features we have

- A full control of the offensive side of the team
- A timer and working clock
- 6 Downs for the full field (Instead of 4 downs per 10 yards)
- A working kick off and field goal
- Randomly generated scoring mechanism for the other team (Can be slightly altered with the difficulty slider)
- Controllable player (This game is, once again, not a stimulation but indeed a game)
- Nice turf 
- Randomized and realistic movements of uncontrollable players
- Reliable linemen (They do the dirty work)
- Five working plays, three running, two passing
- Aesthetically pleasing interface
- Aesthetically displeasing procedure page
- FOOOOTBALLLLLL!!

PLAYS
-------------

For full game info, check the interface notes, but here are the plays in detail

Kickoff - The openining of a game or something done after a team scores. One team kicks the ball in which the other team attempts to return it for as much yards as possible

Dives - Generally a quick and immediate handoff of the ball to the runningback in which the running back usually "dives" through the linemen. 

Sweeps - A handoff in which the quarterback gives it to the runningback from the side and the runningback leaks out to an undefended area

QB Sneak - Self explanatory, the quarterback holds on the ball and tries to leak out to the open making a run.

Double Verticals - A passing play where both wide recievers run straight hopefully to steer clear of any defenders. 

Hail Mary - Generally a last resort play where the wide recievers rush to the endzone in a hope to catch the ball.

Field Goal - A kick for three points usually done on the last down.


CONTROLS
-------------
Check the interface but the two you have to know are

- To pass a ball in a pass play, you must click on one of the two wide recievers and if they happen to be in range of your mouse, they will catch it (Although a defender CAN deflect it)
- To move the football carrier, he must have the football and have a yellow arrow on his head. He will then move towards your mouse.


HOW IT WORKS
----------------
To put it simply, there are many individual breeds. Nearly one for each position. Basically, based on the user's preference and choice, it will call the function that the user chose. The code will have a bunch of smaller functions in which each has each position do something. Most of it is randomized to promote a realistic feeling but only to the point where it IS realistic. 


THINGS TO TRY
-------------
TRY EVERYTHING


ON A SERIOUS NOTE 
-------------
We had a lot of fun making this model and we really realized that Netlogo can do so much more than what we first thought. This game also seemed impossible at first but we decided to give it a try. Honestly, this is probably one of the only projects we spent EXTRA time on and it really gave us a challenge (and a headache). We hope you enjoy this model!

CREDITS AND REFERENCES
----------------------
TEAM SWAG - KEVIN CHEN AND KISSINGER CHEN
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

ballcarrier
true
1
Polygon -2674135 true true 159 130 197 137 214 140 217 140 232 144 229 194 159 177 161 129
Circle -6459832 true false 164 117 27
Circle -16777216 false false 163 115 30
Circle -2674135 true true 56 108 83
Polygon -6459832 true false 92 108 96 146 104 150 113 152 137 146 137 143 137 139 137 136 137 134 136 131 130 123 127 119 124 116 115 111 104 108 94 107 93 109
Circle -1 true false 100 148 8
Line -1 false 125 118 103 152
Line -1 false 137 137 106 149
Line -1 false 126 118 136 136
Line -1 false 116 134 119 143
Line -1 false 132 127 118 138
Line -1 false 95 145 114 134
Circle -16777216 true false 96 114 10
Polygon -2674135 true true 137 141 138 164 142 171 151 178 155 178 162 173 164 159 163 147 164 132 158 131 149 128 139 141
Line -1 false 137 162 138 141
Line -1 false 162 131 162 169
Polygon -6459832 true false 163 139 175 138 178 142 178 151 177 158 171 165 164 164 163 163 163 139
Polygon -1 true false 232 145 263 134 286 145 285 164 268 159 243 167 266 176 279 191 270 206 258 195 229 192 214 190 220 140 231 146
Line -2674135 true 246 161 265 153
Line -2674135 true 244 158 263 150
Line -2674135 true 222 189 251 191
Line -2674135 true 221 185 251 188
Polygon -2674135 true true 286 144 285 125 291 122 297 125 298 167 283 164 286 141
Polygon -2674135 true true 280 191 290 177 294 191 284 211 271 205 279 190
Polygon -6459832 true false 174 160 170 164 190 161 194 152 199 130 196 122 182 123 177 142 176 161
Polygon -6459832 true false 180 130 182 110 195 108 197 131 182 124
Line -1 false 179 121 171 133
Line -1 false 173 124 178 129
Line -1 false 169 127 175 131
Circle -2674135 true true 177 93 22
Polygon -6459832 true false 150 129 142 60 148 54 151 53 157 53 157 56 161 68 166 98 162 131 152 129
Circle -2674135 true true 135 42 24
Line -1 false 146 138 158 145
Line -1 false 158 144 144 149
Line -1 false 145 149 157 156
Line -1 false 157 157 146 162
Polygon -1184463 true false 6 136 7 166 35 166 35 191 49 150 37 119 33 137 6 138

dback
true
1
Circle -2674135 true true 161 108 83
Polygon -6459832 true false 208 108 204 146 196 150 187 152 163 146 163 143 163 139 163 136 163 134 164 131 170 123 173 119 176 116 185 111 196 108 206 107 207 109
Circle -1 true false 192 148 8
Line -1 false 175 118 197 152
Line -1 false 163 137 194 149
Line -1 false 174 118 164 136
Line -1 false 184 134 181 143
Line -1 false 168 127 182 138
Line -1 false 205 145 186 134
Circle -16777216 true false 194 114 10
Polygon -2674135 true true 163 141 162 164 158 171 149 178 145 178 138 173 136 159 137 147 136 132 142 131 151 128 161 141
Line -1 false 163 162 162 141
Rectangle -1 false false 144 146 152 153
Rectangle -1 false false 151 145 158 152
Polygon -2674135 true true 141 130 103 137 86 140 83 140 68 144 71 194 141 177 139 129
Line -1 false 138 131 138 169
Polygon -6459832 true false 137 139 125 138 122 142 122 151 123 158 129 165 136 164 137 163 137 139
Polygon -1 true false 68 145 37 134 14 145 15 164 32 159 57 167 34 176 21 191 30 206 42 195 71 192 86 190 80 140 69 146
Line -2674135 true 54 161 35 153
Line -2674135 true 56 158 37 150
Line -2674135 true 78 189 49 191
Line -2674135 true 79 185 49 188
Polygon -2674135 true true 14 144 15 125 9 122 3 125 2 167 17 164 14 141
Polygon -2674135 true true 20 191 10 177 6 191 16 211 29 205 21 190
Polygon -6459832 true false 127 141 121 115 115 104 103 105 98 112 109 157 132 161
Polygon -6459832 true false 149 125 141 103 131 102 129 105 127 115 131 121 132 132 147 128
Circle -2674135 true true 121 89 20
Circle -2674135 true true 96 92 20

dlineman
true
1
Polygon -2674135 true true 184 63 201 77 206 82 209 86 214 92 219 110 220 118 220 126 219 136 218 139 214 142 208 146 198 150 189 153 186 155 176 155 174 155 170 153 165 153 160 152 151 145 148 144 145 140 142 134 139 127 137 121 137 117 135 117 133 108 131 95 133 91 164 115 174 107 177 102 178 94 172 71 182 64 199 74
Circle -1 true false 165 110 11
Polygon -6459832 true false 174 71 133 91 164 114 168 112 175 109 179 99 172 72
Line -1 false 154 80 171 112
Line -1 false 155 85 142 95
Line -1 false 160 94 152 103
Line -1 false 148 91 156 99
Line -1 false 135 91 166 115
Circle -16777216 true false 163 81 11
Polygon -6459832 true false 117 95 109 89 105 86 102 86 100 87 98 87 98 84 97 82 92 82 78 78 59 70 50 66 43 84 70 93 82 96 85 102 87 102 90 101 96 106 104 112 110 112 121 111 119 97 109 89
Circle -7500403 true false 30 59 24
Polygon -2674135 true true 121 88 159 168 158 181 157 188 151 194 146 197 137 197 132 194 129 190 128 182 128 176 133 175 93 200 84 200 58 127 112 113 105 102 105 96 106 89 113 82 122 87 125 94
Polygon -2674135 false true 106 92 103 105 102 108 104 110 106 114 113 113 119 111 117 102 115 95 104 97
Polygon -2674135 true true 104 98 102 107 106 116 114 115 119 113 117 108 110 98 104 100
Polygon -6459832 true false 129 181 122 171 114 157 115 153 116 151 108 149 105 149 101 149 101 154 101 158 101 162 105 173 110 182 113 183 119 188 120 196 125 199 134 199 143 197 133 195 129 193 131 191 133 195 127 179
Polygon -6459832 true false 129 191 133 197 133 194 131 192 132 193 130 193 134 190
Polygon -6459832 true false 109 178 122 195 125 189 115 181 112 182
Circle -7500403 true false 99 132 24
Polygon -6459832 true false 110 180 122 197 133 200 137 198 121 182 112 182
Polygon -1 true false 59 127 37 107 14 126 9 133 12 142 16 151 24 146 30 142 34 137 42 138 48 152 57 159 60 159 61 168 67 176 45 174 32 175 27 179 20 184 27 200 28 204 37 197 58 197 65 197 68 203 73 203 85 201 58 124
Polygon -1 true false 56 160 60 177 70 178 65 162 56 155 56 163
Line -2674135 true 36 113 14 132
Line -2674135 true 57 181 40 180
Line -2674135 true 42 180 26 187
Line -2674135 true 36 118 17 135
Line -2674135 true 56 185 43 184
Line -2674135 true 42 185 29 190
Line -2674135 true 36 114 54 125
Line -2674135 true 36 120 52 129
Polygon -7500403 true false 10 136 8 120 2 122 1 140 6 153 7 157 16 151 10 136
Polygon -7500403 true false 20 185 17 171 9 171 10 176 10 187 10 199 15 205 18 207 29 204 19 182
Line -1 false 156 176 150 162
Line -1 false 150 164 143 169
Line -1 false 141 170 148 179
Line -1 false 148 179 140 185
Line -1 false 137 178 141 184
Line -1 false 156 181 144 190
Line -1 false 124 101 120 91
Line -1 false 117 92 114 95
Line -1 false 113 95 119 105
Line -1 false 118 106 112 110
Line -1 false 108 100 112 111
Line -1 false 126 106 113 115
Line -1 false 131 140 124 122
Line -1 false 124 123 107 129
Line -1 false 106 128 109 132
Line -1 false 101 155 97 156
Line -1 false 92 138 97 156
Line -1 false 136 154 118 163
Line -6459832 false 105 172 101 174
Line -6459832 false 137 124 146 141
Polygon -6459832 true false 136 122 147 143 148 140 139 123 137 122
Line -1 false 155 81 171 72

dlineman(main)
true
1
Polygon -2674135 true true 184 63 201 77 206 82 209 86 214 92 219 110 220 118 220 126 219 136 218 139 214 142 208 146 198 150 189 153 186 155 176 155 174 155 170 153 165 153 160 152 151 145 148 144 145 140 142 134 139 127 137 121 137 117 135 117 133 108 131 95 133 91 164 115 174 107 177 102 178 94 172 71 182 64 199 74
Circle -1 true false 165 110 11
Polygon -6459832 true false 174 71 133 91 164 114 168 112 175 109 179 99 172 72
Line -1 false 154 80 171 112
Line -1 false 155 85 142 95
Line -1 false 160 94 152 103
Line -1 false 148 91 156 99
Line -1 false 135 91 166 115
Circle -16777216 true false 163 81 11
Polygon -6459832 true false 117 95 109 89 105 86 102 86 100 87 98 87 98 84 97 82 92 82 78 78 59 70 50 66 43 84 70 93 82 96 85 102 87 102 90 101 96 106 104 112 110 112 121 111 119 97 109 89
Circle -7500403 true false 30 59 24
Polygon -2674135 true true 121 88 159 168 158 181 157 188 151 194 146 197 137 197 132 194 129 190 128 182 128 176 133 175 93 200 84 200 58 127 112 113 105 102 105 96 106 89 113 82 122 87 125 94
Polygon -2674135 false true 106 92 103 105 102 108 104 110 106 114 113 113 119 111 117 102 115 95 104 97
Polygon -2674135 true true 104 98 102 107 106 116 114 115 119 113 117 108 110 98 104 100
Polygon -6459832 true false 129 181 122 171 114 157 115 153 116 151 108 149 105 149 101 149 101 154 101 158 101 162 105 173 110 182 113 183 119 188 120 196 125 199 134 199 143 197 133 195 129 193 131 191 133 195 127 179
Polygon -6459832 true false 129 191 133 197 133 194 131 192 132 193 130 193 134 190
Polygon -6459832 true false 109 178 122 195 125 189 115 181 112 182
Circle -7500403 true false 99 132 24
Polygon -6459832 true false 110 180 122 197 133 200 137 198 121 182 112 182
Polygon -1 true false 59 127 37 107 14 126 9 133 12 142 16 151 24 146 30 142 34 137 42 138 48 152 57 159 60 159 61 168 67 176 45 174 32 175 27 179 20 184 27 200 28 204 37 197 58 197 65 197 68 203 73 203 85 201 58 124
Polygon -1 true false 56 160 60 177 70 178 65 162 56 155 56 163
Line -2674135 true 36 113 14 132
Line -2674135 true 57 181 40 180
Line -2674135 true 42 180 26 187
Line -2674135 true 36 118 17 135
Line -2674135 true 56 185 43 184
Line -2674135 true 42 185 29 190
Line -2674135 true 36 114 54 125
Line -2674135 true 36 120 52 129
Polygon -7500403 true false 10 136 8 120 2 122 1 140 6 153 7 157 16 151 10 136
Polygon -7500403 true false 20 185 17 171 9 171 10 176 10 187 10 199 15 205 18 207 29 204 19 182
Line -1 false 156 176 150 162
Line -1 false 150 164 143 169
Line -1 false 141 170 148 179
Line -1 false 148 179 140 185
Line -1 false 137 178 141 184
Line -1 false 156 181 144 190
Line -1 false 124 101 120 91
Line -1 false 117 92 114 95
Line -1 false 113 95 119 105
Line -1 false 118 106 112 110
Line -1 false 108 100 112 111
Line -1 false 126 106 113 115
Line -1 false 131 140 124 122
Line -1 false 124 123 107 129
Line -1 false 106 128 109 132
Line -1 false 101 155 97 156
Line -1 false 92 138 97 156
Line -1 false 136 154 118 163
Line -6459832 false 105 172 101 174
Line -6459832 false 137 124 146 141
Polygon -6459832 true false 136 122 147 143 148 140 139 123 137 122
Line -1 false 155 81 171 72

football
false
14
Polygon -7500403 false false 301 133 301 164 275 192 229 224 167 236 137 236 74 224 30 194 3 162 2 138 30 104 76 74 134 62 168 62 228 74 274 105
Polygon -6459832 true false 300 150 300 165 270 195 225 225 163 236 134 236 75 225 30 195 2 162 2 140 30 105 75 75 136 63 165 63 225 75 270 105 300 135
Line -16777216 true 300 155 5 155
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

fullback
true
1
Polygon -2674135 true true 179 88 141 168 142 181 143 188 149 194 154 197 163 197 168 194 171 190 172 182 172 176 167 175 207 200 216 200 242 127 188 113 195 102 195 96 194 89 187 82 178 87 175 94
Line -1 false 171 142 217 164
Line -1 false 183 163 192 144
Polygon -2674135 true true 116 63 99 77 94 82 91 86 86 92 81 110 80 118 80 126 81 136 82 139 86 142 92 146 102 150 111 153 114 155 124 155 126 155 130 153 135 153 140 152 149 145 152 144 155 140 158 134 161 127 163 121 163 117 165 117 167 108 169 95 167 91 136 115 126 107 123 102 122 94 128 71 118 64 101 74
Circle -1 true false 124 110 11
Polygon -6459832 true false 126 71 167 91 136 114 132 112 125 109 121 99 128 72
Line -1 false 146 80 129 112
Line -1 false 145 85 158 95
Line -1 false 140 94 148 103
Line -1 false 152 91 144 99
Line -1 false 165 91 134 115
Circle -16777216 true false 126 81 11
Polygon -6459832 true false 183 95 191 89 195 86 198 86 200 87 202 87 202 84 203 82 208 82 222 78 241 70 250 66 257 84 230 93 218 96 215 102 213 102 210 101 204 106 196 112 190 112 179 111 181 97 191 89
Circle -7500403 true false 246 59 24
Polygon -2674135 false true 194 92 197 105 198 108 196 110 194 114 187 113 181 111 183 102 185 95 196 97
Polygon -2674135 true true 196 98 198 107 194 116 186 115 181 113 183 108 190 98 196 100
Polygon -6459832 true false 171 181 178 171 186 157 185 153 184 151 192 149 195 149 199 149 199 154 199 158 199 162 195 173 190 182 187 183 181 188 180 196 175 199 166 199 157 197 167 195 171 193 169 191 167 195 173 179
Polygon -6459832 true false 171 191 167 197 167 194 169 192 168 193 170 193 166 190
Polygon -6459832 true false 191 178 178 195 175 189 185 181 188 182
Polygon -6459832 true false 190 180 178 197 167 200 163 198 179 182 188 182
Polygon -1 true false 241 127 263 107 286 126 291 133 288 142 284 151 276 146 270 142 266 137 258 138 252 152 243 159 240 159 239 168 233 176 255 174 268 175 273 179 280 184 273 200 272 204 263 197 242 197 235 197 232 203 227 203 215 201 242 124
Polygon -1 true false 244 160 240 177 230 178 235 162 244 155 244 163
Line -2674135 true 264 113 286 132
Line -2674135 true 243 181 260 180
Line -2674135 true 258 180 274 187
Line -2674135 true 264 118 283 135
Line -2674135 true 244 185 257 184
Line -2674135 true 258 185 271 190
Line -2674135 true 264 114 246 125
Line -2674135 true 264 120 248 129
Polygon -7500403 true false 290 136 292 120 298 122 299 140 294 153 293 157 284 151 290 136
Polygon -7500403 true false 280 185 283 171 291 171 290 176 290 187 290 199 285 205 282 207 271 204 281 182
Line -1 false 164 154 182 163
Line -6459832 false 195 172 199 174
Line -6459832 false 163 124 154 141
Polygon -6459832 true false 164 122 153 143 152 140 161 123 163 122
Line -1 false 146 81 129 72
Line -1 false 87 131 121 147
Line -1 false 87 133 96 113
Line -1 false 97 137 106 117
Line -1 false 144 181 151 187
Line -1 false 150 187 152 180
Line -1 false 144 177 164 188
Polygon -1 false false 152 163 168 169 162 179 150 176 154 163
Polygon -1 false false 181 85 197 91 191 101 179 98 183 85
Line -1 false 172 111 181 116
Line -1 false 181 117 185 107
Line -1 false 176 106 192 114
Polygon -1 false false 177 134 222 154 229 132 185 117 178 137
Circle -7500403 true false 177 132 24

kicker
true
1
Polygon -6459832 true false 171 123 177 140 171 157 160 157 158 131 173 125
Polygon -2674135 true true 172 143 154 142 119 144 112 144 107 144 104 143 103 187 103 194 102 199 150 198 151 139 143 149
Circle -2674135 true true 169 118 86
Polygon -6459832 true false 215 120 215 159 207 163 197 165 173 154 168 151 174 139 178 133 182 128 193 122 199 119 213 117 217 118 214 142
Circle -16777216 true false 206 123 7
Circle -1 true false 199 162 11
Line -1 false 187 124 206 165
Line -1 false 173 143 205 164
Line -1 false 193 138 183 151
Line -1 false 186 123 173 142
Line -1 false 178 134 188 144
Line -1 false 215 155 202 155
Polygon -2674135 true true 170 153 171 185 164 199 158 201 154 201 150 200 146 195 145 185 145 172 145 157 145 148 146 140 150 138 154 139 159 142 168 149 169 158
Line -1 false 168 152 173 185
Line -1 false 161 156 163 165
Line -1 false 162 165 156 169
Line -1 false 155 160 157 168
Line -1 false 156 161 147 164
Line -1 false 165 176 152 182
Polygon -2674135 true true 174 137 168 122 176 118 184 115 186 124 175 131 172 137
Polygon -2674135 true true 181 127 174 137 172 129 177 131
Line -1 false 148 166 149 171
Line -1 false 146 146 146 195
Polygon -1 false false 168 158 167 149 153 138 145 138 146 148 145 194 153 202 163 200 170 181 173 184
Polygon -1 true false 105 145 87 134 69 122 31 123 31 150 71 159 73 180 107 199 104 144
Polygon -2674135 true true 161 143 170 122 129 124 121 122 108 144 160 144
Line -1 false 160 146 104 148
Line -1 false 145 198 105 200
Line -6459832 false 102 146 105 200
Polygon -6459832 true false 175 137 167 152 163 143 167 124 174 136 170 146
Line -1 false 154 128 152 134
Line -1 false 152 135 140 135
Line -1 false 140 130 139 136
Line -1 false 140 132 134 130
Line -1 false 134 129 133 136
Line -1 false 149 142 126 142
Polygon -1 true false 122 119 91 96 37 94 36 115 81 118 96 142 110 145 121 121
Line -2674135 true 94 103 115 118
Line -2674135 true 111 120 92 106
Line -2674135 true 85 99 47 99
Line -2674135 true 85 102 47 102
Line -2674135 true 97 186 77 178
Line -2674135 true 98 183 78 175
Line -2674135 true 66 155 37 149
Line -2674135 true 67 152 38 146
Polygon -6459832 true false 145 160 135 153 126 153 119 161 96 132 88 134 104 165 112 179 118 183 127 184 137 184 148 183 139 155
Polygon -6459832 true false 137 157 145 156 145 174 141 171 139 156
Polygon -6459832 false false 175 120 162 111 156 117 155 121 171 120
Polygon -6459832 true false 174 120 161 109 155 122 172 121
Polygon -6459832 true false 162 109 139 109 130 110 124 108 120 105 117 102 111 99 108 99 107 109 118 120 131 120 156 126 157 123
Circle -7500403 true false 98 94 20
Circle -7500403 true false 80 126 20
Polygon -7500403 true false 36 114 39 79 32 74 26 79 20 92 19 102 20 106 23 111 26 115 35 115
Polygon -7500403 true false 31 150 34 115 27 110 21 115 15 128 14 138 15 142 18 147 21 151 30 151

linebacker
true
1
Polygon -6459832 true false 171 123 177 140 171 157 160 157 158 131 173 125
Polygon -2674135 true true 172 143 154 142 119 144 112 144 107 144 104 143 103 187 103 194 102 199 150 198 151 139 143 149
Circle -2674135 true true 169 118 86
Polygon -6459832 true false 215 120 215 159 207 163 197 165 173 154 168 151 174 139 178 133 182 128 193 122 199 119 213 117 217 118 214 142
Circle -16777216 true false 206 123 7
Circle -1 true false 199 162 11
Line -1 false 187 124 206 165
Line -1 false 173 143 205 164
Line -1 false 193 138 183 151
Line -1 false 186 123 173 142
Line -1 false 178 134 188 144
Line -1 false 215 155 202 155
Polygon -2674135 true true 170 153 171 185 164 199 158 201 154 201 150 200 146 195 145 185 145 172 145 157 145 148 146 140 150 138 154 139 159 142 168 149 169 158
Line -1 false 168 152 173 185
Line -1 false 161 156 163 165
Line -1 false 162 165 156 169
Line -1 false 155 160 157 168
Line -1 false 156 161 147 164
Line -1 false 165 176 152 182
Polygon -2674135 true true 174 137 168 122 176 118 184 115 186 124 175 131 172 137
Polygon -2674135 true true 181 127 174 137 172 129 177 131
Line -1 false 148 166 149 171
Line -1 false 146 146 146 195
Polygon -1 false false 168 158 167 149 153 138 145 138 146 148 145 194 153 202 163 200 170 181 173 184
Polygon -1 true false 105 145 87 134 69 122 31 123 31 150 71 159 73 180 107 199 104 144
Polygon -2674135 true true 161 143 170 122 129 124 121 122 108 144 160 144
Line -1 false 160 146 104 148
Line -1 false 145 198 105 200
Line -6459832 false 102 146 105 200
Polygon -6459832 true false 175 137 167 152 163 143 167 124 174 136 170 146
Line -1 false 154 128 152 134
Line -1 false 152 135 140 135
Line -1 false 140 130 139 136
Line -1 false 140 132 134 130
Line -1 false 134 129 133 136
Line -1 false 149 142 126 142
Polygon -1 true false 122 119 91 96 37 94 36 115 81 118 96 142 110 145 121 121
Line -2674135 true 94 103 115 118
Line -2674135 true 111 120 92 106
Line -2674135 true 85 99 47 99
Line -2674135 true 85 102 47 102
Line -2674135 true 97 186 77 178
Line -2674135 true 98 183 78 175
Line -2674135 true 66 155 37 149
Line -2674135 true 67 152 38 146
Polygon -6459832 true false 145 160 135 153 126 153 119 161 96 132 88 134 104 165 112 179 118 183 127 184 137 184 148 183 139 155
Polygon -6459832 true false 137 157 145 156 145 174 141 171 139 156
Polygon -6459832 false false 175 120 162 111 156 117 155 121 171 120
Polygon -6459832 true false 174 120 161 109 155 122 172 121
Polygon -6459832 true false 162 109 139 109 130 110 124 108 120 105 117 102 111 99 108 99 107 109 118 120 131 120 156 126 157 123
Circle -7500403 true false 98 94 20
Circle -7500403 true false 80 126 20
Polygon -7500403 true false 36 114 39 79 32 74 26 79 20 92 19 102 20 106 23 111 26 115 35 115
Polygon -7500403 true false 31 150 34 115 27 110 21 115 15 128 14 138 15 142 18 147 21 151 30 151

lineman
true
1
Polygon -2674135 true true 116 237 99 223 94 218 91 214 86 208 81 190 80 182 80 174 81 164 82 161 86 158 92 154 102 150 111 147 114 145 124 145 126 145 130 147 135 147 140 148 149 155 152 156 155 160 158 166 161 173 163 179 163 183 165 183 167 192 169 205 167 209 136 185 126 193 123 198 122 206 128 229 118 236 101 226
Circle -1 true false 124 179 11
Polygon -6459832 true false 126 229 167 209 136 186 132 188 125 191 121 201 128 228
Line -1 false 146 220 129 188
Line -1 false 145 215 158 205
Line -1 false 140 206 148 197
Line -1 false 152 209 144 201
Line -1 false 165 209 134 185
Circle -16777216 true false 126 208 11
Polygon -6459832 true false 183 205 191 211 195 214 198 214 200 213 202 213 202 216 203 218 208 218 222 222 241 230 250 234 257 216 230 207 218 204 215 198 213 198 210 199 204 194 196 188 190 188 179 189 181 203 191 211
Circle -7500403 true false 246 217 24
Polygon -2674135 true true 179 212 141 132 142 119 143 112 149 106 154 103 163 103 168 106 171 110 172 118 172 124 167 125 207 100 216 100 242 173 188 187 195 198 195 204 194 211 187 218 178 213 175 206
Polygon -2674135 false true 194 208 197 195 198 192 196 190 194 186 187 187 181 189 183 198 185 205 196 203
Polygon -2674135 true true 196 202 198 193 194 184 186 185 181 187 183 192 190 202 196 200
Polygon -6459832 true false 171 119 178 129 186 143 185 147 184 149 192 151 195 151 199 151 199 146 199 142 199 138 195 127 190 118 187 117 181 112 180 104 175 101 166 101 157 103 167 105 171 107 169 109 167 105 173 121
Polygon -6459832 true false 171 109 167 103 167 106 169 108 168 107 170 107 166 110
Polygon -6459832 true false 191 122 178 105 175 111 185 119 188 118
Circle -7500403 true false 177 144 24
Polygon -6459832 true false 190 120 178 103 167 100 163 102 179 118 188 118
Polygon -1 true false 241 173 263 193 286 174 291 167 288 158 284 149 276 154 270 158 266 163 258 162 252 148 243 141 240 141 239 132 233 124 255 126 268 125 273 121 280 116 273 100 272 96 263 103 242 103 235 103 232 97 227 97 215 99 242 176
Polygon -1 true false 244 140 240 123 230 122 235 138 244 145 244 137
Line -2674135 true 264 187 286 168
Line -2674135 true 243 119 260 120
Line -2674135 true 258 120 274 113
Line -2674135 true 264 182 283 165
Line -2674135 true 244 115 257 116
Line -2674135 true 258 115 271 110
Line -2674135 true 264 186 246 175
Line -2674135 true 264 180 248 171
Polygon -7500403 true false 290 164 292 180 298 178 299 160 294 147 293 143 284 149 290 164
Polygon -7500403 true false 280 115 283 129 291 129 290 124 290 113 290 101 285 95 282 93 271 96 281 118
Line -1 false 144 124 150 138
Line -1 false 150 136 157 131
Line -1 false 159 130 152 121
Line -1 false 152 121 160 115
Line -1 false 163 122 159 116
Line -1 false 144 119 156 110
Line -1 false 176 199 180 209
Line -1 false 183 208 186 205
Line -1 false 187 205 181 195
Line -1 false 182 194 188 190
Line -1 false 192 200 188 189
Line -1 false 174 194 187 185
Line -1 false 169 160 176 178
Line -1 false 176 177 193 171
Line -1 false 194 172 191 168
Line -1 false 199 145 203 144
Line -1 false 208 162 203 144
Line -1 false 164 146 182 137
Line -6459832 false 195 128 199 126
Line -6459832 false 163 176 154 159
Polygon -6459832 true false 164 178 153 157 152 160 161 177 163 178
Line -1 false 146 219 129 228

lineman(o/r)
true
1
Polygon -2674135 true true 116 63 99 77 94 82 91 86 86 92 81 110 80 118 80 126 81 136 82 139 86 142 92 146 102 150 111 153 114 155 124 155 126 155 130 153 135 153 140 152 149 145 152 144 155 140 158 134 161 127 163 121 163 117 165 117 167 108 169 95 167 91 136 115 126 107 123 102 122 94 128 71 118 64 101 74
Circle -1 true false 124 110 11
Polygon -6459832 true false 126 71 167 91 136 114 132 112 125 109 121 99 128 72
Line -1 false 146 80 129 112
Line -1 false 145 85 158 95
Line -1 false 140 94 148 103
Line -1 false 152 91 144 99
Line -1 false 165 91 134 115
Circle -16777216 true false 126 81 11
Polygon -6459832 true false 183 95 191 89 195 86 198 86 200 87 202 87 202 84 203 82 208 82 222 78 241 70 250 66 257 84 230 93 218 96 215 102 213 102 210 101 204 106 196 112 190 112 179 111 181 97 191 89
Circle -7500403 true false 246 59 24
Polygon -2674135 true true 179 88 141 168 142 181 143 188 149 194 154 197 163 197 168 194 171 190 172 182 172 176 167 175 207 200 216 200 242 127 188 113 195 102 195 96 194 89 187 82 178 87 175 94
Polygon -2674135 false true 194 92 197 105 198 108 196 110 194 114 187 113 181 111 183 102 185 95 196 97
Polygon -2674135 true true 196 98 198 107 194 116 186 115 181 113 183 108 190 98 196 100
Polygon -6459832 true false 171 181 178 171 186 157 185 153 184 151 192 149 195 149 199 149 199 154 199 158 199 162 195 173 190 182 187 183 181 188 180 196 175 199 166 199 157 197 167 195 171 193 169 191 167 195 173 179
Polygon -6459832 true false 171 191 167 197 167 194 169 192 168 193 170 193 166 190
Polygon -6459832 true false 191 178 178 195 175 189 185 181 188 182
Circle -7500403 true false 177 132 24
Polygon -6459832 true false 190 180 178 197 167 200 163 198 179 182 188 182
Polygon -1 true false 241 127 263 107 286 126 291 133 288 142 284 151 276 146 270 142 266 137 258 138 252 152 243 159 240 159 239 168 233 176 255 174 268 175 273 179 280 184 273 200 272 204 263 197 242 197 235 197 232 203 227 203 215 201 242 124
Polygon -1 true false 244 160 240 177 230 178 235 162 244 155 244 163
Line -2674135 true 264 113 286 132
Line -2674135 true 243 181 260 180
Line -2674135 true 258 180 274 187
Line -2674135 true 264 118 283 135
Line -2674135 true 244 185 257 184
Line -2674135 true 258 185 271 190
Line -2674135 true 264 114 246 125
Line -2674135 true 264 120 248 129
Polygon -7500403 true false 290 136 292 120 298 122 299 140 294 153 293 157 284 151 290 136
Polygon -7500403 true false 280 185 283 171 291 171 290 176 290 187 290 199 285 205 282 207 271 204 281 182
Line -1 false 144 176 150 162
Line -1 false 150 164 157 169
Line -1 false 159 170 152 179
Line -1 false 152 179 160 185
Line -1 false 163 178 159 184
Line -1 false 144 181 156 190
Line -1 false 176 101 180 91
Line -1 false 183 92 186 95
Line -1 false 187 95 181 105
Line -1 false 182 106 188 110
Line -1 false 192 100 188 111
Line -1 false 174 106 187 115
Line -1 false 169 140 176 122
Line -1 false 176 123 193 129
Line -1 false 194 128 191 132
Line -1 false 199 155 203 156
Line -1 false 208 138 203 156
Line -1 false 164 154 182 163
Line -6459832 false 195 172 199 174
Line -6459832 false 163 124 154 141
Polygon -6459832 true false 164 122 153 143 152 140 161 123 163 122
Line -1 false 146 81 129 72

linemanko
true
1
Polygon -2674135 true true 116 63 99 77 94 82 91 86 86 92 81 110 80 118 80 126 81 136 82 139 86 142 92 146 102 150 111 153 114 155 124 155 126 155 130 153 135 153 140 152 149 145 152 144 155 140 158 134 161 127 163 121 163 117 165 117 167 108 169 95 167 91 136 115 126 107 123 102 122 94 128 71 118 64 101 74
Circle -1 true false 124 110 11
Polygon -6459832 true false 126 71 167 91 136 114 132 112 125 109 121 99 128 72
Line -1 false 146 80 129 112
Line -1 false 145 85 158 95
Line -1 false 140 94 148 103
Line -1 false 152 91 144 99
Line -1 false 165 91 134 115
Circle -16777216 true false 126 81 11
Polygon -6459832 true false 183 95 191 89 195 86 198 86 200 87 202 87 202 84 203 82 208 82 222 78 241 70 250 66 257 84 230 93 218 96 215 102 213 102 210 101 204 106 196 112 190 112 179 111 181 97 191 89
Circle -7500403 true false 246 59 24
Polygon -2674135 true true 179 88 141 168 142 181 143 188 149 194 154 197 163 197 168 194 171 190 172 182 172 176 167 175 207 200 216 200 242 127 188 113 195 102 195 96 194 89 187 82 178 87 175 94
Polygon -2674135 false true 194 92 197 105 198 108 196 110 194 114 187 113 181 111 183 102 185 95 196 97
Polygon -2674135 true true 196 98 198 107 194 116 186 115 181 113 183 108 190 98 196 100
Polygon -6459832 true false 171 181 178 171 186 157 185 153 184 151 192 149 195 149 199 149 199 154 199 158 199 162 195 173 190 182 187 183 181 188 180 196 175 199 166 199 157 197 167 195 171 193 169 191 167 195 173 179
Polygon -6459832 true false 171 191 167 197 167 194 169 192 168 193 170 193 166 190
Polygon -6459832 true false 191 178 178 195 175 189 185 181 188 182
Circle -7500403 true false 177 132 24
Polygon -6459832 true false 190 180 178 197 167 200 163 198 179 182 188 182
Polygon -1 true false 241 127 263 107 286 126 291 133 288 142 284 151 276 146 270 142 266 137 258 138 252 152 243 159 240 159 239 168 233 176 255 174 268 175 273 179 280 184 273 200 272 204 263 197 242 197 235 197 232 203 227 203 215 201 242 124
Polygon -1 true false 244 160 240 177 230 178 235 162 244 155 244 163
Line -2674135 true 264 113 286 132
Line -2674135 true 243 181 260 180
Line -2674135 true 258 180 274 187
Line -2674135 true 264 118 283 135
Line -2674135 true 244 185 257 184
Line -2674135 true 258 185 271 190
Line -2674135 true 264 114 246 125
Line -2674135 true 264 120 248 129
Polygon -7500403 true false 290 136 292 120 298 122 299 140 294 153 293 157 284 151 290 136
Polygon -7500403 true false 280 185 283 171 291 171 290 176 290 187 290 199 285 205 282 207 271 204 281 182
Line -1 false 144 176 150 162
Line -1 false 150 164 157 169
Line -1 false 159 170 152 179
Line -1 false 152 179 160 185
Line -1 false 163 178 159 184
Line -1 false 144 181 156 190
Line -1 false 176 101 180 91
Line -1 false 183 92 186 95
Line -1 false 187 95 181 105
Line -1 false 182 106 188 110
Line -1 false 192 100 188 111
Line -1 false 174 106 187 115
Line -1 false 169 140 176 122
Line -1 false 176 123 193 129
Line -1 false 194 128 191 132
Line -1 false 199 155 203 156
Line -1 false 208 138 203 156
Line -1 false 164 154 182 163
Line -6459832 false 195 172 199 174
Line -6459832 false 163 124 154 141
Polygon -6459832 true false 164 122 153 143 152 140 161 123 163 122
Line -1 false 146 81 129 72

noballquarterback
true
1
Polygon -2674135 true true 113 78 130 92 135 97 138 101 143 107 148 125 149 133 149 141 148 151 147 154 143 157 137 161 127 165 118 168 115 170 105 170 103 170 99 168 94 168 89 167 80 160 77 159 74 155 71 149 68 142 66 136 66 132 64 132 62 123 60 110 62 106 93 130 103 122 106 117 107 109 101 86 111 79 128 89
Circle -1 true false 103 111 11
Polygon -6459832 true false 102 87 94 88 92 88 91 90 82 91 78 97 70 99 67 104 64 107 94 132 105 122 105 117 107 108 101 87
Circle -16777216 true false 80 109 10
Line -1 false 84 91 106 113
Line -1 false 83 92 99 86
Line -1 false 93 90 110 114
Line -1 false 106 113 89 126
Polygon -2674135 true true 143 112 153 93 168 113 172 123 172 134 172 150 167 156 162 164 155 164 152 163 147 159 143 157 149 134 146 125 144 111 150 100
Line -1 false 144 156 145 108
Line -1 false 155 128 148 131
Line -1 false 149 133 163 133
Line -1 false 165 129 166 137
Line -13345367 false 105 143 125 121
Line -13345367 false 106 143 116 153
Line -13345367 false 117 133 126 142
Line -13345367 false 127 142 117 152
Circle -7500403 true false 150 48 23
Polygon -6459832 true false 165 69 170 97 171 100 173 112 169 117 170 120 172 131 173 138 172 145 182 145 185 145 191 141 192 134 193 125 193 118 194 101 191 92 188 79 182 70 174 64 173 63 165 70
Polygon -2674135 true true 193 93 217 90 225 100 226 109 226 113 226 119 228 130 228 139 228 152 227 160 227 168 222 168 213 169 199 169 191 167 161 164 172 144 185 144 192 129 192 120 191 102 192 93 200 93
Line -1 false 171 142 162 161
Polygon -2674135 true true 153 95 171 94 173 105 173 107 173 111 172 113 170 114 167 111 153 94
Polygon -1 true false 220 91 226 107 226 165 225 167 292 168 293 141 281 147 282 152 248 133 288 118 288 99 288 97 280 97 278 106 220 93 226 166
Polygon -7500403 true false 280 107 279 120 286 119 288 118 288 97 282 96 278 102 282 121
Polygon -7500403 true false 282 151 282 168 292 168 293 140 281 148 283 157
Line -2674135 true 244 163 273 163
Line -2674135 true 244 158 273 158
Line -2674135 true 246 131 271 121
Line -2674135 true 243 128 268 118

quarterback
true
1
Polygon -2674135 true true 113 78 130 92 135 97 138 101 143 107 148 125 149 133 149 141 148 151 147 154 143 157 137 161 127 165 118 168 115 170 105 170 103 170 99 168 94 168 89 167 80 160 77 159 74 155 71 149 68 142 66 136 66 132 64 132 62 123 60 110 62 106 93 130 103 122 106 117 107 109 101 86 111 79 128 89
Circle -1 true false 103 111 11
Polygon -6459832 true false 102 87 94 88 92 88 91 90 82 91 78 97 70 99 67 104 64 107 94 132 105 122 105 117 107 108 101 87
Circle -16777216 true false 80 109 10
Line -1 false 84 91 106 113
Line -1 false 83 92 99 86
Line -1 false 93 90 110 114
Line -1 false 106 113 89 126
Polygon -2674135 true true 143 112 153 93 168 113 172 123 172 134 172 150 167 156 162 164 155 164 152 163 147 159 143 157 149 134 146 125 144 111 150 100
Line -1 false 144 156 145 108
Line -1 false 155 128 148 131
Line -1 false 149 133 163 133
Line -1 false 165 129 166 137
Line -13345367 false 105 143 125 121
Line -13345367 false 106 143 116 153
Line -13345367 false 117 133 126 142
Line -13345367 false 127 142 117 152
Polygon -6459832 true false 151 163 148 164 137 196 130 196 121 197 115 195 108 193 101 189 100 184 103 180 105 175 116 176 122 176 128 178 128 179 129 181 133 181 135 174 135 173 134 172 134 170 135 164 140 157 142 157 149 159 149 161
Polygon -6459832 true false 155 164 151 177 151 183 150 189 147 192 145 197 140 200 137 195 148 160 156 163
Polygon -6459832 true false 162 163 155 192 152 200 144 196 148 169 155 162 162 162 163 164
Circle -7500403 true false 150 48 23
Circle -7500403 true false 95 174 23
Polygon -6459832 true false 83 182 84 204 87 212 92 215 94 218 97 218 100 215 103 210 104 201 105 192 105 177 100 172 90 168 85 170 84 179 84 185
Line -1 false 94 203 95 180
Line -1 false 93 188 99 188
Line -1 false 94 195 100 195
Line -1 false 93 201 97 200
Polygon -6459832 true false 165 69 170 97 171 100 173 112 169 117 170 120 172 131 173 138 172 145 182 145 185 145 191 141 192 134 193 125 193 118 194 101 191 92 188 79 182 70 174 64 173 63 165 70
Polygon -2674135 true true 193 93 217 90 225 100 226 109 226 113 226 119 228 130 228 139 228 152 227 160 227 168 222 168 213 169 199 169 191 167 161 164 172 144 185 144 192 129 192 120 191 102 192 93 200 93
Line -1 false 171 142 162 161
Polygon -2674135 true true 153 95 171 94 173 105 173 107 173 111 172 113 170 114 167 111 153 94
Polygon -1 true false 220 91 226 107 226 165 225 167 292 168 293 141 281 147 282 152 248 133 288 118 288 99 288 97 280 97 278 106 220 93 226 166
Polygon -7500403 true false 280 107 279 120 286 119 288 118 288 97 282 96 278 102 282 121
Polygon -7500403 true false 282 151 282 168 292 168 293 140 281 148 283 157
Line -2674135 true 244 163 273 163
Line -2674135 true 244 158 273 158
Line -2674135 true 246 131 271 121
Line -2674135 true 243 128 268 118

runningback
true
1
Polygon -6459832 true false 129 123 123 140 129 157 140 157 142 131 127 125
Polygon -2674135 true true 128 143 146 142 181 144 188 144 193 144 196 143 197 187 197 194 198 199 150 198 149 139 157 149
Circle -2674135 true true 45 118 86
Polygon -6459832 true false 85 120 85 159 93 163 103 165 127 154 132 151 126 139 122 133 118 128 107 122 101 119 87 117 83 118 86 142
Circle -16777216 true false 87 123 7
Circle -1 true false 90 162 11
Line -1 false 113 124 94 165
Line -1 false 127 143 95 164
Line -1 false 107 138 117 151
Line -1 false 114 123 127 142
Line -1 false 122 134 112 144
Line -1 false 85 155 98 155
Polygon -2674135 true true 130 153 129 185 136 199 142 201 146 201 150 200 154 195 155 185 155 172 155 157 155 148 154 140 150 138 146 139 141 142 132 149 131 158
Line -1 false 132 152 127 185
Line -1 false 139 156 137 165
Line -1 false 138 165 144 169
Line -1 false 145 160 143 168
Line -1 false 144 161 153 164
Line -1 false 135 176 148 182
Polygon -2674135 true true 126 137 132 122 124 118 116 115 114 124 125 131 128 137
Polygon -2674135 true true 119 127 126 137 128 129 123 131
Line -1 false 152 166 151 171
Line -1 false 154 146 154 195
Polygon -1 false false 132 158 133 149 147 138 155 138 154 148 155 194 147 202 137 200 130 181 127 184
Polygon -1 true false 195 145 213 134 231 122 269 123 269 150 229 159 227 180 193 199 196 144
Polygon -2674135 true true 139 143 130 122 171 124 179 122 192 144 140 144
Line -1 false 140 146 196 148
Line -1 false 155 198 195 200
Line -6459832 false 198 146 195 200
Polygon -6459832 true false 125 137 133 152 137 143 133 124 126 136 130 146
Line -1 false 146 128 148 134
Line -1 false 148 135 160 135
Line -1 false 160 130 161 136
Line -1 false 160 132 166 130
Line -1 false 166 129 167 136
Line -1 false 151 142 174 142
Polygon -1 true false 178 119 209 96 263 94 264 115 219 118 204 142 190 145 179 121
Line -2674135 true 206 103 185 118
Line -2674135 true 189 120 208 106
Line -2674135 true 215 99 253 99
Line -2674135 true 215 102 253 102
Line -2674135 true 203 186 223 178
Line -2674135 true 202 183 222 175
Line -2674135 true 234 155 263 149
Line -2674135 true 233 152 262 146
Polygon -6459832 true false 155 160 165 153 174 153 181 161 204 132 212 134 196 165 188 179 182 183 173 184 163 184 152 183 161 155
Polygon -6459832 true false 163 157 155 156 155 174 159 171 161 156
Polygon -6459832 false false 125 120 138 111 144 117 145 121 129 120
Polygon -6459832 true false 126 120 139 109 145 122 128 121
Polygon -6459832 true false 138 109 161 109 170 110 176 108 180 105 183 102 189 99 192 99 193 109 182 120 169 120 144 126 143 123
Circle -7500403 true false 182 94 20
Circle -7500403 true false 200 126 20
Polygon -7500403 true false 264 114 261 79 268 74 274 79 280 92 281 102 280 106 277 111 274 115 265 115
Polygon -7500403 true false 269 150 266 115 273 110 279 115 285 128 286 138 285 142 282 147 279 151 270 151

tightend
true
1
Polygon -2674135 true true 116 237 99 223 94 218 91 214 86 208 81 190 80 182 80 174 81 164 82 161 86 158 92 154 102 150 111 147 114 145 124 145 126 145 130 147 135 147 140 148 149 155 152 156 155 160 158 166 161 173 163 179 163 183 165 183 167 192 169 205 167 209 136 185 126 193 123 198 122 206 128 229 118 236 101 226
Circle -1 true false 124 179 11
Polygon -6459832 true false 126 229 167 209 136 186 132 188 125 191 121 201 128 228
Line -1 false 146 220 129 188
Line -1 false 145 215 158 205
Line -1 false 140 206 148 197
Line -1 false 152 209 144 201
Line -1 false 165 209 134 185
Circle -16777216 true false 126 208 11
Polygon -6459832 true false 183 205 191 211 195 214 198 214 200 213 202 213 202 216 203 218 208 218 222 222 241 230 250 234 257 216 230 207 218 204 215 198 213 198 210 199 204 194 196 188 190 188 179 189 181 203 191 211
Circle -7500403 true false 246 217 24
Polygon -2674135 true true 179 212 141 132 142 119 143 112 149 106 154 103 163 103 168 106 171 110 172 118 172 124 167 125 207 100 216 100 242 173 188 187 195 198 195 204 194 211 187 218 178 213 175 206
Polygon -2674135 false true 194 208 197 195 198 192 196 190 194 186 187 187 181 189 183 198 185 205 196 203
Polygon -2674135 true true 196 202 198 193 194 184 186 185 181 187 183 192 190 202 196 200
Polygon -6459832 true false 171 119 178 129 186 143 185 147 184 149 192 151 195 151 199 151 199 146 199 142 199 138 195 127 190 118 187 117 181 112 180 104 175 101 166 101 157 103 167 105 171 107 169 109 167 105 173 121
Polygon -6459832 true false 171 109 167 103 167 106 169 108 168 107 170 107 166 110
Polygon -6459832 true false 191 122 178 105 175 111 185 119 188 118
Circle -7500403 true false 177 144 24
Polygon -6459832 true false 190 120 178 103 167 100 163 102 179 118 188 118
Polygon -1 true false 241 173 263 193 286 174 291 167 288 158 284 149 276 154 270 158 266 163 258 162 252 148 243 141 240 141 239 132 233 124 255 126 268 125 273 121 280 116 273 100 272 96 263 103 242 103 235 103 232 97 227 97 215 99 242 176
Polygon -1 true false 244 140 240 123 230 122 235 138 244 145 244 137
Line -2674135 true 264 187 286 168
Line -2674135 true 243 119 260 120
Line -2674135 true 258 120 274 113
Line -2674135 true 264 182 283 165
Line -2674135 true 244 115 257 116
Line -2674135 true 258 115 271 110
Line -2674135 true 264 186 246 175
Line -2674135 true 264 180 248 171
Polygon -7500403 true false 290 164 292 180 298 178 299 160 294 147 293 143 284 149 290 164
Polygon -7500403 true false 280 115 283 129 291 129 290 124 290 113 290 101 285 95 282 93 271 96 281 118
Line -1 false 144 124 150 138
Line -1 false 150 136 157 131
Line -1 false 159 130 152 121
Line -1 false 152 121 160 115
Line -1 false 163 122 159 116
Line -1 false 144 119 156 110
Line -1 false 176 199 180 209
Line -1 false 183 208 186 205
Line -1 false 187 205 181 195
Line -1 false 182 194 188 190
Line -1 false 192 200 188 189
Line -1 false 174 194 187 185
Line -1 false 169 160 176 178
Line -1 false 176 177 193 171
Line -1 false 194 172 191 168
Line -1 false 199 145 203 144
Line -1 false 208 162 203 144
Line -1 false 164 146 182 137
Line -6459832 false 195 128 199 126
Line -6459832 false 163 176 154 159
Polygon -6459832 true false 164 178 153 157 152 160 161 177 163 178
Line -1 false 146 219 129 228

widereciever
true
1
Circle -2674135 true true 56 108 83
Polygon -6459832 true false 92 108 96 146 104 150 113 152 137 146 137 143 137 139 137 136 137 134 136 131 130 123 127 119 124 116 115 111 104 108 94 107 93 109
Circle -1 true false 100 148 8
Line -1 false 125 118 103 152
Line -1 false 137 137 106 149
Line -1 false 126 118 136 136
Line -1 false 116 134 119 143
Line -1 false 132 127 118 138
Line -1 false 95 145 114 134
Circle -16777216 true false 96 114 10
Polygon -2674135 true true 137 141 138 164 142 171 151 178 155 178 162 173 164 159 163 147 164 132 158 131 149 128 139 141
Line -1 false 137 162 138 141
Rectangle -1 false false 148 146 156 153
Rectangle -1 false false 142 145 149 152
Polygon -2674135 true true 159 130 197 137 214 140 217 140 232 144 229 194 159 177 161 129
Line -1 false 162 131 162 169
Polygon -6459832 true false 163 139 175 138 178 142 178 151 177 158 171 165 164 164 163 163 163 139
Polygon -1 true false 232 145 263 134 286 145 285 164 268 159 243 167 266 176 279 191 270 206 258 195 229 192 214 190 220 140 231 146
Line -2674135 true 246 161 265 153
Line -2674135 true 244 158 263 150
Line -2674135 true 222 189 251 191
Line -2674135 true 221 185 251 188
Polygon -2674135 true true 286 144 285 125 291 122 297 125 298 167 283 164 286 141
Polygon -2674135 true true 280 191 290 177 294 191 284 211 271 205 279 190
Polygon -6459832 true false 173 141 179 115 185 104 197 105 202 112 191 157 168 161
Polygon -6459832 true false 151 125 159 103 169 102 171 105 173 115 169 121 168 132 153 128
Circle -2674135 true true 159 89 20
Circle -2674135 true true 184 92 20

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
