load_addr = $1000
run_addr  = $1000


        org load_addr

start     

        lda #$c0 
        cmp $6a
        beq ramok
        sta $6a
        sta $2e4
            
        lda $d301
        ora #$02
        sta $d301
            
        lda $a000
        inc $a000
        cmp $a000
        beq ramnok
            
        lda #$01
        sta $3f8
        jmp ramok
          
ramnok  inc 712
        jmp ramnok
          
ramok          
        ldx 709
dec709  dex
        stx 709
        txa
        and #%00001111
        beq zero709
        jsr delay
        jmp dec709
zero709 lda #0
        sta 709
        jsr delay
        ldx 710
dec710  dex
        stx 710
        txa
        and #%00001111
        beq zero710
        jsr delay
        jmp dec710
zero710 lda #0
        sta 710
        lda #0
        sta $22f
        
        rts

delay   lda 20
        cmp 20
        beq *-2 
        lda 20
        cmp 20
        beq *-2
        rts
        
        ini start
        run run_addr