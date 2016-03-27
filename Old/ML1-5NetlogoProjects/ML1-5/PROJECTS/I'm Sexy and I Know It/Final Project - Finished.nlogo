globals [clock game-started? game-over? killedzombies start reflectrate]
turtles-own [bosshp monsterhp]
patches-own [oldpcolor]
extensions [sound]

breed [heros hero]
breed [zombies zombie]
breed [grass-squares grass-square ]   
breed [mines mine]      
breed [markers marker]
breed [gods god]
breed [bosses boss]
breed [beams beam]
breed [badbeams badbeam]
breed [unhitareas unhitarea]



to startup ;Starting Screen + Music
  user-message (word "Enjoy the music! It'll play in a few seconds! Press Choose Occupation to Begin!")
  import-drawing "Menu.jpg"
  ask patch 399 299 [set pcolor 99]
  sound:play-sound "Indestructible.wav"
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to menu ;Return to menu after a game over or just, restart.
  ca
  set-patch-size 1.788 ;;better picture quality
  resize-world 0 399 0 299 ;;resizes to fit the menu screen
  ask patch 399 299 [set pcolor 99]
  import-drawing "Menu.jpg"
  set start false
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to choice ;;allows the user to have privileges as Mr.Brown/Ms.Pascu or play as other
          ;;only works for menu screen!!
  if [pcolor] of patch 399 299 = 99 [if mouse-down? [
    if mouse-xcor > 237 and mouse-xcor < 336 and mouse-ycor > 168 and mouse-ycor < 246 [
      set start true
    ]
  ]]
  if start = true [
    if Character = "Mr. Brown" [
      cutscene1
      Mr.BrownScene
      stop]
    if Character = "Ms. Pascu" [
      cutscene2
      Ms.PascuScene
      stop
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to cutscene1 ;Ms. Pascu gets kidnapped!
  ca
  import-drawing "Cutscene1.jpg"
  crt 2 [set shape "chatspeck"
    set label-color yellow]
  ask turtle 0 [setxy 130 128]
  ask turtle 1 [setxy 292 117]
  ask turtle 0 [set label "Hello Ms. Pascu!"]
  wait 2
  ask turtle 1 [set label "Hello Mr. Brown!"]
  wait 2
  ask turtle 0 [set label "Are you going anywhere today?"]
  wait 3
  ask turtle 1 [set label "Nope."]
  wait 1.5
  ask turtle 1 [set label "Staying home today."]
  wait 2
  ask turtle 0 [set label "Let me take you out to dinner! ^-^"]
  wait 3
  ask turtle 1 [set label "Sure thing!"]
  wait 2
  crt 1
  ask turtle 2 [
    setxy 332 118 
    set heading 0 
    set shape "bigfoot" 
    set size 100 
    set label-color 95
  ]
  ask turtle 0 [set label "WooHoo! What the.. WHO ARE YOU!!!!!     "]
  ask turtle 1 [set label ""]
  wait 4
  ask turtle 0 [set label ""]
  ask turtle 2 [set label "I am taking Ms. Pascu to dinner! AJAJAJAJAJAJAJA~"]
  wait 2
  ask turtle 1 [set label "Save me Mr. Brown!  =[    "]
  wait 2
  ask turtle 1 [set label ""]
  ask turtle 2 [set label "Try and stop me!"]
  ask turtle 0 [set label "I SHALL KILL YOU STRANGER!"]
  wait 3
  ask turtle 0 [set label ""]
  ask turtle 2 [set label "Heh good luck Brown...      "
    wait 2
    set label "but you will have to..."
    wait 2
    set label "Kill my army of Zombies!"
    set shape "bigfootscream"]
  wait 2
  ask turtle 0 [set label "WHAT IN THE WORLD?"]
  wait 2
  ask turtle 2 [set label "HAHAHA"]
  ask turtle 1 [set label ""]
  ask turtle 0 [set label ""
    setxy 200 155]
  wait 1
  import-drawing "Cutscene1 Later.jpg"
  ask turtle 1 [
    die
  ]
  ask turtle 2 [
    die
  ]
  crt 6
  ask turtle 3 [
    setxy 33 272
    set size 50
    ifelse random 3 = 0 [set shape "monster"]
    [ifelse random 2 = 0 [set shape "monster2"]
      [set shape "monster3"
      ]
    ]
  ]
  ask turtle 4 [
    setxy 33 28
    set size 50
    ifelse random 3 = 0 [set shape "monster"]
    [ifelse random 2 = 0 [set shape "monster2"]
      [set shape "monster3"
      ]
    ]
  ]
  ask turtle 5 [
    setxy 33 150
    set size 50
    ifelse random 3 = 0 [set shape "monster"]
    [ifelse random 2 = 0 [set shape "monster2"]
      [set shape "monster3"
      ]
    ]
  ]
  ask turtle 6 [
    setxy 367 272
    set size 50
    ifelse random 3 = 0 [set shape "monster"]
    [ifelse random 2 = 0 [set shape "monster2"]
      [set shape "monster3"
      ]
    ]
  ]
  ask turtle 7 [
    setxy 367 28
    set size 50
    ifelse random 3 = 0 [set shape "monster"]
    [ifelse random 2 = 0 [set shape "monster2"]
      [set shape "monster3"
      ]
    ]
  ]
  ask turtle 8 [
    setxy 367 150
    set size 50
    ifelse random 3 = 0 [set shape "monster"]
    [ifelse random 2 = 0 [set shape "monster2"]
      [set shape "monster3"
      ]
    ]
  ]
  wait 2
  ask turtle 0 [set label "Here I come!"]
  wait 2
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to cutscene2 ;Mr.Brown gets Kidnapped!
  ca
  import-drawing "Cutscene2.jpg"
  crt 2 [set shape "chatspeck"
    set label-color yellow]
  ask turtle 0 [setxy 130 128]
  ask turtle 1 [setxy 292 117]
  ask turtle 1 [set label "Hello Mr. Brown!"]
  wait 2
  ask turtle 0 [set label "Hello Ms. Pascu!   "]
  wait 2
  ask turtle 1  [set label "Today is such a lovely day!"]
  wait 2
  ask turtle 0 [set label "Why, yes it is!"]
  wait 2
  ask turtle 0 [set label "Let's go eat outside!"]
  wait 3
  ask turtle 1  [set label "I'd love to!"]
  wait 2
  crt 1
  ask turtle 2 [setxy 219 190 
    set heading towards patch 130 128 
    set shape "bigfoot" 
    set size 100 
    set label-color 95]
  wait 2
  ask turtle 1  [set label ""]
  ask turtle 0 [set label "Yay! Hello, who are you?"]
  wait 2
  ask turtle 2 [set label "I am your father! You will come with me Ms. Pascu" ]
  wait 4
  ask turtle 0 [set label "Wait... what?!?"]
  wait 2
  ask turtle 2 [set label "As for you, Mr.Brown, You will have to deal with...   "]
  wait 3
  ask turtle 0 [set label ""]
  ask turtle 2 [set label "MY ARMY OF ZOMBIES :D   " 
    set shape "bigfootscream"]
  wait 3
  ask turtle 2 [set label "HAHAHA"]
  wait 2
  import-drawing "Cutscene2 Later.jpg"
  ask turtle 1 [setxy 200 155]
  ask turtle 2 [die]
  ask turtle 0 [die]
  crt 6
  ask turtle 3 [
    setxy 33 272
    set size 50
    ifelse random 3 = 0 [set shape "monster"]
    [ifelse random 2 = 0 [set shape "monster2"]
      [set shape "monster3"
      ]
    ]
  ]
  ask turtle 4 [
    setxy 33 28
    set size 50
    ifelse random 3 = 0 [set shape "monster"]
    [ifelse random 2 = 0 [set shape "monster2"]
      [set shape "monster3"
      ]
    ]
  ]
  ask turtle 5 [
    setxy 33 150
    set size 50
    ifelse random 3 = 0 [set shape "monster"]
    [ifelse random 2 = 0 [set shape "monster2"]
      [set shape "monster3"
      ]
    ]
  ]
  ask turtle 6 [
    setxy 367 272
    set size 50
    ifelse random 3 = 0 [set shape "monster"]
    [ifelse random 2 = 0 [set shape "monster2"]
      [set shape "monster3"
      ]
    ]
  ]
  ask turtle 7 [
    setxy 367 28
    set size 50
    ifelse random 3 = 0 [set shape "monster"]
      [ifelse random 2 = 0 [set shape "monster2"]
        [set shape "monster3"
        ]
      ]
  ]
  ask turtle 8 [
    setxy 367 150
    set size 50
    ifelse random 3 = 0 [set shape "monster"]
    [ifelse random 2 = 0 [set shape "monster2"]
      [set shape "monster3"
      ]
    ]
  ]
  ask turtle 1  [set label "But I'm Ms. Pascu.."]
  wait 4
  ask turtle 1  [set label "I'll have to rescue Mr. Brown!"]
  wait 5
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to Mr.BrownScene
  ca
  resize-world 0 399 0 299
  set-patch-size 1.788
  ask patches [set pcolor 55]
  import-drawing "World.jpg"
  create-gods 1 [
    setxy 20 40
    set size 50 
    set shape "swordman"
    set heading 0
  ]
  set killedzombies 0
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to walkup ;move up
  ask gods [
    set heading 0
    fd 10
    if shape != "tank" [
      ifelse count bosses = 0 [ifelse ycor < 70 and shape != "tank" [set shape "swordman"]
        [set shape "swordman flying"
        ]
      ]
      [set shape "swordman flying"]
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to walkdown ;move down
  ask gods [
    set heading 0
    bk 10
    if shape != "tank" [
      ifelse count bosses = 0 [ifelse ycor < 70 [set shape "swordman"]
        [set shape "swordman flying"
        ]
      ]
      [set shape "swordman flying"]
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to swing ;one hit k.o. slash at zombies
  if [shape] of one-of gods = "swordman" or [shape] of one-of gods = "swordman flying" [
    ask gods [
      if Sound-Effects = true 
      [sound:play-sound "Sword-Stab.wav"
      ]
      ifelse ycor < 70 [
        set heading 0
        set shape "swing"
        wait .025
        set shape "swing2"
        wait .025
        set shape "swing3"
        wait .025
      ]
      [
        set heading 0
        set shape "swing flying"
        wait .025
        set shape "swing2 flying"
        wait .025
        set shape "swing3 flying"
        wait .025
      ]
      
      if any? zombies in-radius 40 [
        set killedzombies killedzombies + (count zombies in-radius 40)
        ask zombies in-radius 40 [
          set shape "fire" 
          wait .1 
          die
        ]
      ]
      if any? bosses in-radius 70 [
        ask bosses in-radius 70 [
          set bosshp bosshp - 1
        ]
      ]
      wait .025
      ifelse count bosses = 0 [ifelse ycor < 70 [set shape "swordman"]
        [set shape "swordman flying"]
      ]
      [set shape "swordman flying"]
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to swordbeam ;shoots out sword beams or missles!
  carefully [if [shape] of one-of gods = "swordman" or [shape] of one-of gods = "swordman flying"[
    if mouse-down? [
      if (count beams = 0) [
        ask gods [
          set heading (towardsxy mouse-xcor mouse-ycor) - 90
          if Sound-Effects = true [
            carefully [sound:play-sound "Electricity.wav"] 
            [sound:stop-music]
          ]
          ask patch-here [
            sprout-beams 1 [
              set shape "beam" 
              set color beam-color
              facexy mouse-xcor 
              mouse-ycor 
              set size 50]
          ]
          ifelse count bosses = 0 [ifelse  ycor < 50 [
            set shape "swing"
            wait .025
            set shape "swing2"
            wait .025
            set shape "swing3"
            wait .025
            set shape "swordman"
          ]
          [
            set shape "swing flying"
            wait .025
            set shape "swing2 flying"
            wait .025
            set shape "swing3 flying"
            wait .025
            set shape "swordman flying"
          ]]
          [
            set shape "swing flying"
            wait .025
            set shape "swing2 flying"
            wait .025
            set shape "swing3 flying"
            wait .025
            set shape "swordman flying"
          ]
        ]
      ]
    ]
  ]
  ]
  [stop]
  carefully [if [shape] of one-of gods = "tank" [
    if mouse-down? [
      if (count beams < 2) [
        ask gods [
          carefully [
            set heading (towardsxy mouse-xcor mouse-ycor) - 90
          ]
          [
            set heading 90
          ]
          if Sound-Effects = true [
            carefully 
            [sound:play-sound "Boom.wav"]
            [sound:stop-music]
          ]
          ask patch-here [
            sprout-beams 1 [
              set shape "missle"
              set heading towardsxy mouse-xcor mouse-ycor
              set size 50]
          ]
        ]
      ]
    ]
  ]
  ]
  [stop]
end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to SwordMasterGo
  if [pcolor] of patch 399 299 = 55
  [
    if [plabel] of patch 396 4 = "You Lose!" [stop]
    swordbeam
    if difficulty = "Easy" [
      ifelse killedzombies < 100 [SpawnZombie]
      [
        sound:play-sound-and-wait "Win.wav"
        bawss
      ]
    ]
    if difficulty = "Medium" [
      ifelse killedzombies < 150 [SpawnZombie]
      [sound:play-sound-and-wait "Win.wav"
        bawss
      ]
    ]
    if difficulty = "HardCore" [
      ifelse killedzombies < 200 [SpawnZombie]
      [sound:play-sound-and-wait "Win.wav"
        bawss
      ]
    ]
    ask zombies [
      if monsterhp <= 0 [
        set killedzombies killedzombies + 1
        set shape "fire" 
        wait .1
        die
      ]
    ]
    
    ZombieDirection
    BeamDirection
  ]
  if [pcolor] of patch 399 299 = 0 [ 
    if [plabel] of patch 396 4 = "You Lose!" [stop]
    if [plabel] of patch 396 4 = "You Win!" [stop]
    if count bosses = 0 
    [
      ask gods [hide-turtle]
      import-drawing "Winner1.jpg"
      sound:play-sound "Applause.wav"
      ask patch 396 4 [
        set plabel "You Win!"
      ]
      stop
    ]
    if count gods = 0
    [
      ask patch 396 4 [
        set plabel "You Lose!"
        ask bosses [hide-turtle]
        sound:play-sound-and-wait "Scream.wav" 
      ]
      stop
    ]
    Swordbeam
    BossMovement
    BossDirection
    InstantDeath
    BossBeamDirection
    BadBeamDirection
    tick
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to SpawnZombie
  if difficulty = "Easy" [
    ifelse killedzombies < 20 [
      every 10 [
        create-zombies 6 [
          ifelse random 4 = 0 [
            set shape "monster"
            set monsterhp 120
            setxy max-pxcor random 59
          ]
          [
            ifelse random 3 = 0 [
              set shape "monster2"
              set monsterhp 100
              setxy max-pxcor random 59
            ]
            [
              set shape "monster3"
              set monsterhp 80
              setxy max-pxcor (random 240) + 60
            ]
          ]
          set heading 270
          set size 50
          set label word "HP" monsterhp
        ]
      ]
    ]
    [every 8 [
      create-zombies 6 [
        ifelse random 4 = 0 [
          set shape "monster"
          set monsterhp 160
          setxy max-pxcor random 59
        ]
        [
          ifelse random 3 = 0 [
            set shape "monster2"
            set monsterhp 140
            setxy max-pxcor random 59
          ]
          [
            set shape "monster3"
            set monsterhp 120
            setxy max-pxcor (random 240) + 60
          ]
        ]
        set heading 270
        set size 50
        set label word "HP" monsterhp
      ]
    ]
    ]
  ]
  if difficulty = "Medium" [
    ifelse killedzombies < 40 [
      every 8 [create-zombies 10 [
        ifelse random 4 = 0 [
          set shape "monster"
          set monsterhp 200
          setxy max-pxcor random 59
        ]
        [
          ifelse random 3 = 0 [
            set shape "monster2"
            set monsterhp 180
            setxy max-pxcor random 59
          ]
          [
            set shape "monster3"
            set monsterhp 160
            setxy max-pxcor (random 240) + 60
          ]
        ]
        set heading 270
        set size 50
        set label word "HP" monsterhp
      ]
      ]
    ]
    [every 6 [
      create-zombies 10 [
        ifelse random 4 = 0 [
          set shape "monster"
          set monsterhp 240
          setxy max-pxcor random 59
        ]
        [
          ifelse random 3 = 0 [
            set shape "monster2"
            set monsterhp 220
            setxy max-pxcor random 59
          ]
          [
            set shape "monster3"
            set monsterhp 200
            setxy max-pxcor (random 240) + 60
          ]
        ]
        set heading 270
        set size 50
        set label word "HP" monsterhp
      ]
    ]
    ]
  ]
  if difficulty = "HardCore" [
    ifelse killedzombies < 50 [
      every 6 [create-zombies 14 [
        ifelse random 4 = 0 [
          set shape "monster"
          set monsterhp 480
          setxy max-pxcor random 59
        ]
        [
          ifelse random 3 = 0 [
            set shape "monster2"
            set monsterhp 460
            setxy max-pxcor random 59
          ]
          [
            set shape "monster3"
            set monsterhp 440
            setxy max-pxcor (random 240) + 60
          ]
        ]
        set heading 270
        set size 50
        set label word "HP" monsterhp
      ]
      ]
    ]
    [every 4 [
      create-zombies 14 [
        ifelse random 4 = 0 [
          set shape "monster"
          set monsterhp 540
          setxy max-pxcor random 59
        ]
        [
          ifelse random 3 = 0 [
            set shape "monster2"
            set monsterhp 520
            setxy max-pxcor random 59
          ]
          [
            set shape "monster3"
            set monsterhp 500
            setxy max-pxcor (random 240) + 60
          ]
        ]
        set heading 270
        set size 50
        set label word"HP" monsterhp
      ]
    ]
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to ZombieDirection
  ask zombies [ifelse xcor < 200 
    [carefully [
      set heading towards one-of gods
    ] 
    [fd 1]
    ]
    [
      ask zombies with [pxcor >= 200]
        [set heading 270]]
  ]
  if count gods != 1 [
    ifelse "Yes, I shall abuse my powers." = user-one-of "Oh Darn. Looks like you failed Mr. Brown. Would you like to abuse the god powers and continue? You can reset or keep progress." ["Yes, I shall abuse my powers." "No, I can play fair and lose."]
    [
      ifelse "Keep my progress." = user-one-of "Keep progress or reset?" ["Keep my progress." "Reset."]
      [
        ask zombies [die]
        create-gods 1 [
          set shape "swordman"
          set size 50
          setxy 20 40
          set heading 0
        ]
      ]
      [
        mr.brownscene
      ]
    ]
    [
      ca
      create-zombies 1 [
        setxy 187 158
        set size 50 
        set label "You have FAILED" 
        set shape "bigfoot"
      ]
      ask patch 396 4 [
        set plabel "You Lose!"
      ]
      sound:play-sound-and-wait "Scream.wav"
      stop
    ]
  ]
  if count zombies > 60 [ask zombies 
    [fd .3]
  ]
  if count zombies > 100 [ask zombies 
    [fd .3]
  ]
  ask zombies [
    if any? gods-here [ask gods-here [die]
    ]
  ]
  if count beams > 0 [
    ask zombies [fd .04]
  ]
  if count beams > 6 [
    ask zombies [fd .1]
  ]
  carefully [ifelse [shape] of one-of gods != "swordman" [
    ask zombies [fd .006]     
    if difficulty = "Easy" [
      ask zombies [fd .004]
    ]
    if difficulty = "Medium" 
    [
      ask zombies [fd .008]
    ]
    if difficulty = "HardCore" [
      ask zombies [fd .0012]
    ]
  ]
  [ask zombies [fd .003]
    if difficulty = "Easy" [
      ask zombies [fd .004]
    ]
    if difficulty = "Medium" 
    [
      ask zombies [fd .008]
    ]
    if difficulty = "HardCore" [
      ask zombies [fd .012]
    ]
  ]
  ]
  [
    ask zombies [bk 1]
  ]
  
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to BeamDirection
  ask beams [
    if shape = "beam"[
      if pxcor = max-pxcor or pxcor = min-pxcor or pycor = max-pycor or pycor = min-pycor [die]
      forward .2
    ]
    if shape = "missle" [
      if pxcor = max-pxcor or pxcor = min-pxcor or pycor = max-pycor or pycor = min-pycor [die]
      forward .5
    ]
  ]
  ask beams [
    if shape = "beam" [if any? zombies in-radius 15 [
      ask zombies in-radius 15 [
        set monsterhp monsterhp - 10
        set label word "HP" monsterhp
      ]
      fd 10
    ]
    ]
    if shape = "missle" [if any? zombies in-radius 15 [
      ask zombies in-radius 15 [
        set monsterhp monsterhp - 5
        set label word "HP" monsterhp
      ] 
    ]
    fd 10
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to bawss
  ca
  import-pcolors "Background.jpg"
  ask patches [
    set oldpcolor pcolor
  ]
  create-gods 1 [
    setxy 20 150
    set size 50
    set shape "swordman flying"
    set heading 0
  ]
  create-bosses 1 [
    set heading 0
    setxy 270 150
    set size 50
    set shape "bigfoot"
  ]
  if difficulty = "Easy" [
    set reflectrate 9
    ask bosses [
      set bosshp 40
    ]
  ]
  if difficulty = "Medium" [
    set reflectrate 6
    ask bosses [
      set bosshp 80
    ]
  ]
  if difficulty = "HardCore" [
    set reflectrate 3
    ask bosses [
      set bosshp 120
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to BossDirection
  if difficulty = "Easy" [
    if (count bosses = 1) [
      ask bosses [if ticks mod 1000 = 0 and ticks != 0 [
        set shape "bigfootscream"
        ask n-of (random 10000 + 1) patches [
          set pcolor red
        ]
        ask patches in-radius 80 [
          set pcolor red
        ]
        ask patches with [pcolor = red] [
          ask gods-here [die]
        ]
        wait .1
        ask patches with [pcolor = red] [
          set pcolor oldpcolor]
      ]
      ask gods-here [die]
      set shape "bigfoot"
      ]
    ]
    ask bosses [
      if bosshp <= 0 [die]
    ]
  ]
  if difficulty = "Medium" [
    if (count bosses = 1) [
      ask bosses [if ticks mod 800 = 0 and ticks != 0 [
        set shape "bigfootscream"
        ask n-of (random 20000 + 1) patches [
          set pcolor red
        ]
        ask patches in-radius 150 [
          set pcolor red
        ]
        ask patches with [pcolor = red] [
          ask gods-here [die]
        ]
        wait .1
        ask patches with [pcolor = red] [
          set pcolor oldpcolor]
      ]
      ask gods-here [die]
      set shape "bigfoot"
      ]
    ]
    
    ask bosses [
      if bosshp <= 0 [die]
    ]
  ]
  if difficulty = "HardCore" [
    if (count bosses = 1) [
      ask bosses [if ticks mod 600 = 0 and ticks != 0 [
        set shape "bigfootscream"
        ask n-of (random 30000 + 1) patches [
          set pcolor red]
        ask patches in-radius 200 [
          set pcolor red
        ]
        ask patches with [pcolor = red] [
          ask gods-here [die]
        ]
        wait .1
        ask patches with [pcolor = red] [
          set pcolor oldpcolor]
      ]
      ask gods-here [die]
      set shape "bigfoot"
      ]
    ]
    ask bosses [
      if bosshp <= 0 [die]
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to InstantDeath
  if difficulty = "Easy" [if ticks > 30000 [
    ask bosses [
      ask patch-here [
        sprout-badbeams 1 [
          set shape "kirby" 
          set size 50
          carefully [
            set heading towards one-of gods
          ] 
          [
            fd 1
          ]
        ]
      ]
    ]
    ask badbeams [
      fd 20
    ]
  ]]
  if difficulty = "HardCore" [if ticks > 50000 [
    ask bosses [
      ask patch-here [
        sprout-badbeams 1 [
          set shape "kirby" 
          set size 50
          carefully [
            set heading towards one-of gods
          ] [
          fd 1
          ]
        ]
      ]
    ]
    ask badbeams [
      fd 20
    ]
  ]
  ]
  if difficulty = "Medium" [if ticks > 40000 [
    ask bosses [
      ask patch-here [
        sprout-badbeams 1 [
          set shape "kirby" 
          set size 50
          carefully [
            set heading towards one-of gods
          ] [
          fd 1
          ]
        ]
      ]
    ]
    ask badbeams [
      fd 20
    ]
  ]
  ]
  if ticks mod 1000 = 0 and ticks != 0 [
    ask bosses [
      ask patch-here [
        sprout-badbeams 1 [
          set shape "kirby"
          set size 50
          carefully [
            set heading towards one-of gods
          ] [
          fd 1
          ]
        ]
      ]
    ]
    ask badbeams [
      fd 20
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to BossBeamDirection
  ask beams [
    if pxcor = max-pxcor or pxcor = min-pxcor or pycor = max-pycor or pycor = min-pycor [die]
    forward 1
  ]
  ask beams [
    if any? bosses in-radius 30 [
      ifelse random reflectrate = 1 [
        set breed badbeams
        set shape "kirby"
        set size 50
        carefully [
          set heading towards one-of gods
        ] [
        forward 1
        ]
        forward 1
      ]
      [
        ask bosses in-radius 30 [
          set bosshp bosshp - 4
        ]
        set shape "clash"
        wait .1
        die
      ]
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to BadBeamDirection
  ask badbeams [
    if difficulty = "Easy" [
      fd 1
      if any? gods in-radius 30 [
        ask gods in-radius 30 [
          die
        ]
      ]
      if pxcor = max-pxcor or pxcor = min-pxcor or pycor = max-pycor or pycor = min-pycor [die]
    ]
    if difficulty = "Medium" [
      fd 2
      if any? gods in-radius 30 [
        ask gods in-radius 30 [
          die
        ]
      ]
      if pxcor = max-pxcor or pxcor = min-pxcor or pycor = max-pycor or pycor = min-pycor [die]
    ]
    if difficulty = "HardCore" [
      fd 3
      if any? gods in-radius 30 [
        ask gods in-radius 30 [die]
      ]
      if pxcor = max-pxcor or pxcor = min-pxcor or pycor = max-pycor or pycor = min-pycor [die]
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to BossMovement
  if ticks mod 800 = 0 and ticks != 0 [
    ask bosses [
      setxy random 80 + 270 random 300
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to Transform
  ask gods [
    ifelse shape = "swordman" or shape = "swordman flying"[
      set shape "tank"
      set heading 0
    ]
    [
      if ycor < 70 and count bosses = 1 [set shape "swordman"]
      if ycor >= 50 or count bosses = 1 [set shape "swordman flying"]
      set heading 0
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to Ms.PascuScene
  ifelse user-yes-or-no? "Ms. Pascu, Is this your first time playing?"
  [user-message (word "This is simply a minesweeper game to defeat the zombies and save Mr. Brown. Begin by pressing your start button and clicking on any patch. You can set your zombie amount. We've took your 'immortal' consideration and allowed you to reset the zombies when you lose!")]
  [user-message (word "Good luck and show off your skills!. We've took your 'immortal' consideration and allowed you to reset the zombies when you lose!")]
  clear-all
  resize-world 0 46 0 34
  set-patch-size 14.83
  set clock 0
  set game-started? false
  set game-over? false
  set-default-shape grass-squares "mine1"
  ifelse random 3 = 0 [
    set-default-shape mines "monster"
  ]
  [
    ifelse random 2 = 0 [
      set-default-shape mines "monster"
    ]
    [
      set-default-shape mines "monster2"
    ]
  ]
  set-default-shape markers "missle"
  ask patches [
    sprout-grass-squares 1 [
      set color green
    ]
    set pcolor gray
  ]
  if mine-difficulty = "Easy" [
    ask n-of 40 patches [
      sprout-mines 1 [
        set color black
        hide-turtle
      ]
    ]
  ]
  if mine-difficulty = "Medium" [
    ask n-of 80 patches [
      sprout-mines 1 [
        set color black
        hide-turtle
      ]
    ]
  ]
  if mine-difficulty = "HardCore" [
    ask n-of 200 patches [
      sprout-mines 1 [
        set color black
        hide-turtle
      ]
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to pascustart
  carefully [
    if game-over? [
      ask markers with [
        any? mines-here
      ] [die]
      ask markers [
        set color gray  - 2
      ]
      ask mines [
        show-turtle
      ]
      set game-over? true
      ca
      crt 1 [
        setxy 22 18 
        set shape "bigfoot" 
        set heading 0
        set size 20 
        set label "You have FAILED"
      ]
      sound:play-sound-and-wait "Scream.wav"
      stop
    ]
    if not game-started? [
      reset-timer
      set game-started? true
    ]
    set clock timer
    if all? grass-squares [any? mines-here] [
      ;; you win!!!
      ask mines [ show-turtle ]
      ca
      import-drawing "Winner2.jpg"
      sound:play-sound-and-wait "Applause.wav"
      ask patch 46 0 [
        set plabel "CONGRATZ"
      ]
      stop
    ]
    if mouse-down? [
      ask patch (round mouse-xcor) (round mouse-ycor) [
        ifelse any? mines-here
        [ set game-over? true ] 
        [ clear ]               
      ]
    ]
    tick
  ]
  [stop]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to clear  ;; patch procedure
  ask grass-squares-here [ die ]
  ask markers-here [ die ]
  let total count neighbors with [any? mines-here]
  ifelse total > 0
    [ set plabel total ]
    [ ask neighbors with [any? grass-squares-here]
      [ clear ] ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to mark/unmark
  if not mouse-inside? [ stop ]
  ask patch round mouse-xcor round mouse-ycor [
    if any? grass-squares-here [
      ifelse any? markers-here
        [ ask markers-here [ die ] ]
        [ sprout-markers 1 [ set color black ] ]
    ]
  ]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to reset
  carefully [if [label] of one-of turtles = "You have FAILED" [
    clear-all
    set clock 0
    set game-started? false
    set game-over? false
    set-default-shape grass-squares "mine1"
    ifelse random 3 = 0 [
      set-default-shape mines "monster"
    ]
    [ifelse random 2 = 0 [
      set-default-shape mines "monster1"
    ]
    [
      set-default-shape mines "monster2"
    ]
    ]
    set-default-shape markers "missle"
    ask patches [
      sprout-grass-squares 1 [ set color green ]
    set pcolor gray
    ]
    if mine-difficulty = "Easy" [
      ask n-of 40 patches [
        sprout-mines 1 [
          set color black
          hide-turtle
        ]
      ]
    ]
    if mine-difficulty = "Medium" [
      ask n-of 80 patches [
        sprout-mines 1 [
          set color black
          hide-turtle
        ]
      ]
    ]
    if mine-difficulty = "HardCore" [
      ask n-of 200 patches [
        sprout-mines 1 [
          set color black
          hide-turtle
        ]
      ]
    ]
  ]
  ]
  [stop]
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@#$#@#$#@
GRAPHICS-WINDOW
308
10
1033
577
-1
-1
1.788
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
399
0
299
0
0
1
ticks

CHOOSER
154
182
292
227
difficulty
difficulty
"Easy" "Medium" "HardCore"
2

BUTTON
15
188
134
221
Start Killing!
SwordMasterGo
T
1
T
OBSERVER
NIL
1
NIL
NIL

BUTTON
16
233
79
266
Up
walkup
NIL
1
T
OBSERVER
NIL
W
NIL
NIL

BUTTON
16
271
79
304
Down
walkdown
NIL
1
T
OBSERVER
NIL
S
NIL
NIL

BUTTON
86
272
174
305
Swing
swing
NIL
1
T
OBSERVER
NIL
E
NIL
NIL

MONITOR
101
348
158
393
Boss Hp
[BossHp] of bosses
17
1
11

MONITOR
9
348
98
393
Zombies Killed
killedzombies
17
1
11

BUTTON
7
61
146
94
Choose Occupation
Choice
T
1
T
OBSERVER
NIL
NIL
NIL
NIL

CHOOSER
153
28
291
73
Character
Character
"Mr. Brown" "Ms. Pascu"
0

CHOOSER
21
538
159
583
mine-difficulty
mine-difficulty
"Easy" "Medium" "HardCore"
2

BUTTON
21
587
119
620
Reset Mines
reset
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
624
128
657
Start Burning!
Pascustart
T
1
T
OBSERVER
NIL
2
NIL
NIL

BUTTON
122
587
227
620
Burn Zombies
mark/unmark
NIL
1
T
OBSERVER
NIL
M
NIL
NIL

MONITOR
127
485
184
530
Clock
clock
17
1
11

MONITOR
189
484
290
529
Zombies Burned
count markers
17
1
11

BUTTON
18
19
136
52
Return to Menu
menu
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL

SWITCH
168
355
302
388
Sound-Effects
Sound-Effects
0
1
-1000

BUTTON
87
235
175
268
NIL
Transform
NIL
1
T
OBSERVER
NIL
T
NIL
NIL

TEXTBOX
29
493
179
511
For Ms. Pascu
11
0.0
1

TEXTBOX
26
134
176
152
For Mr. Brown
11
0.0
1

TEXTBOX
167
84
317
168
If you wish to restart, \nPress \"Return to Menu\"\nChoose your character\nPress \"Choose Occupation\"\nUse your mouse and click \n\"Start\"
11
0.0
1

CHOOSER
167
410
305
455
Beam-Color
Beam-Color
0 5 15 25 35 45 55 65 75 85 95 105 115 125 135 139.9
7

MONITOR
183
292
300
337
Zombies on Screen
count zombies
17
1
11

TEXTBOX
899
601
1049
629
Read the information tab before you play! It helps!
11
0.0
1

TEXTBOX
710
601
860
629
Song: Indestructible - The Next Door / Exile
11
0.0
1

TEXTBOX
14
420
164
448
To fire, place mouse on world and click on the screen.
11
0.0
1

BUTTON
295
606
490
639
To Skip Straight To Mr. Brown
Mr.Brownscene
NIL
1
T
OBSERVER
NIL
9
NIL
NIL

BUTTON
498
606
686
639
To Skip Straight to Ms.Pascu
Ms.PascuScene
NIL
1
T
OBSERVER
NIL
0
NIL
NIL

@#$#@#$#@
WHAT IS IT?
-----------
This is the a game that can be very awesome depending on who plays it. This was created by two very 1337 students in Mr. Topher Brown Mykolyk's Computer Science Class. <-- Notice the weird language. That is written by Daniel.

HOW IT WORKS
------------
Well, the plot is that Ms. Pascu/Mr Brown get kidnapped by some evil Bigfoot and the other person has to rescue him or her. You can play as two different characters, Mr. Brown or Ms. Pascu.
We had to remove the student version due to lame idea and lack of time from restructuring and decorating Mr.BrownScene. But would you rather enjoy a sexy model with glorious pictures but less branching or an ugly model with more branching? I'd say that alot of people would prefer the first!

HOW TO PLAY IT
-------------
The controls are simple.
Now each character has their own special controls. It is very important to pay attention to those.
For Mr. Brown:
W - Move Up
S - Move Down
T - Transform Mr. Brown into a Pink Bean Shooting Tank.
E - To swing his sword. This is instant monster kill but it lacks range.
C - Charge up your cannon or sword beams for a greater area of effect..

For Ms. Pascu:
Reset Mines - read the name of the button, what do you think it does?
Play - Allows you to play.
M - puts down a marker to mark your mines. NOTE THAT YOU CAN STILL CLICK THAT MINE AND DIE. THE MARKER IS JUST TO SERVE AS A "MARKER."


THINGS TO NOTICE
----------------
Notice how good Mr. Brown's level is compared to everything else.

MR.BROWN'S LEVEL DESCRIPTION
-------------
Being by pressing the Start Killing! button. Depending on your difficulty, various things can happen. You start as a swordsman, being able to slice and slash out beams to the monsters. The beams will each do 10 damage while the slice is OHKO, as it's close range. I'd say this is the efficient but rather dull style. You can transform! Press T to transform into a tank that shoots out Pink Beans! They are weaker, dealing 5 damage each but they are faster and shoots out TWO at a time! The main goal of the first part is just to kill as much as you can without dying. But since you're GOD, you are able to revive as many times as you want. However, if you like to not cheat, just choose the no option when prompt. You can also charge! This handy thing is when there's no monsters rushing at you. You can charge up and shoot more than 2 bullets! The thing is, they fan out so it's not as useful on a single target. This level is pretty easy if you just hold on to the mouse and fire away. Unless you're in HardCore, but that's another story since the HP of the monsters nearly double. *Tip for HardCore - Move AROUND! The Up and Down aren't there for show!* By the way, if the number of zombies are above 60, that means you can't kill fast enough and you automatically lose!
The Boss level is when things get a little tougher. By a little, I mean ALOT. You need luck on your side as well as agility and timing. Easy Mode causes 1/12 chance of instant death every certain number of ticks. Medium is 1/6 and HardCore is 1/4. This makes it alot harder, right? HAH, just when you think it's hard, you cannot get near the boss to slice him either because after a certain number of ticks, he will initiate the death sequence along with an explosion to kill anything near him. So if you plan on using the slice method, you have to run back and forth. The benefit to the slice method is that it carries no chance of surprises as long as you can time it. By shooting with the tank or the swordsman, the boss can REFLECT and turn your bullets into Kirbys which will fly straight at you unless you dodge. In hardcore, this is almost impossible unless you time it right. (On slower computers, you may get lucky.)
Did I finish? NOPE. If you're too slow and manage to survive until a certain large number of ticks has passed, sucks to be you because the boss will fire a gigantic number of kirbys at you. There's is 0% chance of dodging because he will send out infinitely many until you die. This is considered his ultima.
He will also fire at you under another condition. If you charge pass 40, he will fire at you. On Easy Mode, you can dodge them by shooting out a shoot beam to reduce charge and dodging as quickly as possible. Have Fun!
*Note that this isn't a button mashing game!* You probably can find a way to button mash, but it is prefered not to. I mean, where's the fun in that?! <-- Also note the awesome language. That was written by Kelvin.

MS.PASCU'S LEVEL DESCRIPTION
Minesweeper. Can't get any easier! After winning, the Bigfoot will have no minions left and will be forced to free Mr.Brown. But seriously, do hardcore as a challenge. Easy can be done in less than 5 minutes.

THINGS TO KEEP NOTE OF
-------------------
Be careful of turning sound effects on. The beams and missles launch at an alarming rate in Mr.Brownscene. It can cause errors to display because the sounds cant keep up. Turn on at your own risk. I've implemented a carefully function to it when spamming, but I can't guarantee that errors won't pop up.
This game is very bad on computers with less than 4gb ram. <-- Also note the awesome language. That was written by Kelvin.
IF only we had more time~

NETLOGO FEATURES
----------------
Model Library - Minesweeper

RELATED MODELS
--------------
Minesweeper
Other Stuff

CHANGELOG
----------------------

Leave Messages for the other person.
Edit Project log.

12.21.11 9:03 Fixed up scene 1 to adjust to new coords.
              Movement and creation of zombies/creepers
12.24.11 9:03 < LOL AGAIN Added bullets. Added timer/reset timer on Zombies. 
12.27.11 10:36 Made a bunch of edits, Barriers, Boss. Reduced to 1 level to shorten project time. 1 Level, 3 Scenerios.
12.28.11 8:12 Edited all shapes, fixed bullet killing zombie, need to fix barrier or remove it.
12.29.11 9:06 Overall complete with MrBrown's Level. Started MsPascu's Level. Need minor edits to Mr. Brown's level.
12.29.11 9:53 Need edits to minesweeper. Refer to model library minesweeper. Fixed the lag when the bullets fire and the zombies slow down. Should be fine if the bullet shooting isn't held down.
12.29.11 10:59 Daniel, try fixing the Mcrash. If not, just remove it.
12.29.11 11:00 Kelvin... Mcrash is where exactly? And i dont think Pascu level works. I clicked the blue tile thingy and nothing happened
12.30.11 8:28 Mcrash is in the procedure. It's suppose to explode a given radius so that it's not that hard to live. Also, i'm not done with Ms. Pascu's level. 
12.31.11 1.38 k, ill do some testing around with that.
1.2.11 10:49 i'll edit this tomorrow. I finished our proposal as well. JUST REALIZED -> Fix the scene where Mr.Brown chooses to lose. it still says congratz.
1.3.11 8:40 I don't think level 1 setup works now
1.3.11 9:32 Fixed cutscenes and everything. Try it.
1.3.11 10:00 Added Zombie death to make it look C00ler. mcrash right now does not seem to work.
1.3.11 10:01 Should we remove Mcrash overall?
1.3.11 10:01 Probably, it does nothing but waste more space
1.3.11 10:02 Kay, remove that and we just have to fix the bullet aspect where it doesnt freeze the zombies.
1.3.11 10:03 MK, ill think of something while i sleep and/or read the Odyssey
1.5.11 6:03 Let's give Mr.Brown a lazer instead.
1.5.11 7:48 IM FIRING MA LAZER
1.5.11 7:49 hold on, i'm doing my file.
1.5.11 8:28 mk, ill see what i can do about the bullets
1.5.11 8:29 I'm changing mr.brown's scene in my test file. If the new one is good, we'll use that instead.
1.5.11 8:30 mk, ill do some student scene testing. want to use SS instead of ruzeb
1.5.11 8:38 my friend suggests that we use "while" because it might help remove bullet lag
1.5.11 8:39 LOLOLOL. I'm doing a swordmaster style thing for Mr.Brown.
1.5.11 8:39 lol fire emblem reference maybe. Eh ruzeb scares the crap out of the kids. ill see if ss wants to lol 
1.5.11 10:24 Dood, we're not putting your crush in our model. And it's on the creepy side too. Update via Kelvin Test Model: Swordsman style seems to work better than bullet firing scenes. We can leave that part to the student. Swordsman scene takes up a bunch of buttons to stab up down left right and move up down left right. Also, the waits in the swordsman attacking procedure allows the user to actually see the sword slashing but freezing the zombies for a quick second for every swing, allowing the user to cheat.
1.5.11 10:31 Also added difficulty chooser! I'd say our Mr.Brown level looks good, but the other levels are meh. And we need a boss for every one of them. Daniel FIX <-- I'm going to do my math hw.
1.5.12 11:57 LOL DANIEL, Notice how we keep putting 1/x/11 instead of 1/x/12 -3- Kay, I've added difficulty chooser for Pascu. I find the hardcore mode really hard tho. But I guess that's fine. Our main concern = student and bullets. While was indicated on the crib sheet too.
1.5.11 11.14 screw it, im putting 11 cause ISAIKI. any switch, i spent an hour playing mr browns level and i finally killed 60 zombie thingies. It looks good, but my friend says we can use ticks or something to fix bullets. or we can remove bullets in general
1.7.12 9:24 Well, I'm going to add a beam thing for mr brown. If it screws up like bullets, ima remove. 
1.7.12 9:45 HEY, MY SWORDBEAMS LOOK GOOD~ It doesn't look like it lags the zombies~
1.7.12 10:19 Did a bunch of edits. I think my test one should be the one we work on now, since the swordmaster one is better than the old bullet one.
1.7.12 11:05 I'm going to attempt to resolve problems on student game~ Daniel, we need to think of a boss level for mr.brown. When the dead zombies reaches 60, it's suppose to do a bawss function.
1.7.12 11:48 Changed all cutscenes to using plabels. It looks better. Try to resolve the cutscene zombies.
1.8.11 3.54 k, the cutscene zombies are the zombies in the cutscene that appears right?
1.8.12 6:16, yep. I added the precursors to the boss level but it lags like crazy.
1.8.11 9:45 I fixed the damage thing but the hero seems to die right away at the beginning. IDK why
1.8.12 8:48 I'll check into that.
1.8.12 10:25 I have fixed alot of the errors. The boss stages seems fine now. Just needs more UMPH into it. 
1.10.12 7:29 should we show mr. brown this?
1.10.12 7:31 not yet. I'm re editing menu. and shapes.
1.10.12 7:32 I mean this little notepad notes thingy. 
1.10.12 7:54 sure LOL no big deal.
1.10.12 7:55 Might as well delete some stuff in this file LOL
1.10.12 8:54 LOL, there's really no need.
1.15.12 11:15 Kay, I spent like 3 hours changing everything. The sound works in the new one O_O
1.15.12 11:38 I've migrated our log here. Ease of Access. -Ends my 9.5 hour spree of Netlogo today-
1.16.12 3:40 What's with your barrel roll additions? O_O
1.17.12 11:37 I'VE FINISHED THE CUTSCENES!~ We still need a lv 2 pascu mannn. You've been thinking for a day.
1.18.12 9:15 Wow, you didn't even code level 2. I'ma just polish Mr.Brown's level and hand this in.

CREDITS AND REFERENCES
----------------------

Mr. Brown
Ms. Pascu
Kelvin Mei
Daniel Zheng
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

ant 2
true
0
Polygon -7500403 true true 150 19 120 30 120 45 130 66 144 81 127 96 129 113 144 134 136 185 121 195 114 217 120 255 135 270 165 270 180 255 188 218 181 195 165 184 157 134 170 115 173 95 156 81 171 66 181 42 180 30
Polygon -7500403 true true 150 167 159 185 190 182 225 212 255 257 240 212 200 170 154 172
Polygon -7500403 true true 161 167 201 150 237 149 281 182 245 140 202 137 158 154
Polygon -7500403 true true 155 135 185 120 230 105 275 75 233 115 201 124 155 150
Line -7500403 true 120 36 75 45
Line -7500403 true 75 45 90 15
Line -7500403 true 180 35 225 45
Line -7500403 true 225 45 210 15
Polygon -7500403 true true 145 135 115 120 70 105 25 75 67 115 99 124 145 150
Polygon -7500403 true true 139 167 99 150 63 149 19 182 55 140 98 137 142 154
Polygon -7500403 true true 150 167 141 185 110 182 75 212 45 257 60 212 100 170 146 172

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

beam
true
2
Polygon -1184463 true false 30 150 45 90
Polygon -955883 true true 30 150 45 120 75 90 120 75 180 75 225 90 255 120 270 150 270 180 240 150 240 180 225 150 225 180 210 150 210 180 195 150 195 180 180 150 165 180 165 150 150 195 135 150 135 180 120 150 105 180 105 150 90 180 90 150 75 180 75 150 60 180 60 150 30 180 30 150
Polygon -1184463 true false 60 135 75 105 105 90 150 75 195 90 225 105 240 135 225 120 225 135 195 120 195 135 180 120 150 135 120 120 105 135 105 120 75 135 75 120 60 135
Polygon -1184463 true false 180 120 180 135 165 120 180 120
Polygon -1184463 true false 120 120 120 135 135 120 120 120
Polygon -13345367 false false 30 180 30 150 45 120 75 90 120 75 180 75 225 90 255 120 270 150 270 180 240 150 240 180 225 150 225 180 210 150 210 180 195 150 195 180 180 150 165 180 165 150 150 195 135 150 135 180 120 150 105 180 105 150 90 180 90 150 75 180 75 150 60 180 60 150 30 180

bigfoot
false
0
Polygon -13840069 true false 151 196 142 204 128 204 117 213 117 222 124 223 124 220 124 223 131 225 132 220 132 223 140 225 140 219 143 219 144 211 156 200 153 197
Polygon -13840069 true false 150 60 135 45 90 45 75 60 90 75 120 60 135 60 150 60
Circle -2064490 true false 30 165 60
Line -955883 false 195 75 45 15
Line -16777216 false 150 225 165 210
Polygon -13840069 true false 225 268 189 268 190 281 180 298 226 297 254 294 255 268 225 268
Polygon -6459832 true false 96 150 98 165 127 190 137 193 195 195 240 165 240 150 225 105 150 105 93 131 95 149
Polygon -6459832 true false 135 193 150 187 150 208 135 238 139 252 150 272 195 268 178 250 194 254 195 268 225 268 257 268 240 253 246 225 251 197 240 163 195 193 135 193
Polygon -13840069 true false 135 60 120 60 90 90 75 120 75 135 75 150 90 150 90 135 150 120 211 122 210 135 225 135 225 150 240 150 225 150 240 150 255 150 270 150 270 135 255 90 225 57 180 45 150 45
Polygon -13840069 true false 165 268 137 274 125 286 123 300 195 298 193 267 165 268
Line -16777216 false 135 285 135 300
Line -16777216 false 150 285 150 300
Line -16777216 false 210 283 210 298
Line -16777216 false 196 283 196 298
Line -10899396 false 75 30 60 180
Circle -2674135 false false 39 174 42
Line -16777216 false 150 105 165 120
Line -16777216 false 195 105 210 120
Line -16777216 false 210 105 210 120
Line -16777216 false 225 120 225 135
Line -16777216 false 240 135 240 150
Line -16777216 false 255 135 255 150
Line -16777216 false 180 105 195 120
Line -16777216 false 165 105 180 120
Line -2674135 false 65 176 50 185
Line -2674135 false 50 186 49 200
Line -2674135 false 49 201 65 208
Line -2674135 false 66 209 75 190
Line -2674135 false 76 192 62 187
Line -2674135 false 61 188 59 195
Line -2674135 false 60 195 64 198
Line -2674135 false 44 220 28 254
Line -2674135 false 48 222 32 256
Line -2674135 false 27 255 32 257
Circle -16777216 true false 106 135 14
Circle -16777216 true false 155 127 14
Circle -1 true false 157 129 10
Circle -1 true false 108 137 10
Line -16777216 false 112 165 120 172
Line -16777216 false 120 172 127 164
Line -16777216 false 128 163 137 170
Line -16777216 false 138 170 145 160
Line -16777216 false 146 160 156 168
Line -16777216 false 156 169 161 159
Polygon -13840069 true false 85 152 86 152 89 167 99 167 93 113
Polygon -13840069 true false 200 198 191 206 177 206 166 215 166 224 173 225 173 222 173 225 180 227 181 222 181 225 189 227 189 221 192 221 193 213 205 202 202 199
Line -16777216 false 150 194 172 192
Line -16777216 false 171 192 207 178
Line -16777216 false 165 240 179 251
Line -16777216 false 194 260 195 243
Line -16777216 false 195 242 203 232
Line -16777216 false 195 268 185 275
Line -16777216 false 186 275 175 288
Line -16777216 false 176 288 175 298

bigfootscream
false
0
Polygon -2674135 true false 151 196 142 204 128 204 117 213 117 222 124 223 124 220 124 223 131 225 132 220 132 223 140 225 140 219 143 219 144 211 156 200 153 197
Polygon -2674135 true false 150 60 135 45 90 45 75 60 90 75 120 60 135 60 150 60
Circle -2064490 true false 30 165 60
Line -955883 false 195 75 45 15
Line -16777216 false 150 225 165 210
Polygon -2674135 true false 225 268 189 268 190 281 180 298 226 296 253 295 255 268 225 268
Polygon -6459832 true false 96 150 98 165 127 190 137 193 195 195 240 165 240 150 225 105 150 105 93 131 95 149
Polygon -6459832 true false 135 193 150 187 150 208 135 238 139 252 151 276 195 268 178 250 194 254 195 268 225 268 257 268 240 253 246 225 251 197 240 163 195 193 135 193
Polygon -2674135 true false 135 60 120 60 90 90 75 120 75 135 75 150 90 150 90 135 150 120 211 122 210 135 225 135 225 150 240 150 225 150 240 150 255 150 270 150 270 135 255 90 225 57 180 45 150 45
Polygon -2674135 true false 165 268 138 272 125 284 123 300 195 298 193 267 165 268
Line -16777216 false 135 285 135 300
Line -16777216 false 150 285 150 300
Line -16777216 false 210 283 210 298
Line -16777216 false 196 283 196 298
Line -10899396 false 75 30 60 180
Circle -2674135 false false 39 174 42
Line -16777216 false 150 105 165 120
Line -16777216 false 195 105 210 120
Line -16777216 false 210 105 210 120
Line -16777216 false 225 120 225 135
Line -16777216 false 240 135 240 150
Line -16777216 false 255 135 255 150
Line -16777216 false 180 105 195 120
Line -16777216 false 165 105 180 120
Line -2674135 false 65 176 50 185
Line -2674135 false 50 186 49 200
Line -2674135 false 49 201 65 208
Line -2674135 false 66 209 75 190
Line -2674135 false 76 192 62 187
Line -2674135 false 61 188 59 195
Line -2674135 false 60 195 64 198
Line -2674135 false 44 220 28 254
Line -2674135 false 48 222 32 256
Line -2674135 false 27 255 32 257
Circle -16777216 true false 106 135 14
Circle -16777216 true false 155 127 14
Circle -2674135 true false 157 129 10
Circle -2674135 true false 108 137 10
Polygon -2674135 true false 85 152 86 152 89 167 99 167 93 113
Polygon -2674135 true false 200 198 191 206 177 206 166 215 166 224 173 225 173 222 173 225 180 227 181 222 181 225 189 227 189 221 192 221 193 213 205 202 202 199
Line -16777216 false 150 194 172 192
Line -16777216 false 171 192 207 178
Line -16777216 false 165 240 179 251
Line -16777216 false 194 260 195 243
Line -16777216 false 195 242 203 232
Line -16777216 false 195 268 185 275
Line -16777216 false 186 275 175 288
Line -16777216 false 176 288 175 298
Circle -2674135 true false 117 140 45

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

bullets
true
0
Circle -7500403 true true 135 15 30
Polygon -7500403 true true 135 30 135 210 165 210 165 30 135 30
Polygon -1184463 true false 135 210 120 225 120 300 150 240 180 300 180 225 165 210 135 210

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

chatspeck
true
0

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

clash
true
2
Polygon -955883 true true 30 225 45 195 75 165 120 150 180 150 225 165 255 195 270 225 270 255 240 225 240 255 225 225 225 255 210 225 210 255 195 225 195 255 180 225 165 255 165 225 150 270 135 225 135 255 120 225 105 255 105 225 90 255 90 225 75 255 75 225 60 255 60 225 30 255 30 225
Polygon -955883 true true 30 75 45 105 75 135 120 150 180 150 225 135 255 105 270 75 270 45 240 75 240 45 225 75 225 45 210 75 210 45 195 75 195 45 180 75 165 45 165 75 150 30 135 75 135 45 120 75 105 45 105 75 90 45 90 75 75 45 75 75 60 45 60 75 30 45 30 75
Polygon -1184463 true false 30 150 45 90
Polygon -1184463 true false 60 90 75 120 105 135 150 150 195 135 225 120 240 90 225 105 225 90 195 105 195 90 180 105 150 90 120 105 105 90 105 105 75 90 75 105 60 90
Polygon -1184463 true false 180 105 180 90 165 105 180 105
Polygon -1184463 true false 120 105 120 90 135 105 120 105
Polygon -13345367 false false 30 45 30 75 45 105 75 135 120 150 180 150 225 135 255 105 270 75 270 45 240 75 240 45 225 75 225 45 210 75 210 45 195 75 195 45 180 75 165 45 165 75 150 30 135 75 135 45 120 75 105 45 105 75 90 45 90 75 75 45 75 75 60 45 60 75 30 45
Polygon -13345367 false false 30 255 30 225 45 195 75 165 120 150 180 150 225 165 255 195 270 225 270 255 240 225 240 255 225 225 225 255 210 225 210 255 195 225 195 255 180 225 165 255 165 225 150 270 135 225 135 255 120 225 105 255 105 225 90 255 90 225 75 255 75 225 60 255 60 225 30 255
Polygon -1184463 true false 60 225 75 195 105 180 150 165 195 180 225 195 240 225 225 210 225 225 195 210 195 225 180 210 150 225 120 210 105 225 105 210 75 225 75 210 60 225
Polygon -1184463 true false 120 210 120 225 135 210 120 210
Polygon -1184463 true false 180 210 180 225 165 210 180 210
Line -1184463 false 15 150 285 150
Polygon -1184463 true false 285 120 255 150 210 150 180 150 270 135
Polygon -1184463 true false 15 180 45 150 90 150 120 150 30 165

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

fire
false
0
Polygon -955883 true false 151 286 134 282 103 282 59 248 40 210 32 157 37 108 68 146 71 109 83 72 111 27 127 55 148 11 165 45 180 112 195 57 217 91 226 126 227 203 256 156 256 201 238 263 213 278 183 281
Polygon -1184463 true false 126 284 91 251 85 212 91 168 103 132 118 153 125 181 135 141 151 96 185 161 195 203 193 253 164 286
Polygon -1 true false 195 210 165 210 180 225 210 210 195 210
Polygon -1 true false 90 210 120 210 105 225 75 210 90 210
Polygon -16777216 false false 210 210 180 225 165 210 210 210
Polygon -16777216 false false 75 210 105 225 120 210 75 210
Polygon -955883 true false 45 75 45 45 60 15 45 75
Polygon -955883 true false 255 105 255 75 270 30 255 105
Polygon -955883 true false 195 30 210 60 225 90 210 45 195 30
Polygon -955883 true false 60 105 60 75 90 45 60 90 60 105
Polygon -955883 true false 240 135 240 165 255 120 240 60 240 135
Polygon -955883 true false 30 255 15 225 15 165 30 225 30 255
Polygon -955883 true false 255 270 270 225 270 195 285 225 255 270

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

kirby
false
0
Line -1184463 false 225 75 210 90
Line -1184463 false 60 195 75 195
Line -1184463 false 60 195 75 195
Line -1184463 false 75 225 90 210
Polygon -2674135 true false 240 150 270 165 285 180 270 195 225 195 225 180 225 165 240 150
Circle -2064490 true false 60 60 180
Polygon -2064490 true false 60 150 45 165 45 210 60 225 75 225 90 210 75 195 60 195 75 180
Circle -1184463 false false 60 60 180
Polygon -2674135 true false 180 195 135 225 120 240 120 255 150 270 180 270 230 229 221 207 203 196
Polygon -2064490 true false 180 60 195 45 210 45 225 60 225 75 210 90 180 75 165 75
Line -16777216 false 105 135 75 120
Line -16777216 false 121 134 151 119
Polygon -16777216 true false 105 195 120 195
Line -16777216 false 105 195 120 195
Polygon -2064490 true false 45 165 30 180 30 195 45 210 60 165
Polygon -2064490 true false 30 195 30 210 45 225 75 225 30 195
Circle -13345367 true false 120 150 30
Line -1184463 false 30 180 60 150
Line -1184463 false 30 180 30 210
Line -1184463 false 30 210 45 225
Line -1184463 false 45 225 75 225
Line -1184463 false 180 60 195 45
Line -1184463 false 195 45 210 45
Line -1184463 false 210 45 225 60
Line -1184463 false 225 60 225 75
Polygon -13345367 true false 77 140 75 169 79 175 86 180 95 179 104 170 105 142 97 135 84 134 76 139
Circle -13345367 true false 75 150 30
Polygon -13345367 true false 122 141 120 170 124 176 131 181 140 180 149 171 150 143 142 136 129 135 121 140
Circle -13345367 true false 120 150 30
Circle -1 true false 75 135 30
Circle -1 true false 120 135 30

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

mine1
false
0
Rectangle -7500403 true true 0 0 300 300
Rectangle -1184463 true false 0 0 15 300
Rectangle -1184463 true false 15 285 300 300
Rectangle -1184463 true false 285 0 315 285
Rectangle -1 true false 0 15 15 15
Rectangle -1 true false 15 15 90 15
Rectangle -1 true false 15 15 270 15
Rectangle -1184463 true false 15 0 285 15

missle
true
0
Polygon -6459832 true false 180 255 195 270 210 255 195 240 165 240
Polygon -2064490 true false 135 60 165 60 195 75 210 90 225 150 225 195 225 225 210 240 195 255 150 270 105 255 75 225 75 180 87 135 90 90 105 60 135 60
Polygon -2064490 true false 225 210 239 208 252 193 266 164 252 136 242 113 255 90 270 105 259 116 270 135 283 166 273 195 254 222 210 240 225 210
Polygon -13345367 true false 165 60 180 75 195 86 210 90 210 44 165 60
Polygon -13345367 true false 90 90 120 60 74 41 90 90
Polygon -16777216 true false 135 150 210 150
Circle -1 true false 105 105 30
Circle -1 true false 150 105 30
Circle -16777216 false false 105 105 30
Circle -16777216 false false 150 105 30
Line -955883 false 90 135 105 135
Line -955883 false 180 135 195 135
Line -955883 false 180 135 195 135
Line -955883 false 180 135 195 135
Line -955883 false 180 135 195 135
Line -955883 false 180 135 195 135
Line -955883 false 180 135 195 135
Line -955883 false 180 135 195 135
Line -955883 false 181 139 196 139
Line -955883 false 90 135 105 135
Line -955883 false 90 135 105 135
Line -955883 false 90 135 105 135
Line -955883 false 90 135 105 135
Line -955883 false 90 135 105 135
Line -955883 false 90 135 105 135
Line -955883 false 90 135 105 135
Line -955883 false 90 135 105 135
Line -955883 false 90 139 105 139
Circle -1 false false 144 99 42
Line -1 false 165 90 165 105
Line -1 false 165 135 165 150
Line -1 false 135 150 150 150
Polygon -1 true false 90 240 90 195 105 165 165 165 180 165 210 195 210 225 195 255 150 270 105 255 90 240
Line -16777216 false 195 165 180 180
Line -16777216 false 105 180 121 185
Line -16777216 false 164 185 180 165
Line -16777216 false 165 186 180 180
Line -16777216 false 105 165 122 185
Line -16777216 false 105 180 90 165
Circle -13345367 true false 255 75 30
Polygon -6459832 true false 90 240 75 240 60 225 60 240 75 255 105 255 90 240
Polygon -6459832 true false 195 270 210 240 225 270 195 270

monster
false
7
Polygon -10899396 true false 64 189 46 181 35 168 29 155 29 145 31 133 38 125 48 119 58 108 79 81 93 62 104 47 112 34 127 24 133 23 145 21 166 24 185 33 203 48 218 63 226 76 236 86 247 101 261 120 269 129 278 142 278 156 277 172 263 185 244 193 231 199 225 194 63 189
Polygon -1 true false 101 151 90 168 74 195 66 219 83 253 127 269 206 264 243 240 243 194 214 155 103 150
Circle -13791810 true false 170 146 14
Circle -16777216 true false 142 179 12
Polygon -1184463 true false 116 119 101 164 101 209 146 209 146 164 161 119 116 119
Line -2674135 false 142 120 151 128
Line -2674135 false 120 135 143 132
Line -2674135 false 130 125 130 140
Line -2674135 false 129 146 127 163
Line -2674135 false 127 163 136 170
Line -2674135 false 131 142 133 142
Line -2674135 false 135 142 141 138
Line -2674135 false 120 155 138 155
Line -2674135 false 129 166 121 170
Line -2674135 false 121 171 119 181
Line -2674135 false 113 196 113 188
Line -2674135 false 113 187 120 182
Line -2674135 false 120 184 129 190
Line -2674135 false 129 190 129 197
Line -2674135 false 125 200 127 203
Line -2674135 false 141 174 145 190
Line -2674135 false 145 191 142 203
Line -6459832 false 101 150 84 149
Line -6459832 false 82 149 70 154
Line -6459832 false 71 154 71 163
Line -6459832 false 72 163 84 172
Line -16777216 false 72 160 86 149
Line -16777216 false 75 166 90 150
Line -16777216 false 81 170 96 150
Line -6459832 false 214 154 240 155
Line -6459832 false 240 155 247 151
Circle -13791810 true false 170 146 14
Circle -13791810 true false 170 146 14
Circle -13791810 true false 170 146 14
Polygon -10899396 true false 167 134 168 153 192 153 192 132 168 132

monster2
false
0
Polygon -2674135 true false 95 260 100 277 110 262 118 280 126 261 134 280 141 261 134 241 127 264 121 240 111 261 105 238 98 261
Polygon -1 true false 182 271 218 268 218 282 175 282 182 272
Polygon -1 true false 180 240 195 255 180 270 210 270 210 255 210 225 210 180
Polygon -1 true false 72 104 70 136 90 165 120 166 153 158 165 150 165 135 180 120 180 45 105 45 67 61 75 105 73 104
Polygon -1 true false 106 164 97 183 84 214 83 243 96 264 106 239 110 264 121 239 126 265 136 239 121 224 151 179 151 149 121 164 106 164
Polygon -1 true false 90 60 87 42 120 60 90 60
Line -1 false 90 60 75 75
Line -1 false 75 75 75 105
Line -16777216 false 73 105 84 116
Line -16777216 false 85 116 92 105
Line -16777216 false 90 105 105 114
Line -16777216 false 111 101 105 115
Line -16777216 false 110 102 125 114
Line -16777216 false 152 106 145 111
Line -1 false 90 165 105 165
Line -1 false 105 165 120 165
Line -1 false 120 165 165 150
Line -1 false 165 150 165 135
Line -1 false 90 60 105 45
Line -1 false 105 45 135 45
Polygon -1 true false 135 45 180 45 210 60 237 97 243 128 257 184 225 270 225 255 210 270 210 255 195 270 195 255 180 270 195 225 180 240 210 165 180 120 180 45
Polygon -1 true false 150 150 150 180 120 225 135 240 135 272 165 270 150 240 165 225 180 225 195 225 210 165 180 120 165 135 165 150 150 150
Polygon -2674135 true false 180 270 180 285 195 270 195 285 210 270 210 285 225 270 225 255 210 270 210 255 195 270 195 255 180 270
Line -7500403 true 210 165 180 240
Polygon -1 true false 130 271 164 269 164 283 121 283 130 272
Line -16777216 false 125 113 134 102
Line -16777216 false 144 111 134 102
Circle -16777216 true false 114 86 10
Circle -16777216 true false 75 87 10
Line -16777216 false 89 59 89 60
Line -16777216 false 108 52 101 47
Line -16777216 false 109 53 105 58
Line -16777216 false 90 61 93 66
Line -16777216 false 93 67 97 65
Line -16777216 false 93 166 135 165
Line -16777216 false 133 165 152 153
Line -16777216 false 155 145 151 154
Line -16777216 false 146 158 149 180
Line -16777216 false 149 180 121 224
Line -16777216 false 122 225 133 241
Line -16777216 false 167 133 179 120
Line -16777216 false 134 240 135 270

monster3
false
0
Polygon -1 true false 90 195 80 218 105 210 105 195 90 180
Polygon -1 true false 105 105 90 150 90 180 105 225 135 240 180 240 210 225 225 195 220 139 195 105 105 105
Polygon -7500403 true true 105 120 105 150
Polygon -16777216 true false 90 180 75 195
Polygon -1 true false 211 225 228 236 255 237 271 225 274 219 253 227 236 221 226 210 211 195 226 210 226 195 211 180 211 225
Polygon -1 true false 150 150 150 90
Line -16777216 false 150 165 135 165
Line -16777216 false 180 195 195 210
Line -16777216 false 195 210 210 210
Line -16777216 false 210 210 195 195
Line -16777216 false 90 195 105 225
Polygon -16777216 true false 45 105 150 135 255 105 195 90 180 60 240 60 150 28 105 90 45 105
Circle -1 true false 130 54 42
Circle -1 true false 135 75 30
Circle -16777216 true false 103 132 30
Circle -16777216 true false 155 132 30
Circle -1 true false 107 136 22
Circle -1 true false 159 136 22
Line -955883 false 102 169 114 169
Line -955883 false 102 169 114 169
Line -955883 false 102 169 114 169
Line -955883 false 102 169 114 169
Line -955883 false 102 169 114 169
Line -955883 false 102 169 114 169
Line -955883 false 102 169 114 169
Line -955883 false 102 169 114 169
Line -955883 false 102 169 114 169
Line -955883 false 102 169 114 169
Line -955883 false 102 169 114 169
Line -955883 false 102 169 114 169
Line -955883 false 102 169 114 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -955883 false 184 169 196 169
Line -16777216 false 145 95 146 111
Line -16777216 false 154 96 155 112
Polygon -16777216 true false 154 73 165 73 156 81 154 74
Polygon -16777216 true false 145 73 134 73 143 81 145 74

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

swing
true
0
Polygon -1 true false 175 92 240 90 247 111 251 118 254 121 178 120 178 95
Polygon -13791810 true false 45 120 30 210 45 195 30 285 45 270 30 330 45 315 60 330 75 315 90 330 105 315 120 330 135 315 150 330 165 315 180 330 195 315 210 330 225 315 240 330 255 315 270 330 255 270 270 285 255 195 270 210 255 120 45 120
Polygon -1 true false 125 92 60 90 53 111 49 118 45 120 122 120 122 95
Polygon -1 true false 193 63 185 74 172 84 163 86 152 88 142 86 130 83 120 78 116 73 108 69 100 65 103 59 112 60 118 51 128 32 163 23 191 50 194 61
Polygon -1 true false 136 95 166 95 166 80 136 80 136 95
Circle -16777216 false false 135 47 19
Line -16777216 false 129 46 135 44
Line -16777216 false 135 44 145 43
Line -16777216 false 145 43 156 49
Line -16777216 false 163 50 170 46
Line -16777216 false 171 45 179 43
Circle -16777216 false false 167 47 19
Line -13345367 false 157 92 161 92
Polygon -16777216 true false 136 91 108 97 85 112 75 151 75 181 75 226 105 226 105 151 120 166 120 211 180 211 180 166 195 151 240 120 255 75 225 60 210 90 195 90 166 90 137 90
Polygon -16777216 true false 121 203 113 257 105 291 149 290 148 255 151 227 155 256 154 290 198 290 186 256 180 210 125 198
Polygon -1 true false 148 280 148 325 73 325 78 313 85 306 91 304 106 300 117 299 118 280 148 280
Polygon -1 true false 155 281 155 326 230 326 225 314 218 307 212 305 197 301 186 300 185 281 155 281
Rectangle -1184463 true false 120 197 180 212
Rectangle -13345367 true false 140 198 159 212
Polygon -1 true false 228 55 232 44 227 34 231 28 238 19 248 19 257 29 258 40 254 45 251 51 248 67 231 56
Polygon -13345367 true false 139 91 146 102 142 109 142 180 149 189 157 181 158 110 154 103 161 89 139 89
Line -16777216 false 155 74 165 74
Line -16777216 false 205 47 217 54
Polygon -16777216 true false 136 30 151 37 164 50 159 37 149 24 168 39 176 48 181 61 187 73 186 65 184 47 189 58 198 73 192 48 189 33 203 44 212 54 206 38 197 31 197 30 211 23 216 13 217 7 210 14 206 16 200 19 192 19 187 19 194 14 202 8 203 3 195 8 188 11 182 13 183 8 184 2 185 -2 169 5 155 5 141 6 127 8 115 13 102 26 97 36 94 38 73 38 90 46 93 50 93 62 93 74 105 66 108 74 111 76 126 56 122 42 135 31
Polygon -1 true false 79 225 79 238 73 246 73 252 80 261 89 264 103 259 108 249 104 241 100 239 100 224 82 224
Polygon -1184463 true false 279 46 269 62 213 28 30 -77 62 -85 101 -83 134 -75 157 -63 178 -47 186 -36 196 -16 205 -1 219 12 277 45
Line -16777216 false 226 18 219 30
Line -16777216 false 218 13 211 25
Line -16777216 false 234 22 227 34
Line -16777216 false 242 27 235 39
Line -16777216 false 249 31 242 43
Line -16777216 false 256 34 249 46
Line -16777216 false 263 38 256 50
Line -16777216 false 269 42 262 54
Circle -16777216 true false 138 50 14
Circle -16777216 true false 169 50 14

swing flying
true
0
Polygon -1184463 true false 15 45 30 210 45 195 30 285 45 270 30 330 45 360 60 330 75 360 90 330 105 360 120 330 135 360 150 330 165 360 180 330 195 360 210 330 225 360 240 330 255 360 270 330 255 270 270 285 255 195 270 210 285 45 150 0
Polygon -1 true false 193 63 185 74 172 84 163 86 152 88 142 86 130 83 120 78 116 73 108 69 100 65 103 59 112 60 118 51 128 32 163 23 191 50 194 61
Polygon -1 true false 136 95 166 95 166 80 136 80 136 95
Circle -16777216 false false 135 47 19
Line -16777216 false 129 46 135 44
Line -16777216 false 135 44 145 43
Line -16777216 false 145 43 156 49
Line -16777216 false 163 50 170 46
Line -16777216 false 171 45 179 43
Circle -16777216 false false 167 47 19
Line -13345367 false 157 92 161 92
Polygon -16777216 true false 136 91 108 97 85 112 75 151 75 181 75 226 105 226 105 151 120 166 120 211 180 211 180 166 195 151 240 120 255 75 225 60 210 90 195 90 166 90 137 90
Polygon -16777216 true false 121 203 113 257 105 291 149 290 148 255 151 227 155 256 154 290 198 290 186 256 180 210 125 198
Polygon -1 true false 148 280 148 325 73 325 78 313 85 306 91 304 106 300 117 299 118 280 148 280
Polygon -1 true false 155 281 155 326 230 326 225 314 218 307 212 305 197 301 186 300 185 281 155 281
Rectangle -955883 true false 120 197 180 212
Rectangle -13345367 true false 140 198 159 212
Polygon -1 true false 228 55 232 44 227 34 231 28 238 19 248 19 257 29 258 40 254 45 251 51 248 67 231 56
Polygon -13345367 true false 139 91 146 102 142 109 142 180 149 189 157 181 158 110 154 103 161 89 139 89
Line -16777216 false 155 74 165 74
Line -16777216 false 205 47 217 54
Polygon -16777216 true false 136 30 151 37 164 50 159 37 149 24 168 39 176 48 181 61 187 73 186 65 184 47 189 58 198 73 192 48 189 33 203 44 212 54 206 38 197 31 197 30 211 23 216 13 217 7 210 14 206 16 200 19 192 19 187 19 194 14 202 8 203 3 195 8 188 11 182 13 183 8 184 2 185 -2 169 5 155 5 141 6 127 8 115 13 102 26 97 36 94 38 73 38 90 46 93 50 93 62 93 74 105 66 108 74 111 76 126 56 122 42 135 31
Polygon -1 true false 79 225 79 238 73 246 73 252 80 261 89 264 103 259 108 249 104 241 100 239 100 224 82 224
Polygon -1184463 true false 279 46 269 62 213 28 30 -77 62 -85 101 -83 134 -75 157 -63 178 -47 186 -36 196 -16 205 -1 219 12 277 45
Line -16777216 false 226 18 219 30
Line -16777216 false 218 13 211 25
Line -16777216 false 234 22 227 34
Line -16777216 false 242 27 235 39
Line -16777216 false 249 31 242 43
Line -16777216 false 256 34 249 46
Line -16777216 false 263 38 256 50
Line -16777216 false 269 42 262 54
Circle -16777216 true false 138 50 14
Circle -16777216 true false 169 50 14

swing2
true
0
Polygon -13791810 true false 45 120 30 210 45 195 30 285 45 270 30 330 45 315 60 330 75 315 90 330 105 315 120 330 135 315 150 330 165 315 180 330 195 315 210 330 225 315 240 330 255 315 270 330 255 270 270 285 255 195 270 210 255 120 45 120
Polygon -1 true false 264 142 277 153 284 152 291 154 297 159 298 165 298 174 292 181 284 182 275 180 270 175 268 169 252 157 263 144
Polygon -1 true false 125 91 60 90 53 110 48 116 45 120 122 119 122 94
Polygon -1 true false 175 92 240 90 247 111 252 116 255 121 178 120 178 95
Polygon -1 true false 193 63 185 74 172 84 163 86 152 88 142 86 130 83 120 78 116 73 108 69 100 65 103 59 112 60 118 51 128 32 163 23 191 50 194 61
Polygon -1 true false 136 95 166 95 166 80 136 80 136 95
Circle -16777216 false false 135 47 19
Line -16777216 false 129 46 135 44
Line -16777216 false 135 44 145 43
Line -16777216 false 145 43 156 49
Line -16777216 false 163 50 170 46
Line -16777216 false 171 45 179 43
Circle -16777216 false false 167 47 19
Line -13345367 false 157 92 161 92
Polygon -16777216 true false 136 91 108 97 85 112 75 151 75 181 75 226 105 226 105 151 120 166 120 211 180 211 180 166 195 151 232 160 253 171 274 140 235 116 194 94 166 90 137 90
Polygon -16777216 true false 121 203 113 257 105 291 149 290 148 255 151 227 155 256 154 290 198 290 186 256 180 210 125 198
Polygon -1 true false 148 280 148 325 73 325 78 313 85 306 91 304 106 300 117 299 118 280 148 280
Polygon -1 true false 155 281 155 326 230 326 225 314 218 307 212 305 197 301 186 300 185 281 155 281
Rectangle -1184463 true false 120 197 180 212
Rectangle -13345367 true false 140 198 159 212
Polygon -13345367 true false 139 91 146 102 142 109 142 180 149 189 157 181 158 110 154 103 161 89 139 89
Line -16777216 false 155 74 165 74
Polygon -16777216 true false 136 30 151 37 164 50 159 37 149 24 168 39 176 48 181 61 187 73 186 65 184 47 189 58 198 73 192 48 189 33 203 44 212 54 206 38 197 31 197 30 211 23 216 13 217 7 210 14 206 16 200 19 192 19 187 19 194 14 202 8 203 3 195 8 188 11 182 13 183 8 184 2 185 -2 169 5 155 5 141 6 127 8 115 13 102 26 97 36 94 38 73 38 90 46 93 50 93 62 93 74 105 66 108 74 111 76 126 56 122 42 135 31
Polygon -1 true false 79 225 79 238 73 246 73 252 80 261 89 264 103 259 108 249 104 241 100 239 100 224 82 224
Polygon -1184463 true false 247 186 451 32 454 53 452 67 449 78 444 89 435 101 422 117 406 129 385 140 355 149 330 152 310 160 256 196 247 187
Line -16777216 false 255 180 264 189
Line -16777216 false 263 175 271 183
Line -16777216 false 270 169 279 179
Line -16777216 false 277 163 286 173
Line -16777216 false 285 158 294 168
Line -16777216 false 292 152 301 162
Circle -16777216 true false 137 49 16
Circle -16777216 true false 169 49 16

swing2 flying
true
0
Polygon -1184463 true false 15 45 30 210 45 195 30 285 45 270 30 330 45 360 60 330 75 360 90 330 105 360 120 330 135 360 150 330 165 360 180 330 195 360 210 330 225 360 240 330 255 360 270 330 255 270 270 285 255 195 270 210 285 45 150 0
Polygon -1 true false 264 142 277 153 284 152 291 154 297 159 298 165 298 174 292 181 284 182 275 180 270 175 268 169 252 157 263 144
Polygon -1 true false 193 63 185 74 172 84 163 86 152 88 142 86 130 83 120 78 116 73 108 69 100 65 103 59 112 60 118 51 128 32 163 23 191 50 194 61
Polygon -1 true false 136 95 166 95 166 80 136 80 136 95
Circle -16777216 false false 135 47 19
Line -16777216 false 129 46 135 44
Line -16777216 false 135 44 145 43
Line -16777216 false 145 43 156 49
Line -16777216 false 163 50 170 46
Line -16777216 false 171 45 179 43
Circle -16777216 false false 167 47 19
Line -13345367 false 157 92 161 92
Polygon -16777216 true false 136 91 108 97 85 112 75 151 75 181 75 226 105 226 105 151 120 166 120 211 180 211 180 166 195 151 232 160 253 171 274 140 235 116 194 94 166 90 137 90
Polygon -16777216 true false 121 203 113 257 105 291 149 290 148 255 151 227 155 256 154 290 198 290 186 256 180 210 125 198
Polygon -1 true false 148 280 148 325 73 325 78 313 85 306 91 304 106 300 117 299 118 280 148 280
Polygon -1 true false 155 281 155 326 230 326 225 314 218 307 212 305 197 301 186 300 185 281 155 281
Rectangle -955883 true false 120 197 180 212
Rectangle -13345367 true false 140 198 159 212
Polygon -13345367 true false 139 91 146 102 142 109 142 180 149 189 157 181 158 110 154 103 161 89 139 89
Line -16777216 false 155 74 165 74
Polygon -16777216 true false 136 30 151 37 164 50 159 37 149 24 168 39 176 48 181 61 187 73 186 65 184 47 189 58 198 73 192 48 189 33 203 44 212 54 206 38 197 31 197 30 211 23 216 13 217 7 210 14 206 16 200 19 192 19 187 19 194 14 202 8 203 3 195 8 188 11 182 13 183 8 184 2 185 -2 169 5 155 5 141 6 127 8 115 13 102 26 97 36 94 38 73 38 90 46 93 50 93 62 93 74 105 66 108 74 111 76 126 56 122 42 135 31
Polygon -1 true false 79 225 79 238 73 246 73 252 80 261 89 264 103 259 108 249 104 241 100 239 100 224 82 224
Polygon -1184463 true false 247 186 451 32 454 53 452 67 449 78 444 89 435 101 422 117 406 129 385 140 355 149 330 152 310 160 256 196 247 187
Line -16777216 false 255 180 264 189
Line -16777216 false 263 175 271 183
Line -16777216 false 270 169 279 179
Line -16777216 false 277 163 286 173
Line -16777216 false 285 158 294 168
Line -16777216 false 292 152 301 162
Circle -16777216 true false 137 49 16
Circle -16777216 true false 169 49 16

swing3
true
0
Polygon -13791810 true false 45 120 30 210 45 195 30 285 45 270 30 330 45 315 60 330 75 315 90 330 105 315 120 330 135 315 150 330 165 315 180 330 195 315 210 330 225 315 240 330 255 315 270 330 255 270 270 285 255 195 270 210 255 120 45 120
Polygon -1 true false 125 92 60 90 53 109 48 115 46 120 122 120 122 95
Polygon -1 true false 175 92 240 90 247 109 251 116 254 121 178 120 178 95
Polygon -1 true false 193 63 185 74 172 84 163 86 152 88 142 86 130 83 120 78 116 73 108 69 100 65 103 59 112 60 118 51 128 32 163 23 191 50 194 61
Polygon -1 true false 136 95 166 95 166 80 136 80 136 95
Circle -16777216 false false 135 47 19
Line -16777216 false 129 46 135 44
Line -16777216 false 135 44 145 43
Line -16777216 false 145 43 156 49
Line -16777216 false 163 50 170 46
Line -16777216 false 171 45 179 43
Circle -16777216 false false 167 47 19
Line -13345367 false 157 92 161 92
Polygon -16777216 true false 136 91 108 97 85 112 75 151 75 181 75 226 105 226 105 151 120 166 120 211 180 211 180 166 195 151 210 210 214 226 244 211 225 135 194 94 166 90 137 90
Polygon -16777216 true false 121 203 113 257 105 291 149 290 148 255 151 227 155 256 154 290 198 290 186 256 180 210 125 198
Polygon -1 true false 148 280 148 325 73 325 78 313 85 306 91 304 106 300 117 299 118 280 148 280
Polygon -1 true false 155 281 155 326 230 326 225 314 218 307 212 305 197 301 186 300 185 281 155 281
Rectangle -1184463 true false 120 197 180 212
Rectangle -13345367 true false 140 198 159 212
Polygon -13345367 true false 139 91 146 102 142 109 142 180 149 189 157 181 158 110 154 103 161 89 139 89
Line -16777216 false 155 74 165 74
Polygon -16777216 true false 136 30 151 37 164 50 159 37 149 24 168 39 176 48 181 61 187 73 186 65 184 47 189 58 198 73 192 48 189 33 203 44 212 54 206 38 197 31 197 30 211 23 216 13 217 7 210 14 206 16 200 19 192 19 187 19 194 14 202 8 203 3 195 8 188 11 182 13 183 8 184 2 185 -2 169 5 155 5 141 6 127 8 115 13 102 26 97 36 94 38 73 38 90 46 93 50 93 62 93 74 105 66 108 74 111 76 126 56 122 42 135 31
Polygon -1 true false 79 225 79 238 73 246 73 252 80 261 89 264 103 259 108 249 104 241 100 239 100 224 82 224
Polygon -1 true false 221 223 223 235 221 243 222 249 226 254 235 257 250 253 253 241 250 233 244 230 238 214 224 222
Polygon -1184463 true false 210 224 452 308 432 324 411 329 390 329 369 325 340 317 321 305 304 289 287 274 272 261 204 238 210 225
Line -16777216 false 220 228 214 240
Line -16777216 false 228 231 222 243
Line -16777216 false 237 234 231 246
Line -16777216 false 247 238 241 250
Line -16777216 false 256 240 250 252
Line -16777216 false 265 244 259 256
Circle -16777216 true false 137 49 15
Circle -16777216 true false 169 49 15

swing3 flying
true
0
Polygon -1184463 true false 15 45 30 210 45 195 30 285 45 270 30 330 45 360 60 330 75 360 90 330 105 360 120 330 135 360 150 330 165 360 180 330 195 360 210 330 225 360 240 330 255 360 270 330 255 270 270 285 255 195 270 210 285 45 150 0
Polygon -1 true false 193 63 185 74 172 84 163 86 152 88 142 86 130 83 120 78 116 73 108 69 100 65 103 59 112 60 118 51 128 32 163 23 191 50 194 61
Polygon -1 true false 136 95 166 95 166 80 136 80 136 95
Circle -16777216 false false 135 47 19
Line -16777216 false 129 46 135 44
Line -16777216 false 135 44 145 43
Line -16777216 false 145 43 156 49
Line -16777216 false 163 50 170 46
Line -16777216 false 171 45 179 43
Circle -16777216 false false 167 47 19
Line -13345367 false 157 92 161 92
Polygon -16777216 true false 136 91 108 97 85 112 75 151 75 181 75 226 105 226 105 151 120 166 120 211 180 211 180 166 195 151 210 210 214 226 244 211 225 135 194 94 166 90 137 90
Polygon -16777216 true false 121 203 113 257 105 291 149 290 148 255 151 227 155 256 154 290 198 290 186 256 180 210 125 198
Polygon -1 true false 148 280 148 325 73 325 78 313 85 306 91 304 106 300 117 299 118 280 148 280
Polygon -1 true false 155 281 155 326 230 326 225 314 218 307 212 305 197 301 186 300 185 281 155 281
Rectangle -955883 true false 120 197 180 212
Rectangle -13345367 true false 140 198 159 212
Polygon -13345367 true false 139 91 146 102 142 109 142 180 149 189 157 181 158 110 154 103 161 89 139 89
Line -16777216 false 155 74 165 74
Polygon -16777216 true false 136 30 151 37 164 50 159 37 149 24 168 39 176 48 181 61 187 73 186 65 184 47 189 58 198 73 192 48 189 33 203 44 212 54 206 38 197 31 197 30 211 23 216 13 217 7 210 14 206 16 200 19 192 19 187 19 194 14 202 8 203 3 195 8 188 11 182 13 183 8 184 2 185 -2 169 5 155 5 141 6 127 8 115 13 102 26 97 36 94 38 73 38 90 46 93 50 93 62 93 74 105 66 108 74 111 76 126 56 122 42 135 31
Polygon -1 true false 79 225 79 238 73 246 73 252 80 261 89 264 103 259 108 249 104 241 100 239 100 224 82 224
Polygon -1 true false 221 223 223 235 221 243 222 249 226 254 235 257 250 253 253 241 250 233 244 230 238 214 224 222
Polygon -1184463 true false 210 224 452 308 432 324 411 329 390 329 369 325 340 317 321 305 304 289 287 274 272 261 204 238 210 225
Line -16777216 false 220 228 214 240
Line -16777216 false 228 231 222 243
Line -16777216 false 237 234 231 246
Line -16777216 false 247 238 241 250
Line -16777216 false 256 240 250 252
Line -16777216 false 265 244 259 256
Circle -16777216 true false 137 49 15
Circle -16777216 true false 169 49 15

swordman
true
0
Polygon -13791810 true false 47 121 31 210 44 196 31 287 44 271 31 331 45 315 59 330 74 317 90 330 106 316 120 330 135 315 150 330 165 315 180 330 195 315 210 330 225 315 240 330 255 315 270 330 255 270 270 285 255 195 270 210 255 120 45 120
Polygon -1184463 true false 139 108 237 240 201 232 176 223 151 206 137 190 130 169 121 128 117 104 76 48 90 40 138 107
Polygon -1 true false 125 92 60 90 53 111 49 118 47 123 122 120 122 95
Polygon -1 true false 175 92 240 90 247 111 251 118 255 121 178 120 178 95
Polygon -1 true false 221 225 221 238 227 246 227 252 220 261 211 264 197 259 192 249 196 241 200 239 200 224 218 224
Polygon -1 true false 193 63 185 74 172 84 163 86 152 88 142 86 130 83 120 78 116 73 108 69 100 65 103 59 112 60 118 51 128 32 163 23 191 50 194 61
Polygon -1 true false 136 95 166 95 166 80 136 80 136 95
Circle -16777216 false false 135 47 19
Line -16777216 false 129 46 135 44
Line -16777216 false 135 44 145 43
Line -16777216 false 145 43 156 49
Line -16777216 false 163 50 170 46
Line -16777216 false 171 45 179 43
Circle -16777216 false false 167 47 19
Line -13345367 false 157 92 161 92
Polygon -16777216 true false 136 91 108 97 85 112 75 151 75 181 75 226 105 226 105 151 120 166 120 211 180 211 180 166 195 151 195 226 225 226 228 151 216 112 193 96 166 90 137 90
Polygon -16777216 true false 121 203 113 257 105 291 149 290 148 255 151 227 155 256 154 290 198 290 186 256 180 210 125 198
Polygon -1 true false 148 280 148 325 73 325 78 313 85 306 91 304 106 300 117 299 118 280 148 280
Polygon -1 true false 155 281 155 326 230 326 225 314 218 307 212 305 197 301 186 300 185 281 155 281
Rectangle -1184463 true false 120 197 180 212
Rectangle -13345367 true false 140 198 159 212
Polygon -1 true false 79 225 79 238 73 246 73 252 80 261 89 264 103 259 108 249 104 241 100 239 100 224 82 224
Polygon -13345367 true false 139 91 146 102 142 109 142 180 149 189 157 181 158 110 154 103 161 89 139 89
Line -16777216 false 155 74 165 74
Line -16777216 false 121 83 109 90
Line -16777216 false 117 77 105 84
Line -16777216 false 113 71 100 78
Line -16777216 false 107 64 94 71
Line -16777216 false 103 59 91 66
Line -16777216 false 99 53 87 60
Line -16777216 false 95 47 83 54
Polygon -7500403 true true 45 60 28 191
Circle -16777216 true false 138 50 14
Circle -16777216 true false 169 50 14
Polygon -16777216 true false 136 30 151 37 164 50 159 37 149 24 168 39 176 48 181 61 187 73 186 65 184 47 189 58 198 73 192 48 189 33 203 44 212 54 206 38 197 31 197 30 211 23 216 13 217 7 210 14 206 16 200 19 192 19 187 19 194 14 202 8 203 3 195 8 188 11 182 13 183 8 184 2 185 -2 169 5 155 5 141 6 127 8 115 13 102 26 97 36 94 38 73 38 90 46 93 50 93 62 93 74 105 66 108 74 111 76 126 56 122 42 135 31

swordman flying
true
0
Polygon -1184463 true false 15 45 31 210 44 196 31 287 44 271 31 331 45 360 59 330 75 360 90 330 105 360 120 330 135 360 150 330 165 360 180 330 195 360 210 330 225 360 240 330 255 360 270 330 255 270 270 285 255 195 270 210 285 45 150 0
Polygon -1184463 true false 139 108 237 240 201 232 176 223 151 206 137 190 130 169 121 128 117 104 76 48 90 40 138 107
Polygon -1 true false 221 225 221 238 227 246 227 252 220 261 211 264 197 259 192 249 196 241 200 239 200 224 218 224
Polygon -1 true false 193 63 185 74 172 84 163 86 152 88 142 86 130 83 120 78 116 73 108 69 100 65 103 59 112 60 118 51 128 32 163 23 191 50 194 61
Polygon -1 true false 136 95 166 95 166 80 136 80 136 95
Circle -16777216 false false 135 47 19
Line -16777216 false 129 46 135 44
Line -16777216 false 135 44 145 43
Line -16777216 false 145 43 156 49
Line -16777216 false 163 50 170 46
Line -16777216 false 171 45 179 43
Circle -16777216 false false 167 47 19
Line -13345367 false 157 92 161 92
Polygon -16777216 true false 136 91 108 97 85 112 75 151 75 181 75 226 105 226 105 151 120 166 120 211 180 211 180 166 195 151 195 226 225 226 228 151 216 112 193 96 166 90 137 90
Polygon -16777216 true false 121 203 113 257 105 291 149 290 148 255 151 227 155 256 154 290 198 290 186 256 180 210 125 198
Polygon -1 true false 148 280 148 325 73 325 78 313 85 306 91 304 106 300 117 299 118 280 148 280
Polygon -1 true false 155 281 155 326 230 326 225 314 218 307 212 305 197 301 186 300 185 281 155 281
Rectangle -955883 true false 120 197 180 212
Rectangle -13345367 true false 140 198 159 212
Polygon -1 true false 79 225 79 238 73 246 73 252 80 261 89 264 103 259 108 249 104 241 100 239 100 224 82 224
Polygon -13345367 true false 139 91 146 102 142 109 142 180 149 189 157 181 158 110 154 103 161 89 139 89
Line -16777216 false 155 74 165 74
Line -16777216 false 121 83 109 90
Line -16777216 false 117 77 105 84
Line -16777216 false 113 71 100 78
Line -16777216 false 107 64 94 71
Line -16777216 false 103 59 91 66
Line -16777216 false 99 53 87 60
Line -16777216 false 95 47 83 54
Polygon -7500403 true true 45 60 28 191
Circle -16777216 true false 138 50 14
Circle -16777216 true false 169 50 14
Polygon -16777216 true false 136 30 151 37 164 50 159 37 149 24 168 39 176 48 181 61 187 73 186 65 184 47 189 58 198 73 192 48 189 33 203 44 212 54 206 38 197 31 197 30 211 23 216 13 217 7 210 14 206 16 200 19 192 19 187 19 194 14 202 8 203 3 195 8 188 11 182 13 183 8 184 2 185 -2 169 5 155 5 141 6 127 8 115 13 102 26 97 36 94 38 73 38 90 46 93 50 93 62 93 74 105 66 108 74 111 76 126 56 122 42 135 31

tank
true
12
Polygon -10899396 true false 15 135 30 180 -15 165 15 135
Polygon -1184463 true false 75 165 45 120 15 135 30 195 75 165
Polygon -1184463 true false 85 54 62 13 7 9 58 130 31 48
Polygon -10899396 true false 150 180 165 195 135 180 135 165 105 165 90 165 120 150 135 135 150 165 150 180
Polygon -1 true false 105 240 30 240 15 225 0 195 0 165 15 165 45 180 135 180 165 195 135 240 105 240
Polygon -1 true false 255 165 255 150 274 164 289 196 270 195 255 180 255 165
Polygon -13840069 true false 165 135 135 120 105 105 75 105 45 120 30 150 30 165 45 180 75 180 165 135
Polygon -7500403 true false 240 90 240 75 195 75 195 90 195 120 240 120 240 90
Rectangle -7500403 true false 240 90 285 120
Rectangle -1184463 true false 195 75 240 90
Rectangle -1184463 true false 195 85 225 105
Circle -7500403 true false 270 90 30
Rectangle -7500403 true false 135 90 195 120
Polygon -13840069 true false 165 120 210 150 165 150 120 120 165 120
Polygon -13840069 true false 135 90 195 120 225 135 255 165 255 180 150 180 150 165 90 120 120 120 165 150 210 150 165 120 195 120
Polygon -1 true false 60 180 45 195
Polygon -1 true false 270 195 240 240 135 240 165 195 150 180 270 180 270 195
Polygon -1 true false 106 166 132 166 133 194 91 196 106 166
Polygon -1 true false 180 195 270 195
Polygon -7500403 true false 225 225 240 240 195 240 180 225 225 225
Line -7500403 false 255 180 270 195
Line -7500403 false 270 195 165 195
Polygon -6459832 true false 290 196 263 240 240 240 270 195 290 196
Polygon -16777216 true false 90 195 45 180 29 162 30 147 60 165 105 165 90 195
Polygon -1184463 true false 45 120 15 135 0 135 30 120 45 120
Polygon -7500403 true false 135 90 105 105 135 120 135 90
Polygon -7500403 true false 0 135 30 120 0 105 -15 120 0 135
Line -1 false 90 165 75 195
Line -1 false 90 165 75 195
Line -1 false 90 165 75 195
Line -1 false 90 165 75 195
Line -1 false 90 165 75 195
Line -1 false 90 165 75 195
Line -1 false 90 165 75 195
Line -1 false 90 165 75 195
Line -1 false 90 165 75 195
Line -1 false 90 165 75 195
Line -1 false 75 165 60 195
Line -1 false 75 165 60 195
Line -1 false 75 165 60 195
Line -1 false 75 165 60 195
Line -1 false 75 165 60 195
Line -1 false 75 165 60 195
Line -1 false 75 165 60 195
Line -1 false 75 165 60 195
Line -1 false 75 165 60 195
Line -1 false 75 165 60 195
Line -1 false 75 165 60 195
Polygon -6459832 true false 270 195 255 165 255 180 270 195
Line -7500403 false 165 210 195 210
Line -7500403 false 165 210 195 210
Line -7500403 false 165 210 195 210
Line -7500403 false 165 210 195 210
Line -7500403 false 165 210 195 210
Line -7500403 false 165 210 195 210
Line -7500403 false 165 210 195 210
Line -7500403 false 165 210 195 210
Line -7500403 false 165 210 195 210
Line -7500403 false 165 210 195 210
Line -7500403 false 165 204 195 204
Line -1 false 60 165 45 180
Line -1 false 60 165 45 180
Line -1 false 60 165 45 180
Line -1 false 60 165 45 180
Line -1 false 60 165 45 180
Line -1 false 60 165 45 180
Line -1 false 60 165 45 180
Line -1 false 60 165 45 180
Line -1 false 60 165 45 180
Line -1 false 60 165 45 180
Line -1 false 60 165 44 180
Line -1 false 270 90 270 120
Line -1 false 270 90 270 120
Line -1 false 270 90 270 120
Line -1 false 270 90 270 120
Line -1 false 270 90 270 120
Line -1 false 270 90 270 120
Line -1 false 270 90 270 120
Line -1 false 270 90 270 120
Line -1 false 270 90 270 120
Line -1 false 270 90 270 120
Line -1 false 270 90 270 120
Line -1 false 270 90 270 120
Circle -16777216 false false 270 90 30
Polygon -1184463 true false 255 150 225 135 255 165 255 150
Line -16777216 false 240 150 255 150
Line -16777216 false 240 150 255 150
Line -16777216 false 240 150 255 150
Line -16777216 false 240 150 255 150
Line -16777216 false 135 210 90 210
Line -16777216 false 90 210 75 225
Line -6459832 false 0 195 15 225
Line -6459832 false 15 225 30 240
Polygon -6459832 true false 0 195 15 210 30 240 15 225 0 195
Polygon -6459832 true false 30 225 120 225 105 240 30 240 15 225 30 225
Line -16777216 false 75 225 45 225
Line -16777216 false 0 195 45 225
Line -16777216 false 0 195 45 225
Line -16777216 false 0 195 45 225
Line -16777216 false 0 195 45 225
Line -16777216 false 0 195 45 225
Line -16777216 false 0 195 45 225
Line -16777216 false 0 195 45 225
Line -16777216 false 0 192 45 222
Line -16777216 false 135 210 90 210
Line -16777216 false 135 210 90 210
Line -16777216 false 135 210 90 210
Line -16777216 false 135 210 90 210
Line -16777216 false 135 210 90 210
Line -16777216 false 135 207 90 207
Line -16777216 false 90 210 75 225
Line -16777216 false 90 210 75 225
Line -16777216 false 90 210 75 225
Line -16777216 false 90 210 75 225
Line -16777216 false 90 210 75 225
Line -16777216 false 90 210 75 225
Line -16777216 false 88 207 73 222
Line -16777216 false 75 225 45 225
Line -16777216 false 75 225 45 225
Line -16777216 false 75 225 45 225
Line -16777216 false 75 225 45 225
Line -16777216 false 75 225 45 225
Line -16777216 false 75 225 45 225
Line -16777216 false 74 222 44 222
Polygon -6459832 true false 135 240 105 240 135 195 165 195 135 240
Polygon -13791810 true false 22 21 33 48 86 55 63 13 20 10
Polygon -16777216 true false 109 171 101 190 127 190 129 171 111 171
Line -7500403 false 109 175 126 175
Line -7500403 false 108 179 125 179
Line -7500403 false 105 183 125 183
Line -7500403 false 104 187 124 187
Line -16777216 false 90 195 131 195
Line -16777216 false 133 167 131 194
Circle -1 true false 90 122 10
Circle -1184463 true false 108 115 16
Line -1 false 92 123 103 113
Line -1 false 100 128 108 122
Polygon -1 true false 101 115 101 121 117 134 124 136 130 130 130 123 111 109 106 110 101 115
Circle -1184463 true false 102 110 16
Circle -1184463 true false 105 112 16
Circle -1184463 true false 112 118 16
Circle -1184463 true false 115 120 16
Circle -16777216 false false 114 120 14
Circle -16777216 false false 111 117 20
Line -16777216 false 102 123 112 132
Line -16777216 false 110 107 126 118
Line -16777216 false 112 108 103 110
Line -16777216 false 103 110 101 116
Line -16777216 false 100 117 104 124
Line -16777216 false 102 117 102 112

tank2
true
0
Rectangle -7500403 true true 144 0 159 105
Rectangle -6459832 true false 195 45 255 255
Rectangle -16777216 false false 195 45 255 255
Rectangle -6459832 true false 45 45 105 255
Rectangle -16777216 false false 45 45 105 255
Line -16777216 false 45 75 255 75
Line -16777216 false 45 105 255 105
Line -16777216 false 45 60 255 60
Line -16777216 false 45 240 255 240
Line -16777216 false 45 225 255 225
Line -16777216 false 45 195 255 195
Line -16777216 false 45 150 255 150
Polygon -7500403 true true 90 60 60 90 60 240 120 255 180 255 240 240 240 90 210 60
Rectangle -16777216 false false 135 105 165 120
Polygon -16777216 false false 135 120 105 135 101 181 120 225 149 234 180 225 199 182 195 135 165 120
Polygon -16777216 false false 240 90 210 60 211 246 240 240
Polygon -16777216 false false 60 90 90 60 89 246 60 240
Polygon -16777216 false false 89 247 116 254 183 255 211 246 211 237 89 236
Rectangle -16777216 false false 90 60 210 90
Rectangle -16777216 false false 143 0 158 105

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
