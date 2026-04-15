; --- YELLOW WALL ---

    CPX player1_object
    BEQ Yellow_Player
    JMP Yellow_NotPlayer

Yellow_Player:

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

    JMP Yellow_Done


Yellow_NotPlayer:

    LDA Object_flags,x
    AND #%00000100
    BEQ Yellow_Done

        ; ONLY destroy if player is YELLOW
        LDA playerColor
        CMP #$03
        BNE Yellow_Done

        DestroyObject
        DEC bossHealth

        LDA bossHealth
        BNE Yellow_Done

            LDA #$06
            STA bossByte
            LDA #$05
            STA bossHealth

Yellow_Done: