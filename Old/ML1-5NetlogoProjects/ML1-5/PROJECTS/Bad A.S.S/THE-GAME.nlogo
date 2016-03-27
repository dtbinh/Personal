breed [hero]
breed [boat]
breed [cave1]
breed [athira]
breed [stephanie]
breed [crashes]
breed [waves]
breed [fishes]
breed [blankout]
breed [badass]
breed [trees tree]
breed [product]
breed [island]
breed [bally]
breed [book]
breed [phone]
breed [burger]
breed [bag]
breed [passcode]
globals [hshape pass have]


to vibrate
  repeat 3[
  set heading 0
  bk 1
  wait 0.1
  fd 1
  wait 0.1
  set heading 90
  fd 1
  wait 0.1
  set heading 270
  fd 2
  wait 0.1
  set heading 90
  fd 1
  ]
end

to flash [times]
  repeat times [
  create-blankout 1 [set shape "white-out" set size 50 wait .1 die wait .1]
  create-blankout 1 [set shape "black-out" set size 50 wait .1 die wait .1]
  ]
end

to credits
  reset
  flash 3
  wait 0.1
  create-badass 1[set shape "badassproduction" set size 15 setxy 0 6]
  wait 1
  create-product 1 [set shape "badassproduct" set size 10 setxy 0 -6]
  wait 1
  create-athira 1
                 ask athira [set shape "cat"
                             set size 5
                                 setxy -9 -9
                                 set label "Athira Sivan"]
                 wait 1
       create-stephanie 1 [set shape "dog"
                             set size 5
                                    setxy 9 -9
                                    set label "Stephanie Stettner"]
       wait 3
   flash 2
       reset
end

to setup
  reset
  opening
end

to reset
  ca
    resize-world -16 16 -16 16
    set-patch-size 12
end

 to opening
  display user-message "Haha Now you lost the game!"
  wait 1
  crt 1 [set shape "dot" setxy -5 0 set size 5]
  wait 1
  crt 1 [set shape "dot" setxy 0 0 set size 5]
  wait 1
  crt 1 [set shape "dot" setxy 5 0 set size 5]
  wait 1
  display user-message "Not really LOL. Let's start then"
  ask turtles with [shape = "dot"] [die]
  flash 3
  create-athira 1[set shape "thegame" set size 25 setxy 0 0]
  wait 1
  wait 1
  display user-message " Welcome to THE GAME"
  wait 1
  display user-message "Who art thou? A) Mr. Brown B) Student C) Alien Species"
  wait Time_in_seconds_to_choose_answer
       ifelse Answer_Choices = "Choice A" [set hshape "mr.brown"] 
            [ifelse Answer_Choices = "Choice B" [set hshape "student"] 
              [if Answer_Choices = "Choice C" [set hshape "alien"]]]     
  display user-message "Is it your first time playing? Choose Answer"
  wait Time_in_seconds_to_choose_answer
  ifelse Answer_Yes/No = "NO" [display user-message "Good luck MWAHAHAHA!"   wait 0.1
                                      ask athira [die] port_scene]
   [ wait 1 flash 3 display user-message "Read info tab And now go click that HALT button"]
end
  
to port_scene
  ask patches
  [if pycor > 0 or pycor = 0[set pcolor cyan]
    if pxcor < 0 and pycor < 0 [set pcolor brown]
    if pxcor > 0 and pycor < 0[set pcolor blue]
    ]
  crt 18 [set shape "cloud" set size random 10 setxy random-xcor random 15]
  create-boat 1
  ask boat [setxy 4 -7
    set shape "ship"
    set color grey
    set size 10]
  create-hero 1
  ask hero [set shape hshape
    setxy -5 -5
    set size 5]
  display user-message "Get on the boat?"
  wait Time_in_seconds_to_choose_answer
  ifelse Answer_Yes/No = "YES" [ask turtles with [shape = "cloud"] [die] crash] [safe_way]
  end


to lose-function
  flash 6
  crt 1
  [set shape "lost"
    set size 20]
  end


to won-function
   flash 6
  crt 1
  [set shape "won"
    set size 20]
end

to safe_way
  ask turtles [die]
  won-function
  wait 1
  reset
  crt 1 [set shape "safe"
    set size 20]
   wait 2
                                                          credits
end

 to crash
   ask patches [
          if pycor < 15[set pcolor blue]]
   ask hero [setxy 0 -5]
   ask boat [setxy 0 -7]
   create-waves 25 
   ask waves [set shape "waves" setxy random-xcor  random-ycor set size 3]
   ask turtles with [shape = "waves"] [if ycor > 12 [set ycor 5]] 
   wait 3
   ask boat [set heading 90 rt 90 fd 5 die]
   crash-function
   ask hero [if shape = "alien" [wait 1 set shape "alien-water" wait 1 die]]
   if (count hero) = 0 [
     lose-function
     wait 2
     display user-message "Aliens can't swim FYI Didn't you read the info tab?"
     ]
   ask hero [ifelse shape = "mr.brown" [set shape "brown-water" wait 1]
                        [set shape "student-water" wait 1]]
   ask turtles with [shape = "waves"] [wiggle]
   ask hero [repeat 10 [set heading 90 wiggle wait 1]]
   create-island 1 [set shape "island" setxy 9 10 set size 10]
   ask hero[ repeat 5 [set heading towards one-of island wiggle wait 1]]
   beach
 end

to crash-function
  flash 3
  create-crashes 1
  ask crashes [set shape "crash" set size 20
  wait 2
  die]
end

to beach
  ask waves [die]
  ask island [die]
  beach-setup
   ask hero [setxy -5 -6 
        ask hero [ifelse shape = "brown-water" [set shape "mr.brown" wait 1]
                        [set shape "student" wait 1]]]
   display user-message "Where do you want to go? A) Stay on the Beach B) Jungle"
  wait Time_in_seconds_to_choose_answer
       ifelse Answer_Choices = "Choice A" [
         starvation
         ] 
            [ifelse Answer_Choices = "Choice B" [
                jungle]
              [if Answer_Choices = "Choice C" [
                  flash 1
     lose-function
     wait 1
     display user-message "-__- What choice C?"]]]     
end

to beach-setup
  flash 5
  ask patches with [pycor > 5] [set pcolor cyan]
  ask patches with [pycor < 5] [set pcolor yellow]
  create-trees 20 [set shape "tree" setxy random-xcor random 5 set size 6]
end

to wiggle
    fd 1
    left random 60
    right random 60
    fd 1
end

to starvation
  ask hero [set heading 90]
  ask patches with [pcolor = cyan] [set pcolor violet]
  crt 1
  ask turtles with [shape = "default"] [set shape "moon" set size 9 setxy 9 10]
  repeat 5 [ask patches with [pcolor = violet] [set pcolor cyan]
            ask turtles with [shape = "moon"] [set shape "sun"]
            ask hero [fd 5 wait 1 bk 1 wait 1]
            ask patches with [pcolor = cyan] [set pcolor violet]
            ask turtles with [shape = "sun"] [set shape "moon"]
            ask hero [fd 1 wait 1 bk 3 wait 1]]
  ask hero [die]
  lose-function
     wait 2
     display user-message "Humans get hungry. Duuh."
end
  


to jungle
  ask patches with [pycor < 12] [ set pcolor yellow]
  ask patches with [pcolor = yellow] [set pcolor scale-color green random 100 1 99]
  create-trees  20 [set shape "tree" setxy random-xcor random 10 set size 6]
  ask hero [setxy 0 -10]
  display user-message "Where do you want to go? A) Left B) Right C) Forward"
  wait Time_in_seconds_to_choose_answer
       ifelse Answer_Choices = "Choice A" [ask hero [set heading 270 repeat 5 [ fd 2 wait 0.1]] rightway] 
            [ifelse Answer_Choices = "Choice B" [ask hero [set heading 90 repeat 5 [ fd 2 wait 0.1]] cave] 
              [if Answer_Choices = "Choice C" [ask hero [set heading 0 repeat 5 [ fd 2 wait 0.1]] epicway]]]
end

to cave
  ask trees [die]
  flash 2
  create-cave1 1
  ask cave1 [set shape "cave" setxy 5 -6 set size 10]
  ask hero [set heading 90 wait 1 fd 1]
  wait 2
  ask cave1 [die]
  flash 3
  ask patches [ifelse random 100 < 50 [set pcolor black] [set pcolor grey]]
  crt 10 [set shape "stag1" set size 4 setxy random-xcor 14]
  crt 10 [set shape "stag2" set size 4 setxy random-xcor -14]
  ask hero [setxy 0 -7]
  create-bally 1 [set shape "giftball" set size 5 setxy 0 8]
  crt 1 [set shape "postcard" setxy 1 8]
  display user-message "Open it?"
  wait Time_in_seconds_to_choose_answer
  
  ifelse Answer_Yes/No = "YES" [
    ask hero [set heading towards one-of bally
    repeat 9 [fd 1 wait 1]]
    wait 1
    flash 1
    ask turtles with [shape = "postcard"] [setxy 0 0 set size 20 wait 3 die]
    flash 1
    wait 3
    ifelse random 100 < 50 [ask bally [set shape "ball"]
                        ask hero [set label "SPALDING!!!"]
                        wait 2
                         reset
                        display user-message "5 years later...."
                        won-function
                        wait 2
                        display user-message "A movie is made about you called Castaway II. Your best friend from the island, Spalding, floated away when you wereescaping the island. YOU HAVE WON THE FAMOUS WAY, however you shall be forever alone since all your relatives haved died from terrorist attack. The END"
                          ask turtles [die]
  won-function
  wait 1
  reset
  crt 1 [set shape "famousway"
    set size 20]
   wait 2
                                                          credits
    ]
    [ask bally [set shape "bomb"]
                        ask hero [set label "NOOOOOOOO!!!"]
                        crash-function
                        lose-function
                        wait 2
                        display user-message "Not your lucky day ehh?"
    ]]
     [ask hero [repeat 7 [bk 1 wait 1]]
       ask turtles with [ shape = "stag1"] [die]
       ask turtles with [ shape = "stag2"] [die]
       ask turtles with [ shape = "giftball"] [die]
       ask turtles with [ shape = "postcard"] [die]
       ask patches [set pcolor yellow]
       ask patches with [pcolor = yellow] [set pcolor scale-color green random 100 1 99]
       crt  20 [set shape "tree" setxy random-xcor random 10 set size 6]
       repeat 3[
       wait 0.1
       crt  20 [set shape "tree" setxy random-xcor random-ycor set size 6]
       wait 1]
       lose-function
       display user-message "You have become one withe the jungle. You lost the TARZAN-IAN way."
     ]
end

to rightway
  ask trees [die]
  flash 2
  create-trees 1 [setxy 0 3 set size 15 set shape "tree"]
  ask hero [setxy 6 -10 set heading 270 repeat 3 [fd 3 wait 1] wait 1 fd 1 wait 1 set heading 0 fd 1]
  wait 1
  ask trees [vibrate wait 1]
  ask hero [bk 1 wait 1]
  create-bag 1 [set shape "backpack" set size 5 setxy 0 7 set heading 180 repeat 4 [fd random 6 wait 0.1]]
  wait 1
  display user-message "You found a Sophmore Bookbag!"
  wait 1
  ask bag [die]
  create-burger 1 [set size 5 setxy -5 -3 set shape "hamburger"]
  create-book 1 [set size 5 setxy 0 -3 set shape "compscibook-closed"]
  create-phone 1 [set size 5 setxy 5 -3 set shape "phone"]
 wait 1
  display user-message "Which do you want to take? A) MR. BROWN'S EPIC COMP SCI GUIDE B) iPhone C) HAMBURGERS"
  wait Time_in_seconds_to_choose_answer
       ifelse Answer_Choices = "Choice A" [bookway] 
            [ifelse Answer_Choices = "Choice B" [phoneway] 
              [if Answer_Choices = "Choice C" [burgerway]]]    
end

to bookway
  set have "book"
  wait 1
  ask book [set size 10 set shape "compscibook-open"]
  display user-message "This belongs to..."
  ifelse random 100 < 33 [create-passcode 1 [set shape "password1" wait 0.1 set size 5 wait 0.1 set size 10 wait 2 die] set pass "A"]
         [ifelse random 66 < 33 [create-passcode 1 [set shape "password2" wait 0.1 set size 5 wait 0.1 set size 10 wait 2 die] set pass "B"]
         [create-passcode 1 [set shape "password3" wait 0.1 set size 5 wait 0.1 set size 10 wait 2 die]] set pass "C"]
         ask book [set size 5 set shape "compscibook-closed"]
  display user-message "Choose soomething else?"
  wait Time_in_seconds_to_choose_answer
  ifelse Answer_Yes/No = "YES" [ display user-message "Which do you want to take? A) iPhone B) HAMBURGERS"
                              wait Time_in_seconds_to_choose_answer
                                      ifelse Answer_Choices = "Choice A" [phoneway] 
                                                    [ifelse Answer_Choices = "Choice B" [burgerway] 
                                                   [if Answer_Choices = "Choice C" [flash 1
                                                                      lose-function
                                                                               wait 1
                                                                display user-message "-__- What choice C?"]]]  ]
   [ask book [die] ask burger [die] ask phone [die] wait 1 mountainbase]
end

to mountainsetup
  flash 3
  ask patches with [pycor > -13] [set pcolor cyan]
    ask patches with [pycor < -12] [ set pcolor brown]
  ask patches with [pcolor = brown] [set pcolor scale-color brown random 100 0 99]
  crt 1 [set shape "mountain" set size 30 stamp die]
  ask hero [setxy 0 -14]
end

to cliffsetup
  ask turtles with [shape = "mountain"] [die]
  flash 3
   ask patches with [pycor > -14] [set pcolor cyan]
    ask patches with [pycor < -15] [ set pcolor brown]
  ask patches with [pcolor = brown] [set pcolor scale-color brown random 100 0 99]
  crt 1 [set shape "nest" set size 4 setxy 8 -2]
  crt 1 [set shape "cliff" set size 35 stamp die]
  ask hero [setxy -1 -3]
end

to phoneway
  set have "phone"
  ask burger [die]
  ask book [die]
  ask phone [die]
   wait 1
  mountainbase
end

to burgerway
  set have "burger"
  ask book [die]
  ask phone [die]
  ask burger [die]
   wait 1
  mountainbase
end

to mountainbase
  ask trees [die]
  mountainsetup
  ifelse have = "burger" or have = "phone" or have = "book" [mountainbaseBAD] [mountainbaseEPIC]
end

to mountainbaseBAD
  display user-message "Climb the mountain? Yes or No?"
  wait Time_in_seconds_to_choose_answer
  ifelse Answer_Yes/No = "NO" [if have = "burger" [crt 1 [set shape "monkey" setxy 4 -13 set size 4 set heading towards one-of hero repeat 3 [fd random 3 wait 0.2]] ask hero [die] wait 1 reset lose-function wait 2 display user-message "Monkeys like hamburgers, just saying"]
                               if have = "book" [display user-message "COMP SCI GODS SAVE ME!!" flash 1 ask patches with [pcolor = cyan] [set pcolor violet] crt 1 [set shape "light" set size 30] flash 10 ask hero [die] wait 1 reset lose-function wait 2 display user-message "Think Simple. Think Smart."]
                               if have = "phone" [display user-message "RAGE WHY IS THERE NO CONNECTION???" wait 1 ask hero [die] wait 1 reset lose-function wait 2 display user-message "People these days...."]]
                          [cliffsetup
                             wait 2
                                 crt 1 [setxy 11 11 set shape "bird" wait 0.1 set heading towards patch-at 8 -2 fd 3 set size 5 fd 3 wait 0.1 fd 5]
                                 wait 1
                                 display user-message "What do you want to do? A) Jump off the cliff? B) Fight him with my items!! C) Don't do anything!"
                                   wait Time_in_seconds_to_choose_answer
       ifelse Answer_Choices = "Choice A" [
         ask hero [set heading 270 repeat 3 [fd 1 wait 0.1]] display user-message "YEAH I CAN FLY BOOO-YAAA--oh snapples" flash 5 ask hero [fd 8 die] flash 3 wait 2 reset lose-function wait 2 display user-message "No you can't"]
       [ifelse Answer_Choices = "Choice B" [
         if have = "burger" [ask turtles with [shape = "bird"] [set heading towards one-of hero fd 5 wait 1]
                                                                          reset
                                                                     lose-function
                                                                              wait 2
                                                                           display user-message "Birds like hamburgers too."]
         if have = "book" [display user-message "SAVE ME OH COMP SCI GODS"flash 1 ask patches with [pcolor = cyan] [set pcolor violet] crt 1 [set shape "light" set size 30] flash 10 ask hero [die] wait 1 reset lose-function wait 2 display user-message "You ask too much of me :{"]
         if have = "phone" [ crt 1 [set shape "phone" set size 20] wait 1 crt 1 [set shape "enter" set size 20 wait 1 die] wait 1 display user-message "O.O There's a password"
                                  wait 1
                                  display user-message "What is the password? A)bHcAL B) dKcAI C) bNoAI?"
countdown
                                  if Answer_Choices = "Choice A" and pass = "A"[ wait 3 flash 3 crt 1 [set shape "unlocked" set size 30 wait 1 die]
                                                                       reset
                                                                       crt 1 [set shape "sunset" set size 30 stamp die]
                                                                       crt 1 [set size 5 set shape "helicopter" setxy -5 -5 set heading 45 repeat 10[fd random 3 wait 0.1]]
                                                                       ask turtles [die]
                                                                       wait 3
                                                                    won-function
                                                                   wait 1
                                                     crt 1 [set shape "badass_way"
                                                       set size 20]
                                                             wait 2
                                                          credits]
                                     if Answer_Choices = "Choice B" and pass = "B" [ wait 3 flash 3 crt 1 [set shape "unlocked" set size 30 wait 1 die]
                                                                       reset
                                                                       crt 1 [set shape "sunset" set size 30 stamp die]
                                                                       crt 1 [set size 5 set shape "helicopter" setxy -5 -5 set heading 45 repeat 10[fd random 3 wait 0.1]]
                                                                       ask turtles [die]
                                                                       wait 3
                                                                    won-function
                                                                   wait 1
                                                                   reset
                                                     crt 1 [set shape "badass_way"
                                                       set size 20]
                                                             wait 2
                                                          credits]
                                     ifelse Answer_Choices = "Choice C" and pass = "C" [ wait 3 flash 3 crt 1 [set shape "unlocked" set size 30 wait 1 die]
                                                                       reset
                                                                       crt 1 [set shape "sunset" set size 30 stamp die]
                                                                       crt 1 [set size 5 set shape "helicopter" setxy -5 -5 set heading 45 repeat 10[fd random 3 wait 0.3]]
                                                                       ask turtles [die]
                                                                       wait 3
                                                                    won-function
                                                                   wait 1
                                                     crt 1 [set shape "badass_way"
                                                       set size 20]
                                                             wait 2
                                                          credits]
                                     [wait 3 flash 3 crt 1 [set shape "locked" set size 30 wait 1 die]
                                                    flash 5
                                                    crt 1 [set shape "crash" set size 25 wait 1 die]
                                                    reset
                                                    lose-function
                                                    wait 2
                                                    display user-message "You were so close too :/"]]]
       
        [if Answer_Choices = "Choice C" [
            ask turtles with [shape = "bird"] [set heading towards one-of hero fd 5 wait 1]
                             reset
                                                          lose-function
                                                   wait 2
                    display user-message "Like that would work."]]]]
end

to mountainbaseEPIC
   display user-message "Climb the mountain? Yes or No?"
  wait Time_in_seconds_to_choose_answer
  ifelse Answer_Yes/No = "NO"  [flash 2 crt 5 [set shape "fallinrocks" set size 3 setxy random-xcor 10 set heading 180 repeat 3 [ fd random 6 wait 0.1]]
                                      flash 1
                                        ask hero [die]
                                        reset
                                   lose-function
                                        wait 2
                                     display user-message "Falling Rocks Hurt."]
                               [ cliffsetup
                                 ask hero [set label "EGGS = FOOD O>O"]
                                 wait 2
                                 crt 1 [setxy 11 11 set shape "bird" wait 0.1 set heading towards patch-at 8 -2 fd 3 set size 5 fd 3 wait 0.1 fd 5]
                                 wait 0.2
                                 crt 1 [setxy -3 0 set shape "sword" set size 4]
                                 crt 1 [setxy 0 -1 set shape "flute" set size 4]
                                 wait 0.1
                                 display user-message "What do you want to use? Yes) Sword No) Flute"
                                  wait Time_in_seconds_to_choose_answer
                                  ifelse Answer_Yes/No = "YES"[
                                                                 ask turtles with [shape = "sword"] [setxy 3 -3 wait 1 set shape "brokensword"]
                                                                 wait 2
                                                                 ask turtles with [shape = "bird"] [set heading towards one-of hero fd 5 wait 1]
                                                                          reset
                                                                     lose-function
                                                                              wait 2
                                                                           display user-message "The pen is mightier than the sword."]
                                                                     [ask turtles with [shape = "flute"] [setxy 3 -3 wait 1] 
                                                                       wait 1
                                                                       flash 3
                                                                       reset
                                                                       crt 1 [set shape "sunset" set size 30 stamp die]
                                                                       wait 1
                                                                       crt 1 [set shape "dudeflyingoff" set size 5 setxy -5 -5 set heading 45 repeat 10[fd random 3 wait 0.1]]
                                                                       wait 2
                                                                       ask turtles [die]
  won-function
  wait 2
  reset
  wait 1
  crt 1 [set shape "epic_way"
    set size 20]
   wait 2
             credits]]
end

to epicway
   mountainbase
end

to countdown
                                  crt 1 [set shape "10" set size 30 wait 1 die]
                                  crt 1 [set shape "09" set size 30 wait 1 die]
                                  crt 1 [set shape "08" set size 30 wait 1 die]
                                  crt 1 [set shape "07" set size 30 wait 1 die]
                                  crt 1 [set shape "06" set size 30 wait 1 die]
                                  crt 1 [set shape "05" set size 30 wait 1 die]
                                  crt 1 [set shape "04" set size 30 wait 1 die]
                                  crt 1 [set shape "03" set size 30 wait 1 die]
                                  crt 1 [set shape "02" set size 30 wait 1 die]
                                  crt 1 [set shape "01" set size 30 wait 1 die]
                                  crt 1 [set shape "00" set size 30 wait 1 die]
end
@#$#@#$#@
GRAPHICS-WINDOW
276
12
682
439
16
16
12.0
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

CHOOSER
45
115
183
160
Answer_Choices
Answer_Choices
"Choice A" "Choice B" "Choice C"
2

CHOOSER
45
166
192
211
Answer_Yes/No
Answer_Yes/No
"YES" "NO"
0

BUTTON
38
77
190
110
THE GAME
setup
NIL
1
T
OBSERVER
NIL
T
NIL
NIL

SLIDER
4
228
259
261
Time_in_seconds_to_choose_answer
Time_in_seconds_to_choose_answer
3
20
3
1
1
NIL
HORIZONTAL

BUTTON
188
22
261
55
Restart
reset
NIL
1
T
OBSERVER
NIL
R
NIL
NIL

TEXTBOX
31
272
243
412
REMINDER\nTo stop at any point, click HALT when a statement is said and then restart.\n\nWhen you have lost or won, please press HALT. IF YOU DON'T DO THIS , THE GAME WILL CRASH ON YOU. PLEASE FOLLOW INSTRUCTIONS. CAUSE I KNOW SOME OF YOU WON'T AND ONLY NOW READ THIS AND SAY..\"Ohhhhh\"
11
14.0
1

BUTTON
18
22
89
55
NIL
Credits
NIL
1
T
OBSERVER
NIL
C
NIL
NIL

@#$#@#$#@
READ THE REMINDER!!!


WHAT IS IT

This is a game,the main driving mechanism is just one start up/setup button, which contain the setup for each decision made by the user. This will call other function for each stage of the game, setting up the background, turtles, and etc. The player interacts with the game by making choices for his/her game counterpart. You are put in situations and given choices to make which will lead to either one of many wins, or one of many (sometimes painful) deaths. There will be “helpful” comments made by the game-makers’ angel and demon counterparts.

HOW IT WORKS

You can play this game by simply answering yes or no to the questions that are asked to your game figure. The choices you make will either lead to another choice, to you winning the game, or you losing. There are multiple ways to win or lose and you’re just going to have to play to figure them all out!

HOW TO USE IT

You will use the choosers available to you to play the game. The question asked to you will show you that you can either answer with a yes or no, or choose answer choices a, b or c. Depending on the answers you can choose, you can use choosers yes or no, or a, b, or c to get yourself through the game.
To make the choices, you will click the OK button presented when the question pop up shows, then you will go over to the side and choose an answer from the Choosers available, the chooser named Answer_choices gives you choices a,b or c, the chooser Answer_yes/no lets you answer yes or no.
The ‘THE GAME’ button sets up the first situation and starts the game and the rest of the game is consisted of you making decisions until you want to restart, were you would have to click the halt button instead of OK and then click the ‘THE GAME’ button again.
When you have lost/won and wish to restart, you must click HALT before restarting.
The restart button allows you to restart the game.

THINGS TO NOTICE

there are multiple ways to win or lose so don’t stop after the first time!
aliens can’t swim >:D

THINGS TO TRY

Try playing the game multiple times, each time not choosing the same answer twice, see how many different time you can win!

EXTENDING THE MODEL

If you want to extend the model of this game, you can add more scenarios other than the beach, jungle, cave and mountain. Add more ways to win or lose and you can try to incorporate this all into the game as it is now.

NETLOGO FEATURES

In the procedures tab, we use display user message to ask the question needed to help the player through the game. We use choosers on the side so the player can choose his/her answers. There is a slider to fix how much time you need to answer the questions. We also used turtle shapes editor to make our own shapes for the game.

RELATED MODELS

Games by PuffballsUnited on newgrounds.com of a stickman escaping prison, breaking into a jail and stealing a diamond. All these games are played the same way as this game is played, with the player going through the game by answering a series of questions and making choices to get their character through the game.

CREDITS AND REFERENCES

newgrounds.com
PuffballsUnited
The teachings of Mr.Brownmykolyk
The amazing brain of Stephanie Stettner
The amazing everything of Athira Sivan
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

00
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 61 62 241 242
Circle -1 true false 95 93 122
Circle -16777216 true false 140 141 54

01
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 61 62 241 242
Rectangle -1 true false 156 96 180 200
Polygon -1 true false 179 105 179 81 139 84 113 111 128 123

02
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240
Rectangle -1 true false 133 197 225 215
Circle -1 true false 78 78 130
Circle -16777216 true false 66 86 120

03
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240
Circle -1 true false 113 153 85
Circle -1 true false 106 81 85
Circle -16777216 true false 92 151 78
Circle -16777216 true false 96 91 64
Rectangle -1 true false 120 150 168 167

04
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240
Rectangle -1 true false 145 160 196 169
Rectangle -1 true false 155 73 170 222
Polygon -1 true false 156 74 83 164 168 168 169 160 102 156 164 82

05
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240
Rectangle -1 true false 121 86 136 191
Circle -1 true false 103 137 85
Circle -16777216 true false 92 143 76
Rectangle -1 true false 118 89 196 101

06
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 61 67 241 247
Circle -1 true false 111 136 85
Circle -16777216 true false 127 156 48
Polygon -1 true false 111 106 93 147 93 167 102 192 119 201 132 207 125 190 115 173 122 161 122 149 120 137 119 120 180 94

07
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240
Rectangle -1 true false 164 106 179 211
Rectangle -1 true false 112 105 181 125

08
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240
Rectangle -1 true false 169 105 184 210
Circle -1 true false 107 147 85
Circle -1 true false 108 83 85
Circle -16777216 true false 127 170 48
Circle -16777216 true false 124 110 48

09
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240
Rectangle -1 true false 165 110 180 215
Circle -1 true false 88 97 85
Circle -16777216 true false 109 120 48

10
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240
Rectangle -1 true false 105 105 120 210
Circle -1 true false 133 112 85
Circle -16777216 true false 150 132 48

a
false
0
Polygon -2674135 true false 147 -4 57 161 27 236 102 176 122 161 178 161 250 237
Polygon -1 true false 113 120 140 51 169 126 148 140 110 146
Polygon -2674135 true false 31 231 73 270 106 166
Polygon -2674135 true false 192 162 199 251 253 239

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

alien
false
0
Polygon -13840069 true false 161 127 236 190 221 220 161 145
Polygon -13840069 true false 135 130 58 192 73 222 133 147
Polygon -7500403 true true 143 108 123 163 121 169 104 271 137 226 149 196 167 226 194 271 182 169 179 166 159 109
Circle -13840069 true false 96 10 106
Rectangle -13840069 true false 126 86 171 101
Circle -16777216 false false 123 37 48
Circle -1 true false 125 39 44
Circle -2674135 true false 140 55 14
Circle -16777216 false false 143 95 12
Polygon -16777216 false false 123 27 133 20 139 19 155 19 164 23 167 26 159 20
Rectangle -16777216 true false 137 162 165 180

alien-water
false
0
Polygon -13840069 true false 161 127 236 190 221 220 161 145
Polygon -13840069 true false 141 121 64 183 79 213 139 138
Polygon -7500403 true true 143 108 123 163 121 169 104 271 137 226 149 196 167 226 194 271 182 169 179 166 159 109
Circle -13840069 true false 96 10 106
Rectangle -13840069 true false 126 86 171 101
Circle -16777216 false false 123 37 48
Circle -1 true false 125 39 44
Circle -2674135 true false 140 55 14
Circle -16777216 false false 143 95 12
Polygon -16777216 false false 123 27 133 20 139 19 155 19 164 23 167 26 159 20
Rectangle -16777216 true false 137 162 165 180
Line -13791810 false -14 216 46 180
Polygon -13345367 false false 49 182 61 206 84 190 107 187 114 215 142 204 161 183 178 200 199 204 220 183 242 189 245 207 261 205 270 188 285 201 291 212 298 191 299 193 298 194 181 298 156 290 132 277 128 277 28 226 4 210 2 205 6 212 12 210 10 206 8 206 5 212 15 222 16 205 8 209 6 202 5 211 15 231 11 207 10 207 16 213 19 222 33 237 48 252 75 253 3 200 49 181 54 186 51 180 45 182 35 189 17 195 14 213
Polygon -13345367 true false 9 208 47 182 61 207 102 187 110 196 119 211 156 190 178 196 197 210 229 184 252 188 242 208 269 200 270 186 288 197 290 211 278 225 251 248 222 280 194 295 153 295 137 281 91 272 29 253 10 237 12 213 12 198 14 204

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

athira1
false
2
Circle -2674135 true false 48 51 202
Polygon -2674135 false false 226 86 235 44 216 25 219 47 202 62 201 62
Polygon -2674135 false false 74 86 65 44 84 25 81 47 98 62 99 62
Line -16777216 false 200 99 167 128
Line -16777216 false 100 99 133 128
Circle -16777216 true false 173 117 20
Circle -16777216 true false 107 117 20
Polygon -16777216 false false 107 171 119 180 131 183 149 187 166 184 185 175 193 169 191 191 183 201 167 208 151 215 135 214 115 205 108 197 102 186 106 170 127 198 141 186 160 199 170 181 182 194 192 172
Polygon -2674135 true false 107 167 103 173 128 178 155 177 179 173 186 164 167 159 130 155 108 157 98 157
Polygon -1 true false 129 197 140 186 120 181 111 174 129 197
Polygon -1 true false 145 188 160 198 168 185 151 190 147 188 154 189
Polygon -1 true false 172 184 181 194 191 173 179 181 173 183
Polygon -2674135 false false 75 82 75 66 70 55 65 43 80 29 76 46 78 51 84 61 100 66 90 68
Polygon -2674135 false false 78 73 78 55 72 47 77 37 82 32 72 48 72 71
Polygon -2674135 false false 77 48 78 40 82 31 80 51 87 62
Polygon -2674135 false false 83 70 77 53 75 43 68 43 75 73 86 77 92 65 85 54 80 48
Polygon -2674135 false false 85 73 73 63 76 55 72 45 77 33 71 46 72 69 80 79 87 70 87 63 78 64 73 49 73 78 82 71 80 57
Polygon -2674135 false false 89 69 86 56 76 65 80 78 75 81 79 76 88 66 97 65
Polygon -2674135 false false 93 62 88 57 80 49 70 41 73 56 73 73 91 59 97 63
Polygon -2674135 false false 89 64 80 65 75 55
Polygon -2674135 false false 231 47 217 30 221 55 217 78 201 72 211 61 202 64 197 74 219 72 219 58 230 46 228 37 224 48 226 64 219 78 205 71 216 61 216 51 209 58 216 60 224 49 219 51 219 65 225 72 223 85 227 75 227 64 227 55
Polygon -2674135 false false 222 63 232 42 221 41 227 44 225 47 210 74 200 96 215 75 218 67 231 60 232 45 225 60 223 85 214 101 214 70 216 53 225 51
Polygon -2674135 false false 227 63 231 47 221 39 225 48 215 61 205 67 200 84 211 64 210 59 216 74 217 65 222 79 222 69 220 56 219 50 223 43 221 32 222 55 231 50

backpack
false
0
Polygon -16777216 true false 182 28 158 0 135 36 138 243 169 221 165 206 152 211 152 44 163 22 177 43
Polygon -16777216 true false 78 45 54 17 31 53 34 260 65 238 61 223 48 228 48 61 59 39 73 60
Polygon -11221820 true false 95 264 229 223 221 66 189 34 106 41 76 103
Polygon -11221820 true false 95 263 60 238 56 102 81 39 188 34
Line -16777216 false 95 265 94 106
Line -16777216 false 93 109 108 63
Line -16777216 false 110 63 189 36
Line -16777216 false 93 217 58 202
Polygon -16777216 false false 119 197 119 244 214 216 214 188 214 183 215 178 214 173
Line -16777216 false 214 197 119 223
Rectangle -16777216 false false 204 199 213 212
Polygon -16777216 false false 109 94 110 126 202 103 202 77
Line -16777216 false 73 209 74 108
Line -16777216 false 74 109 94 56
Line -16777216 false 94 57 179 34
Polygon -16777216 true false 73 144 75 174 85 179 87 169
Polygon -16777216 true false 98 36 120 5 145 31 140 44 125 24 114 44

badass_way
false
0
Circle -7500403 true true -35 9 105
Circle -7500403 true true 199 145 105
Circle -7500403 true true -1 174 105
Circle -7500403 true true 123 33 105
Line -8630108 false 15 17 27 39
Line -8630108 false 39 16 19 56
Circle -8630108 false false 32 28 31
Line -8630108 false 67 32 67 58
Line -8630108 false 68 57 81 58
Line -8630108 false 82 57 82 37
Line -8630108 false 107 12 109 62
Line -8630108 false 110 60 127 38
Line -8630108 false 127 39 139 58
Line -8630108 false 138 57 140 17
Circle -8630108 false false 145 30 31
Line -8630108 false 183 34 183 63
Line -8630108 false 186 38 203 64
Line -8630108 false 203 63 199 32
Circle -8630108 true false 212 30 13
Circle -8630108 true false 213 51 13
Polygon -2674135 true false 15 75 15 165 60 135 45 120 75 75
Polygon -2674135 true false 90 88 60 163 90 133 105 163
Polygon -2674135 true false 120 90 120 165 150 135
Polygon -2674135 true false 180 135 150 210 180 180 195 210
Polygon -2674135 true false 217 135 202 165 232 180 217 210 247 180 217 165
Polygon -2674135 true false 255 135 240 165 270 180 255 210 285 180 255 165
Circle -2674135 true false 202 200 10
Circle -2674135 true false 240 200 10
Circle -2674135 true false 275 200 10
Polygon -2674135 true false 37 224 39 287 61 260 75 287 77 213 64 246 60 233 52 252
Polygon -2674135 true false 111 212 81 287 111 257 126 287
Polygon -2674135 true false 129 222 148 247 137 291 170 217 152 234

badassproduct
false
0
Rectangle -2674135 true false -15 0 0 375
Rectangle -2674135 true false -15 0 45 15
Rectangle -2674135 true false 30 0 45 60
Rectangle -2674135 true false -15 45 30 60
Rectangle -1 true false 45 0 60 345
Rectangle -1 true false 60 0 75 15
Rectangle -1 true false 60 0 90 15
Rectangle -1 true false 75 0 90 45
Rectangle -1 true false 60 45 90 60
Polygon -1 true false 60 60 90 270 75 285 64 176 57 98 60 60 75 270
Rectangle -2674135 true false 90 30 135 270
Rectangle -16777216 true false 105 60 120 240
Polygon -1 true false 135 0 135 300 150 300 165 285 180 270 180 30 150 0
Rectangle -2674135 true false 255 0 300 15
Rectangle -2674135 true false 270 -15 285 390
Rectangle -2674135 true false 210 30 225 300
Rectangle -2674135 true false 180 285 210 300
Rectangle -2674135 true false 180 -45 195 285
Rectangle -1 true false 225 45 255 60
Rectangle -1 true false 225 60 240 270
Rectangle -1 true false 225 270 255 285
Polygon -16777216 true false 60 300 60 285 60 270 60 255 60 240 60 270 60 150
Rectangle -16777216 true false 150 30 165 270

badassproduction
false
2
Circle -2674135 true false 48 51 202
Polygon -2674135 false false 226 86 235 44 216 25 219 47 202 62 201 62
Polygon -2674135 false false 74 86 65 44 84 25 81 47 98 62 99 62
Line -16777216 false 200 99 167 128
Line -16777216 false 100 99 133 128
Circle -16777216 true false 173 117 20
Circle -16777216 true false 107 117 20
Polygon -16777216 false false 107 171 119 180 131 183 149 187 166 184 185 175 193 169 191 191 183 201 167 208 151 215 135 214 115 205 108 197 102 186 106 170 127 198 141 186 160 199 170 181 182 194 192 172
Polygon -2674135 true false 107 167 103 173 128 178 155 177 179 173 186 164 167 159 130 155 108 157 98 157
Polygon -1 true false 129 197 140 186 120 181 111 174 129 197
Polygon -1 true false 145 188 160 198 168 185 151 190 147 188 154 189
Polygon -1 true false 172 184 181 194 191 173 179 181 173 183
Polygon -2674135 false false 75 82 75 66 70 55 65 43 80 29 76 46 78 51 84 61 100 66 90 68
Polygon -2674135 false false 78 73 78 55 72 47 77 37 82 32 72 48 72 71
Polygon -2674135 false false 77 48 78 40 82 31 80 51 87 62
Polygon -2674135 false false 83 70 77 53 75 43 68 43 75 73 86 77 92 65 85 54 80 48
Polygon -2674135 false false 85 73 73 63 76 55 72 45 77 33 71 46 72 69 80 79 87 70 87 63 78 64 73 49 73 78 82 71 80 57
Polygon -2674135 false false 89 69 86 56 76 65 80 78 75 81 79 76 88 66 97 65
Polygon -2674135 false false 93 62 88 57 80 49 70 41 73 56 73 73 91 59 97 63
Polygon -2674135 false false 89 64 80 65 75 55
Polygon -2674135 false false 231 47 217 30 221 55 217 78 201 72 211 61 202 64 197 74 219 72 219 58 230 46 228 37 224 48 226 64 219 78 205 71 216 61 216 51 209 58 216 60 224 49 219 51 219 65 225 72 223 85 227 75 227 64 227 55
Polygon -2674135 false false 222 63 232 42 221 41 227 44 225 47 210 74 200 96 215 75 218 67 231 60 232 45 225 60 223 85 214 101 214 70 216 53 225 51
Polygon -2674135 false false 227 63 231 47 221 39 225 48 215 61 205 67 200 84 211 64 210 59 216 74 217 65 222 79 222 69 220 56 219 50 223 43 221 32 222 55 231 50
Polygon -2674135 true false 75 90 66 44 80 28 80 46 99 67
Polygon -2674135 true false 201 64 221 45 216 26 232 44 224 86 211 95
Polygon -1 true false 11 17 16 107 62 92 62 79 42 63 33 65 57 45 59 27 37 22 30 24
Polygon -1 true false 91 82 123 10 153 90 136 91 125 50 87 94
Polygon -1 true false 175 17 175 95 231 55
Polygon -2674135 true false 187 62 186 43 206 55 186 72
Polygon -2674135 true false 118 46 122 31 128 45
Polygon -2674135 true false 35 36 23 53 41 43
Polygon -2674135 true false 39 74 27 91 45 81
Polygon -1 true false 16 280 48 208 78 288 61 289 50 248 12 292
Polygon -2674135 true false 42 243 46 228 52 242
Polygon -1 true false 154 228 140 209 103 212 102 229 118 245 141 246 155 267 144 283 123 283 112 271 106 270 105 281 103 288 135 294 169 286 175 258 158 241 145 235 126 232 117 230 122 222 140 223
Polygon -1 true false 251 228 237 209 200 212 199 229 215 245 238 246 252 267 241 283 220 283 209 271 203 270 202 281 200 288 232 294 266 286 272 258 255 241 242 235 223 232 214 230 219 222 237 223
Circle -1 true false 82 281 8
Circle -1 true false 175 282 8
Circle -1 true false 273 281 8

ball
false
0
Circle -955883 true false 2 -1 300
Polygon -16777216 false false 217 14 189 47 184 69 184 81 179 109 186 141 190 174 204 215 232 249 248 266 291 207 297 177 299 154 297 127 293 109 286 88 282 77 274 66 266 54 245 31 236 26
Polygon -16777216 false false 82 13 110 46 115 68 115 80 120 108 113 140 105 166 94 215 74 243 37 250 8 206 2 176 0 153 2 126 6 108 13 87 17 76 25 65 33 53 54 30 63 25
Polygon -16777216 false false 24 217 52 200 67 196 100 190 132 184 173 180 225 181 254 186 276 198 288 208 292 219 282 225 274 236 269 242 252 263 239 271 227 278 212 285 194 296 130 294 87 291 70 268 52 257 36 237 31 224
Polygon -16777216 false false 18 80 46 97 61 101 94 107 126 113 164 118 219 116 248 111 270 99 282 89 286 78 276 72 268 61 261 49 246 34 233 26 221 19 206 12 188 1 124 3 81 6 64 29 46 40 30 60 25 73
Polygon -16777216 false false 2 144 41 154 69 157 99 162 156 157 211 155 237 151 273 145 298 131 298 113 290 94 281 74 265 57 251 41 213 20 133 5 79 21 53 34 35 59 21 86
Line -16777216 false 142 1 152 294

bird
false
6
Polygon -1184463 true false 180 105 210 45 210 75 240 60 240 90 270 75 270 105 285 105 285 120
Circle -6459832 true false 131 101 127
Circle -6459832 true false 78 48 85
Circle -1 true false 90 60 30
Polygon -16777216 true false 105 75 90 75 105 90 120 75
Line -1184463 false 120 30 90 75
Line -1184463 false 75 90 30 105
Line -1184463 false 30 105 75 105
Line -1184463 false 75 105 45 120
Line -1184463 false 45 120 90 120
Line -1184463 false 180 225 180 270
Line -1184463 false 210 225 210 270
Polygon -1184463 true false 180 270 150 255 165 270 150 285 180 285
Polygon -8630108 true false 210 270 195 255 195 270 180 285 210 285
Polygon -8630108 true false 180 150 225 45 225 90 255 75 255 105 285 90 270 120 300 120 210 180

black-out
false
0
Rectangle -16777216 true false 0 -15 315 300

bomb
false
0
Circle -1 true false 1 3 296
Polygon -1184463 true false 149 69 134 54 137 73 163 75 167 68 167 57 177 46 190 41 216 41 218 53 228 58 230 40 217 31 194 30 159 35 150 47 149 61 112 60
Circle -16777216 true false 43 74 210
Polygon -2674135 true false 215 50 207 73 216 65 220 88 224 71 239 82 237 66 247 68 236 51 229 59 221 53
Polygon -1 false false 99 202 84 217 100 229 115 238 129 242 163 248 198 240 209 220 217 203 205 203 202 217 185 226 175 229 156 232 131 231 112 219
Circle -1 false false 101 156 22
Circle -1 false false 157 152 22
Line -1 false 103 143 122 159
Line -1 false 156 155 179 137
Rectangle -16777216 true false 120 60 180 90

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

brokensword
true
10
Polygon -1184463 true false 45 180 42 147 55 153 60 81 91 105 106 66 115 104 136 36 143 74 164 23 180 40 194 15 196 27 226 6 235 26 256 16 242 50 258 91 215 84 211 139 189 137 190 187 144 159 171 235 116 220 126 246 106 220 97 286 75 264 30 265 31 245 4 244 14 186 5 158 29 188 38 160
Polygon -7500403 true false 89 165 54 207 43 196 36 203 34 217 46 233 63 248 91 243 77 228 120 178 134 194 143 197 150 189 157 180 139 170 131 165 231 43 229 25 209 29 110 147 85 124 77 130 73 139 75 155
Line -16777216 false 118 155 222 34
Polygon -13345367 true true 113 151 88 126 76 129 75 146 78 157 84 169 94 168 109 178 118 184 129 189 144 201 154 190 159 182 150 176 141 172 127 160 116 149
Polygon -13345367 true true 52 208 44 196 32 205 33 213 40 222 49 235 56 240 64 247 79 251 89 245 85 237
Line -16777216 false 65 206 79 220
Line -16777216 false 70 192 90 213
Line -16777216 false 81 186 94 198
Line -16777216 false 89 176 105 190
Polygon -1184463 true false 146 81 148 161 164 134 232 43 230 19 214 17
Polygon -7500403 true false 172 84 163 130 211 109 252 89 267 72 238 68
Line -16777216 false 245 79 174 102
Polygon -6459832 true false 57 207 75 227 78 221 60 197 70 200 81 223 87 217 76 202 70 187 81 196 94 209 96 203 84 193 71 179 83 181 94 193 97 200 100 194 90 178 91 173 105 189 110 188 110 182 98 175 78 177 69 186 58 202

brown-water
false
1
Circle -2674135 false true 219 159 42
Circle -2674135 false true 39 159 42
Circle -955883 true false -4 176 127
Circle -1 true false 110 5 80
Polygon -1 true false 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -1 true false 127 79 172 94
Polygon -1 true false 195 90 240 150 225 180 165 105
Polygon -1 true false 105 90 60 150 75 180 135 105
Polygon -2674135 true true 150 57 159 50 170 53 177 59 187 60 187 51 199 60 192 70 181 73 171 68 162 64 149 59 151 58 149 60 159 62 162 66 169 72
Polygon -2674135 true true 152 57 143 50 132 53 125 59 115 60 115 51 103 60 110 70 121 73 131 68 140 64 153 59 151 58 153 60 143 62 140 66 133 72
Circle -16777216 true false 164 32 11
Circle -16777216 true false 123 32 11
Line -16777216 false 120 195 180 195
Polygon -16777216 false false 169 89 176 103 151 116 147 190 150 115 151 100 169 89 169 91 168 90 150 101 150 122 151 117 177 103 169 88
Polygon -16777216 false false 127 90 120 104 145 117 149 191 146 116 145 101 127 90 127 92 128 91 146 102 146 123 145 118 119 104 127 89
Polygon -8630108 true false 120 196 91 284 136 292 148 226 151 226 164 293 207 278 180 197 120 196 180 196 187 221 191 240 197 262 207 279 188 225 189 235
Polygon -7500403 true false 120 196 133 203 148 210 160 219
Polygon -8630108 true false 120 197 189 235 203 277 206 275 199 264 204 275 198 264 196 257 202 267
Polygon -7500403 false false 206 274 198 258 194 248 191 239 188 232 178 226 162 216 149 212 140 203 127 200 121 196 153 202 162 215 174 226 187 234 190 227 184 219 182 207 179 197 125 197 134 202 143 203 165 210 179 221
Polygon -8630108 true false 187 232 123 199 178 198
Polygon -7500403 false false 72 136 89 163 111 133 120 194 145 195 144 119 120 105 117 104 125 90 105 90 71 136
Polygon -2674135 true true 223 134 208 159 185 130 176 191 151 192 151 117 179 101 172 88 191 88
Rectangle -16777216 true false 119 190 179 198
Polygon -2674135 true true 74 136 89 161 112 132 121 193 146 194 146 119 118 103 125 90 106 90
Rectangle -16777216 true false 118 191 180 197
Polygon -2674135 true true 181 190 188 133 185 131 175 189
Polygon -16777216 true false 192 91 194 89 227 133 221 134
Line -16777216 false 148 103 144 190
Line -16777216 false 149 102 146 188
Line -16777216 false 148 104 147 193
Circle -955883 true false 75 210 150
Circle -955883 true false 173 173 134
Line -2674135 true 30 180 75 225
Line -2674135 true 75 225 105 240
Line -2674135 true 105 240 195 240
Line -2674135 true 195 240 240 210
Line -2674135 true 240 210 270 180
Line -2674135 true 75 225 30 300
Line -2674135 true 150 240 150 315
Line -2674135 true 240 210 300 270
Rectangle -13345367 true false -15 270 300 390
Polygon -13345367 true false 0 285 15 255 75 285 75 270 105 255 165 285 195 300 225 270 255 255 285 270 285 255 300 270 270 285 240 285 225 255 210 255 195 255 180 270 165 270 150 255 135 270 120 270 90 270 45 255 30 270

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
5
Circle -7500403 true false 42 47 218
Polygon -2064490 true false 146 174 171 171 151 196
Polygon -7500403 true false 244 129 270 36 183 70
Polygon -7500403 true false 55 128 29 35 116 69
Polygon -2064490 true false 237 103 251 51 217 76
Polygon -2064490 true false 63 103 49 51 83 76
Polygon -1 true false 94 194 131 226 152 225 183 227 206 196 199 190 172 215 134 220
Polygon -16777216 true false 78 151 84 146 92 140 104 134 109 133 118 137 135 147 132 144 129 145 130 144 139 147 130 134 117 130 103 127 89 133 71 147
Polygon -16777216 true false 224 151 218 146 210 140 198 134 193 133 184 137 167 147 170 144 173 145 172 144 163 147 172 134 185 130 199 127 213 133 231 147
Polygon -16777216 false false 180 207 184 219 191 196
Polygon -16777216 false false 121 212 126 223 129 216
Line -16777216 false 291 164 173 174
Line -16777216 false 293 180 175 178
Line -16777216 false 19 180 137 178
Line -16777216 false 19 166 137 176
Line -16777216 false 173 180 296 197
Line -16777216 false 137 182 14 199

cave
false
1
Polygon -7500403 true false 150 30 15 120 60 285 240 285 285 120
Polygon -16777216 false false 60 60 180 30 270 60 285 195 270 270 90 300 30 270 15 195 45 105 60 60
Polygon -7500403 true false 60 60 180 30 270 60 285 195 270 270 75 300 30 270 15 180 30 150 60 60 60 75 60 60 75 60 105 45 135 45 180 30 210 45 270 60 270 105 285 165 285 210 270 240 240 270 225 285 165 285 90 285 75 300 30 240 15 195 15 165 30 120 45 90 60 60 75 60 60 75 45 75 90 45 150 45 180 30 210 45 255 60 270 90 270 150 285 210 285 255 270 270 225 285 180 285 135 285 75 285 45 285 45 240 30 195 15 165 15 135 15 120 60 75 60 60
Circle -16777216 true false 45 180 118
Polygon -16777216 true false 45 225 60 285 135 285 150 270 150 240 150 210 120 195 90 195 60 210 60 225 45 240 45 225 60 210 75 195 60 180 105 180 135 195 150 225 150 270 135 285 120 285 90 285 90 300 60 285 60 270 60 240 45 240 45 225 60 210 60 195 30 225 45 225 60 195 60 210 75 195 90 180 105 180 120 195 120 210 90 210 45 195 45 225 45 240 45 255 75 270 75 255 105 255 120 270 150 270 150 255 165 240 150 210 135 210 120 225 90 210 90 180
Line -7500403 false 75 210 60 240
Line -7500403 false 60 225 60 270
Line -7500403 false 45 255 75 210
Line -7500403 false 60 210 90 195
Line -7500403 false 60 210 45 255
Line -16777216 false 30 165 60 135
Line -16777216 false 135 45 165 75
Line -16777216 false 90 120 135 90
Line -16777216 false 165 180 210 120
Line -16777216 false 225 195 240 195
Line -16777216 false 225 150 240 165
Line -16777216 false 165 135 210 75
Line -16777216 false 180 75 225 105

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cliff
false
5
Polygon -6459832 true false 31 176 3 295 298 295 250 178
Polygon -6459832 true false 29 162 137 9 248 157
Polygon -7500403 true false 134 146 68 146 31 162 35 189 113 204 159 202 216 204 257 192 245 148
Polygon -1 true false 107 53 137 9 168 52 146 44 136 53 129 44 114 56

cloud
false
0
Circle -1 true false 48 48 85
Circle -1 true false 81 36 108
Circle -1 true false 156 51 108
Circle -1 true false 43 88 95
Circle -1 true false 126 96 108
Circle -1 true false 219 129 42
Circle -1 true false 24 84 42

compscibook-closed
false
0
Rectangle -7500403 true true 30 30 270 270
Line -14835848 false 30 30 45 15
Line -14835848 false 45 15 285 15
Line -14835848 false 270 30 285 15
Line -14835848 false 270 270 285 255
Line -14835848 false 285 15 285 255
Polygon -14835848 false false 30 30 60 15 75 30 105 15 120 30 150 15 180 30 210 15 240 30 270 15
Polygon -14835848 false false 285 15 270 45 285 60 270 90 285 105 270 135 285 135 270 165 285 165 270 195 285 210 270 240 285 255
Polygon -8630108 false false 75 45 45 45 45 90 75 90 75 75 60 75 60 60 75 60
Polygon -8630108 false false 90 60 90 90 120 90 120 60
Polygon -8630108 false false 135 60 135 90 150 90 150 75 165 75 165 90 180 90 180 75 195 75 195 90 210 90 210 60
Polygon -8630108 false false 225 60 225 105 240 105 240 90 255 90 255 60
Polygon -8630108 false false 120 105 90 105 90 120 105 120 105 135 90 135 90 150 120 150 120 120 105 120
Polygon -8630108 false false 150 120 135 120 135 150 150 150 150 135 135 135
Polygon -8630108 false false 165 120 165 150 180 150 180 120
Polygon -8630108 false false 41 179 42 244 79 244 79 213 50 210 76 201 75 171 43 171
Polygon -8630108 false false 150 210 150 240 180 240 180 210
Polygon -8630108 false false 105 210 105 240 135 240 135 210
Polygon -8630108 false false 195 180 195 240 210 240 210 225 240 240 255 240 210 210 240 180 225 180 210 195 210 180

