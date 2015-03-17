Instructions
--

named registers | description
--- | ---
$0 | constant value 0
$r0-$r7 | Work registers
$imm | private, immediate register
$rd | doc, destination register
$rs | doc, source register
$rt | doc, second source register

control lines | # | description
--- | --- | ---
ssel | 0 | 0=RF$sval 1=$imm
tsel | 1 | 0=RV$tval 1=CONST(0)
cin | 2 |
sinv | 3 |
tinv | 4 |
aop x4 | 5-8 | 0=XOR 1=OR 2=AND 3=SLL 4=SRL 5=ADD 6=LT 7=EQ 8=GT
dset | 9 |
fset | 10 |
iset | 11 |
fetch | 12 |
pcload | 13 |
pcop x2 | 14-15 | 0=pc+1 1=pc+addr 2=addr
write | 16 |
dsel x2 | 17-18 | 0=$imm, 1=@pc 2=ALU$dval
timm | 19 | unused

control instructions | inst | lines | hex | description
--- | --- | --- | --- | ---
00 | fet | fetch=1 pcload=1 | 3000 | fetch the instruction `@pc`
01 | ldi | iset=1 pcload=1 | 2800 | load the data `@pc` in `$imm`
02 | adi ($rd), $rs | ssel=1 aop=5 fetch=1 pcload=1 | 30A1 | `$rd = $rs + $imm`
