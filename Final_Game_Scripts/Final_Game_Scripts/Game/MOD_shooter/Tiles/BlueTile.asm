; --- BLUE WALL ---

    CPX player1_object
    BEQ Blue_Player
    JMP Blue_NotPlayer

Blue_Player:

    ; instant death → lose screen

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

    JMP Blue_Done


Blue_NotPlayer:

    LDA Object_flags,x
    AND #%00000100
    BEQ Blue_Done

        ; ONLY destroy if player is BLUE
        LDA playerColor
        CMP #$02
        BNE Blue_Done

        DestroyObject
        DEC bossHealth

        LDA bossHealth
        BNE Blue_Done

            LDA #$07
            STA bossByte
            LDA #$05
            STA bossHealth

Blue_Done: