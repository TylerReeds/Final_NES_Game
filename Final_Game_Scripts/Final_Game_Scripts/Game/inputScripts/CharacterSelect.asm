;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CHARACTER SELECT UPDATE
;; Reuses difficulty cursor (curSelection)
;; 0 = Character 1
;; 1 = Character 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CS_Update:

    TXA
    STA tempx


    ;; any input?
    LDA gamepad
    AND #%00110100
    BEQ CS_End


;; ---------------- UP ----------------
    LDA gamepad
    AND #%00010000
    BEQ CS_Down

    DEC curSelection
    JMP CS_End


;; ---------------- DOWN ----------------
CS_Down:
    LDA gamepad
    AND #%00100000
    BEQ CS_Confirm

    INC curSelection
    JMP CS_End


;; ---------------- CONFIRM ----------------
CS_Confirm:
    LDA gamepad
    AND #%00000100
    BEQ CS_End

    ;; save which character was chosen
    LDA curSelection
    STA charSelect

    ;; start gameplay state
    LDA #$01
    STA gameState


CS_End:
    LDX tempx
    RTS
