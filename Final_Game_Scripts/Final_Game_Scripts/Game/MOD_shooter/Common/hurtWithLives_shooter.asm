	LDA gameHandler
	AND #%10000000
	BEQ +canHurtPlayer
		JMP +skipHurt
+canHurtPlayer:

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

+skipHurt