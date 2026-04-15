;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EXTRA LOAD – SPAWN PLAYER
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

spawnPlayer:

    TXA
    PHA

    LDX player1_object

    LDA Object_x_hi,x
    STA tempA

    LDA Object_y_hi,x
    STA tempB

    LDA Object_direction,x
    STA tempC

    DestroyObject


;; -------- pick character ----------
    LDA charSelect
    BEQ spawnMax

spawnAnne:
    CreateObject tempA, tempB, #$01, #$00
    JMP finish

spawnMax:
    CreateObject tempA, tempB, #$00, #$00


finish:
    TXA
    STA player1_object
    STA camObject

    LDA tempC
    STA Object_direction,x


;; palettes
    LoadObjectSubPalettes charSelect, #$00

    PLA
    TAX
    RTS
