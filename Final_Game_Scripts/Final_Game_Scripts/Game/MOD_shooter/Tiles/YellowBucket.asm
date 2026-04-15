CPX player1_object
BEQ YellowBucket_IsPlayer
JMP YellowBucket_Done

YellowBucket_IsPlayer:
    LDA playerColor
    CMP #$00
    BNE YellowBucket_Done

    LDA #$03
    STA playerColor
    STA playerPalette

YellowBucket_Done: