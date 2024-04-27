/*Author - Wing Hoy. Last edited on Jan 14, 2022 */
/*-----------------DO NOT MODIFY--------*/
.global TestAsmCall
.global printf
.global cr
.syntax unified

.text
TestAsmCall:
PUSH {lr}
/*--------------------------------------*/

/*-------Students write their code here ------------*/
.equ Memreader, 0x20001000
.equ Memwriter, 0x20002000

ldr r1, = Memreader
ldr r3, = Memwriter


mov r4,#100


Starter:

ldr r2,[r1]

cmp r2,#0x0D

beq FINISH

b CONTINUE


CONTINUE:

cmp r2,#0x30

blo ERROR

b FIRSTLEVEL




FIRSTLEVEL:

cmp r2,#0x3A

blo DIGITS

b SECONDLEVEL


DIGITS:

sub r2,r2,#0x30

b WRITE



SECONDLEVEL:

cmp r2,#0x41

blo ERROR

b THIRDLEVEL



THIRDLEVEL:

cmp r2,#0x47

blo UPPERCASE

b FOURTHLEVEL


UPPERCASE:

sub r2,r2,#0x37

b WRITE



FOURTHLEVEL:

cmp r2,#0x61

blo ERROR

b FINALLEVEL



FINALLEVEL:

cmp r2,#0x67

blo LOWERCASE

b ERROR



LOWERCASE:

sub r2,r2,#0x57

b WRITE


WRITE:

str r2,[r3]

add r1,#0x4

add r3,#0x4

sub r4,#1

cmp r4,#0

beq FINISH

b Starter



ERROR:

ldr r5,=#0xFFFFFFFF

str r5,[r3]

add r1,#0x4

add r3,#0x4

sub r4,#1

cmp r4,#0

b Starter


FINISH:


























/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
/*--------------------------------------*/
