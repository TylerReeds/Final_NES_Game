;;;; Shoot monster projectile


;;; Specify the game object number
;;; for the monster projectile.

OBJ_MONSTER_PROJECTILE = 3


CountObjects #%00010000 ;;; Monster weapon
CMP #3 ;;; Monster weapon limit
BCC +canShoot
    JMP +canNotShoot
+canShoot:
    
    LDA Object_x_hi,x
    CLC
    ADC #4 ;;; X offset
    STA tempA
 
    LDA Object_screen,x
    ADC #0
    STA tempD
   
    LDA Object_y_hi,x
    CLC
    ADC #4 ;;; Y offset
    STA tempB
 
    LDA Object_direction,x
    AND #%00000111
    STA tempC
  
    TXA
    PHA
    ;;; OBJ_MONSTER_PROJECTILE is a constant. You can replace this
    ;;; with the game object number for the monster projectile or
    ;;; change the number specified at the top of this script.
    CreateObjectOnScreen tempA, tempB, #OBJ_MONSTER_PROJECTILE, #0, tempD
    ;; arg0 = x
    ;; arg1 = y
    ;; arg2 = object
    ;; arg3 = beginning state
    ;; arg4 = object screen
  
    STX temp ;;; Store the new projectile object in temp
  
    LDA tempC
    CMP #FACE_RIGHT
    BEQ +shootRight
        LDA #LEFT
        STA temp1
        LDA #FACE_LEFT
        STA temp2
        JMP +moveProjectile
    +shootRight:
        LDA #RIGHT
        STA temp1
        LDA #FACE_RIGHT
        STA temp2
  
    +moveProjectile:
        StartMoving temp, temp1
      
        STX temp
        ChangeFacingDirection temp, temp2
  
    PLA
    TAX
  
+canNotShoot: