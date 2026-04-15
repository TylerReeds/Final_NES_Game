; --- ORANGE TILE ---

    CPX player1_object
    BEQ +isPlayer1
    JMP +notPlayer1

+isPlayer1:
    DEC myLives
    LDA myLives
    BNE +respawn

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
        
        JMP +done

+respawn:
    LDA continueMap
    STA warpMap
    
    LDA continueScreen
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
    
    LDA #$05
    STA bossHealth

    JMP +done

+notPlayer1:
    LDA Object_flags,x
    AND #%00000100
    BEQ +done
    
        DestroyObject
        DEC bossHealth
        
        LDA bossHealth
        BNE +done
        
            LDA #$0A
            STA bossByte

            LDA #$05
            STA bossHealth

+done: