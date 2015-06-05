#sum = $s0
#first = $s1
#second = $s2
#n = $s3

.text
main:       li $a0, 45              # n = ?

fib:        li $s0, 0               # initial load first
            li $s1, 1               # initial load second
            li $s2, 0               # initial load sum

fib_loop:   sltiu $t0, $a0, 1       # set $t0 = n <= 1
            subi $a0, $a0, 1        # decrement n by 1
            add $s0, $s1, $s2       # sum = first + second
            add $s1, $s2, $zero     # first = second
            add $s2, $s0, $zero     # second = sum
            beqz $t0, fib_loop      # if n > 1 then loop

exit:       li $v0, 1
            add $a0, $s0, $zero     # update sum
            syscall
