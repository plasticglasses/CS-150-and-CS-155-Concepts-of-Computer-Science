;Q2

;The next few lines input an integer and check if it is zero
;if it is zero, the program ends
         STRO input, d
         DECI int, d
         BREQ end 

;If the number is one, the game is over so branch to the end
start:   LDA int, d
         SUBA 0x01, i
         BREQ end

;Check if the number is odd
;by using an AND gate between the binary value of the integer and 1
;if it returns the value 1, then the number is odd
;if it returns zero then the number is even
;if the number is even it branches
;if the number is odd then the code does not branch

         LDA int, d
         STRO line, d
         DECO int, d
         ANDA 1, i
         STA msb,d
         BREQ even

;the number is odd, so it does not branch
;perform odd number calculation ((3 x int) + 1) and loop to the begining
         LDA int, d
         STA sum, d
         ADDA int, d
         ADDA int, d
         ADDA 0x01, i
         STA int, d
         BR start

;the branch for an even number
;if the number is even, divide it by 2 (by performing right arithmetic shift) and loop to the start
even:    LDA int, d
         ASRA
         STA int, d
         BR  start 
          
;this printds a new line, outputs the final value, says goodbye and stops
end:     STRO line, d
         DECO int, d   
         STRO bye, d

         STOP

line:    .ASCII "\n\x00"     ;new line
bye:   .ASCII "\n\nGoodbye!\x00"
int:   .BLOCK 2  ;users initial input
input: .ASCII "Please input a number: "
msb:   .BLOCK 2 ;Most Significant Bit
sum:   .BLOCK 2  ;stores the sum after the odd calculations

         .END