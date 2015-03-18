Instructions
--

instruction format | 15-13 | 12-10 | 9-7 | 6-0 | description
--- | --- | --- | --- | --- | ---
type 0 |  |  |  |  | immediate
type 1 | treg | sreg | dreg | opcode | control instruction

named registers | description
--- | ---
$r0-$r7 | Work registers
$pc | hidden, progam counter
$imm | hidden, immediate register
$rd | doc, destination register
$rs | doc, source register
$rt | doc, second source register

control lines | # | description
--- | --- | ---
ssel | 0 | 0=RF$sval 1=$imm
tsel | 1 | 0=RV$tval 1=$pc
cin | 2 |
sinv | 3 |
tinv | 4 |
aop x4 | 5-8 | 0=XOR 1=OR 2=AND 3=SLL 4=SRL 5=ADD 6=LT 7=EQ 8=GT
dset | 9 |
fset | 10 |
iset | 11 |
fetch | 12 |
pcload | 13 |
pcop x2 | 14-15 | 0=pc+1 1=pc+addr 2=wb 3=$pc
write | 16 |
dsel x2 | 17-18 | 0=$imm, 1=$pc 2=ALU$dval
timm | 19 | unused

opcode | control instruction | control lines | control hex | description
--- | --- | --- | --- | ---
00 | _nop | fetch=1 pcload=1 | 3000 | do nothing
01 | _li | iset=1 pcload=1 | 2800 | load the immediate `$pc` in `$imm` (see note 1)
02 | _adi ($rd), $rs | ssel=1 aop=5 fetch=1 pcload=1 dsel=2 dset=1 | 432A1 | `$rd = $rs + $imm`
03 | _add ($rd), $rs, $rt | aop=5 fetch=1 pcload=1 dsel=2 dset=1 | 432A0 | `$rd = $rs + $rt`
04 | _l ($rd) | pcload=1 dsel=1 dset=1 | 22200 | load the immediate `$pc` in `$rd`
05 | _ji | fetch=1 pcload=1 pcop=2 | B000 | jump to `$imm`

instruction | control instructions | footprint | description
--- | --- | --- | ---
addi ($rd), $rs, imm | _li; _adi ($rd), $rs | {type1, type0, type1} | `$rd = $rs + imm`
add ($rd), $rs, $rt | _add ($rd), $rs, $rt | {type1} | `$rd = $rs + $rt`
puti ($rd) imm | _l ($rd) | {type1, type0} | `$rd = imm`
j imm | _li; _ji | {type1, type0, type1} | `pc = $imm`

Notes
--
1. Instructions using an immediate could have an additionnal variant that use `@pc` directly with `tsel=1 fetch=0` and a footprint of `{type1, type0}` instead of using an additionnal instruction to load the immediate in the immediate register. However, if multiple consecutive instructions were to use the same immediate, storing it in the immediate register would reduce the memory footprint of the program.
