CPX player1_object
BEQ WhiteBucket_IsPlayer
JMP WhiteBucket_Done

WhiteBucket_IsPlayer:
    LDA #$00
    STA playerColor
    STA playerPalette

WhiteBucket_Done: