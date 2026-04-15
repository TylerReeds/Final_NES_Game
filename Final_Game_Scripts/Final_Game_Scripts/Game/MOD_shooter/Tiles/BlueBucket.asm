CPX player1_object
BEQ BlueBucket_IsPlayer
JMP BlueBucket_Done

BlueBucket_IsPlayer:
    LDA playerColor
    CMP #$00
    BNE BlueBucket_Done

    LDA #$02
    STA playerColor
    STA playerPalette

BlueBucket_Done: