```
main:
    puti ($r0), 0x0001
    puti ($r1), 0x0001
loop:
    add ($r0), $r0, $r1
    j loop
```
