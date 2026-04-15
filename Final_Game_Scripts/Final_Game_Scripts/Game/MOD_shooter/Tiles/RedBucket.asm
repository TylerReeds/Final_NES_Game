CPX player1_object
BEQ RedBucket_IsPlayer
JMP RedBucket_Done

RedBucket_IsPlayer:
    LDA playerColor
    CMP #$00
    BNE RedBucket_Done

    LDA #$01
    STA playerColor
    STA playerPalette

RedBucket_Done: