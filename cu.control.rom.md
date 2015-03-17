Instructions
--

lines | # | description
--- | --- | ---
ssel | 0 | 0=RF$sval 1=$imm
tsel | 1 | 0=RV$tval 1=CONST(0)
cin | 2 |
sinv | 3 |
tinv | 4 |
aop x4 | 5-8 |
dset | 9 |
fset | 10 |
iset | 11 |
fetch | 12 |
pcload | 13 |
pcop x2 | 14-15 | 0=pc+1 1=pc+addr 2=addr
write | 16 |
dsel x2 | 17-18 | 0=$imm, 1=@pc 2=ALU$dval

cui# | inst | lines | description
--- | --- | --- | --- 
00 | fet | fetch=1 pcload=1 | fetch the instruction `@pc`
01 | ldi | iset=1 pcload=1 | load the data `@pc` in `$imm`
02 | adi | ssel=1 
