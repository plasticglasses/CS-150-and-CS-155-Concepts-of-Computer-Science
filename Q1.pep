;Q1

;these lines input two numbers
start:   STRO msg, d 
         DECI numOne, d

;This is the decision if the player wants to play
;if zero was entered then end the game
         BREQ end 

;These lines find and outputs the sum of the two integers
         DECI numTwo, d 
         LDA numTwo, d
         ADDA numOne, d
         STA sum, d 
         STRO sumMsg, d
         DECO sum, d

;These lines finds and outputs the difference between the two numbers 
         LDA numOne, d
         SUBA numTwo, d
         STA diff , d
         STRO diffMsg, d
         DECO diff, d

;This branches to the start of the program
         BR start

;This outputs the end message
end:     STRO msg1, d 
   
STOP

msg:      .ASCII  "\nInput two numbers, or input 0 to terminate.\x00"
msg1:     .ASCII "Goodbye!\x00"
sumMsg: .ASCII "The sum is: \x00"
diffMsg: .ASCII "\nThe difference is: \x00"
numOne:   .BLOCK 2           ;stores the first integer
numTwo:   .BLOCK 2           ;stores the second integer
sum:      .BLOCK 2           ;stores the sum of the two integers
diff:    .BLOCK 2            ;stores the difference between the two integers

.END