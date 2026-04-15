; --- RED WALL ---

    CPX player1_object
    BEQ Red_Player
    JMP Red_NotPlayer

Red_Player:

    ; instant death → lose screen (X=1, Y=14)

    LDA continueMap
    STA warpMap

    LDA #$E1
    STA currentNametable

    AND #%00001111
    STA camX_hi

    LDX player1_object
    STA Object_screen,x

    LDA #$02
    STA screenTransitionType

    LDA #$00
    STA camX
    STA camX_lo

    LDA updateScreenData
    AND #%11111011
    STA updateScreenData

    LDA scrollByte
    AND #%00111110
    ORA #%00000010
    STA scrollByte

    LDA #$00
    STA scrollOffsetCounter

    LDA gameHandler
    ORA #%10000000
    STA gameHandler

    JMP Red_Done


Red_NotPlayer:

    LDA Object_flags,x
    AND #%00000100
    BEQ Red_Done

        ; ONLY destroy if player is RED
        LDA playerColor
        CMP #$01
        BNE Red_Done

        DestroyObject
        DEC bossHealth

        LDA bossHealth
        BNE Red_Done

            LDA #$05
            STA bossByte
            LDA #$05
            STA bossHealth

Red_Done: