INCLUDE Irvine32.inc

.data

strScore BYTE "Your score is: ",0

score BYTE 0
          
xPos BYTE 0  ;columns 
yPos BYTE 20 ;rows 
inputChar BYTE ?

; for gravity 


LEVEL_WIDTH  = 120        
LEVEL_HEIGHT = 26


;  LEVEL MAP DEFINITION 
level1 LABEL BYTE
    BYTE "                     ***                           ***                                                                  ",13,10 ; Row 0
    BYTE "                   **   **                       **   **                         ***                                    ",13,10 ; Row 1
    BYTE "                     ***                           ***                         **   **                  ***             ",13,10 ; Row 2
    BYTE "                                 ***                                             ***                  **   **           ",13,10 ; Row 3
    BYTE "                               **   **                               ***                                ***             ",13,10 ; Row 4
    BYTE "                                 ***                               **   **                                              ",13,10 ; Row 5
    BYTE "      ***                                                            ***                                                ",13,10 ; Row 6
    BYTE "    **   **                                                                                                             ",13,10 ; Row 7
    BYTE "      ***                                                                                                               ",13,10 ; Row 8
    BYTE "                                                                                                                        ",13,10 ; Row 9
    BYTE "                                                                                                                        ",13,10 ; Row 10
    BYTE "                                                                                                                        ",13,10 ; Row 11
    BYTE "                                                                                                                        ",13,10 ; Row 12
    BYTE "                                                                                                                        ",13,10 ; Row 13
    BYTE "                                                                                                                        ",13,10 ; Row 14
    BYTE "                                                                                                                        ",13,10 ; Row 15
    BYTE "                            ==============                                                ========                      ",13,10 ; Row 16
    BYTE "                                           ===================                                               =====      ",13,10 ; Row 17
    BYTE "                     =====================                                         ======          =======              ",13,10 ; Row 18
    BYTE "             =======                                                            ======                                  ",13,10 ; Row 19
    BYTE "                                                                                                                        ",13,10 ; Row 20  
    BYTE "===============    =====================================       ============================           ==================",13,10 ; Row 21 
    BYTE "               |  |                                     |     |                            |          |                 ",13,10 ; Row 22 
    BYTE "               |  |                                     |     |                            | ======== |                 ",13,10 ; Row 23 
    BYTE "               |__|                                     |_____|                            |          |                 ",13,10 ; Row 24 
	BYTE "                                                                                           |__________|                 ",13,10 ; 
    BYTE "________________________________________________________________________________________________________________________",13,10,0 ; Row 25 (Empty, with final NULL terminator)
    MAXCoins db 5
level2 LABEL BYTE
    BYTE "========================================================================================================================",13,10 ; Row 0 (Ceiling)
    BYTE "========================================================================================================================",13,10 ; Row 1
    BYTE "                                                                                                                        ",13,10 ; Row 2
    BYTE "      [===]                                            [===]                           [===]                            ",13,10 ; Row 3
    BYTE "                                                                                                                        ",13,10 ; Row 4
    BYTE "                  [===]                                                                               [===]             ",13,10 ; Row 5
    BYTE "                                                                    [===]                                               ",13,10 ; Row 6
    BYTE "                                  [===]                                                                                 ",13,10 ; Row 7
    BYTE "                                                                                                                        ",13,10 ; Row 8
    BYTE "        |  |                                                                                           |  |             ",13,10 ; Row 9 (Inverted Pipe)
    BYTE "        |  |                                                                                           |  |             ",13,10 ; Row 10
    BYTE "        |__|                   [=====]                                       [=====]                   |__|             ",13,10 ; Row 11
    BYTE "                                                                                                                        ",13,10 ; Row 12
    BYTE "                                            [=====]                                                                     ",13,10 ; Row 13
    BYTE "                   [=====]                                                                                              ",13,10 ; Row 14
    BYTE "                                                          [=====]                                                       ",13,10 ; Row 15
    BYTE "                                                                                                      [==]              ",13,10 ; Row 16
    BYTE "          [?]                                                                                       [==][==]            ",13,10 ; Row 17
    BYTE "        [=] [=]                  |  |                                    |  |                     [==][==][==]          ",13,10 ; Row 18
    BYTE "      [=]     [=]                |  |                                    |  |                   [==][==][==][==]        ",13,10 ; Row 19
    BYTE "                                 |__|                                    |__|                 [==][==][==][==][==]      ",13,10 ; Row 20
    BYTE "=====            ============= ========= ===================== ========= ========== ============================ =======",13,10 ; Row 21 (Floor)
    BYTE "    |    |  |     |         |            |                  |                    |        |                       |     ",13,10 ; Row 22
    BYTE "    |    |__|     |         |            |                  |                    |        |                       |     ",13,10 ; Row 23
    BYTE "____|_____________|_________|____________|__________________|____________________|________|_______________________|_____",13,10 ; Row 24
    BYTE "                                                                                                                        ",13,10 ; Row 25
    BYTE "________________________________________________________________________________________________________________________",13,10,0
; === LEVEL 3: SKY/CASTLE (Hard) ===
level3 LABEL BYTE
    BYTE "||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||   ||",13,10 ; Row 0 (Castle Top)
    BYTE "||___||___||___||___||___||___||___||___||___||___||___||___||___||___||___||___||___||___||___||___||___||___||___||",13,10 ; Row 1
    BYTE "                                                                                                                        ",13,10 ; Row 2
    BYTE "                                                                                                                        ",13,10 ; Row 3
    BYTE "                                                                                                                        ",13,10 ; Row 4
    BYTE "              [=====]                                         [=====]                                                   ",13,10 ; Row 5
    BYTE "                                                                                                                        ",13,10 ; Row 6
    BYTE "                                      [=====]                                                                           ",13,10 ; Row 7
    BYTE "                                                                                                                        ",13,10 ; Row 8
    BYTE "                                                                                                                        ",13,10 ; Row 9
    BYTE "   [===]                                                                                     [=====]                    ",13,10 ; Row 10
    BYTE "                                                                                                                        ",13,10 ; Row 11
    BYTE "                                                                                                                        ",13,10 ; Row 12
    BYTE "                [=]                                             [=]                                                     ",13,10 ; Row 13
    BYTE "                                                                                                                        ",13,10 ; Row 14
    BYTE "                                           = = =                                                 = = =                  ",13,10 ; Row 15
    BYTE "                                          = |  | =                                              = |  | =       = =      ",13,10 ; Row 16
    BYTE "                                         =  |  |  =                                            =  |  |  =     =    =    ",13,10 ; Row 17
    BYTE "                                        =   |  |   =                                          =   |  |   = = =      =   ",13,10 ; Row 18
    BYTE "                                       =    |  |    =                                        =    |  |                = ",13,10 ; Row 19
    BYTE "          ==             ==           =     |__|     =                                      =     |__|                  ",13,10 ; Row 20
    BYTE "=========    ===========    =========================== == =========== == ==========================           =========",13,10 ; Row 21
    BYTE "        |    |         |    |                         |    |         |    |                        |           |        ",13,10 ; Row 22
    BYTE "        |    |         |    |                         |    |         |    |                        |  LAVA     |        ",13,10 ; Row 23
    BYTE "________|____|_________|____|_________________________|____|_________|____|________________________|___________|________",13,10 ; Row 24
    BYTE "                                                                                                                        ",13,10 ; Row 25
    BYTE "________________________________________________________________________________________________________________________",13,10,0

 coinx db  10,20,30,40,50
 coiny db  20,19,20,20,19
 strSpace BYTE " ", 0


currentLevel BYTE 1       
strLevel BYTE "Current Level: ", 0 

LEVEL_EXIT_X = 119         ; horizontal 
LEVEL_EXIT_Y = 20          ;Ground level

; Base coin positions 
BASE_coinx db  10,20,30,40,50
BASE_coiny db  20,19,20,20,19

strGameWin BYTE "CONGRATULATIONS! YOU COMPLETED ALL THREE LEVELS!", 0


strMenuTitle    BYTE "=== PLATFORM JUMPER ===", 0
strMenu1        BYTE "1. New Game", 0           
strMenu2        BYTE "2. Instructions (Dummy)", 0
strMenu3        BYTE "3. Continue Game", 0     ; Continues from progress.txt
strMenu4_LB     BYTE "4. Leaderboard", 0       
strMenu5_Exit   BYTE "5. Exit", 0             
strMenuPrompt   BYTE "Select an option (1-5): ", 0 

strGameOver     BYTE "GAME OVER", 0 


; --- LEADERBOARD/FILE I/O DATA ---
leaderboardFile BYTE "leaderboard.txt", 0
fileHandle      DWORD ?
playerName      BYTE 20 DUP(0)  ; Player's name (max 19 chars + NULL)
playerScore     DWORD ?         ; Score to save (need to convert from BYTE 'score' to DWORD)
strNamePrompt   BYTE "Enter your name (max 19 chars): ", 0
strLBDivider    BYTE "--------------------------------------------------", 13, 10, 0
strLBHeader     BYTE "RANK  | NAME                | SCORE", 13, 10, 0
strInstructions BYTE "Controls: W(up), A(left), D(right), Q(up-left), E(up-right)", 13, 10
                BYTE "Collect 'C', Find '@' to exit level.", 13, 10
strReturnToMenu BYTE "Press any key to return to menu...", 0


strFileSeparator BYTE " ", 0
StringBuf       BYTE 512 DUP(?)
strLBerr BYTE "Leaderboard file not found/created. Play a game first!", 0
strFileCRLF      BYTE 13, 10, 0
             

playerLives         BYTE 3
strLivesDisplay     BYTE "Lives: ", 0
LIVES_DISPLAY_X     = 25        ; X position to start drawing the lives text
LIVES_DISPLAY_Y     = 0         ; Y position (same row as score)

strSplash1      BYTE "WELCOME TO", 0
strSplash2      BYTE "TERMINAL BASED SUPER MARIO"
                BYTE " 24i-0717" , 0
strSplashWait   BYTE "[ PRESS ANY KEY TO CONTINUE ]", 0

TIMER_DISPLAY_X = 100
TIMER_DISPLAY_Y = 0

strTimerDisplay BYTE "Time: ", 0
levelTimer      DWORD 60        ; Current time remaining in seconds
timerStartTime  DWORD ?         ; Stores the result of GetMseconds
TIMER_INTERVAL  DWORD 1000      ; 1000 milliseconds = 1 second

strLevelComplete BYTE "LEVEL ", 0
strCompleteMsg   BYTE " COMPLETED! Press any key to continue...", 0 ; New string

strPauseTitle   BYTE "--- GAME PAUSED ---", 0
strResume       BYTE "1. Resume Game", 0
strPauseExit    BYTE "2. Exit to Main Menu", 0
strPausePrompt  BYTE "Select option (1-2): ", 0

levelProgressFile BYTE "progress.txt", 0
levelProgressHandle DWORD ?

lifeUpX   BYTE 40     ; X position for the $ item
lifeUpY   BYTE 19     ; Y position for the $ item (on platform at row 18)
lifeUpCollected BYTE 'f' ; 't' if collected, 'f' if not
lifeUpChar BYTE '$', 0

; --- NEW ENEMY DATA ---
MAXGoombas      = 2
goombaChar      BYTE 'G'            ; Character to display for Goomba
goombaX         BYTE 49, 96         ; Initial X positions for Goombas
goombaY         BYTE 15, 19         ; Initial Y positions for Goombas (must be on a platform)
goombaDirection BYTE 1, 0           ; 1=Right, 0=Left
goombaAlive     BYTE 't', 't'       ; 't'=alive, 'f'=defeated


; ADD THESE MISSING BASE POSITIONS TO 
BASE_goombaX    BYTE 49, 96         
BASE_goombaY    BYTE 15, 19 
LEFT_HALF_MAX   = 59 ; Max X for the left half
RIGHT_HALF_MIN  = 60 ; Min X for the right half
SCREEN_MAX_X    = 119 ; Max X for the screen
SCREEN_MIN_X    = 0   ; Min X for the screen

; --- MUSHROOM POWER-UP DATA ---
isSuper         BYTE 0      ; 0 = Normal (Small), 1 = Super
mushroomChar    BYTE 'M', 0
mushroomX       BYTE 55     ; X position for Mushroom (Level 1)
mushroomY       BYTE 19     ; Y position (Ground/Platform)
mushroomActive  BYTE 't'    ; 't' = visible, 'f' = collected

; --- TIME-UP ITEM DATA ---
timeUpChar      BYTE '+', 0
timeUpX         BYTE 75     ; X position (Level 1 - on the platform)
timeUpY         BYTE 20     ; Y position
timeUpActive    BYTE 't'    ; 't' = visible, 'f' = collected
timeOnPlatform DWORD 0   ; Counter for how long we stood still
lastXPos       BYTE 0    ; Where we were last frame
lastYPos       BYTE 0    ; Where we were last frame

; --- FIREBALL DATA ---
MAX_FIREBALLS   = 3
fbX             BYTE MAX_FIREBALLS DUP(0)
fbY             BYTE MAX_FIREBALLS DUP(0)
fbDir           BYTE MAX_FIREBALLS DUP(0) ; 0=Right, 1=Left, 2=Up, 3=Down
fbActive        BYTE MAX_FIREBALLS DUP('f')
fbChar          BYTE '*', 0

; --- ENEMY FREEZE DATA ---
; Matches MAXGoombas (2)
goombaFrozen    BYTE 'f', 'f'       ; 't' if frozen, 'f' if moving
goombaTimer     DWORD 0, 0          ; Timer for 4 seconds (4000ms)

; --- KOOPA TROOPA DATA ---
MAXKoopas       = 2
koopaChar       BYTE 'K'            ; Character for Normal Koopa
shellChar       BYTE 'O'            ; Character for Shell
koopaX          BYTE 85, 110        ; Initial X positions
koopaY          BYTE 19, 20         ; Initial Y positions
koopaDirection  BYTE 0, 0           ; 0=Left, 1=Right
; States: 0=Dead, 1=Normal, 2=Shell(Stop), 3=Shell(Moving)
koopaState      BYTE 1, 1           

; Base positions for resetting level
BASE_koopaX     BYTE 85, 110
BASE_koopaY     BYTE 19, 20


; --- SOUND CONTROL ---
soundEnabled BYTE 1         ; 1 = On, 0 = Off
musicEnabled BYTE 1         ; 1 = On, 0 = Off

; ========================================
; ESSENTIAL SOUND EFFECTS
; ========================================

; --- JUMP SOUND ---
jumpSoundFreqs    DWORD 523, 659      ; C5, E5 (Quick ascending)
jumpSoundDurs     DWORD 30, 30
jumpSoundCount    = 2

; --- COIN SOUND ---
coinSoundFreqs    DWORD 988, 1319     ; B5, E6 (Ding!)
coinSoundDurs     DWORD 40, 40
coinSoundCount    = 2

; --- ENEMY DEFEAT (Stomp) ---
stompSoundFreqs   DWORD 523, 392      ; C5, G4 (Quick thump)
stompSoundDurs    DWORD 30, 40
stompSoundCount   = 2

; --- POWER-UP (Mushroom) ---
powerUpFreqs      DWORD 523, 659, 784, 1047, 1319  ; C5, E5, G5, C6, E6
powerUpDurs       DWORD 50, 50, 50, 50, 100
powerUpCount      = 5

; --- EXTRA LIFE ---
lifeUpFreqs       DWORD 659, 784, 1047, 1319, 1568, 2093  ; E5-C7 ascending
lifeUpDurs        DWORD 60, 60, 60, 60, 60, 120
lifeUpCount       = 6

; --- DEATH SOUND ---
deathSoundFreqs   DWORD 523, 494, 466, 440, 392, 349, 330, 262  ; Descending
deathSoundDurs    DWORD 50, 50, 50, 50, 50, 50, 50, 100
deathSoundCount   = 8

; --- TIME WARNING ---
timeWarnFreqs     DWORD 880, 988  ; A5, B5 (Urgent beeping)
timeWarnDurs      DWORD 10
timeWarnCount     = 4

; ========================================
; BACKGROUND MUSIC THEMES
; ========================================

; --- OVERWORLD THEME ---
overworldFreqs    DWORD 659, 659, 0, 659, 0, 523, 659, 0, 784, 0, 0, 0, 392  
overworldDurs     DWORD 100, 100, 100, 100, 100, 100, 100, 100, 200, 200, 200, 200, 200
overworldCount    = 13

; --- UNDERGROUND THEME ---
undergroundFreqs  DWORD 392, 523, 659, 523, 659, 784, 0, 784, 659  
undergroundDurs   DWORD 120, 120, 120, 120, 120, 240, 120, 120, 240
undergroundCount  = 9

; --- CASTLE/BOSS THEME (Intense, dramatic) ---
castleFreqs       DWORD 330, 0, 330, 0, 330, 0, 262, 0, 330, 0, 392, 440  
castleDurs        DWORD 100, 50, 100, 50, 100, 50, 150, 50, 100, 50, 150, 200
castleCount       = 12

; --- VICTORY/LEVEL COMPLETE ---
victoryFreqs      DWORD 523, 523, 523, 659, 784, 880, 1047, 880, 1047 
victoryDurs       DWORD 80, 80, 80, 160, 80, 80, 160, 80, 240
victoryCount      = 9

; --- GAME OVER MUSIC ---
gameOverFreqs     DWORD 523, 392, 330, 220, 262, 196, 175, 131 
gameOverDurs      DWORD 150, 150, 150, 150, 150, 150, 150, 300
gameOverCount     = 8

; ========================================
; INTERACTIVE AUDIO EFFECTS
; ========================================

; --- SHELL KICK ---
shellKickFreqs    DWORD 784, 1047    
shellKickDurs     DWORD 30, 50
shellKickCount    = 2

; --- BLOCK BREAK ---
blockBreakFreqs   DWORD 1047, 988, 880, 784  
blockBreakDurs    DWORD 30, 30, 30, 40
blockBreakCount   = 4

; --- FLAGPOLE SLIDE ---
flagpoleFreqs     DWORD 659, 698, 740, 784, 831, 880, 932, 988  
flagpoleDurs      DWORD 40, 40, 40, 40, 40, 40, 40, 60
flagpoleCount     = 8

; --- PAUSE SOUND ---
pauseSoundFreqs   DWORD 659, 784       
pauseSoundDurs    DWORD 50, 100
pauseSoundCount   = 2

; --- FIREBALL SHOOT ---
fireballFreqs     DWORD 1319, 1047     
fireballDurs      DWORD 20, 30
fireballCount     = 2

; --- ONE-UP (Extra Life Bonus) ---
oneUpFreqs        DWORD 659, 1319, 659, 1319, 659, 1319  
oneUpDurs         DWORD 50, 50, 50, 50, 50, 150
oneUpCount        = 6

; --- PIPE WARP ---
pipeWarpFreqs     DWORD 659, 784, 988, 1319, 1568  
pipeWarpDurs      DWORD 80, 80, 80, 80, 120
pipeWarpCount     = 5

Beep PROTO stdcall, dwFreq:DWORD, dwDuration:DWORD


.code
main PROC

  call ShowSplashScreen
  call LoadLevelProgress



menuLoop::
    call DrawMenu               ; DrawMenu now shows 5 options
    call ReadChar       
    mov inputChar, al

    ; Option 1: New Game
    cmp inputChar, '1'
    je newGameRoutine ; New entry point

    ; Option 2: Instructions
    cmp inputChar, '2'
    je instructionsScreen

    ; Option 3: Continue Game
    cmp inputChar, '3'
    je continueGameRoutine ; New entry point

    ; Option 4: Leaderboard
    cmp inputChar, '4'
    je showLeaderboard

    ; Option 5: Exit
    cmp inputChar, '5'
    je exitGame

    ; Invalid input, loop again
    jmp menuLoop

instructionsScreen:
    call ShowInstructions
    jmp menuLoop        

showLeaderboard:
    call ReadLeaderboard
    jmp menuLoop

newGameRoutine:
    call ClearProgressFile ; Resets progress.txt (ensures Level 1 start)
    mov currentLevel, 1    ; Explicitly set to 1
    jmp getNameAndStartGame ; Proceed to get name/start game
    
continueGameRoutine:
    call LoadLevelProgress ; Loads level number from progress.txt
    jmp getNameAndStartGame ; Proceed to get name/start game
getNameAndStartGame: ; Common entry point for both New Game and Continue
    call Clrscr
    
    ; Set text color
    mov eax, White + (Black*16)
    call SetTextColor
    
    ; Position cursor
    mov dl, 10
    mov dh, 10
    call Gotoxy
    
    ; Display prompt
    mov edx, OFFSET strNamePrompt
    call WriteString
    
    mov edx, OFFSET playerName
    mov ecx, 29                 ; Max 29 characters (buffer is 30 bytes)
    call ReadString             ; This reads user input
    
    
    ; ReadString returns length in EAX
    cmp eax, 0                  ; Check if user entered nothing
    je useDefaultName           ; If empty, use default
    
    ; Null-terminate at the position after last character
    mov esi, OFFSET playerName
    add esi, eax                ; Move to position after last char
    mov BYTE PTR [esi], 0       ; Ensure null termination
    
    ; Trim any trailing spaces/CR/LF
    mov edx, OFFSET playerName
    mov ecx, SIZEOF playerName
    call TrimTrailing
    
    ; Double-check we still have a name after trimming
    cmp BYTE PTR [OFFSET playerName], 0
    je useDefaultName
    
    jmp nameReady

useDefaultName:
    ; If name is empty, use "Player" as default
    mov esi, OFFSET playerName
    mov BYTE PTR [esi],   'P'
    mov BYTE PTR [esi+1], 'l'
    mov BYTE PTR [esi+2], 'a'
    mov BYTE PTR [esi+3], 'y'
    mov BYTE PTR [esi+4], 'e'
    mov BYTE PTR [esi+5], 'r'
    mov BYTE PTR [esi+6],  0

nameReady:
    ; Initialize score for the new game
    mov score, 0
    
    ; Jump to game initialization
    call startGameRoutine
    jmp gameLoop


startGameRoutine:
    call Clrscr         ; Clear the menu screen
    mov playerLives, 3
    call LoadLevel
    call PlayLevelMusic
    call DrawLevelExit 
    call DrawGoombas
    call ResetKoopas
    call DrawKoopas
    call DrawPlayer
    call drawcoin
    call DrawLifeUp
    call StartTimer


gameLoop:
    ; =========================================
    ; 1. CONSTANT UPDATES (Run every frame)
    ; =========================================
    call UpdateAndDisplayTimer 
    
    ; Check Timer Death
    cmp al, 't'
    je pitfall

    ; Update Enemies
    call MoveGoombas
    call CheckGoombaCollision ; Check collision after move
    call MoveKoopas
    call DrawKoopas
    call CheckKoopaCollision 
    call UpdateFireballs
    call DrawMushroom           
    call CheckMushroomCollision 
    call DrawTimeUp          
    call CheckTimeUpCollision 
    mov eax, 50                 
    call Delay
    
    ; =========================================
    ; 2. GRAVITY LOGIC
    ; =========================================
    call CheckForGround         ; Returns 'g' (ground) or 'f' (falling)
    cmp al, 'g'
    je onground                 ; If grounded, skip falling code

    ; --- FALLING LOGIC ---
    cmp yPos, 22         
    jge pitfall                 ; Death by pit

    call updateplayer           ; Erase old position
    inc yPos                    ; Move down
    call drawplayer             ; Draw new position
    
    ; Check collisions while falling
    call CheckCoinCollision
    call CheckLifeUpCollision
    call CheckLevelExit
    
    jmp gameLoop                ; Loop back

    ; =========================================
    ; 3. GROUND LOGIC
    ; =========================================
onground:
    ; --- A. HUD UPDATES ---
    ; Redraw HUD to keep it visible
    mov eax, White + (black * 16)
    call SetTextColor
    mov dl, 0
    mov dh, 0
    call Gotoxy
    mov edx, OFFSET strScore
    call WriteString
    mov al, score
    call WriteInt
    call DrawLives

    ; Display Level
    mov dl, 0
    mov dh, 1
    call Gotoxy
    mov edx, OFFSET strLevel
    call WriteString
    movzx eax, currentLevel
    call WriteInt
    mov al, ' '
    call WriteChar

    ; Check if player position has changed since last frame
    mov al, xPos
    cmp al, lastXPos
    jne resetPlatformTimer  
    
    mov al, yPos
    cmp al, lastYPos
    jne resetPlatformTimer  

    ; We assume the game loop Delay is roughly 50ms
    add timeOnPlatform, 50   
    
    ; Check if 3 seconds have passed
    cmp timeOnPlatform, 3000 
    jl checkInput           ; If less than 3s, skip to input

    call BreakBlockUnderFeet
    
    ; Reset timer so we don't try to break air repeatedly
    mov timeOnPlatform, 0   
    jmp checkInput

resetPlatformTimer:
    ; Reset the timer and update the "last known position"
    mov timeOnPlatform, 0
    mov al, xPos
    mov lastXPos, al
    mov al, yPos
    mov lastYPos, al

; --- C. INPUT HANDLING ---
checkInput:
    call ReadKey                ; Non-blocking input
    jz noKeyPressed             ; If no key, loop back
    
    mov inputChar, al

    ; Controls
    cmp inputChar, 'p'
    je doPause
    cmp inputChar, 'x'
    je exitGame
    cmp inputChar, 'h'
    je shootHorizontal
    cmp inputChar, 'v'
    je shootVertical
    cmp inputChar, 'w'
    je moveUp
    cmp inputChar, 'a'
    je moveLeft
    cmp inputChar, 'd'
    je moveRight
    cmp inputChar, 'q'
    je moveUpLeft
    cmp inputChar, 'e'
    je moveUpRight

noKeyPressed:
    jmp gameLoop

    ; =========================================
    ; 4. MOVEMENT HANDLERS
    ; =========================================
moveUp:
call PlayJumpSound
    mov ecx, 2
    jumpLoop:
        call UpdatePlayer
        dec yPos
        call DrawPlayer
        
        call CheckCoinCollision
        call CheckMushroomCollision ; Allow picking up while jumping
        call CheckTimeUpCollision
        call CheckGoombaCollision   ; Die if jumping INTO a goomba
        call CheckLevelExit
        
        mov eax, 70
        call Delay
    loop jumpLoop
    jmp gameLoop

moveLeft:
    call UpdatePlayer
    cmp xPos, 0
    je noleft 
    dec xPos
    noleft:
    call DrawPlayer
    
    ; Check collisions after moving
    call CheckCoinCollision
    call CheckMushroomCollision
    call CheckTimeUpCollision
    call CheckGoombaCollision   
    call CheckLevelExit
    jmp gameLoop

moveRight:
    call UpdatePlayer
    cmp xPos, 119
    jge noRight
    inc xPos
    noRight:
    call DrawPlayer
    
    ; Check collisions after moving
    call CheckCoinCollision
    call CheckMushroomCollision
    call CheckTimeUpCollision
    call CheckGoombaCollision
    call CheckLevelExit
    jmp gameLoop

moveUpLeft:
call PlayJumpSound
    mov ecx, 2
    jumpLeftLoop:
        call UpdatePlayer
        dec yPos
        cmp xPos, 0
        je skipLeftMove
        dec xPos
    skipLeftMove:
        call DrawPlayer
        call CheckCoinCollision
        call CheckMushroomCollision
        call CheckTimeUpCollision
        call CheckGoombaCollision
        call CheckLevelExit
        mov eax, 70
        call Delay
    loop jumpLeftLoop
    jmp gameLoop

moveUpRight:
call PlayJumpSound
    mov ecx, 2
    jumpRightLoop:
        call UpdatePlayer
        dec yPos
        cmp xPos, 119 
        jge skipRightMove
        inc xPos
    skipRightMove:
        call DrawPlayer
        call CheckCoinCollision
        call CheckMushroomCollision
        call CheckTimeUpCollision
        call CheckGoombaCollision
        call CheckLevelExit
        mov eax, 70
        call Delay
    loop jumpRightLoop
    jmp gameLoop

shootHorizontal:
call PlayFireballSound
    mov al, 0           ; 0 = horizontal
    call SpawnFireball
    jmp gameLoop

shootVertical:
call PlayFireballSound
    mov al, 2           ; 2 = Up
    call SpawnFireball
    jmp gameLoop

pitfall::
call PlayDeathSound
    dec playerLives
    
    ; Check if player is out of lives
    cmp playerLives, 0
    je finalGameOver

    ; --- Life Lost, Reset Level ---
    call Clrscr

    mov xPos, 0
    mov yPos, 20
    
    mov timeOnPlatform, 0
    mov lastXPos, 0
    mov lastYPos, 20
    
    ; Reload Level components
    call LoadLevel
    call DrawLevelExit 
    call ResetCoins
    call ResetGoombaPositions
    call ResetGoombas
    call DrawGoombas
    call ResetKoopas
    call DrawKoopas
    call ResetLifeUp
    call DrawLifeUp
    mov mushroomActive, 't' 
    mov isSuper, 0    
    call drawcoin
    call DrawPlayer
    call StartTimer
    
    jmp gameLoop

finalGameOver:
    jmp gameOver
timeExpiredHandler:
    jmp pitfall 
doPause:
    call PauseGame
    jmp gameLoop
main ENDP


; =======================================================
; PauseGame PROC
; Halts the game, displays a menu, and waits for user input.
; =======================================================
PauseGame PROC
    pushad
    
    call Clrscr 
    
    mov eax, White + (Black * 16)
    call SetTextColor
    
pauseMenuLoop:
    ; Display Title
    mov dl, 30
    mov dh, 10
    call Gotoxy
    mov edx, OFFSET strPauseTitle
    call WriteString
    
    ; Display Option 1: Resume
    mov dl, 30
    mov dh, 12
    call Gotoxy
    mov edx, OFFSET strResume
    call WriteString
    
    ; Display Option 2: Exit to Menu
    mov dl, 30
    mov dh, 13
    call Gotoxy
    mov edx, OFFSET strPauseExit
    call WriteString
    
    ; Display Prompt
    mov dl, 30
    mov dh, 15
    call Gotoxy
    mov edx, OFFSET strPausePrompt
    call WriteString
    
    call ReadChar       ; Get user input
    
    
    ; Check option '1' (Resume)
    cmp al, '1'
    je resumeGame
    
    ; Check option '2' (Exit to Menu)
    cmp al, '2'
    je exitToMenu
    
    ; Invalid input, clear prompt and loop again
    mov dl, 30
    mov dh, 15
    call Gotoxy
    mov al, ' ' ; Clear the input character
    call WriteChar
    jmp pauseMenuLoop

resumeGame:
    call Clrscr
    popad
    call LoadLevel      ; Redraw map
    call DrawLevelExit
    call drawcoin
    call DrawPlayer     ; Redraw player
    call StartTimer     
    
    mov al, 0 
    ret                 

exitToMenu:
    popad
    jmp menuLoop        ; Jump to the main menu loop (defined in main PROC)

PauseGame ENDP
; =======================================================
; StrLength_ PROC
; Calculates the length of a null-terminated string.
; Receives: EDX = Address of the string.
; Returns: EAX = Length of the string (excluding null).
; =======================================================
StrLength_ PROC
    push edx
    push ecx
    push esi
    
    mov esi, edx    ; ESI points to the string
    mov ecx, 0FFFFFFFFh ; Max possible count
    mov al, 0       ; Search for null terminator
    cld             ; Scan forward
    repne scasb     ; Scan until AL (0) is found
    
    mov eax, 0FFFFFFFFh ; Load max count
    sub eax, ecx    ; Subtract remaining count 
    dec eax         ; Subtract 1 because we counted the null terminator
    
    pop esi
    pop ecx
    pop edx
    ret
StrLength_ ENDP
ShowSplashScreen PROC
    pushad              ; Save all registers

    call Clrscr

    ; =================================================
    ; DRAW 4 LAYERS OF BORDERS
    ; =================================================
    ; We will use a loop to draw 4 concentric rectangles
    ; BL  = X offset (starts at 0)
    ; BH  = Y offset (starts at 0)
    
    mov ecx, 4          ; We want 4 layers
    mov bl, 0           ; Starting X
    mov bh, 0           ; Starting Y
    
drawLayersLoop:
    push ecx            ; Save loop counter (layer ID)

    ; --- SET COLOR FOR GRADIENT ---
    ; Layer 1 (Outer) - Dark Blue
    cmp ecx, 4
    je col1
    ; Layer 2 - Medium Blue
    cmp ecx, 3
    je col2
    ; Layer 3 - Light Blue/Cyan
    cmp ecx, 2
    je col3
    ; Layer 4 - Lightest Cyan
    jmp col4

col1: mov eax, Blue + (Black*16)
      jmp setCol
col2: mov eax, LightBlue + (Black*16)
      jmp setCol
col3: mov eax, Cyan + (Black*16)
      jmp setCol
col4: mov eax, LightCyan + (Black*16)
      
setCol:
    call SetTextColor

    ; --- CALCULATE DIMENSIONS FOR THIS LAYER ---
    ; W_Inner = 119 - (X_Offset * 2)
    ; H_Inner = 25 - (Y_Offset * 2)
    
    ; 1. TOP-LEFT CORNER (TL: '\')
    mov dl, bl          ; Start X
    mov dh, bh          ; Start Y
    call Gotoxy
    mov al, '\'         ; User requested Top-Left Corner
    call WriteChar
    
    ; 2. DRAW TOP HORIZONTAL LINE ('-')
    push ebx            
    movzx ecx, bl       ; EAX = X_Offset * 2
    shl ecx, 1
    mov eax, 119
    sub eax, ecx        ; EAX = Total width of line
    mov ecx, eax        ; Move to counter
    
topLine:
    mov al, '-'         ; Horizontal Char
    call WriteChar
    loop topLine
    
    ; 3. TOP-RIGHT CORNER (TR: '/')
    mov al, '/'         ; User requested Top-Right Corner
    call WriteChar
    pop ebx             

    ;; 4. DRAW RIGHT VERTICAL LINE ('|')
    mov dl, 119         ; Rightmost X
    sub dl, bl          ; Adjust for layer offset
    
    mov dh, bh          ; Start Y (already set)
    inc dh              ; Start one row down (after top corner)

    push ebx            
    movzx ecx, bh       ; EAX = Y_Offset * 2
    shl ecx, 1
    mov eax, 26
    sub eax, ecx        ; EAX = Total height
    mov ecx, eax
    sub ecx, 2          ; Loop count (since we do one less due to corner)
    
rightSide:
    call Gotoxy
    mov al, '|'
    call WriteChar
    inc dh              ; Move down
    loop rightSide
    pop ebx

    ; 5. BOTTOM-RIGHT CORNER (BR: '\')
    ; Current cursor is at bottom-right of the vertical line
    mov al, '\'         ; User requested Bottom-Right Corner
    call WriteChar
    
    ; 6. DRAW BOTTOM HORIZONTAL LINE ('-')
    ; Set position to Bottom Left Corner position
    mov dl, bl          ; Left X
    mov dh, 25          ; Bottom Y
    sub dh, bh          ; Adjust for layer offset
    call Gotoxy
    
    ; 7. BOTTOM-LEFT CORNER (BL: '/')
    mov al, '/'         ; User requested Bottom-Left Corner
    call WriteChar
    
    ; Move DL to start of horizontal line
    inc dl
    
    ; Draw horizontal line (Left to Right, same loop as top)
    push ebx
    movzx ecx, bl       
    shl ecx, 1
    mov eax, 119
    sub eax, ecx        
    mov ecx, eax        
    
botLine:
    call Gotoxy
    mov al, '-'
    call WriteChar
    inc dl              ; Move right
    loop botLine
    pop ebx

    ; 8. DRAW LEFT VERTICAL LINE ('|')
    mov dl, bl          ; Left X
    mov dh, bh          ; Top Y
    inc dh              ; Start one row down
    
    push ebx
    movzx ecx, bh       
    shl ecx, 1
    mov eax, 25
    sub eax, ecx
    mov ecx, eax
    sub ecx, 1          ; Loop count (since we do one less due to corner)
    
leftSide:
    call Gotoxy
    mov al, '|'
    call WriteChar
    inc dh              ; Move down
    loop leftSide
    pop ebx

    ; --- PREPARE FOR NEXT LAYER ---
    inc bl              ; Move X inward
    inc bl              ; Move X inward again (visual correction for wide console)
    inc bh              ; Move Y inward
    
    pop ecx             ; Restore loop counter
    dec ecx
    cmp ecx, 0
    jne drawLayersLoop_jump
    jmp finishedLayers

drawLayersLoop_jump:
    jmp drawLayersLoop

finishedLayers:

    ; =================================================
    ; DRAW TEXT CONTENT 
    ; =================================================
    mov eax, White + (Black*16)
    call SetTextColor

    ; 1. Welcome To
    mov dl, 55         
    mov dh, 10         
    call Gotoxy
    mov edx, OFFSET strSplash1
    call WriteString

    ; 2. Game Name
    mov dl, 47         
    mov dh, 12
    call Gotoxy
    mov edx, OFFSET strSplash2
    call WriteString

    ; 3. Press Key 
    mov eax, Yellow + (Black*16)
    call SetTextColor
    mov dl, 48
    mov dh, 20
    call Gotoxy
    mov edx, OFFSET strSplashWait
    call WriteString

    ; Wait for Input
    call ReadChar
    
    popad               
    ret
ShowSplashScreen ENDP


; In the .code section, replace the existing DrawMenu PROC:
DrawMenu PROC
    push edx
    push eax

    call Clrscr
    mov eax, lightGray + (black * 16) ; Set a nice color for the menu
    call SetTextColor

    ; Display Title
    mov dl, 10
    mov dh, 5
    call Gotoxy
    mov edx, OFFSET strMenuTitle
    call WriteString

    ; Display Option 1: New Game
    mov dl, 10
    mov dh, 7
    call Gotoxy
    mov edx, OFFSET strMenu1
    call WriteString

    ; Display Option 2: Instructions
    mov dl, 10
    mov dh, 8
    call Gotoxy
    mov edx, OFFSET strMenu2
    call WriteString

    ; Display Option 3: Continue Game
    mov dl, 10
    mov dh, 9
    call Gotoxy
    mov edx, OFFSET strMenu3
    call WriteString
    
    ; Display Option 4: Leaderboard 
    mov dl, 10
    mov dh, 10
    call Gotoxy
    mov edx, OFFSET strMenu4_LB ; Use the new Leaderboard string
    call WriteString

    ; Display Option 5: Exit 
    mov dl, 10
    mov dh, 11
    call Gotoxy
    mov edx, OFFSET strMenu5_Exit ; Use the new Exit string
    call WriteString

    ; Display Prompt 
    mov dl, 10
    mov dh, 13 ; Adjusted Y position
    call Gotoxy
    mov edx, OFFSET strMenuPrompt
    call WriteString

    pop eax
    pop edx
    ret
DrawMenu ENDP

ShowInstructions PROC
    push edx

    call Clrscr
    mov eax, yellow + (black * 16) ; Set a distinct color
    call SetTextColor

    mov dl, 5
    mov dh, 5
    call Gotoxy
    mov edx, OFFSET strInstructions
    call WriteString

    call ReadChar ; Wait for any key press
    
    pop edx
    ret
ShowInstructions ENDP

DrawPlayer PROC
    push eax
 
    ; Check if Super Mario
    cmp isSuper, 1
    je drawSuper
    
    ; Normal Mario (LightBlue)
    mov eax, LightBlue + (Black * 16) 
    jmp setPlayerColor

drawSuper:
    ; Super Mario (LightRed) - Visual indication of power-up
    mov eax, LightRed + (Black * 16)

setPlayerColor:
    call SetTextColor
    
    mov dl, xPos
    mov dh, yPos
    call Gotoxy
    mov al, "X"         ; You could change this to 'M' if you wanted, but Color is enough
    call WriteChar
    
    ; Move cursor back
    mov dl, xPos
    mov dh, yPos
    call Gotoxy
    
    pop eax
    ret
DrawPlayer ENDP
UpdatePlayer PROC
	; Erase player at:
    push eax
    push edx
    
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
    
    mov eax, Black + (Black * 16)
    call SetTextColor
    
	mov al," "
	call WriteChar
    
    mov eax, White + (Black * 16)
    call SetTextColor
    
    pop edx
    pop eax
	ret
UpdatePlayer ENDP


LoadLevel PROC
    pushad ; Save all registers
    
    ; Define Colors (text only, no background)
    mov ebx, Blue           ; EBX = Blue 
    mov edi, Red            ; EDI = Red 
    mov ebp, White          ; EBP = White
    
    ; 1. Select the correct level map
    mov al, currentLevel
    cmp al, 1
    je loadLevel1
    
    cmp al, 2
    je loadLevel2
    
    cmp al, 3
    je loadLevel3
    
    ; Default to level 1 if currentLevel is invalid
    jmp loadLevel1 

loadLevel1:
    mov esi, OFFSET level1      ; ESI = pointer to the start of level1 map
    jmp startLevelDrawing

loadLevel2:
    mov esi, OFFSET level2      ; ESI = pointer to the start of level2 map
    jmp startLevelDrawing

loadLevel3:
    mov esi, OFFSET level3      ; ESI = pointer to the start of level3 map
    jmp startLevelDrawing
    
startLevelDrawing:
    ; Initialization for drawing
    mov dh, 0                   ; DH = current row (Y)
    mov ecx, LEVEL_HEIGHT       
rowLoop:
    ; Inner loop for columns
    push ecx                    ; Save outer row counter
    mov ecx, LEVEL_WIDTH        ; ECX = inner loop counter (columns = 120)
    mov dl, 0                   ; DL = current column (X)

colLoop:
    ; 1. Get Character
    mov al, [esi]               ; AL = current map character
    
    ; 2. Determine Color based on character type
    push eax                    ; Save character
    
    ; Check for Start Marker (Green)
    cmp al, 'S'
    je setGreen                 ; 'S' -> Green
    
    ; Check for Clouds (Blue for Level 1)
    cmp al, '*'
    je setBlue                  ; '*' -> Blue
    
    ; Check for Solid Platform (Cyan: '=', '[', ']')
    cmp al, '='
    je setCyan                  ; '=' -> Cyan (Level 1 platform)
    cmp al, '['
    je setCyan                  ; '[' -> Cyan (Level 2/3 platform edge)
    cmp al, ']'
    je setCyan                  ; ']' -> Cyan (Level 2/3 platform edge)
    
    ; Check for Base/Platforms (Red: '|', '-', '_')
    cmp al, '|'
    je setRed                   ; '|' -> Red (Box wall)
    cmp al, '-'
    je setRed                   ; '-' -> Red (Box top/bottom)
    cmp al, '_'
    je setRed                   ; '_' -> Red (Ground/Platform base)
    
    ; Default: Space or other -> White
    mov eax, ebp                ; EBP holds White
    jmp drawChar

setBlue:
    mov eax, Blue + (Black*16)   ; Blue
    jmp drawChar

setCyan:
    mov eax, Cyan + (Black*16)  ; Cyan
    jmp drawChar

setRed:
    mov eax, Red + (Black*16)   ; Red
    jmp drawChar
    
setGreen:
    mov eax, Green + (Black*16) ; Green (for 'S' start marker)
    jmp drawChar

drawChar:
    ; Set the text color and draw character
    pushad                      
    call SetTextColor
    call Gotoxy                 ; Set cursor to (DL, DH)
    popad                       
    
    pop eax                     ; Restore character
    push eax                    ; Save it again for WriteChar
    
    pushad                      
    call WriteChar              ; Draw the character
    popad                       
    
    pop eax                     ; Clean up saved character
    
    ; Advance to next column/char
    inc dl                      ; Increment column X
    inc esi                     ; Increment map pointer
    loop colLoop                ; Loop for columns

    ; Advance map pointer past 
    add esi, 2
    
    ; Advance to next row
    inc dh                      ; Increment row Y
    pop ecx                     ; Restore outer row counter
    loop rowLoop                

done:
    popad
    ret
LoadLevel ENDP

CheckCoinCollision PROC
    push eax
    push ecx
    push esi
    push edi
    push edx

    movzx ecx, MAXCoins              ; Number of coins
    mov esi, OFFSET coinx
    mov edi, OFFSET coiny

nextCoin:
    ; Check if coin already collected (marked as 255)
    mov al, [esi]
    cmp al, 255
    je skipCoin

    ; Check X position
    mov al, [esi]
    cmp al, xPos
    jne skipCoin

    ; Check Y position
    mov al, [edi]
    cmp al, yPos
    jne skipCoin

    ; ===== COIN COLLECTED! =====
    inc score
    call PlayCoinSound 

    ; Erase coin from screen
    push eax
    push edx
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    
    mov eax, Black + (Black * 16)
    call SetTextColor
    
    mov al, ' '
    call WriteChar
    
    ; Restore color for subsequent drawing
    mov eax, White + (Black * 16)
    call SetTextColor
    
    pop edx
    pop eax

    ; Mark coin as collected 
    mov BYTE PTR [esi], 255
    mov BYTE PTR [edi], 255

skipCoin:
    inc esi
    inc edi
    loop nextCoin

    pop edx
    pop edi
    pop esi
    pop ecx
    pop eax
    ret
CheckCoinCollision ENDP

drawcoin proc
  push ecx 
   push edi
   push esi
   mov edi,offset coinx
   mov esi ,offset coiny

   movzx ecx, MAXCoins ;length of coin array
   l1:
   
   cmp BYTE PTR [edi], 255 ; Check if collected
   je skipDrawCoin
   
   mov dl,[edi]
   mov dh,[esi]
   call gotoxy 
   mov eax, Yellow + (Black * 16)
   call SetTextColor
   mov al,'C'
   call writechar
   
skipDrawCoin:
   inc esi
   inc edi
   loop l1
   
   ; Restore text color after drawing coins
   mov eax, White + (Black * 16)
   call SetTextColor
   
   pop esi
   pop edi
   pop ecx
   ret 
   drawcoin endp

   DrawLevelExit PROC
    push eax
    push edx
    mov dl, LEVEL_EXIT_X
    mov dh, LEVEL_EXIT_Y
    call Gotoxy
    mov eax, Magenta + (Black * 16)
    call SetTextColor
    mov al, '@'
    call WriteChar
    
    ; Restore text color
    mov eax, White + (Black * 16)
    call SetTextColor
    
    pop edx
    pop eax
    ret
DrawLevelExit ENDP


ResetCoins PROC
    ; Reloads the active coin arrays from the BASE arrays
    push ecx
    push esi
    push edi

    ; Copy BASE_coinx to coinx
    mov esi, OFFSET BASE_coinx
    mov edi, OFFSET coinx
    movzx ecx, MAXCoins
    rep movsb 

    ; Copy BASE_coiny to coiny
    mov esi, OFFSET BASE_coiny
    mov edi, OFFSET coiny
    movzx ecx, MAXCoins
    rep movsb 

    pop edi
    pop esi
    pop ecx
    ret
ResetCoins ENDP

CheckLevelExit PROC
    push eax
    push ebx
    push ecx
    push edx

    ; Check if player's current position matches the exit position
    mov al, xPos
    cmp al, LEVEL_EXIT_X
    jne skipLevelChange ; X-coordinate mismatch

    mov al, yPos
    cmp al, LEVEL_EXIT_Y
    jne skipLevelChange ; Y-coordinate mismatch

    
    ; Check if we are about to complete the FINAL level
    mov al, currentLevel
    cmp al, 3
    je finalLevelComplete ; If currentLevel is 3, jump to Game Win logic


    call ShowLevelCompleteScreen
    
proceedToNextLevel:
    ; If not the final level, proceed to the next level
    inc currentLevel    
    call SaveLevelProgress

    call Clrscr
    
    ; Reset Player Position 
    
    mov xPos, 0
    mov yPos, 20 ; Reset to Y=20 for a safer start in new levels

    ; Reload Level components
    call LoadLevel      ; Will load level2 or level3 based on currentLevel
    call DrawLevelExit  ; Draw the exit for the new level
    call ResetCoins     ; Reset coin array data
    call drawcoin       ; Redraw the coins
    jmp skipLevelChange ; Skip the rest and return

finalLevelComplete:
    call Clrscr
    mov dl, 30
    mov dh, 10
    call Gotoxy
    mov edx, OFFSET strGameWin ; Display congratulations message
    call WriteString
    
    ; Display final score
    mov dl, 30
    mov dh, 12
    call Gotoxy
    mov edx, OFFSET strScore
    call WriteString
    mov al, score
    call WriteInt

    call ReadChar
    call SaveScoreToFile
    jmp exitGame  ; Jump to the main program's exit handler

skipLevelChange:
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
CheckLevelExit ENDP



GetLevelChar PROC
    push ebx
    push ecx
    push esi
    
    ; Calculate offset
    movzx eax, yPos
    mov ecx, LEVEL_WIDTH
    add ecx, 2
    mul ecx
    movzx ebx, xPos
    add eax, ebx
    
    mov bl, currentLevel
    cmp bl, 1
    je useLevel1
    cmp bl, 2
    je useLevel2
    cmp bl, 3
    je useLevel3
    
useLevel1:
    mov esi, OFFSET level1
    jmp getLevelChar_
useLevel2:
    mov esi, OFFSET level2
    jmp getLevelChar_
useLevel3:
    mov esi, OFFSET level3
    
getLevelChar_:
    add esi, eax
    mov al, [esi]
    
    pop esi
    pop ecx
    pop ebx
    ret
GetLevelChar ENDP

CheckForGround PROC
    push eax
    push ebx    ; Preserve EBX 
    push edx    ; Preserve EDX 

    ; Calculate Y + 1 and check boundary
    mov al, yPos
    inc al                  
    
    mov dh, al              

    cmp al, LEVEL_HEIGHT    ; Check if Y + 1 is past the bottom
    ja setFalling           ; If it is past, player is falling
    
    ; Save original xPos/yPos in BL/BH before temporary modification
    mov bl, xPos            ; Original xPos in BL
    mov bh, yPos            ; Original yPos in BH
    
    ; Temporarily set yPos to the position below the player (Y + 1)
    mov yPos, dh            
    
    call GetLevelChar       ; AL = character at (xPos, yPos + 1)
                            
    ; Restore original xPos, yPos
    mov xPos, bl            ; Restore xPos from BL
    mov yPos, bh            ; Restore yPos from BH

    ; AL still holds the map character. Check if it's a solid block.
    cmp al, '='
    je setGrounded
    cmp al, '-'
    je setGrounded
    cmp al, '_'  ; 
    je setGrounded
    cmp al, '['  ; 
    je setGrounded
    cmp al, ']'  ;
    je setGrounded
    
setFalling:
    ; We are falling. Pop all registers, THEN set return value.
    pop edx     ; Restore EDX
    pop ebx     ; Restore EBX
    pop eax     ; Restore original EAX
    mov al, 'f' ; 'f' for falling
    ret
    
setGrounded:
    ; We are grounded. Pop all registers, THEN set return value.
    pop edx     ; Restore EDX
    pop ebx     ; Restore EBX
    pop eax     ; Restore original EAX
    mov al, 'g' ; 'g' for grounded
    ret
CheckForGround ENDP

exitGame:
	exit


gameOver PROC
call PlayGameOverMusic
    ; No need to push registers here as we are exiting anyway
    
    call Clrscr
    
    mov dl, 30
    mov dh, 10
    call Gotoxy
    mov eax, White + (Black*16)
    call setTextColor
    mov edx, OFFSET strGameOver
    call WriteString
    
    ; Display final score
    mov dl, 30
    mov dh, 12
    call Gotoxy
    mov edx, OFFSET strScore
    call WriteString
    mov al, score
    call WriteInt
    
    mov dl, 30
    mov dh, 14
    call Gotoxy
    mov edx, OFFSET strReturnToMenu 
    call WriteString
    
    ; Save score and wait for key
    call SaveScoreToFile
    call ReadChar 

    exit
gameOver ENDP


SaveScoreToFile PROC
    pushad
    
    ; Verify name is not empty
    cmp BYTE PTR [OFFSET playerName], 0
    je skipSave
    
    ; Convert score
    movzx eax, score
    mov playerScore, eax
    
    
    ; Try to open existing file
    mov edx, OFFSET leaderboardFile
    call OpenInputFile
    cmp eax, INVALID_HANDLE_VALUE
    je createNewFile
    
    ; File exists - read all content first
    mov fileHandle, eax
    
    ; Read existing content into StringBuf
    mov eax, fileHandle
    mov edx, OFFSET StringBuf
    mov ecx, 900            ; Read up to 400 bytes 
    call ReadFromFile
    mov ebx, eax            ; EBX = bytes read
    
    ; Close the file
    mov eax, fileHandle
    call CloseFile
    
    ; Now create new file (overwrites old)
    mov edx, OFFSET leaderboardFile
    call CreateOutputFile
    mov fileHandle, eax
    
    ; Write back old content if any
    cmp ebx, 0
    je writeNewEntry
    
    mov eax, fileHandle
    mov edx, OFFSET StringBuf
    mov ecx, ebx
    call WriteToFile
    
    jmp writeNewEntry

createNewFile:
    ; Create brand new file
    mov edx, OFFSET leaderboardFile
    call CreateOutputFile
    mov fileHandle, eax

writeNewEntry:
    ; Write Name
    mov edx, OFFSET playerName
    call StrLength_
    mov ecx, eax
    
    cmp ecx, 0
    je closeFile_
    
    mov eax, fileHandle
    mov edx, OFFSET playerName
    call WriteToFile
    
    ; Write Space
    mov eax, fileHandle
    mov edx, OFFSET strFileSeparator
    mov ecx, 1
    call WriteToFile
    
    ; Convert and Write Score
    call ClearStringBuf
    mov eax, playerScore
    mov edi, OFFSET StringBuf
    call IntToString
    
    mov edx, OFFSET StringBuf
    call StrLength_
    mov ecx, eax
    
    mov eax, fileHandle
    mov edx, OFFSET StringBuf
    call WriteToFile
    
    ; Write CRLF
    mov eax, fileHandle
    mov edx, OFFSET strFileCRLF
    mov ecx, 2
    call WriteToFile

closeFile_:
    mov eax, fileHandle
    call CloseFile
    
skipSave:
    popad
    ret
SaveScoreToFile ENDP

ReadLeaderboard PROC
    pushad

    call Clrscr
    mov eax, LightGreen + (Black * 16)
    call SetTextColor
    
    ; Print Header
    mov dl, 10
    mov dh, 3
    call Gotoxy
    mov edx, OFFSET strLBHeader
    call WriteString

    mov dl, 10
    mov dh, 4
    call Gotoxy
    mov edx, OFFSET strLBDivider
    call WriteString

    ; Open File
    mov edx, OFFSET leaderboardFile
    call OpenInputFile
    mov fileHandle, eax
    cmp fileHandle, INVALID_HANDLE_VALUE
    je FileNotCreatedYet
    
    mov dh, 5               ; Y-position 
    mov ebx, 1              ; EBX = Rank Counter

readLoop:
    ; Safety limit
    cmp ebx, 20
    jge endReadLoop
    cmp dh, 23
    jge endReadLoop
    
    ; Clear StringBuf before reading
    push eax
    push ecx
    push edi
    mov edi, OFFSET StringBuf
    mov ecx, SIZEOF StringBuf
    mov al, 0
    rep stosb
    pop edi
    pop ecx
    pop eax
    
    ; Read one line
    mov eax, fileHandle
    mov edx, OFFSET StringBuf
    mov ecx, SIZEOF StringBuf
    call ReadOneLine        
    
    ; Check for EOF
    cmp eax, 0
    je endReadLoop
    
    ; Check for valid line 
    cmp eax, 3
    jl readLoop             ; Skip invalid lines
    
    ; Find the LAST space separator
    mov ecx, eax            ; ECX = Length
    mov esi, OFFSET StringBuf
    add esi, ecx
    dec esi                 ; ESI = last char
    
findSpace:
    cmp esi, OFFSET StringBuf
    jbe skipThisLine        ; No space found
    
    mov al, [esi]
    cmp al, ' '
    je foundSpace
    dec esi
    jmp findSpace
    
foundSpace:
    ; ESI points to the space
    mov BYTE PTR [esi], 0   ; Null-terminate name
    inc esi                 ; ESI now points to score
    
    ; Verify we have both name and score
    cmp BYTE PTR [OFFSET StringBuf], 0  
    je skipThisLine
    cmp BYTE PTR [esi], 0               
    je skipThisLine
    
    
    push esi                ; Save score pointer
    
    ; Print Rank (Fixed at column 10, width 5)
    mov dl, 10
    call Gotoxy
    
    ; Right-align rank in 5-char field
    mov eax, ebx
    cmp eax, 10
    jl singleDigitRank
    
    ; Two-digit rank
    call WriteDec
    jmp afterRank
    
singleDigitRank:
    ; Add leading space for single digit
    mov al, ' '
    call WriteChar
    mov eax, ebx
    call WriteDec
    
afterRank:
    ; Print separator " | "
    mov al, ' '
    call WriteChar
    mov al, '|'
    call WriteChar
    mov al, ' '
    call WriteChar
    
    ; Print Name 
    mov edx, OFFSET StringBuf
    call WriteString
    
    ; Get name length for padding
    mov edx, OFFSET StringBuf
    call StrLength_
    
    ; Pad to 20 characters total for name column
    mov ecx, 20
    sub ecx, eax
    cmp ecx, 0
    jle printScoreSeparator
    
padName:
    mov al, ' '
    call WriteChar
    loop padName
printScoreSeparator:
    ; Print separator " | "
    mov al, ' '
    call WriteChar
    mov al, '|'
    call WriteChar
    mov al, ' '
    call WriteChar
    
    ; Print Score
    pop esi                 ; Restore score pointer
    mov edx, esi
    call WriteString
    
    call Crlf               
    
    ; Next line
    inc dh
    inc ebx
    jmp readLoop    
skipThisLine:
    ; Skip malformed line but continue reading
    jmp readLoop

endReadLoop:
    mov eax, fileHandle
    call CloseFile
    
    ; Show message
    mov dl, 10
    add dh, 2               ; Add extra line space
    call Gotoxy
    mov edx, OFFSET strReturnToMenu
    call WriteString
    call ReadChar
    
    popad
    ret
    
FileNotCreatedYet:
    mov dl, 10
    mov dh, 5
    call Gotoxy
    mov edx, OFFSET strLBerr
    call WriteString
    
    mov dl, 10
    mov dh, 7
    call Gotoxy
    mov edx, OFFSET strReturnToMenu
    call WriteString
    call ReadChar
    
    popad
    ret
ReadLeaderboard ENDP


DrawLives PROC
    pushad
    
    ; 1. Position cursor at the start
    mov dl, LIVES_DISPLAY_X
    mov dh, LIVES_DISPLAY_Y
    call Gotoxy
    
    ; 2. Set color for "Lives: " text (White on Black)
    mov eax, White + (Black * 16)
    call SetTextColor
    
    ; 3. Display "Lives: " text (cursor auto-advances)
    mov edx, OFFSET strLivesDisplay
    call WriteString
    
    ; 4. Set color for '$' characters (Yellow on Black)
    mov eax, Yellow + (Black * 16)
    call SetTextColor
    
    ; 5. Draw the '$' characters (one for each life)
    movzx ecx, playerLives
    cmp ecx, 0              ; Safety check
    je skipDraw
    mov al, '$'
    
drawLoop:
    call WriteChar          ; Cursor auto-advances after each character
    loop drawLoop
    
skipDraw:
    ; 6. Clear any remaining characters (if a life was lost)
    mov eax, Black + (Black * 16)  ; Black text on black background
    call SetTextColor
    
    movzx eax, playerLives
    mov ecx, 3              ; Max lives
    sub ecx, eax            ; ECX = spaces to clear
    cmp ecx, 0              ; Check if we need to clear anything
    jle skipClear
    
    mov al, ' '             ; Space character
    
clearLoop:
    call WriteChar          ; Cursor auto-advances
    loop clearLoop
    
skipClear:
    ; 7. Restore default color (White on Black)
    mov eax, White + (Black * 16)
    call SetTextColor
    
    popad
    ret
DrawLives ENDP

; =======================================================
; StartTimer PROC
; Initializes the level timer to 60 seconds and records 
; the current system time.
; =======================================================
StartTimer PROC
    push eax
    push edx
    
    mov levelTimer, 60        ; Reset timer to 60 seconds
    call GetMseconds          ; EAX = current system time in ms
    mov timerStartTime, eax   ; Save the starting time
    
    pop edx
    pop eax
    ret
StartTimer ENDP
; =======================================================
; UpdateAndDisplayTimer PROC
; Checks if a second has elapsed, updates the timer, and displays it.
; Returns: AL = 't' if time expired, 'o' if OK
; =======================================================
UpdateAndDisplayTimer PROC
    push ebx
    push ecx
    push edx
    push edi

    ; 1. Check if a second has elapsed
    call GetMseconds        ; EAX = Current system time (ms)
    mov ebx, EAX            ; EBX = Current time
    sub ebx, timerStartTime ; EBX = Elapsed time since last update/start
    
    cmp ebx, TIMER_INTERVAL ; Compare elapsed time to 1000ms
    jl displayOnly          ; If < 1000ms, just display, don't decrement

    ; 2. Time has elapsed, decrement timer and reset start time
    
    ; Update Start Time: timerStartTime = CurrentTime
    call GetMseconds
    mov timerStartTime, eax ; Reset to current time
    
    ; Decrement Timer
    mov eax, levelTimer
    cmp eax, 0              ; Check if already 0
    jle timeExpired       
    dec eax
    mov levelTimer, eax
    
    ; 3. Check if timer just reached zero
    cmp levelTimer, 0
    je timeExpired
    
displayOnly:
    ; 4. Display Remaining Time (levelTimer)
    
    ; Set color and position
    push eax
    mov eax, Yellow + (Black * 16)
    call SetTextColor
    pop eax
    
    mov dl, TIMER_DISPLAY_X
    mov dh, TIMER_DISPLAY_Y
    call Gotoxy
    
    ; Display "Time: "
    push edx
    mov edx, OFFSET strTimerDisplay
    call WriteString
    pop edx
    
    ; Display new time
    mov eax, levelTimer
    call WriteDec
    
    ; Clear remaining characters on the line
    mov al, ' '
    call WriteChar
    mov al, ' '
    call WriteChar
    
    ; Restore default color
    push eax
    mov eax, White + (Black * 16)
    call SetTextColor
    pop eax
    ; ... existing display code ...
    
    ; Check for low time warning
    cmp levelTimer, 10
    jg skipWarning
    
    ; Play warning every 2 seconds
    mov eax, levelTimer
    and eax, 1              ; Check if odd/even
    cmp eax, 0
    jne skipWarning
    call PlayTimeWarningSound
    
skipWarning:
    ; Return 'o' for OK (time not expired)
    pop edi
    pop edx
    pop ecx
    pop ebx
    mov al, 'o'
    ret

timeExpired:
    ; Display time as 0 before returning
    push eax
    mov eax, Yellow + (Black * 16)
    call SetTextColor
    pop eax
    
    mov dl, TIMER_DISPLAY_X
    mov dh, TIMER_DISPLAY_Y
    call Gotoxy
    
    push edx
    mov edx, OFFSET strTimerDisplay
    call WriteString
    pop edx
    
    mov eax, 0
    call WriteDec
    
    mov al, ' '
    call WriteChar
    mov al, ' '
    call WriteChar
    
    ; Return 't' for time expired
    pop edi
    pop edx
    pop ecx
    pop ebx
    mov al, 't'
    ret
UpdateAndDisplayTimer ENDP
; =======================================================
; ClearStringBuf PROC
; Clears the StringBuf by filling it with zeros
; =======================================================
ClearStringBuf PROC
    push eax
    push ecx
    push edi
    
    mov edi, OFFSET StringBuf
    mov ecx, SIZEOF StringBuf
    mov al, 0
    rep stosb                   ; Fill buffer with zeros
    
    pop edi
    pop ecx
    pop eax
    ret
ClearStringBuf ENDP

; =======================================================
; IntToString PROC
; Converts an integer to a string
; Receives: EAX = Integer to convert
;           EDI = Address of destination buffer
; Returns: String in buffer pointed to by EDI
; =======================================================
IntToString PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi
    
    mov ebx, 10                 ; Divisor for base-10
    mov ecx, 0                  ; Digit counter
    
    ; Handle zero case
    cmp eax, 0
    jne startConversion
    mov BYTE PTR [edi], '0'
    mov BYTE PTR [edi+1], 0
    jmp conversionDone
    
startConversion:
    ; Push digits onto stack in reverse order
pushDigits:
    cmp eax, 0
    je popDigits
    
    mov edx, 0                  ; Clear EDX for division
    div ebx                     ; EAX = quotient, EDX = remainder
    add dl, '0'                 ; Convert remainder to ASCII
    push edx                    ; Push digit onto stack
    inc ecx                     ; Increment digit counter
    jmp pushDigits
    
popDigits:
    ; Pop digits from stack and store in buffer
    mov esi, edi                ; ESI = current buffer position
    
popLoop:
    cmp ecx, 0
    je nullTerminate
    
    pop edx                     ; Pop digit
    mov [esi], dl               ; Store in buffer
    inc esi                     ; Move to next position
    dec ecx                     ; Decrement counter
    jmp popLoop
    
nullTerminate:
    mov BYTE PTR [esi], 0       ; Null-terminate the string
    
conversionDone:
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
IntToString ENDP

; =======================================================
; Removes trailing spaces, CR, LF, and null bytes
; Receives: EDX = Address of string
;           ECX = Max length
; =======================================================

TrimTrailing PROC
    push eax
    push ebx
    push ecx
    push esi
    
    mov esi, edx            ; ESI = start of string
    
    ; First, find the actual end of the string (first null or max length)
    mov ebx, esi            ; EBX = start
    mov ecx, 0              ; Counter
    
findActualEnd:
    cmp ecx, 29             ; Don't go past buffer
    jge foundEnd
    mov al, [ebx]
    cmp al, 0               ; Found null?
    je foundEnd
    inc ebx
    inc ecx
    jmp findActualEnd
    
foundEnd:
    ; Now EBX points to null or past buffer
    ; ECX = length of string
    
    ; If length is 0, nothing to trim
    cmp ecx, 0
    je exitTrim
    
    ; Start from the end and work backwards
    dec ebx                 ; Point to last actual character
    
trimLoop:
    cmp ebx, esi            ; Don't go before start
    jl exitTrim
    
    mov al, [ebx]
    
    ; Check if it's a character we want to trim
    cmp al, ' '             ; Space
    je trimThis
    cmp al, 13              ; CR
    je trimThis
    cmp al, 10              ; LF
    je trimThis
    cmp al, 9               ; Tab
    je trimThis
    cmp al, 0               ; Null
    je trimThis
    
    ; Found a valid character, stop trimming
    jmp placeNull
    
trimThis:
    dec ebx
    jmp trimLoop
    
placeNull:
    ; EBX points to the last valid character
    ; Place null after it
    inc ebx
    mov BYTE PTR [ebx], 0
    
exitTrim:
    pop esi
    pop ecx
    pop ebx
    pop eax
    ret
TrimTrailing ENDP

ReadOneLine PROC
    push ebx
    push ecx
    push edx
    push esi
    push edi
    
    mov ebx, eax        ; EBX = File Handle
    mov edi, edx        ; EDI = Buffer Start
    mov esi, 0          ; ESI = Character Counter
    
ReadNextChar:
    ; Check buffer limit
    cmp esi, ecx
    jge LineComplete
    
    ; Read 1 byte into buffer
    push ecx
    mov eax, ebx            ; File Handle
    lea edx, [edi + esi]    ; Current position in buffer
    mov ecx, 1              ; Read 1 byte
    call ReadFromFile
    pop ecx
    
    ; Check if read failed (EOF)
    cmp eax, 0
    je EndOfFile
    
    ; Check what we read
    mov al, [edi + esi]     ; Get the character
    
    ; Check for CR (0Dh) - skip it
    cmp al, 0Dh
    je ReadNextChar         ; Don't store CR, just read next
    
    ; Check for LF (0Ah) - end of line
    cmp al, 0Ah
    je LineComplete
    
    ; Valid character - keep it
    inc esi                 ; Increment counter
    jmp ReadNextChar
    
LineComplete:
    ; Null-terminate the string
    mov BYTE PTR [edi + esi], 0
    mov eax, esi            ; Return number of chars read
    jmp ExitReadLine
    
EndOfFile:
    ; If we read some chars before EOF, return them
    cmp esi, 0
    je TrueEOF
    
    ; We have data, null-terminate and return
    mov BYTE PTR [edi + esi], 0
    mov eax, esi
    jmp ExitReadLine
    
TrueEOF:
    ; No data read, return 0
    mov BYTE PTR [edi], 0   ; Null-terminate empty buffer
    mov eax, 0
    
ExitReadLine:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
ReadOneLine ENDP

ShowLevelCompleteScreen PROC
    pushad
     call PlayLevelCompleteSound
    
    call Clrscr
    mov eax, LightGreen + (Black * 16)
    call SetTextColor
    
    ; 1. Display "LEVEL X COMPLETED!"
    mov dl, 30
    mov dh, 10
    call Gotoxy
    
    ; a. Write "LEVEL "
    mov edx, OFFSET strLevelComplete
    call WriteString
    
    ; b. Write Level Number
    movzx eax, currentLevel
    call WriteInt
    
    ; c. Write " COMPLETED! Press any key to continue..."
    mov edx, OFFSET strCompleteMsg 
    call WriteString

    ; 2. Display Score
    mov dl, 30
    mov dh, 12
    call Gotoxy
    mov edx, OFFSET strScore
    call WriteString
    mov al, score
    call WriteInt
    
    ; 3. Wait for key press
    mov dl, 30
    mov dh, 14
    call Gotoxy
    mov edx, OFFSET strReturnToMenu 
    call WriteString
    call ReadChar
    
    popad
    ret
ShowLevelCompleteScreen ENDP

; =======================================================
; LoadLevelProgress PROC
; Attempts to read the saved level from progress.txt.
; =======================================================
LoadLevelProgress PROC
    pushad

    ; 1. Open the progress file for reading
    mov edx, OFFSET levelProgressFile
    call OpenInputFile
    mov levelProgressHandle, eax
    cmp levelProgressHandle, INVALID_HANDLE_VALUE
    je NoProgressFile ; If it doesn't exist, use default (Level 1)

    ; 2. Read the level number (we assume it's a single digit in the file)
    mov eax, levelProgressHandle
    mov edx, OFFSET StringBuf   ; Use StringBuf as a temporary holder
    mov ecx, 2                  ; Max 2 bytes (level number + null terminator)
    call ReadOneLine            ; A custom helper might be needed if ReadFromFile is used. ReadOneLine is best.

    cmp eax, 0                  ; Check if nothing was read (empty file)
    je NoProgressFile

    ; 3. Convert ASCII char (e.g., '2') to integer (2)
    mov al, [OFFSET StringBuf]  ; AL = '1', '2', or '3' (ASCII)
    cmp al, '0'
    jle NoProgressFile          ; If somehow corrupted, use default
    sub al, '0'                 ; AL = 1, 2, or 3 (Numeric)

    ; 4. Update currentLevel
    mov currentLevel, al        
    
    ; 5. Close the file
    mov eax, levelProgressHandle
    call CloseFile

    popad
    ret

NoProgressFile:
 
    mov currentLevel, 1
    cmp levelProgressHandle, INVALID_HANDLE_VALUE
    je DoneClosing
    mov eax, levelProgressHandle
    call CloseFile
DoneClosing:
    popad
    ret
LoadLevelProgress ENDP

; =======================================================
; SaveLevelProgress PROC
; Overwrites progress.txt with the current level number.
; =======================================================

SaveLevelProgress PROC
    pushad

    ; 1. Create/Open file for output 
    mov edx, OFFSET levelProgressFile
    call CreateOutputFile   ; Creates new file or overwrites existing one
    mov levelProgressHandle, eax

    ; Check for error (though less critical for a simple save)
    cmp eax, INVALID_HANDLE_VALUE
    je SaveExit

    ; 2. Convert currentLevel to ASCII string in StringBuf
    call ClearStringBuf         
    movzx eax, currentLevel     ; EAX = level number
    mov edi, OFFSET StringBuf   ; EDI = destination buffer
    call IntToString            ; Converts 1 -> "1", 2 -> "2", etc.

    ; 3. Write Level String to file
    mov edx, OFFSET StringBuf
    call StrLength_             ; EAX = length of string (1)
    mov ecx, eax                ; Byte Count in ECX

    mov eax, levelProgressHandle
    mov edx, OFFSET StringBuf
    call WriteToFile

    ; 4. Close file
    mov eax, levelProgressHandle
    call CloseFile
    
SaveExit:
    popad
    ret
SaveLevelProgress ENDP


; =======================================================
; DrawLifeUp PROC
; Draws the '$' character if it hasn't been collected.
; =======================================================

DrawLifeUp PROC
    pushad

    ; Check if already collected
    cmp lifeUpCollected, 't'
    je endDrawLifeUp

    ; Draw the '$'
    mov dl, lifeUpX
    mov dh, lifeUpY
    call Gotoxy

    mov eax, Green + (Black * 16) ; Use Green for life-up
    call SetTextColor
    
    mov edx, OFFSET lifeUpChar
    call WriteString 
    
    ; Restore color
    mov eax, White + (Black * 16)
    call SetTextColor
    
endDrawLifeUp:
    popad
    ret
DrawLifeUp ENDP


; =======================================================
; CheckLifeUpCollision PROC
; Checks for collision with the $ item and increments life (max 3).
; =======================================================

CheckLifeUpCollision PROC
    pushad

    ; 1. Skip if already collected
    cmp lifeUpCollected, 't'
    je endCheckLifeUp

    ; 2. Check for X and Y match
    mov al, xPos
    cmp al, lifeUpX
    jne endCheckLifeUp

    mov al, yPos
    cmp al, lifeUpY
    jne endCheckLifeUp
    
    ; 3. Check if lives are already max
    
    cmp playerLives, 3
    jge markCollected ; If 3 or more, skip increment but still collect/erase it

    ; 4. Increment life
    inc playerLives
    call PlayExtraLifeSound 
    call DrawLives ; Update the HUD immediately

markCollected:
    ; 5. Mark as collected
    mov lifeUpCollected, 't'

    ; 6. Erase '$' from screen
    mov dl, lifeUpX
    mov dh, lifeUpY
    call Gotoxy
    
    ; Erase with black on black
    mov eax, Black + (Black * 16)
    call SetTextColor
    
    mov al, ' '
    call WriteChar
    
    ; Restore color
    mov eax, White + (Black * 16)
    call SetTextColor
    
endCheckLifeUp:
    popad
    ret
CheckLifeUpCollision ENDP

ResetLifeUp PROC
    pushad
    mov lifeUpCollected, 'f'
    popad
    ret
ResetLifeUp ENDP



; =======================================================
; ClearProgressFile PROC
; Overwrites progress.txt with nothing, setting up a fresh start.
; =======================================================

ClearProgressFile PROC
    pushad

    ; 1. Create/Open file for output (overwrites existing file with 0 size)
    mov edx, OFFSET levelProgressFile
    call CreateOutputFile   ; Creates new file or overwrites existing one
    mov levelProgressHandle, eax

    ; No need to write anything, just close it to ensure it's empty
    cmp eax, INVALID_HANDLE_VALUE
    je ClearExit ; Check for error
    
    mov eax, levelProgressHandle
    call CloseFile
    
ClearExit:
    popad
    ret
ClearProgressFile ENDP


; =======================================================
; DrawGoombas PROC
; Draws the Goomba characters if they are alive.
; =======================================================
DrawGoombas PROC
    pushad
    
    mov ecx, MAXGoombas
    mov esi, OFFSET goombaX
    mov edi, OFFSET goombaY
    mov ebx, OFFSET goombaAlive
    
drawLoopGoomba:
    cmp BYTE PTR [ebx], 'f'     ; Is it defeated?
    je skipDrawGoomba
    
    ; Draw the Goomba ('G')
    mov dl, [esi]               ; X position
    mov dh, [edi]               ; Y position
    call Gotoxy
    
    mov eax, Red + (Black * 16) ; Use Red color for Goomba
    call SetTextColor
    
    mov al, goombaChar          ; 'G'
    call WriteChar
    
    ; Restore color (will be done by gravity/onground, but good practice)
    mov eax, White + (Black * 16)
    call SetTextColor
    
skipDrawGoomba:
    inc esi                     ; Next X
    inc edi                     ; Next Y
    inc ebx                     ; Next Alive flag
    loop drawLoopGoomba
    
    popad
    ret
DrawGoombas ENDP

; =======================================================
; MoveGoombas PROC
; Handles Goomba movement and FREEZE logic
; =======================================================
MoveGoombas PROC
    pushad
    
    mov ecx, MAXGoombas
    mov esi, OFFSET goombaX
    mov edi, OFFSET goombaY
    mov ebx, OFFSET goombaDirection
    mov edx, OFFSET goombaAlive
    mov ebp, 0                  
    
goombaMoveLoop:
    ; 1. Check if defeated
    cmp BYTE PTR [edx], 'f'     ; Is it dead?
    je skipGoombaProcessing     ; If dead, do nothing
    
    ; ============================================================
    ; STEP 5: CHECK FREEZE STATUS
    ; ============================================================
    push eax                    ; Save registers used for calculation
    push esi                    ; Save X pointer temporarily
    
    ; Check goombaFrozen[ebp]
    mov esi, OFFSET goombaFrozen
    add esi, ebp                ; Add index to base address
    cmp BYTE PTR [esi], 't'     ; Is it frozen?
    jne notFrozen               ; If not 't', jump to normal movement

    
    ; Calculate address of goombaTimer[ebp] (DWORD array, so index * 4)
    mov esi, OFFSET goombaTimer
    mov eax, ebp                ; Move Index to EAX
    shl eax, 2                  ; Multiply by 4 (Shift Left 2)
    add esi, eax                ; ESI now points to this Goomba's timer
    
    ; Decrease Timer
    sub DWORD PTR [esi], 50     ; Subtract 50ms (Frame delay)
    jg keepFrozen               ; If time > 0, stay frozen
    
    ; Time is up: Unfreeze
    mov esi, OFFSET goombaFrozen
    add esi, ebp
    mov BYTE PTR [esi], 'f'     ; Set frozen to 'f'
    
keepFrozen:
    pop esi                     ; Restore X pointer
    pop eax                     ; Restore EAX
    jmp performDraw             ; SKIP MOVEMENT, just draw it standing still

notFrozen:
    pop esi                     ; Restore X pointer
    pop eax                     ; Restore EAX


    ; 2. Erase current position (Black on Black)
    push eax
    push edx
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov eax, Black + (Black * 16)
    call SetTextColor
    mov al, ' '
    call WriteChar
    pop edx
    pop eax
    
    ; 3. Determine Next Position & Direction
    mov al, [ebx]
    cmp al, 1                   ; Check Direction (1=Right)
    je checkRightBounds
    

    
    ; Check LEFT SCREEN BOUNDARY (X=0)
    mov al, [esi]               
    cmp al, SCREEN_MIN_X        
    je reverseDirGoomba         ; Hit the left edge, reverse!
    
    ; Check if next X-1 leads to a pit
    mov al, [esi]
    dec al                      ; Proposed X-1
    push eax
    call CheckNextPosForSolid   ; BL = char at (X-1, Y+1)
    pop eax 
    cmp bl, ' '                 ; Check BL if it's a pit (' ')
    je reverseDirGoomba         ; Pit found, reverse!
    
    ; Check Half-Screen Boundary (Goomba 1 limit)
    cmp ebp, 1                  ; Is this Goomba 1?
    jne moveLeftOnly            
    mov al, [esi]               
    cmp al, LEFT_HALF_MAX       
    jle reverseDirGoomba        

moveLeftOnly:
    dec BYTE PTR [esi]          ; Move Left (X--)
    jmp performDraw             ; Move on to draw

checkRightBounds:


    ; Check RIGHT SCREEN BOUNDARY (X=119)
    mov al, [esi]               
    cmp al, SCREEN_MAX_X        
    je reverseDirGoomba         ; Hit the right edge, reverse!
    
    ; Check if next X+1 leads to a pit
    mov al, [esi]
    inc al                      ; Proposed X+1
    push eax
    call CheckNextPosForSolid   ; BL = char at (X+1, Y+1)
    pop eax 
    cmp bl, ' '                 ; Check BL if it's a pit (' ')
    je reverseDirGoomba         ; Pit found, reverse!
    

    cmp ebp, 0                  ; Is this Goomba 0?
    jne moveRightOnly
    mov al, [esi]               
    cmp al, RIGHT_HALF_MIN      
    jge reverseDirGoomba        
    
moveRightOnly:
    inc BYTE PTR [esi]          ; Move Right (X++)
    jmp performDraw
    
reverseDirGoomba:
    ; Reverse Direction (0 -> 1 or 1 -> 0)
    mov al, [ebx]
    xor al, 1
    mov [ebx], al
    ; No move performed this frame when reversing direction
    
performDraw:
    ; 4. Draw the Goomba
    push eax
    push edx
    mov dl, [esi]               ; X position
    mov dh, [edi]               ; Y position
    call Gotoxy
    
    ; Check if Frozen to change color (Optional Visual Effect)
    ; We check the array again quickly to set color
    push esi
    mov esi, OFFSET goombaFrozen
    add esi, ebp
    cmp BYTE PTR [esi], 't'
    pop esi
    je drawFrozenColor
    
    mov eax, Red + (Black * 16) ; Normal Red
    jmp setGColor
    
drawFrozenColor:
    mov eax, LightCyan + (Black * 16) ; Cyan/Ice color when frozen

setGColor:
    call SetTextColor
    mov al, goombaChar          ; 'G'
    call WriteChar
    
    pop edx
    pop eax
    
skipGoombaProcessing:
    inc esi                     ; Next Goomba X
    inc edi                     ; Next Goomba Y
    inc ebx                     ; Next Goomba Dir
    inc edx                     ; Next Goomba Alive
    inc ebp                     ; Increment Goomba Index
    
    dec ecx                     ; Decrement counter
    cmp ecx, 0                  ; Check if done
    jne goombaMoveLoop          ; Continue loop
    
    ; 6. Restore final color
    push eax
    mov eax, White + (Black * 16)
    call SetTextColor
    pop eax

    popad
    ret
MoveGoombas ENDP

CheckNextPosForSolid PROC
    
    ;          in the calling routine (MoveGoombas). EDX is clobbered by MUL.
    push ebx
    push edx    
    
    push eax
    push ecx
    push esi
    
    ; Save AL (Proposed X)
    mov bl, al
    
    ; Calculate offset: (Y+1) * (LevelWidth+2) + X
    movzx eax, BYTE PTR [edi]   ; EAX = Goomba Y
    inc eax                     ; EAX = Goomba Y + 1 (position below)
    mov ecx, LEVEL_WIDTH
    add ecx, 2
    mul ecx                     ; EAX = (Y+1) * (LevelWidth+2), EDX is clobbered here
    movzx esi, bl               ; ESI = Proposed X
    add eax, esi                ; EAX = Total offset
    
    ; Get correct level map
    push eax
    mov al, currentLevel
    cmp al, 1
    je useLevel1_goomba
    cmp al, 2
    je useLevel2_goomba
    mov esi, OFFSET level3
    jmp getChar_goomba
    
useLevel1_goomba:
    mov esi, OFFSET level1
    jmp getChar_goomba
useLevel2_goomba:
    mov esi, OFFSET level2
    
getChar_goomba:
    pop eax                     ; EAX = Offset
    add esi, eax
    mov bl, [esi]               ; BL = Character at (X, Y+1)
    
    pop esi
    pop ecx
    pop eax
    
    pop edx                     ; *** FIX: Restore original EDX (the goombaAlive pointer)
    pop ebx                     ; *** FIX: Restore original EBX (the goombaDirection pointer)
    ret
CheckNextPosForSolid ENDP



; =======================================================
; CheckGoombaCollision PROC
; Checks if player has collided with any alive Goomba.
; =======================================================
CheckGoombaCollision PROC
    pushad
    
    mov ecx, MAXGoombas
    mov esi, OFFSET goombaX
    mov edi, OFFSET goombaY
    mov ebx, OFFSET goombaAlive
    
collisionLoop:
    cmp BYTE PTR [ebx], 'f'     ; Is it defeated?
    je skipGoombaCheck
    
    ; Check X match
    mov al, [esi]
    cmp al, xPos
    jne skipGoombaCheck
    
    ; Check Y match
    mov al, [edi]               
    cmp al, yPos                
    jne checkSideCollision      
    
    ; Direct Hit
    jmp playerHitWrapper

checkSideCollision:
    ; Check Stomp (Player is 1 unit above)
    inc al                      
    cmp al, yPos                
    je playerStomped
    
    jmp skipGoombaCheck
    
playerHitWrapper:
    
    cmp isSuper, 1
    je powerDown
    
    ; If not super, Player dies
    jmp pitfallExit             

powerDown:
    ; 1. Revert to Small Mario
    mov isSuper, 0
    
    ; 2. "Sacrifice" the Goomba (Defeat it instantly)
    ; This prevents Mario from being stuck inside the Goomba 
    mov BYTE PTR [ebx], 'f'
    
    ; 3. Erase the Goomba
    push eax
    push edx
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov eax, Black + (Black * 16)
    call SetTextColor
    mov al, ' '
    call WriteChar
        
    pop edx
    pop eax
    
    jmp skipGoombaCheck

playerStomped:
    ; Erase Goomba
    push eax
    push edx
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov eax, Black + (Black * 16)
    call SetTextColor
    mov al, ' '
    call WriteChar
    pop edx
    pop eax

    mov BYTE PTR [ebx], 'f'     ; Set defeated
    inc score      
    call PlayStompSound  
    jmp skipGoombaCheck         
    
pitfallExit:
    popad                       
    jmp pitfall                 
    
skipGoombaCheck:
    inc esi
    inc edi
    inc ebx
    
    dec ecx             ; Manually decrease the counter
    cmp ecx, 0          ; Check if we hit zero
    je finishedCollision; If 0, we are done, exit the loop
    jmp collisionLoop   ; Unconditional JMP can jump ANY distance
    
finishedCollision:
    popad
    ret
CheckGoombaCollision ENDP


ResetGoombaPositions PROC
    push ecx
    push esi
    push edi

    ; Copy BASE_goombaX to goombaX
    mov esi, OFFSET BASE_goombaX
    mov edi, OFFSET goombaX
    mov ecx, MAXGoombas
    rep movsb 

    ; Copy BASE_goombaY to goombaY
    mov esi, OFFSET BASE_goombaY
    mov edi, OFFSET goombaY
    mov ecx, MAXGoombas
    rep movsb 

    pop edi
    pop esi
    pop ecx
    ret
ResetGoombaPositions ENDP


; =======================================================
; ResetGoombas PROC
; Resets all Goomba states to 't' (alive).
; =======================================================

ResetGoombas PROC
    pushad
    mov ecx, MAXGoombas
    mov esi, OFFSET goombaAlive
resetLoop:
    mov BYTE PTR [esi], 't'
    inc esi
    loop resetLoop
    popad
    ret
ResetGoombas ENDP

; =======================================================
; DrawMushroom PROC
; Draws 'M' if it hasn't been collected
; =======================================================

DrawMushroom PROC
    pushad

    ; Check if active
    cmp mushroomActive, 't'
    jne endDrawMush

    ; Draw the 'M'
    mov dl, mushroomX
    mov dh, mushroomY
    call Gotoxy

    ; Red background or Magenta text to make it stand out
    mov eax, LightMagenta + (Black * 16) 
    call SetTextColor
    
    mov edx, OFFSET mushroomChar
    call WriteString 
    
    ; Restore color
    mov eax, White + (Black * 16)
    call SetTextColor
    
endDrawMush:
    popad
    ret
DrawMushroom ENDP

; =======================================================
; CheckMushroomCollision PROC
; Turns Mario into Super Mario
; =======================================================
CheckMushroomCollision PROC
    pushad

    ; 1. Skip if already collected
    cmp mushroomActive, 't'
    jne endCheckMush

    ; 2. Check for X and Y match
    mov al, xPos
    cmp al, mushroomX
    jne endCheckMush

    mov al, yPos
    cmp al, mushroomY
    jne endCheckMush
    

    ; 3. Enable Super Mode
    mov isSuper, 1
 
    ; 4. Add Score
    add score, 5
    call PlayPowerUpSound

    ; 5. Mark as collected
    mov mushroomActive, 'f'

    ; 6. Erase 'M' from screen
    mov dl, mushroomX
    mov dh, mushroomY
    call Gotoxy
    
    mov eax, Black + (Black * 16)
    call SetTextColor
    mov al, ' '
    call WriteChar
    
    mov eax, White + (Black * 16)
    call SetTextColor
    
endCheckMush:
    popad
    ret
CheckMushroomCollision ENDP

; =======================================================
; DrawTimeUp PROC
; Draws a Yellow '+' if active and in Level 1
; =======================================================

DrawTimeUp PROC
    pushad

    ; 1. Only exist in Level 1
    cmp currentLevel, 1
    jne endTimeDraw

    ; 2. Check if active
    cmp timeUpActive, 't'
    jne endTimeDraw

    ; 3. Draw the '+'
    mov dl, timeUpX
    mov dh, timeUpY
    call Gotoxy

    ; Yellow text on Black background
    mov eax, Yellow + (Black * 16) 
    call SetTextColor
    
    mov edx, OFFSET timeUpChar
    call WriteString 
    
    ; Restore color
    mov eax, White + (Black * 16)
    call SetTextColor
    
endTimeDraw:
    popad
    ret
DrawTimeUp ENDP

; =======================================================
; CheckTimeUpCollision PROC
; Adds 10 seconds to the timer if collected
; =======================================================

CheckTimeUpCollision PROC
    pushad

    ; 1. Level check
    cmp currentLevel, 1
    jne endTimeCheck

    ; 2. Active check
    cmp timeUpActive, 't'
    jne endTimeCheck

    ; 3. Coordinate check
    mov al, xPos
    cmp al, timeUpX
    jne endTimeCheck

    mov al, yPos
    cmp al, timeUpY
    jne endTimeCheck
    
    
    ; 4. Increase Timer
    add levelTimer, 10      ; Add 10 seconds
    
    ; 5. Mark as collected
    mov timeUpActive, 'f'
    
    ; 6. Erase visual immediately
    mov dl, timeUpX
    mov dh, timeUpY
    call Gotoxy
    mov eax, Black + (Black * 16)
    call SetTextColor
    mov al, ' '
    call WriteChar
    
    ; 7. Add a small score bonus (optional)
    add score, 2
    
endTimeCheck:
    popad
    ret
CheckTimeUpCollision ENDP

BreakBlockUnderFeet PROC
    pushad

    
    movzx eax, yPos
    inc eax             ; Look at block UNDER feet
    mov ecx, 122        ; Level Width (120) + 2 bytes for newline
    mul ecx             ; EAX = Row Offset
    
    movzx ebx, xPos
    add eax, ebx        ; EAX = Total Offset from start of map

    ; Select correct level map
    mov bl, currentLevel
    cmp bl, 1
    je useLvl1
    cmp bl, 2
    je useLvl2
    mov esi, OFFSET level3
    jmp doBreak

useLvl1:
    mov esi, OFFSET level1
    jmp doBreak
useLvl2:
    mov esi, OFFSET level2

doBreak:
    add esi, eax        ; ESI now points to the specific byte in the map
    
    ; Check if it's unbreakable (optional)
    ; cmp BYTE PTR [esi], '_' 
    ; je skipBreak      ; Don't break the floor

    mov BYTE PTR [esi], ' '  ; Change map data to Space
    call PlayBlockBreakSound
    
    ; Visual Effect (Beep)
    ; mov eax, 500
    ; mov ebx, 100
    ; call Beep

    ; Redraw the empty space immediately
    mov dl, xPos
    mov dh, yPos
    inc dh              ; Draw at feet level
    call Gotoxy
    mov al, ' '
    call WriteChar

skipBreak:
    popad
    ret
BreakBlockUnderFeet ENDP

; =======================================================
; SpawnFireball PROC
; Receives: AL = Direction (0=Right, 2=Up)
; Finds an empty slot and activates a fireball
; =======================================================

SpawnFireball PROC
    pushad
    mov bl, al              ; Save direction in BL
    
    mov ecx, MAX_FIREBALLS
    mov esi, 0              ; Index
    
findSlot:
    cmp fbActive[esi], 'f'  ; Find inactive slot
    je foundSlot
    inc esi
    loop findSlot
    jmp exitSpawn           ; No slots available

foundSlot:
    ; Set Active
    mov fbActive[esi], 't'
    
    ; Set Position (Start at Player's pos)
    mov al, xPos
    mov fbX[esi], al
    mov al, yPos
    mov fbY[esi], al
    
    ; Set Direction
    mov fbDir[esi], bl
    
exitSpawn:
    popad
    ret
SpawnFireball ENDP

; =======================================================
; UpdateFireballs PROC
; Moves active fireballs, Checks Bounds, Hits Enemies
; =======================================================

UpdateFireballs PROC
    pushad
    
    mov ecx, MAX_FIREBALLS
    mov esi, 0              ; Fireball Index

updateLoop:
    cmp fbActive[esi], 'f'
    je nextFireball

    ; 1. Erase Old Position
    mov dl, fbX[esi]
    mov dh, fbY[esi]
    call Gotoxy
    mov eax, Black + (Black * 16)
    call SetTextColor
    mov al, ' '
    call WriteChar

    ; 2. Move Fireball
    mov al, fbDir[esi]
    cmp al, 0
    je moveFbRight
    cmp al, 2
    je moveFbUp
    jmp checkBounds

moveFbRight:
    inc fbX[esi]
    jmp checkBounds
moveFbUp:
    dec fbY[esi]

checkBounds:
    ; 3. Check Screen/Wall Bounds
    cmp fbX[esi], 119       ; Max Width
    jge killFireball
    cmp fbY[esi], 0         ; Top of screen
    jle killFireball
    
    ; 4. CHECK COLLISION WITH GOOMBAS
    push ecx                ; Save outer loop
    push esi                ; Save fireball index
    
    ; Loop through Goombas
    mov ecx, MAXGoombas
    mov edi, 0              ; Goomba Index
    
checkGoombaHit:
    ; Check if Goomba is Alive
    cmp goombaAlive[edi], 'f'
    je nextTarget
    
    ; Check X collision
    mov al, fbX[esi]
    cmp al, goombaX[edi]
    jne nextTarget
    
    ; Check Y collision
    mov al, fbY[esi]
    cmp al, goombaY[edi]
    jne nextTarget
    
    ; Freeze the Goomba
    mov goombaFrozen[edi], 't'
    
    ; Set Timer to 4000ms (4 seconds)
    mov eax, edi
    shl eax, 2              ; Multiply index by 4 for DWORD array
    mov goombaTimer[eax], 4000
    
    ; Kill the Fireball
    pop esi                 ; Restore fb index
    pop ecx                 ; Restore loop
    jmp killFireball        ; Jump to deactivate fireball

nextTarget:
    inc edi
    loop checkGoombaHit
    
    pop esi                 ; Restore fb index
    pop ecx                 ; Restore loop

    ; ============================================================
    ; 5. NEW: CHECK COLLISION WITH KOOPAS
    ; ============================================================
    push ecx                ; Save outer fireball loop
    push esi                ; Save fireball index

    mov ecx, MAXKoopas
    mov edi, 0              ; Koopa Index (Using EDI for loop index)

checkKoopaHit:
    ; Check if Koopa is Dead (0)
    cmp koopaState[edi], 0
    je nextKoopaTarget

    ; Check X collision
    mov al, fbX[esi]
    cmp al, koopaX[edi]
    jne nextKoopaTarget

    ; Check Y collision
    mov al, fbY[esi]
    cmp al, koopaY[edi]
    jne nextKoopaTarget

    
    ; 1. Kill the Koopa (Set State to 0)
    mov koopaState[edi], 0

    ; 2. Erase Koopa Visual Immediately
    push eax
    push edx
    mov dl, koopaX[edi]
    mov dh, koopaY[edi]
    call Gotoxy
    mov eax, Black + (Black * 16)
    call SetTextColor
    mov al, ' '
    call WriteChar
    pop edx
    pop eax

    ; 3. Add Score and Play Sound
    add score, 2
    call PlayShellKickSound ; Use shell kick sound for impact

    ; 4. Kill the Fireball
    pop esi                 ; Restore fb index
    pop ecx                 ; Restore loop
    jmp killFireball        ; Deactivate fireball

nextKoopaTarget:
    inc edi
    loop checkKoopaHit

    pop esi                 ; Restore fb index
    pop ecx                 ; Restore loop


    ; 6. Draw New Position (If no collision occurred)
    mov dl, fbX[esi]
    mov dh, fbY[esi]
    call Gotoxy
    mov eax, Blue + (Black * 16) ; BLUE COLOR
    call SetTextColor
    mov al, '*'             ; STAR CHARACTER
    call WriteChar
    
    jmp nextFireball

killFireball:
    mov fbActive[esi], 'f'  ; Deactivate

nextFireball:
    inc esi
    dec ecx
    cmp ecx, 0
    jne updateLoop

    ; Restore text color
    mov eax, White + (Black * 16)
    call SetTextColor

    popad
    ret
UpdateFireballs ENDP

ResetKoopas PROC
    pushad
    ; Reset Positions
    mov esi, OFFSET BASE_koopaX
    mov edi, OFFSET koopaX
    mov ecx, MAXKoopas
    rep movsb
    
    mov esi, OFFSET BASE_koopaY
    mov edi, OFFSET koopaY
    mov ecx, MAXKoopas
    rep movsb

    ; Reset States to 1 (Normal)
    mov ecx, MAXKoopas
    mov esi, OFFSET koopaState
resetKLoop:
    mov BYTE PTR [esi], 1
    inc esi
    loop resetKLoop
    
    popad
    ret
ResetKoopas ENDP
DrawKoopas PROC
    pushad
    
    mov ecx, MAXKoopas
    mov esi, OFFSET koopaX
    mov edi, OFFSET koopaY
    mov ebx, OFFSET koopaState
    
drawKLoop:
    ; Check if dead (0)
    cmp BYTE PTR [ebx], 0
    je skipDrawKoopa
    
    ; Move cursor
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    
    ; Check State
    cmp BYTE PTR [ebx], 1
    je drawNormal
    
    ; Draw Shell (State 2 or 3)
    mov eax, Green + (Black * 16)
    call SetTextColor
    mov al, shellChar ; 'O'
    call WriteChar
    jmp skipDrawKoopa

drawNormal:
    mov eax, LightGreen + (Black * 16)
    call SetTextColor
    mov al, koopaChar ; 'K'
    call WriteChar
    
skipDrawKoopa:
    inc esi ; Next X
    inc edi ; Next Y
    inc ebx ; Next State
    loop drawKLoop
    
    ; Restore White Color
    mov eax, White + (Black * 16)
    call SetTextColor
    
    popad
    ret
DrawKoopas ENDP

MoveKoopas PROC
    pushad
    
    mov ecx, MAXKoopas
    mov esi, OFFSET koopaX
    mov edi, OFFSET koopaY
    mov ebx, OFFSET koopaDirection
    mov edx, OFFSET koopaState
    
koopaMoveLoop:
    ; 1. Check State
    mov al, [edx]
    cmp al, 0          
    je nextKoopaMove
    cmp al, 2           ; Stationary Shell?
    je nextKoopaMove    ; Don't move if stationary shell

    ; 2. Erase Old Position
    push eax
    push edx
    mov dl, [esi]
    mov dh, [edi]
    call Gotoxy
    mov eax, Black + (Black * 16)
    call SetTextColor
    mov al, ' '
    call WriteChar
    pop edx
    pop eax

    ; 3. Movement Logic (Left/Right)
    mov al, [ebx]       ; Get Direction
    cmp al, 1
    je kMoveRight
    
    ; Move Left
    mov al, [esi]
    cmp al, 0           ; Screen bound
    je kReverse
    dec BYTE PTR [esi]
    jmp kDraw
    
kMoveRight:
    mov al, [esi]
    cmp al, 119         ; Screen bound
    je kReverse
    inc BYTE PTR [esi]
    jmp kDraw
    
kReverse:
    xor BYTE PTR [ebx], 1 ; Flip direction
    jmp kDraw ; Just draw at same spot this frame
    
kDraw:


nextKoopaMove:
    inc esi
    inc edi
    inc ebx
    inc edx
    loop koopaMoveLoop
    
    popad
    ret
MoveKoopas ENDP

CheckKoopaCollision PROC
    pushad
    
    mov ecx, MAXKoopas
    mov esi, OFFSET koopaX
    mov edi, OFFSET koopaY
    mov ebx, OFFSET koopaState
    mov edx, OFFSET koopaDirection 
    
checkKColLoop:
    cmp BYTE PTR [ebx], 0 ; Dead?
    je nextKCol
    
    ; Check X
    mov al, [esi]
    cmp al, xPos
    jne nextKCol
    
    ; Check Y
    mov al, [edi]
    cmp al, yPos
    jne checkKStomp
    
    ; --- DIRECT HIT (Side) ---
    cmp BYTE PTR [ebx], 2  ; Is it a stationary shell?
    je kickShell
    
    ; If Normal (1) or Moving Shell (3) -> Hurt Player
    cmp isSuper, 1
    je koopaPowerDown
    
    popad
    jmp pitfall ; Die
    
koopaPowerDown:
    mov isSuper, 0
    mov BYTE PTR [ebx], 0 ; Kill Koopa to prevent instant death loop
    jmp nextKCol

kickShell:
    ; Kick logic: Set state to 3 (Moving)
    mov BYTE PTR [ebx], 3
    call PlayShellKickSound
    
   
    xor BYTE PTR [edx], 1 
    
    ; Move shell 1 step away immediately to avoid re-collision
    jmp nextKCol

checkKStomp:
    ; Check if Player is 1 unit above (yPos == koopaY - 1)
    mov al, yPos
    inc al
    cmp al, [edi]
    jne nextKCol
    
    
    ; If Normal -> Become Shell
    cmp BYTE PTR [ebx], 1
    jne checkShellStop
    
    mov BYTE PTR [ebx], 2  ; Become Shell
    add score, 2
    
    ; visual bounce (optional)
    dec yPos 
    jmp nextKCol
    
checkShellStop:
    ; If Moving Shell -> Stop
    cmp BYTE PTR [ebx], 3
    jne nextKCol
    mov BYTE PTR [ebx], 2 ; Stop
    dec yPos
    
nextKCol:
    inc esi
    inc edi
    inc ebx
    inc edx
    loop checkKColLoop

    popad
    ret
CheckKoopaCollision ENDP


; =======================================================
; PlaySoundSequence PROC
; Generic procedure to play a sequence of tones
; Receives: ESI = Pointer to frequency array
;           EDI = Pointer to duration array
;           ECX = Number of notes
; =======================================================

PlaySoundSequence PROC
    pushad
    
    ; Check if sound is enabled
    cmp soundEnabled, 0
    je exitSeq
    
    mov ebx, 0              ; Index counter
    
playNextNote:
    cmp ebx, ecx
    jge exitSeq
    
    ; Get frequency at index EBX
    mov eax, [esi + ebx*4]  ; Frequency (DWORD = 4 bytes)
    
    ; Get duration at index EBX
    mov edx, [edi + ebx*4]  ; Duration (DWORD = 4 bytes)
    
    ; Check if it's a rest (frequency = 0)
    cmp eax, 0
    je playRest
    
    ; Play the note
    push ecx
    push edx
    push esi
    push edi
    INVOKE Beep, eax, edx
    pop edi
    pop esi
    pop edx
    pop ecx
    jmp nextNote
    
playRest:
    ; For rest, just delay without beep
    push ecx
    push eax
    mov eax, edx
    call Delay
    pop eax
    pop ecx
    
nextNote:
    inc ebx
    jmp playNextNote
    
exitSeq:
    popad
    ret
PlaySoundSequence ENDP

; ========================================
; ESSENTIAL SOUND EFFECTS
; ========================================

PlayJumpSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET jumpSoundFreqs
    mov edi, OFFSET jumpSoundDurs
    mov ecx, jumpSoundCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayJumpSound ENDP

; --- Coin Sound ---
PlayCoinSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET coinSoundFreqs
    mov edi, OFFSET coinSoundDurs
    mov ecx, coinSoundCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayCoinSound ENDP

; --- Stomp Sound ---
PlayStompSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET stompSoundFreqs
    mov edi, OFFSET stompSoundDurs
    mov ecx, stompSoundCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayStompSound ENDP

; --- Power-Up Sound ---
PlayPowerUpSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET powerUpFreqs
    mov edi, OFFSET powerUpDurs
    mov ecx, powerUpCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayPowerUpSound ENDP

; --- Extra Life Sound ---
PlayExtraLifeSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET lifeUpFreqs
    mov edi, OFFSET lifeUpDurs
    mov ecx, lifeUpCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayExtraLifeSound ENDP

; --- Death Sound ---
PlayDeathSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET deathSoundFreqs
    mov edi, OFFSET deathSoundDurs
    mov ecx, deathSoundCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayDeathSound ENDP

; --- Time Warning Sound ---
PlayTimeWarningSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET timeWarnFreqs
    mov edi, OFFSET timeWarnDurs
    mov ecx, timeWarnCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayTimeWarningSound ENDP

; ========================================
; BACKGROUND MUSIC
; ========================================

; --- Overworld Theme ---
PlayOverworldMusic PROC
    push esi
    push edi
    push ecx
    
    cmp musicEnabled, 0
    je skipMusic
    
    mov esi, OFFSET overworldFreqs
    mov edi, OFFSET overworldDurs
    mov ecx, overworldCount
    call PlaySoundSequence
    
skipMusic:
    pop ecx
    pop edi
    pop esi
    ret
PlayOverworldMusic ENDP

; --- Underground Theme ---
PlayUndergroundMusic PROC
    push esi
    push edi
    push ecx
    
    cmp musicEnabled, 0
    je skipMusic2
    
    mov esi, OFFSET undergroundFreqs
    mov edi, OFFSET undergroundDurs
    mov ecx, undergroundCount
    call PlaySoundSequence
    
skipMusic2:
    pop ecx
    pop edi
    pop esi
    ret
PlayUndergroundMusic ENDP

; --- Castle Theme ---
PlayCastleMusic PROC
    push esi
    push edi
    push ecx
    
    cmp musicEnabled, 0
    je skipMusic3
    
    mov esi, OFFSET castleFreqs
    mov edi, OFFSET castleDurs
    mov ecx, castleCount
    call PlaySoundSequence
    
skipMusic3:
    pop ecx
    pop edi
    pop esi
    ret
PlayCastleMusic ENDP

; --- Victory Music ---
PlayVictoryMusic PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET victoryFreqs
    mov edi, OFFSET victoryDurs
    mov ecx, victoryCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayVictoryMusic ENDP

; --- Game Over Music ---
PlayGameOverMusic PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET gameOverFreqs
    mov edi, OFFSET gameOverDurs
    mov ecx, gameOverCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayGameOverMusic ENDP

; ========================================
; INTERACTIVE AUDIO
; ========================================

; --- Shell Kick ---
PlayShellKickSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET shellKickFreqs
    mov edi, OFFSET shellKickDurs
    mov ecx, shellKickCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayShellKickSound ENDP

; --- Block Break ---
PlayBlockBreakSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET blockBreakFreqs
    mov edi, OFFSET blockBreakDurs
    mov ecx, blockBreakCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayBlockBreakSound ENDP

; --- Flagpole Slide ---
PlayFlagpoleSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET flagpoleFreqs
    mov edi, OFFSET flagpoleDurs
    mov ecx, flagpoleCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayFlagpoleSound ENDP

; --- Pause Sound ---
PlayPauseSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET pauseSoundFreqs
    mov edi, OFFSET pauseSoundDurs
    mov ecx, pauseSoundCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayPauseSound ENDP

; --- Fireball Sound ---
PlayFireballSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET fireballFreqs
    mov edi, OFFSET fireballDurs
    mov ecx, fireballCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayFireballSound ENDP

; --- 1-Up Sound ---
PlayOneUpSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET oneUpFreqs
    mov edi, OFFSET oneUpDurs
    mov ecx, oneUpCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayOneUpSound ENDP

; --- Pipe Warp Sound ---
PlayPipeWarpSound PROC
    push esi
    push edi
    push ecx
    
    mov esi, OFFSET pipeWarpFreqs
    mov edi, OFFSET pipeWarpDurs
    mov ecx, pipeWarpCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayPipeWarpSound ENDP

; =======================================================
; PlayLevelMusic PROC
; Plays appropriate music based on current level
; =======================================================
PlayLevelMusic PROC
    push eax
    
    mov al, currentLevel
    cmp al, 1
    je playLevel1Music
    
    cmp al, 2
    je playLevel2Music
    
    cmp al, 3
    je playLevel3Music
    
    jmp exitLevelMusic
    
playLevel1Music:
    call PlayOverworldMusic
    jmp exitLevelMusic
    
playLevel2Music:
    call PlayUndergroundMusic
    jmp exitLevelMusic
    
playLevel3Music:
    call PlayCastleMusic
    
exitLevelMusic:
    pop eax
    ret
PlayLevelMusic ENDP

; =======================================================
; PlayTimeUpSound PROC
; Plays when collecting time bonus
; =======================================================
PlayTimeUpSound PROC
    push esi
    push edi
    push ecx
    
    ; Reuse coin sound with different pitch
    mov esi, OFFSET coinSoundFreqs
    mov edi, OFFSET coinSoundDurs
    mov ecx, coinSoundCount
    call PlaySoundSequence
    
    pop ecx
    pop edi
    pop esi
    ret
PlayTimeUpSound ENDP

; =======================================================
; PlayLevelCompleteSound PROC
; Wrapper for victory music
; =======================================================
PlayLevelCompleteSound PROC
    call PlayVictoryMusic
    ret
PlayLevelCompleteSound ENDP


END main
