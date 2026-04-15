checkSelection:
    TXA
    STA tempx

    LDA gamepad
    AND #%00110100          ; Up / Down / A
    BNE continueCheckingSelection
    JMP endCheckingSelection



continueCheckingSelection:

    LDA gamepad
    AND #%00010000          ; UP
    BNE selectionUp

    LDA gamepad
    AND #%00100000          ; DOWN
    BNE selectionDown

    LDA gamepad
    AND #%00000100          ; A
    BNE selectionConfirm

    JMP endCheckingSelection



; UP
selectionUp:
    LDA curSelection
    BNE +
    LDA #SELECTION_MAX_VALUE
    STA curSelection
    JMP endCheckingSelection
+
    DEC curSelection
    JMP endCheckingSelection



; DOWN
selectionDown:
    LDA curSelection
    CMP #SELECTION_MAX_VALUE
    BNE +
    LDA #$00
    STA curSelection
    JMP endCheckingSelection
+
    INC curSelection
    JMP endCheckingSelection


; CONFIRM
selectionConfirm:
    JMP endCheckingSelection



endCheckingSelection:
    LDX tempx
    RTS