compscibook-open
false
0
Rectangle -7500403 true true 0 75 165 255
Rectangle -7500403 true true 165 75 330 255
Line -6459832 false 150 75 150 255
Line -6459832 false 15 60 0 75
Line -6459832 false 15 60 300 60
Line -6459832 false 150 75 165 60
Polygon -14835848 false false 15 60 30 75 60 60 75 75 120 60 150 75
Polygon -14835848 false false 150 75 195 60 270 75 300 60
Polygon -14835848 false false 15 90 60 120 90 90 120 120 90 165 45 150 30 180 60 225 105 180 120 225 105 240 30 225 15 150 45 135 90 150 15 120
Polygon -14835848 false false 165 90 165 120 195 120 225 105 180 105 225 105 255 120 255 150 180 150 180 195 210 240 270 210 270 180 195 180 165 180 165 135 225 120 210 90

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

crash
false
0
Circle -7500403 true true 20 26 264
Rectangle -2674135 true false 120 105 135 105
Polygon -7500403 true true 127 118 126 133 137 131
Polygon -7500403 true true 132 151 132 142 141 146 142 150 135 151 133 150
Polygon -16777216 true false 33 112 31 218 78 226 91 191 49 165 90 189 88 124 35 114
Circle -7500403 true true 46 134 28
Circle -7500403 true true 48 185 28
Circle -16777216 true false 80 156 75
Circle -7500403 true true 103 175 40
Circle -16777216 true false 141 169 55
Circle -7500403 true true 156 184 24
Rectangle -16777216 true false 186 117 212 244
Rectangle -16777216 true false 260 119 272 207
Polygon -16777216 true false 195 120 225 180 270 120 255 120 225 150

cylinder
false
0
Circle -7500403 true true 0 0 300

dog
false
5
Circle -6459832 true false 47 55 218
Polygon -2064490 true false 141 171 172 167 149 191
Line -16777216 false 248 160 173 174
Line -16777216 false 240 180 175 178
Line -16777216 false 60 180 137 178
Line -16777216 false 60 165 137 176
Line -16777216 false 173 180 240 195
Line -16777216 false 137 182 45 195
Polygon -16777216 true false 71 142 78 137 84 130 104 123 119 127 129 132 131 136 134 138 140 143 128 135 121 134 108 127 92 129 81 138
Polygon -6459832 true false 20 10 62 131 119 74 61 18
Polygon -2064490 true false 33 37 64 99 92 73 32 26 23 29
Polygon -6459832 true false 69 20 11 8 6 59 7 97 18 98 40 65
Polygon -6459832 true false 182 62 219 0 265 -18 273 -1 265 16 257 33 252 51 244 60 256 38 251 53 213 94
Polygon -2064490 true false 189 60 230 16 256 -5 218 75
Polygon -16777216 true false 120 213 122 223 128 230 147 235 173 231 173 228 175 224 178 222 181 213 172 225 165 226 155 229 137 226 125 222
Polygon -16777216 true false 229 142 222 137 216 130 196 123 181 127 171 132 169 136 166 138 160 143 172 135 179 134 192 127 208 129 219 138

dot
false
0
Circle -7500403 true true 90 90 120

dudeflyingoff
false
0
Polygon -6459832 true false 131 134 109 175 134 206 184 207 197 167 169 133
Circle -6459832 true false 131 141 42
Polygon -6459832 true false 132 206 94 252 122 246 140 274 159 245 192 278 196 239 241 248 182 202
Polygon -6459832 true false 172 138 259 55 224 122 294 96 225 144 286 165 239 183 257 248
Polygon -6459832 true false 133 144 46 61 81 128 11 102 80 150 19 171 66 189 48 254
Circle -6459832 true false 117 71 68
Polygon -13345367 true false 139 160 141 192 176 192 169 154
Circle -1 true false 131 122 42
Polygon -6459832 true false 132 74 123 55 142 61 160 54 165 60 186 62 175 84

enter
false
0
Polygon -2674135 true false 22 48 34 143 98 139 96 110 62 124 55 86 93 76 88 63 45 62 52 45 109 48 98 25
Polygon -2674135 true false 109 72 103 113 113 108 117 93 121 109 128 112 136 85 132 79 124 97 117 73
Polygon -2674135 true false 140 65 145 83 157 82 148 131 166 132 166 87 180 83 178 61
Polygon -2674135 true false 196 76 181 127 238 126 235 108 206 111 206 93 228 90 226 81 204 81 208 71 225 70 225 55 192 59 190 80
Polygon -2674135 true false 245 74 243 107 257 110 257 92 273 100 285 114 285 90 264 84 285 73 282 67 275 63 245 60
Circle -16777216 true false 249 67 12
Polygon -2674135 true false 10 175 -3 281 16 286 19 259 56 246
Circle -16777216 true false 11 225 19
Polygon -2674135 true false 58 194 49 285 58 287 67 252 73 279 84 282
Circle -16777216 true false 57 235 12
Polygon -2674135 true false 112 220 105 208 83 210 69 224 76 242 108 258 108 274 87 281 86 274 83 288 126 294 124 248 89 232 94 226 107 226
Polygon -2674135 true false 156 218 149 206 127 208 113 222 120 240 152 256 152 272 131 279 130 272 127 286 170 292 168 246 133 230 138 224 151 224
Polygon -2674135 true false 208 231 198 213 190 212 177 226 171 248 172 274 193 290 201 286 201 277 191 272 184 244
Circle -2674135 true false 201 241 31
Circle -16777216 true false 209 249 14
Polygon -2674135 true false 234 210 237 251 228 295 250 294 267 253
Polygon -16777216 true false 243 242 239 286 258 251
Polygon -2674135 true false 269 213 268 299 297 288 296 271 276 274 274 257 290 250 292 238 280 239 278 227 295 216 293 206
Circle -1 true false 104 141 26
Circle -1 true false 158 145 24
Polygon -1 false false 80 166 83 180 94 195 105 191 126 192 154 197 192 196 205 172 192 196 156 197 91 192

epic_way
false
0
Polygon -1184463 true false 75 30 91 118 14 122 79 175 59 250 112 212 141 292 165 216 226 279 212 192 292 198 218 145 270 68 193 87 174 14 139 88
Polygon -7500403 true true 79 85 79 104 41 104 41 126 69 126 69 145 41 145 41 170 66 170 64 187 20 184 27 86
Polygon -7500403 true true 81 127 80 185 102 185 99 161 122 162 121 126
Polygon -1184463 true false 92 137 95 152 115 150 114 134
Polygon -7500403 true true 144 183 142 118 127 121 129 186
Polygon -7500403 true true 176 119 177 127 176 135 155 138 152 176 180 174 178 184 146 184 149 121
Polygon -7500403 true true 90 203 93 275 107 275 112 240 123 279 142 279 142 194 121 195 118 227 111 216 108 229 105 197
Polygon -7500403 true true 152 204 170 204 190 281 180 279 174 256 163 256 153 285 145 283
Polygon -1184463 true false 161 228 159 241 171 241
Polygon -7500403 true true 181 210 193 211 195 230 210 209 226 210 203 287 193 280 194 246
Line -2674135 false 15 17 27 39
Line -2674135 false 39 16 19 56
Circle -2674135 false false 32 28 31
Line -2674135 false 67 32 67 58
Line -2674135 false 68 57 81 58
Line -2674135 false 82 57 82 37
Line -2674135 false 107 12 109 62
Line -2674135 false 110 60 127 38
Line -2674135 false 127 39 139 58
Line -2674135 false 138 57 140 17
Circle -2674135 false false 145 30 31
Line -2674135 false 183 34 183 63
Line -2674135 false 186 38 203 64
Line -2674135 false 203 63 199 32
Circle -2674135 true false 212 30 13
Circle -2674135 true false 213 51 13

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

fallinrocks
true
0
Polygon -6459832 false false 90 60 30 120 30 150 75 195 75 225 60 240 90 270 150 255 150 225 150 195 165 180 180 225 180 255 225 240 225 210 150 240 135 255 180 210 285 195 270 150 255 120 210 120 210 90 225 60 195 60 150 60 135 75 105 60 90 45 90 60 60 75 90 60 75 75 75 90 90 60 60 90 75 60 60 75 90 60
Polygon -6459832 false false 90 60 30 120 30 150 75 195 75 225 60 240 90 270 150 255 150 225 150 195 165 180 180 225 180 255 225 240 225 210 150 240 135 255 180 210 285 195 270 150 255 120 210 120 210 90 225 60 195 60 150 60 135 75 105 60 90 45 90 60 60 75 90 60 75 75 75 90 90 60 60 90 75 60 60 75 90 60
Polygon -6459832 false false 105 60 45 120 45 150 90 195 90 225 75 240 105 270 165 255 165 225 165 195 180 180 195 225 195 255 240 240 240 210 165 240 150 255 195 210 300 195 285 150 270 120 225 120 225 90 240 60 210 60 165 60 150 75 120 60 105 45 105 60 75 75 105 60 90 75 90 90 105 60 75 90 90 60 75 75 105 60
Polygon -6459832 false false 105 75 45 135 45 165 90 210 90 240 75 255 105 285 165 270 165 240 165 210 180 195 195 240 195 270 240 255 240 225 165 255 150 270 195 225 300 210 285 165 270 135 225 135 225 105 240 75 210 75 165 75 150 90 120 75 120 120 105 75 75 90 105 75 90 90 90 105 105 75 75 105 90 75 75 90 105 75
Circle -6459832 false false 33 93 85
Polygon -6459832 true false 180 45 285 180 135 255 90 210 90 240 120 255 165 225 180 255 195 195 255 225 285 180 255 135 90 75 210 75 90 60 75 60 105 45 135 60 135 75 90 90 45 105 30 135 15 150 30 180 60 195 60 270 150 270 165 240 225 255 270 210 285 180 210 105 195 75 195 60 135 75 75 90 75 120 45 120 45 135 30 150
Polygon -16777216 false false 225 90 105 90 195 75 210 90 240 75 240 135 270 135 300 180 285 240 255 255 240 270 195 270 165 285 120 285 105 285 75 255 75 210 60 195 45 180 30 150 45 120 60 120 90 75 135 75 180 75 225 90 210 105 255 90 255 105 240 135 255 150 300 180 300 210

famousway
false
0
Rectangle -1 true false 49 -3 259 300
Polygon -16777216 true false 60 0 -11 1 -11 301 60 300
Polygon -16777216 true false 314 1 240 0 240 315 315 315
Polygon -16777216 true false 70 353 63 337 61 316 61 302 61 281 62 244 80 241 112 240 158 242 243 245 242 257 246 281 250 302 249 328 239 347 237 352 272 359 269 299 270 250 267 222 266 213 270 233 230 227 207 229 183 228 143 227 114 226 95 223 70 225 52 227 46 227 36 250 38 272 38 318 40 349 51 360
Polygon -16777216 true false 65 -32 58 -16 56 5 56 19 56 40 57 77 75 80 107 81 153 79 237 78 237 64 241 40 245 19 244 -7 234 -26 232 -31 267 -38 264 22 265 71 262 99 261 108 265 88 225 94 202 92 178 93 138 94 109 95 90 98 65 96 47 94 41 94 31 71 33 49 33 3 35 -28 46 -39
Polygon -7500403 true true 76 12 65 34 80 44 75 76 94 72 98 41 125 10 107 9 95 33
Circle -7500403 true true 118 17 54
Polygon -7500403 true true 192 15 174 62 223 65 222 17 211 21 210 46 196 52
Polygon -7500403 true true 89 111 66 124 84 141 104 127 108 120 117 136 146 117 137 112 124 122 113 111 89 129
Circle -7500403 true true 146 104 40
Polygon -7500403 true true 199 108 198 138 206 135 205 120 222 142 227 135 226 109 220 110 217 126
Polygon -7500403 true true 91 154 95 163 118 161 112 183 127 180 130 164 143 165 143 143 132 147 123 149
Polygon -7500403 true true 162 153 150 153 146 179 154 181 159 170 170 171 168 183 180 185 184 148 176 152 176 164 161 165
Polygon -7500403 true true 199 157 188 187 223 188 225 176 204 175 204 166 214 168 215 161
Polygon -7500403 true true 196 160 198 153 215 149 215 155
Polygon -7500403 true true 4 212 54 259 64 253 35 226 54 212 44 205 30 217 24 206 39 197 31 188
Polygon -7500403 true true 56 194 58 231 65 233 66 213 75 238 90 236 75 189
Polygon -7500403 true true 99 195 95 235 100 238 106 214 112 245 123 244 137 219 130 250 144 250 148 202 123 222 108 195
Circle -7500403 true true 146 207 42
Polygon -7500403 true true 189 206 189 246 217 249 219 206 210 204 209 240 197 241 199 204
Polygon -7500403 true true 274 214 267 201 226 213 222 227 257 222 261 235 245 247 229 237 217 252 256 264 271 240 266 218 238 216 262 209 274 220
Polygon -7500403 true true 52 270 63 295 73 290 73 275 84 294 98 286 104 269 93 265 85 282 77 261 71 265 65 288
Polygon -7500403 true true 113 264 103 294 113 293 122 277 120 291 144 293 130 259
Polygon -7500403 true true 151 262 158 275 148 293 162 298 186 258 177 258 168 271 160 259
Polygon -7500403 true true 197 259 194 283 207 283 209 260
Circle -7500403 true true 191 287 15
Circle -1 true false 158 118 16
Circle -1 true false 135 34 22
Polygon -1 true false 62 209 63 199 71 206
Circle -1 true false 156 218 22
Polygon -1 true false 118 275 119 265 127 272

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

flute
true
0
Polygon -7500403 true true 92 174 62 221 71 218 71 222 71 223 77 219 75 231 80 237 123 187 127 184 132 180 133 178 136 175 131 181 134 174 234 52 216 54 212 38 113 156 109 158 104 159 99 162 96 167
Circle -6459832 true false 58 213 28
Circle -6459832 true false 208 33 27
Circle -16777216 false false 81 185 12
Circle -16777216 false false 92 173 12
Circle -16777216 false false 119 149 12
Circle -16777216 false false 142 119 12
Circle -16777216 false false 194 56 12
Circle -16777216 false false 158 101 12
Circle -16777216 false false 170 88 10
Circle -16777216 false false 197 82 12

giftball
false
0
Circle -2674135 true false 2 1 300
Rectangle -13840069 true false 129 2 163 301
Rectangle -13840069 true false 0 129 303 164
Circle -10899396 true false 71 87 80
Circle -10899396 true false 134 70 101
Polygon -10899396 true false 136 155 76 182 74 203 82 220 85 242 68 268 40 279 39 292 62 299 85 289 101 266 105 244 102 221 107 190 138 163
Polygon -10899396 true false 133 153 165 188 174 219 159 242 156 264 177 276 204 259 223 238 201 238 183 250 182 236 191 214 187 192 175 169 167 166 147 153
Polygon -2674135 true false 127 137 131 117 124 106 110 98 99 101 92 116 89 129 111 141 113 157 124 148 126 140
Polygon -2674135 true false 174 134 168 132 166 113 177 99 192 95 205 103 206 116 185 124 174 131 172 137

hamburger
false
0
Polygon -6459832 true false 52 85 244 90 228 43 152 25 83 41
Polygon -6459832 true false 56 189 248 184 232 231 156 249 87 233
Polygon -13840069 true false 47 99 56 81 84 91 108 83 142 93 164 85 176 92 211 85 228 103 249 91 250 111 184 105 172 109 119 106 105 112 74 105 54 112
Polygon -1184463 true false 47 129 249 132 268 145 255 164 50 163 29 151
Polygon -2674135 true false 95 106 43 109 50 130 122 130 142 117
Polygon -2674135 true false 202 110 150 114 155 128 229 132 246 121 240 111
Polygon -13840069 true false 34 167 73 187 130 181 163 184 201 175 247 181 268 164 178 167 110 167

helicopter
false
0
Polygon -6459832 true false 98 225 117 175 128 179 116 218 128 223 130 234 117 244 98 242 88 241 67 247 48 247 33 248 23 229 38 219 47 203 72 159 83 163 52 227
Polygon -7500403 true true 104 101 77 102 66 106 38 124 35 131 32 145 33 164 36 183 42 204 60 214 83 220 103 215 126 209 165 201 209 189 231 179 258 167 272 158 277 144 272 131 255 130 229 126 188 116 160 111 139 107 112 103 105 103
Polygon -1 true false 89 108 61 119 41 128 37 137 39 147 40 165 40 175 43 181 64 183 85 179 99 173 103 163 99 139 91 113
Polygon -16777216 true false 64 125 57 133 47 138 45 150 50 143 52 131
Polygon -2674135 true false 134 97 129 109 155 115 149 100
Polygon -1 false false 112 126 126 190 203 167 183 128
Polygon -16777216 false false 139 180 138 180 129 151 182 148 189 160
Polygon -16777216 true false 140 163 143 170 148 167 145 161
Polygon -1 true false 129 151 124 136 180 136 183 149
Polygon -16777216 true false 270 135 247 153 260 177 274 135 277 78 293 96 276 138 271 189 281 185 273 139 290 137 291 157
Polygon -6459832 true false 153 222 143 185 132 189 144 228 132 233 130 244 143 254 162 245 171 241 192 237 210 234 217 231 246 218 220 210 213 213 188 169 177 173 197 213
Polygon -16777216 true false 139 95 217 223 237 208 139 99 242 26 240 69 144 101 49 39 51 68

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

ipod
false
14
Polygon -1 false false 60 270 32 257 14 253 27 214 11 205 13 184 7 180 29 160 59 164 228 164 275 167 251 209 282 218 252 244 289 263 225 270
Rectangle -7500403 true false 60 30 225 270
Rectangle -16777216 true true 90 45 195 150
Circle -1 true false 108 168 85
Circle -7500403 true false 116 176 67

island
false
0
Polygon -1184463 true false 178 151 165 143 144 137 136 138 115 138 105 135 90 150 80 161 86 179 96 186 111 190 142 187 166 179 197 182 209 178 212 170 213 163 201 156 185 153
Polygon -10899396 true false 94 151 94 163 98 170 105 175 111 172 144 168 164 174 175 164 188 171 199 168 196 160 192 152 158 141 154 134 131 131 102 134 90 141
Polygon -6459832 true false 128 113 125 119 129 120 132 116 129 112 151 141 120 155 109 139 122 126
Polygon -7500403 true true 64 51 59 42 38 41 27 47 14 60 3 85 10 108 30 138 66 141 84 124 82 117 55 123 33 121 29 114 23 100 26 82 44 66 60 63
Circle -7500403 true true 77 36 75
Polygon -7500403 true true 171 53 150 97 141 106 159 114 170 93 183 70 189 83 175 113 180 119 186 119 210 85 210 100 189 126 207 135 217 112 236 80 238 48 225 45 198 58 190 34 178 48
Circle -1 true false 108 58 34
Polygon -7500403 true true 257 55 219 136 229 143 237 156 246 139 238 123 248 99 260 119 275 105 250 88 285 88 299 81 268 63
Polygon -7500403 true true 45 194 3 268 15 282 33 262 53 267 37 286 62 297 96 216 74 210 59 250 37 247 59 202
Polygon -7500403 true true 102 215 93 297 151 295 148 276 103 280 107 258 143 259 147 241 105 246 112 229 148 231 147 216
Polygon -7500403 true true 165 215 162 295 174 291 174 255 185 289 205 290 180 249 201 237 209 225 204 217 191 210
Circle -1 true false 169 221 18
Polygon -7500403 true true 217 196 208 278 266 276 263 257 218 261 222 239 258 240 262 222 220 227 227 210 263 212 262 197
Polygon -7500403 true true 273 179 270 249 295 257 298 242 296 218 297 199 283 186 268 178
Circle -7500403 true true 269 264 20

jungle-tree
false
0
Polygon -14835848 true false 150 210 135 195 120 210 60 240 75 195 30 150 60 165 75 150 30 120 15 105 90 135 45 90 60 90 90 105 105 120 60 45 105 60 120 60 135 30 150 15 165 30 180 60 195 60 225 45 195 120 210 105 240 90 255 90 210 150 285 105 270 120 225 180 270 150 255 195 225 210 210 240 180 210 165 195
Polygon -6459832 true false 135 195 135 240 135 255 135 285 165 285 165 240 165 195

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

light
false
0
Polygon -1184463 true false 127 24 62 151 143 105 124 229 95 313 179 102 172 82 99 114 163 -6
Polygon -1184463 true false 270 94 190 217 244 206 147 316 276 205 279 188 222 201
Polygon -1184463 true false 29 141 17 249 45 210 38 320 58 190 26 222

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

locked
false
0
Polygon -13840069 true false 27 193 9 248 34 276 53 253 35 241 50 188
Circle -13840069 true false 59 193 70
Circle -16777216 true false 72 213 27
Polygon -13840069 true false 183 209 169 204 142 204 125 273 160 285 173 274 146 262 149 216 178 221 179 220
Polygon -13840069 true false 186 187 189 293 205 290 202 244 222 288 242 287 201 228 216 172 207 176 197 213 193 178
Polygon -13840069 true false 220 210 224 240 242 246 245 228 235 229 234 220 244 219 244 214 232 213 232 206 243 206 242 194 216 200
Polygon -13840069 true false 254 201 259 250 293 228
Polygon -16777216 true false 264 220 264 240 282 228
Polygon -13840069 true false 60 45 45 30 15 45 0 90 60 120 60 150 15 135 0 167 9 178 48 177 79 174 74 111 27 85 31 57 56 61 63 68 76 52
Polygon -13840069 true false 86 37 85 64 94 59 86 174 96 175 108 62 126 58 130 33
Polygon -13840069 true false 124 82 150 76 155 98 142 97 137 153 160 149 156 166 114 167 112 151 122 152 129 104 117 103 117 84
Polygon -13840069 true false 159 33 175 169 201 168 205 146 189 152 171 23 151 32
Polygon -13840069 true false 199 31 215 167 241 166 245 144 229 150 211 21 191 30

lost
false
1
Polygon -7500403 true false 270 75 225 30 30 225 75 270
Polygon -7500403 true false 30 75 75 30 270 225 225 270
Polygon -2674135 true true 30 45 15 60 45 90 45 135 60 135 60 90 90 60 75 45 60 60 60 75 45 75 45 60 30 45 30 60 15 60 30 45 15 60 30 60
Polygon -2674135 true true 210 45 195 60 195 135 225 135 240 135 270 135 270 60 255 45 255 60 255 120 210 120 210 60 210 45 210 60 195 60 210 45 195 60 210 60
Polygon -2674135 true true 120 45 105 60 105 135 135 135 150 135 180 135 180 60 165 45 165 60 165 120 120 120 120 60 120 45 120 60 105 60 120 45 105 45 105 60 120 60
Rectangle -2674135 true true 105 45 180 60
Rectangle -2674135 true true 30 195 45 270
Rectangle -2674135 true true 30 255 90 270
Polygon -2674135 true true 120 180 105 195 105 270 135 270 150 270 180 270 180 195 165 180 165 195 165 255 120 255 120 195 120 180 120 195 105 195 120 180 105 180 105 195 120 195
Rectangle -2674135 true true 105 180 180 195
Rectangle -2674135 true true 255 195 300 210
Rectangle -2674135 true true 270 195 285 270
Rectangle -2674135 true true 195 195 240 210
Rectangle -2674135 true true 195 195 210 240
Rectangle -2674135 true true 195 225 240 240
Rectangle -2674135 true true 225 225 240 270
Rectangle -2674135 true true 195 255 225 270

monkey
false
0
Circle -6459832 true false 97 266 42
Polygon -6459832 true false 108 135 89 161 85 188 85 226 102 266 127 285 185 286 204 262 221 223 216 177 195 130
Circle -6459832 true false 98 20 31
Circle -6459832 true false 90 30 120
Circle -1 false false 108 63 85
Circle -16777216 true false 120 49 16
Circle -16777216 true false 163 49 16
Circle -6459832 true false 178 23 31
Circle -16777216 true false 129 92 14
Circle -16777216 true false 156 92 14
Line -16777216 false 126 121 142 133
Line -16777216 false 141 133 164 133
Line -16777216 false 163 134 178 116
Polygon -1 false false 123 150 111 179 110 215 122 257 151 264 184 260 195 234 198 194 186 150 165 150
Circle -6459832 true false 169 267 42
Circle -6459832 true false 58 140 42
Circle -6459832 true false 196 138 42
Line -16777216 false 144 49 120 38
Line -16777216 false 155 49 176 36
Polygon -6459832 true false 206 230 240 202 240 182 255 174 255 146 271 132 265 111 281 100 289 113 280 127 284 146 271 164 271 206 253 209 251 230 233 229 225 247 213 238

moon
false
0
Circle -1184463 true false 0 0 300
Circle -7500403 true true 90 90 30
Circle -7500403 true true 195 120 30
Circle -7500403 true true 24 144 42
Circle -7500403 true true 114 189 42
Circle -7500403 true true 116 26 67
Circle -7500403 true true 189 189 42

mountain
false
2
Polygon -6459832 true false 152 3 7 284 152 298 301 267
Polygon -16777216 false false 152 5 10 283 151 304 300 269
Polygon -16777216 false false 117 83 89 168 74 210 110 151 108 144
Polygon -16777216 false false 140 37 124 100 147 67
Polygon -1 true false 119 61 140 47 153 60 162 46 184 61 151 7

mr.brown
false
1
Circle -1 true false 110 5 80
Polygon -1 true false 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -1 true false 127 79 172 94
Polygon -1 true false 195 90 240 150 225 180 165 105
Polygon -1 true false 105 90 60 150 75 180 135 105
Polygon -2674135 true true 150 57 159 50 170 53 177 59 187 60 187 51 199 60 192 70 181 73 171 68 162 64 149 59 151 58 149 60 159 62 162 66 169 72
Polygon -2674135 true true 152 57 143 50 132 53 125 59 115 60 115 51 103 60 110 70 121 73 131 68 140 64 153 59 151 58 153 60 143 62 140 66 133 72
Circle -16777216 true false 164 32 11
Circle -16777216 true false 123 32 11
Line -16777216 false 120 195 180 195
Polygon -16777216 false false 169 89 176 103 151 116 147 190 150 115 151 100 169 89 169 91 168 90 150 101 150 122 151 117 177 103 169 88
Polygon -16777216 false false 127 90 120 104 145 117 149 191 146 116 145 101 127 90 127 92 128 91 146 102 146 123 145 118 119 104 127 89
Polygon -8630108 true false 120 196 91 284 136 292 148 226 151 226 164 293 207 278 180 197 120 196 180 196 187 221 191 240 197 262 207 279 188 225 189 235
Polygon -7500403 true false 120 196 133 203 148 210 160 219
Polygon -8630108 true false 120 197 189 235 203 277 206 275 199 264 204 275 198 264 196 257 202 267
Polygon -7500403 false false 206 274 198 258 194 248 191 239 188 232 178 226 162 216 149 212 140 203 127 200 121 196 153 202 162 215 174 226 187 234 190 227 184 219 182 207 179 197 125 197 134 202 143 203 165 210 179 221
Polygon -8630108 true false 187 232 123 199 178 198
Polygon -7500403 false false 72 136 89 163 111 133 120 194 145 195 144 119 120 105 117 104 125 90 105 90 71 136
Polygon -2674135 true true 223 134 208 159 185 130 176 191 151 192 151 117 179 101 172 88 191 88
Rectangle -16777216 true false 119 190 179 198
Polygon -2674135 true true 74 136 89 161 112 132 121 193 146 194 146 119 118 103 125 90 106 90
Rectangle -16777216 true false 118 191 180 197
Polygon -2674135 true true 181 190 188 133 185 131 175 189
Polygon -16777216 true false 192 91 194 89 227 133 221 134
Line -16777216 false 148 103 144 190
Line -16777216 false 149 102 146 188
Line -16777216 false 148 104 147 193

nest
false
0
Polygon -6459832 false false 180 255 75 210 30 150 30 135 90 120 120 195 105 135 150 105 210 150 240 120 255 165 165 180 225 240 165 255 255 225 255 150 255 105 195 90
Polygon -6459832 false false 30 120 90 90 150 90 195 75 255 90 285 135 270 225 210 240 135 255 60 225 15 180 15 135 75 105 120 75 180 90 255 60 270 165 285 210 240 225 195 285 135 270 135 225 60 240 60 180 15 180 45 90 90 135 120 60 210 105 240 60 285 135 240 180 270 240 210 225 210 285 150 210 90 270 90 195 30 210 60 135 0 120 45 75 105 135 105 60 195 75 180 120 240 45 285 75
Polygon -6459832 false false 15 105 75 75 135 75 180 60 240 75 270 120 255 210 195 225 120 240 45 210 0 165 0 120 60 90 105 60 165 75 240 45 255 150 270 195 225 210 180 270 120 255 120 210 45 225 45 165 0 165 30 75 75 120 105 45 195 90 225 45 270 120 225 165 255 225 195 210 195 270 135 195 75 255 75 180 15 195 45 120 -15 105 30 60 90 120 90 45 180 60 165 105 225 30 270 60
Circle -1 true false 71 116 67
Circle -1 true false 135 150 60
Circle -1 true false 131 86 67

not
false
0
Rectangle -2674135 true false 30 90 60 225
Line -2674135 false 30 90 105 225
Rectangle -2674135 true false 90 90 105 225
Circle -2674135 false false 103 103 124
Rectangle -2674135 true false 210 105 285 120
Rectangle -2674135 true false 240 120 255 225
Line -2674135 false 60 105 90 210
Line -2674135 false 45 120 90 195
Line -2674135 false 45 105 90 210
Line -2674135 false 60 105 90 210
Line -2674135 false 45 120 90 210
Line -2674135 false 60 105 90 210
Line -2674135 false 53 110 84 195
Line -2674135 false 50 111 80 172
Line -2674135 false 54 108 69 146
Circle -2674135 false false 118 119 93
Circle -2674135 false false 111 111 108
Circle -2674135 false false 108 109 113
Circle -2674135 false false 119 117 96
Circle -2674135 false false 115 115 100
Circle -2674135 false false 106 106 116
Circle -2674135 false false 114 115 104
Circle -2674135 false false 108 110 112
Circle -2674135 false false 121 118 102
Circle -2674135 false false 104 103 121
Line -2674135 false 57 105 86 204
Line -2674135 false 58 94 87 204
Line -2674135 false 50 118 87 205
Line -2674135 false 53 105 91 204
Line -2674135 false 55 108 89 215

password1
false
0
Rectangle -1 true false 30 30 270 270
Line -16777216 false 45 195 255 195
Polygon -16777216 false false 60 105 60 195 105 165 60 165
Line -16777216 false 120 195 120 60
Line -16777216 false 120 135 135 135
Line -16777216 false 135 60 135 195
Circle -16777216 false false 139 152 42
Circle -1 true false 159 156 30
Line -16777216 false 184 195 192 73
Line -16777216 false 192 73 209 195
Line -16777216 false 185 155 210 155
Line -16777216 false 220 83 220 182
Line -16777216 false 221 183 248 184

password2
false
0
Rectangle -1 true false 30 30 270 270
Line -16777216 false 45 195 255 195
Line -16777216 false 107 195 107 60
Line -16777216 false 135 60 106 115
Circle -16777216 false false 139 152 42
Circle -1 true false 159 156 30
Line -16777216 false 184 195 192 73
Line -16777216 false 192 73 209 195
Line -16777216 false 185 155 210 155
Line -16777216 false 234 83 234 182
Line -16777216 false 107 115 129 194
Line -16777216 false 90 60 90 195
Circle -16777216 false false 50 154 42
Line -16777216 false 223 84 250 83
Line -16777216 false 225 184 252 184

password3
false
0
Rectangle -1 true false 30 30 270 270
Line -16777216 false 45 195 255 195
Line -16777216 false 107 195 105 120
Line -16777216 false 130 196 130 88
Circle -16777216 false false 139 152 42
Line -16777216 false 184 195 192 73
Line -16777216 false 192 73 209 195
Line -16777216 false 185 155 210 155
Line -16777216 false 234 83 234 182
Line -16777216 false 107 115 129 194
Line -16777216 false 50 60 50 195
Circle -16777216 false false 50 154 42
Line -16777216 false 223 84 250 83
Line -16777216 false 225 184 252 184

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

phone
false
7
Polygon -7500403 true false 65 37 83 23 206 19 217 29 225 275 200 291 99 291 79 276
Polygon -16777216 true false 73 44 86 32 197 27 208 40 217 272 200 284 102 287 85 273
Polygon -7500403 true false 85 248 97 236 114 250 131 254 157 254 182 251 199 237 221 244 217 272 203 287 102 289 83 274
Line -16777216 false 112 252 100 286
Line -16777216 false 139 255 129 289
Line -16777216 false 164 254 174 290
Line -16777216 false 182 251 203 298
Rectangle -16777216 true false 145 267 157 279
Rectangle -10899396 true false 87 46 204 225
Line -7500403 false 122 233 123 244
Line -7500403 false 123 239 129 239
Line -7500403 false 129 239 129 247
Line -7500403 false 141 235 143 248
Line -7500403 false 137 242 148 243
Line -7500403 false 163 238 156 238
Line -7500403 false 156 239 158 247
Line -7500403 false 158 248 166 248
Rectangle -1 true false 88 132 203 216
Rectangle -13345367 true false 100 59 119 77
Rectangle -13345367 true false 99 86 118 104
Rectangle -13345367 true false 161 59 180 77
Rectangle -13345367 true false 129 59 148 77
Rectangle -13345367 true false 160 88 179 106
Rectangle -13345367 true false 128 85 147 103

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

postcard
false
11
Rectangle -1 true false 0 16 300 286
Rectangle -2674135 true false 10 35 56 70
Line -2674135 false 10 36 18 27
Line -2674135 false 18 28 25 35
Line -2674135 false 28 69 35 76
Line -2674135 false 12 69 19 76
Line -2674135 false 46 27 53 34
Line -2674135 false 35 27 42 34
Line -2674135 false 26 36 34 27
Line -2674135 false 39 36 47 27
Line -2674135 false 49 78 57 69
Line -2674135 false 35 77 43 68
Line -2674135 false 20 77 28 68
Line -2674135 false 42 71 49 78
Line -2674135 false 56 36 64 45
Line -2674135 false 64 47 55 55
Line -2674135 false 65 62 56 70
Line -2674135 false 56 54 64 63
Line -2674135 false 10 56 1 64
Line -2674135 false 9 37 0 45
Line -2674135 false 1 62 9 71
Line -2674135 false 0 46 8 55
Polygon -2674135 false false 13 89 45 89 44 104 20 105 20 116 44 117 44 144 2 144 3 134 25 133 25 124 10 123 14 85
Polygon -2674135 false false 49 110 49 145 81 145 78 109 49 110
Polygon -2674135 false false 56 118 54 136 71 136 71 118
Circle -2674135 false false 81 94 13
Line -2674135 false 84 147 109 95
Circle -2674135 false false 99 129 13
Polygon -2674135 false false 152 110 126 109 126 140 156 140 153 131 136 130 136 118 154 118 154 108
Polygon -2674135 false false 162 96 162 145 169 142 169 120 176 121 176 137 183 137 183 116 168 114 168 93
Polygon -2674135 false false 205 118 187 118 188 139 198 139 200 143 208 142 206 135 202 135
Polygon -2674135 false false 191 124 191 133 198 133 198 125
Polygon -2674135 false false 210 119 212 142 221 142 220 134 229 134 229 143 236 142 233 118
Polygon -2674135 false false 265 113 239 112 239 143 269 143 266 134 249 133 249 121 267 121 267 111
Polygon -2674135 false false 278 126 294 126 291 112 273 112 274 138 293 138 293 133 278 133
Polygon -2674135 false false 280 116 280 123 289 122 288 117
Polygon -8630108 true true 8 162 6 242 15 242 27 220 39 249 52 249 52 165 39 164 34 212 29 197 17 212 21 159
Polygon -8630108 true true 58 203 58 240 68 239 68 201
Circle -8630108 true true 53 175 16
Polygon -8630108 true true 69 205 69 239 76 236 76 229 85 232 85 238 97 237 97 199 82 206 75 197
Circle -2674135 false false 114 154 20
Polygon -2674135 false false 136 163 136 195 141 195 141 188 150 188 155 202 163 200 158 186 164 171 157 161
Polygon -2674135 false false 141 171 141 183 151 183 153 175 146 172
Polygon -7500403 true false 168 182 167 252 195 252 195 236 179 236 177 182
Circle -7500403 true false 185 199 45
Circle -1 true false 196 212 19
Polygon -1 true false 254 217 251 215 247 212
Polygon -7500403 true false 246 215 247 204 225 203 235 231 220 242 220 250 246 232 235 217
Polygon -7500403 true false 260 221 280 223 280 201 252 203 254 246 279 246 279 233 261 236
Polygon -1 true false 262 209 262 216 276 215 275 208

safe
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -1184463 true false 150 60 255 240 45 240
Rectangle -1 true false 15 105 60 120
Rectangle -1 true false 30 120 45 150
Rectangle -1 true false 75 105 90 150
Rectangle -1 true false 75 120 120 135
Rectangle -1 true false 120 105 135 150
Rectangle -1 true false 150 105 165 150
Rectangle -1 true false 150 105 195 120
Rectangle -1 true false 165 135 195 150
Line -1 false 166 127 190 127
Polygon -1 true false 61 166 26 166 26 189 49 189 48 205 27 205 28 221 58 220 58 181 36 180 36 173 60 173
Polygon -1 true false 78 166 67 219 84 218 87 203 100 203 107 218 122 219 88 155
Polygon -1184463 true false 89 179 87 195 99 193
Polygon -1 true false 129 157 131 220 147 221 148 189 170 190 170 177 143 177 144 167 170 166 169 156
Polygon -1 true false 188 155 189 221 240 221 240 200 205 200 205 192 232 192 232 182 207 182 208 167 240 168 239 153
Polygon -1 true false 18 229 19 289 35 288 42 266 50 290 71 288 70 226 54 225 46 250 42 239 36 252 37 227
Polygon -1 true false 89 234 78 287 95 286 98 271 111 271 118 286 133 287 99 223
Polygon -7500403 true true 98 245 96 261 108 259
Polygon -1 true false 132 230 150 263 144 290 162 291 169 263 181 226 166 225 162 251 145 229

sheep
false
0
Rectangle -7500403 true true 151 225 180 285
Rectangle -7500403 true true 47 225 75 285
Rectangle -7500403 true true 15 75 210 225
Circle -7500403 true true 135 75 150
Circle -16777216 true false 165 76 116

ship
false
4
Rectangle -6459832 true false 75 150 225 240
Polygon -6459832 true false 210 150 285 150 225 240 210 150
Polygon -6459832 true false 90 150 15 150 75 240 90 150
Rectangle -7500403 true false 90 105 210 150
Circle -16777216 true false 108 119 22
Circle -16777216 true false 138 119 22
Circle -16777216 true false 169 119 22
Line -2674135 false 36 181 261 181
Polygon -2674135 true false 36 180 56 211 244 210 264 180
Line -16777216 false 150 104 150 41
Polygon -2674135 true false 150 45 213 60 152 72
Rectangle -16777216 true false 145 40 150 105

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

stag1
false
2
Polygon -7500403 true false 150 295 40 50 150 0 260 50
Polygon -16777216 false false 150 296 37 44 149 -3 262 48
Polygon -16777216 false false 132 247 104 162 89 120 125 179 123 186
Polygon -16777216 false false 155 263 198 166 164 208

stag2
false
2
Polygon -7500403 true false 150 5 40 250 150 300 260 250
Polygon -16777216 false false 150 4 37 256 149 303 262 252
Polygon -16777216 false false 117 83 89 168 74 210 110 151 108 144
Polygon -16777216 false false 140 37 124 100 147 67

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

stephanie1
false
1
Circle -1 true false 42 64 200
Polygon -16777216 false false 119 226 119 227 128 233 138 234 149 230 153 224 155 216 112 217
Circle -16777216 true false 170 180 21
Circle -16777216 true false 78 183 21
Polygon -1184463 false false 68 94 75 107 99 115 125 124 160 124 199 123 225 114 238 107 238 98 242 85 240 75 231 65 212 56 188 45 162 41 133 41 99 44 76 61 68 83 68 98 89 116 146 128 203 124 237 105 239 79 227 63 181 49 121 38 83 52 72 74 70 100 100 120 169 129 233 107 236 69 214 48 146 35 105 39 88 54 66 94 85 118 139 132 222 113 237 73 215 51 156 39 95 34 71 66 58 92 77 124 127 133 200 126 238 105 228 60 126 45 84 64 66 93 81 127 115 129 175 125 216 120 245 88 235 59 201 46 140 37 84 48 63 89 71 117 118 133 174 134 233 123 243 81 199 54 128 40 76 72 71 112 98 120 150 125 203 114 249 97 235 77 217 55 135 43 80 67 68 98 98 119 170 120 215 102 224 75 201 60 142 52 93 68 70 113 120 123 215 113 233 75 207 52 164 51 78 57 61 90 98 127 138 124 193 114 246 88 233 69 210 55 139 39 97 49 79 77 87 125 147 126 210 117 238 91 225 47 183 42 132 37 96 59 77 81 76 104 99 119 186 124 226 106 225 63 195 43 109 46 65 52 61 85 61 101 133 117 233 124 241 97 228 64 183 44 129 46 58 82 59 93
Circle -16777216 false false 42 65 200
Polygon -1184463 false false 232 94 219 101
Polygon -1184463 false false 71 108 74 68 104 55 167 55 175 49 226 77 242 92 232 106 216 120 188 124 151 130 119 126 80 119 75 106

student
false
15
Circle -1 true true 91 51 114
Polygon -1 true true 105 163 116 222 105 276 119 295 136 291 147 237 160 292 179 295 189 276 178 221 190 163
Polygon -1 true true 187 162 222 202 214 227 171 168
Polygon -1 true true 105 163 70 203 78 228 121 169
Rectangle -1 true true 115 141 178 172
Circle -16777216 false false 154 86 40
Circle -16777216 false false 100 85 40
Circle -16777216 false false 100 85 40
Circle -16777216 false false 100 85 40
Circle -16777216 false false 100 85 40
Circle -16777216 false false 102 87 40
Circle -16777216 false false 99 87 40
Circle -16777216 false false 154 86 40
Circle -16777216 false false 154 88 40
Circle -16777216 false false 152 86 40
Line -16777216 false 140 141 162 140
Line -16777216 false 124 63 111 46
Line -16777216 false 136 59 136 41
Line -16777216 false 155 64 161 42
Line -16777216 false 172 62 187 46
Line -16777216 false 109 71 92 54

student-water
false
15
Circle -1 true true 91 51 114
Polygon -1 true true 187 162 222 202 214 227 171 168
Rectangle -1 true true 115 141 178 172
Circle -16777216 false false 154 86 40
Circle -16777216 false false 100 85 40
Circle -16777216 false false 100 85 40
Circle -16777216 false false 100 85 40
Circle -16777216 false false 100 85 40
Circle -16777216 false false 102 87 40
Circle -16777216 false false 99 87 40
Circle -16777216 false false 154 86 40
Circle -16777216 false false 154 88 40
Circle -16777216 false false 152 86 40
Line -16777216 false 124 63 111 46
Line -16777216 false 136 59 136 41
Line -16777216 false 155 64 161 42
Line -16777216 false 172 62 187 46
Line -16777216 false 109 71 92 54
Rectangle -6459832 true false 34 225 274 315
Polygon -1 true true 105 163 116 222 105 276 119 295 136 291 147 237 160 292 179 295 189 276 178 221 190 163
Line -16777216 false 30 245 112 239
Line -16777216 false 31 261 105 255
Line -16777216 false 30 285 105 290
Line -16777216 false 135 285 150 285
Line -16777216 false 195 285 270 285
Line -16777216 false 195 255 270 255
Line -16777216 false 180 240 269 235
Line -16777216 false 143 256 150 255
Line -16777216 false 37 271 106 269
Line -16777216 false 143 271 154 273
Line -16777216 false 192 272 276 267
Polygon -1 true true 105 163 70 203 78 228 121 169
Line -16777216 false 130 146 134 140
Line -16777216 false 134 141 146 135
Line -16777216 false 147 135 160 140
Line -16777216 false 160 140 162 148

sun
false
0
Polygon -955883 true false 30 105 45 135 17 148 48 177 33 200 23 214 59 206 40 249 84 219 75 277 110 238 133 292 140 250 211 284 193 241 251 265 233 219 276 242 256 190 293 212 250 155 276 155 293 151 255 131 284 109 294 96 251 106 280 63 219 76 243 41 208 56 208 14 179 38 165 15 157 37 127 22 136 49 80 31 109 64 48 68 63 88 20 79 50 115
Polygon -2674135 true false 75 71 73 39 99 58 115 10 125 55 153 22 165 38 200 12 190 44 224 30 226 62 265 49 231 83 283 81 255 108 290 122 267 135 277 168 242 172 279 202 246 201 276 222 232 209 251 243 226 233 228 264 210 242 208 269 187 256 171 285 165 261 148 281 132 259 89 280 97 241 65 258 79 228 43 235 54 208 29 216 42 181 27 174 36 157 19 124 47 133 36 89 54 97 41 68 67 83 63 52
Polygon -955883 true false 71 75 62 29 85 58 100 8 121 51 117 12 130 43 144 21 158 48 189 7 180 40 200 48 217 68 234 89 255 114 265 147 285 189 254 174 253 202 231 225 207 246 191 253 169 261 163 295 147 256 126 264 115 259 100 249 81 237 66 225 50 210 21 237 44 193 12 189 49 177 39 144 39 127 5 104 48 118 48 98 58 91 71 77
Polygon -2674135 true false 61 82 48 48 84 78 88 64 99 50 82 55 85 19 110 49 124 43 150 39 182 45 203 54 214 64 235 86 249 111 253 139 292 166 257 165 256 183 252 189 244 202 225 234 209 242 178 252 200 288
Polygon -2674135 true false 78 78 59 97 48 111 16 89 44 131 44 143 4 180 49 177 69 203 69 222 46 264 80 234 88 242 106 249 117 254 116 297 131 247 115 229 67 141 62 90
Circle -1184463 true false 34 34 226
Rectangle -16777216 true false 84 129 138 153
Rectangle -16777216 true false 169 128 240 155
Rectangle -16777216 true false 127 141 180 148
Line -16777216 false 111 210 99 196
Line -16777216 false 151 219 195 202
Line -16777216 false 103 187 101 199
Line -16777216 false 201 190 192 204
Line -16777216 false 109 208 152 219

sunset
false
0
Circle -13345367 true false -103 -47 227
Circle -13345367 true false 83 -91 302
Circle -2674135 true false 30 89 218
Polygon -13791810 true false -27 173 44 168 93 171 156 175 228 186 301 182 334 364 -16 345
Polygon -1184463 true false 47 191 25 197 30 229 40 252 49 280 53 299 138 304 159 296 173 281 195 265 211 240 204 216 194 204 141 184 90 179
Polygon -13840069 true false 57 200 37 210 38 250 75 280 117 296 148 278 190 243 162 189 91 204 57 201
Polygon -13345367 false false 218 281 242 255 258 271 274 255 293 274 298 264 295 288
Polygon -13345367 false false -13 219 1 234 12 219 21 225 24 219 31 243 7 248
Line -955883 false 15 139 -14 127
Line -955883 false 38 114 12 67
Line -955883 false 70 97 43 36
Line -955883 false 110 83 92 14
Line -955883 false 150 80 147 8
Line -955883 false 185 83 214 28
Line -955883 false 217 101 262 52
Line -955883 false 241 128 294 92
Line -955883 false 256 156 314 140

sword
true
10
Polygon -1184463 true false 45 180 42 147 55 153 60 81 91 105 106 66 115 104 136 36 143 74 164 23 180 40 194 15 196 27 226 6 235 26 256 16 242 50 258 91 215 84 211 139 189 137 190 187 144 159 171 235 116 220 126 246 106 220 97 286 75 264 30 265 31 245 4 244 14 186 5 158 29 188 38 160
Polygon -7500403 true false 89 165 54 207 43 196 36 203 34 217 46 233 63 248 91 243 77 228 120 178 134 194 143 197 150 189 157 180 139 170 131 165 231 43 229 25 209 29 110 147 85 124 77 130 73 139 75 155
Line -16777216 false 118 155 222 34
Polygon -13345367 true true 113 151 88 126 76 129 75 146 78 157 84 169 94 168 109 178 118 184 129 189 144 201 154 190 159 182 150 176 141 172 127 160 116 149
Polygon -13345367 true true 52 208 44 196 32 205 33 213 40 222 49 235 56 240 64 247 79 251 89 245 85 237
Line -16777216 false 65 206 79 220
Line -16777216 false 70 192 90 213
Line -16777216 false 81 186 94 198
Line -16777216 false 89 176 105 190
Polygon -6459832 true false 57 207 75 227 78 221 60 197 70 200 81 223 87 217 76 202 70 187 81 196 94 209 96 203 84 193 71 179 83 181 94 193 97 200 100 194 90 178 91 173 105 189 110 188 110 182 98 175 78 177 69 186 58 202

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

thegame
false
0
Polygon -13840069 true false 150 285 285 225 285 75 150 135
Polygon -11221820 true false 151 137 16 77 151 17 286 77
Polygon -8630108 true false 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75
Polygon -1184463 true false 193 61 180 53 159 47 151 48 130 48 119 52 101 59 95 71 101 89 111 96 126 100 157 97 181 89 212 92 224 88 227 80 228 73 216 66 200 63
Polygon -10899396 true false 110 64 110 76 114 83 121 88 127 85 160 81 180 87 191 77 204 84 215 81 212 73 208 65 174 54 170 47 147 44 118 47 106 54
Polygon -6459832 true false 143 24 140 30 144 31 147 27 144 23 166 52 135 66 124 50 137 37
Polygon -13791810 true false 39 75 48 69 51 76 62 71 71 80 66 82 63 75 55 84 48 74
Polygon -13791810 true false 141 120 150 126 156 103 164 124 173 115 168 113 165 120 157 111 150 121
Polygon -13791810 true false 227 81 236 87 238 60 250 85 259 76 254 74 251 81 243 72 236 82
Polygon -16777216 true false 19 119 59 143 58 165 37 148 32 220 21 217 28 147 17 140
Polygon -16777216 true false 65 147 54 229 60 233 69 196 77 199 76 242 84 244 88 187 95 148 84 150 81 187 65 189 70 148
Polygon -16777216 true false 111 153 96 250 135 270 138 247 106 231 114 201 127 219 133 220 138 196 122 186 122 174 136 179 139 168
Polygon -1 true false 200 186 186 156 157 169 156 231 155 260 166 268 182 263 198 249 205 225 177 224 177 235 189 235 182 247 173 251 168 242 164 211 172 190 177 179 189 198 196 200
Polygon -1 true false 202 154 197 190 204 249 215 244 216 209 221 240 227 237 219 191 207 176
Polygon -1 true false 217 163 232 239 240 233 231 195 244 227 241 193 252 228 258 224 236 153 225 157 237 202 220 162
Polygon -1 true false 246 145 261 228 279 216 277 198 268 201 262 185 272 179 274 162 256 162 254 148 278 143 267 124 246 130
Polygon -13840069 true false 204 183 206 212 219 205

tree
false
0
Rectangle -6459832 true false 135 90 165 300
Polygon -10899396 true false 180 75 225 120 240 165 180 135 150 75
Polygon -13840069 true false 195 15 150 60 135 105 180 105 225 15
Polygon -10899396 true false 75 150 75 180 135 150 165 90 120 105
Polygon -10899396 true false 150 75 105 30 60 15 90 75 150 105
Polygon -10899396 true false 180 75 225 120 240 165 180 135 150 75
Polygon -10899396 true false 90 75 45 120 30 165 90 135 120 75
Polygon -13840069 true false 165 90 210 135 225 180 165 150 135 90
Polygon -13840069 true false 60 135 105 90 150 75 120 135 60 165
Polygon -6459832 true false 90 150 90 120 105 105 135 105 120 150

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

unlocked
false
0
Polygon -13840069 true false 196 110 204 134 266 130 264 113
Polygon -13840069 true false 27 193 9 248 34 276 53 253 35 241 50 188
Circle -13840069 true false 59 193 70
Circle -16777216 true false 72 213 27
Polygon -13840069 true false 183 209 169 204 142 204 125 273 160 285 173 274 146 262 149 216 178 221 179 220
Polygon -13840069 true false 186 187 189 293 205 290 202 244 222 288 242 287 201 228 216 172 207 176 197 213 193 178
Polygon -13840069 true false 220 210 224 240 242 246 245 228 235 229 234 220 244 219 244 214 232 213 232 206 243 206 242 194 216 200
Polygon -13840069 true false 254 201 259 250 293 228
Polygon -16777216 true false 264 220 264 240 282 228
Polygon -13840069 true false 42 43 3 130 23 150 76 165 96 57 82 52 60 141 28 121 56 55
Polygon -13840069 true false 110 80 104 163 125 159 123 111 165 167 190 161 184 87 164 80 163 128 136 84

waves
false
0
Polygon -13791810 true false 42 186 52 197 63 187 72 181 81 178 93 184 99 187 103 195 115 186 104 194 119 195 127 187 136 181 144 178 155 176 168 185 171 193 180 194 181 192 187 184 191 177 205 175 210 175 218 181 227 188 230 193 240 186 229 172 204 158 175 177 148 159 112 177 80 162
Polygon -13791810 true false 67 181 48 187 56 181 70 175 84 178 92 178 111 181 110 181 123 172 179 180 158 183 188 179 196 170 207 168 221 171 240 186 211 173
Polygon -11221820 true false 139 249 152 238 166 233 179 237 194 245 203 245 213 234 225 230 247 234 255 243 264 252 277 244 271 225 262 225 249 222 237 215 228 216 204 222 200 234 190 225
Polygon -11221820 true false 139 244 131 238 157 225 167 218 186 225 199 228 217 219 243 220 266 230 261 242 249 224 234 224 215 220 194 242 194 233 186 228 183 219 172 220 160 220 150 227 132 236
Polygon -11221820 true false 132 239 139 248 166 232 175 234 187 235 191 227 184 221 177 221 162 214 156 218 146 229

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

white-out
false
0
Rectangle -1 true false 0 -15 315 300

won
false
6
Polygon -7500403 true false 295 84 250 39 55 234 100 279
Polygon -7500403 true false 0 199 47 145 128 245 103 280
Rectangle -13840069 true true 38 36 52 90
Rectangle -13840069 true true 87 40 103 126
Rectangle -13840069 true true 94 43 172 55
Rectangle -13840069 true true 147 44 163 132
Rectangle -13840069 true true 94 119 156 134
Rectangle -13840069 true true 201 47 216 135
Rectangle -13840069 true true 198 123 266 138
Rectangle -13840069 true true 246 49 268 129
Rectangle -13840069 true true 17 165 37 281
Rectangle -13840069 true true 91 167 112 279
Rectangle -13840069 true true 133 170 148 281
Rectangle -13840069 true true 196 169 211 282
Rectangle -13840069 true true 253 174 270 277
Polygon -13840069 true true 66 33 19 137 39 137 82 30
Polygon -13840069 true true 203 175 253 273 260 259 208 169
Polygon -13840069 true true 21 274 61 180 106 269 92 272 61 224
Rectangle -13840069 true true 135 165 180 180
Rectangle -13840069 true true 165 180 180 285
Rectangle -13840069 true true 135 270 180 285

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
