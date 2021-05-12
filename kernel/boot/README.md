# Documentation about the boot.asm(aka bootloader)

## Bootloader Memory Map
```
+---------------+  <--  07C0:0000, here is the starting address of our 512B bootloader
|      512B		|
|   bootloader  |
+---------------+
| 				|
| 				|
|	  4096B     |
| reserved area |
|				|
|				|
+---------------+  <-- (07C0+288):0000, ss holds the value of (07C0+288)h
| 				|
| 				|
|	  4096B     |
| 	  Stack     |
|				|
|				|
+---------------+  <-- ss:sp points to this address. Now sp holds the value of 4096.
```