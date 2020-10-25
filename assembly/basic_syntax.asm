; Learning Assembly : Basic Syntax
; ========================================================================================
; Comments are denoted by ';' and can be on a line alone or at the end of a line that runs
; ========================================================================================
; ========
; Sections
; ========
; Assembly files have 3 sections
;  * data, bss, text
; Sections are declared using 'section.'<sectiontype> (i.e. section.data)
; ========================================================================================
; ==========
; Statements
; ==========
; Assembly language consists of three statement types :
;   * Executable instructions (aka instructions)
;     * Tell processor what to do
;     * Each instruction consists of an operation code (opcode), i.e. 'mov'
;     * Each executable instruction generates one machine language instruction 
;   * Assembler directives (aka pseudo-ops)
;      Tells assembler about various aspects of assembly process
;     * Non-executable and do not generate machine language instructions
;   * Macros
;     * Text substitution mechanism
; ========================================================================================
; ================
; Statement Syntax
; ================
; One statement per line
; Format : [label] mnemonic [operands] [;comment]
; Fields in square brackets are optional
; An instruction has two parts 
;   * Name of the instruction (mnemonic) to be executed
;   * Operands (parameters) of the command
; Example Instruction
;   * mov edx,msg 
;   * mov [opcode] edx,msg [operands]

; Required 'Hello, World!' when starting a new language : 

section.data    ; used for declaring initialized data or constants
  ; Data does not change at runtime...
  ; Can declare various constant values, file names, buffer size etc...
msg db 'Hello, World!', 0xa     ; 'db' - data byte - define bite size variable and fill with a string
  ; Above assigns variable 'msg' to the data byte "Hello, World!"
  ; 0xa is a new line in assembly
len equ $ - msg     ; Length of variable 'msg'

section.text    ; Where the actual code is...
  global _start     ; This is required at the begining of the section - this is for the linked (ld)
    ; 'global _start' tells the kernel where program execution begins
_start:     ; This is where program execution begins...
  mov edx,len     ; string length 
    ; edx aka the data register. Also used in input/output. 
    ; Also used with EAX register along with EDX for multiply and divide operations involving large values 
  mov ecx,msg     ; string to write
    ; ecx aka the count register. Stores the loop count in iterative operations
  mov ebx,1       ; file descriptor (stdout)
    ; ebx aka the base register. Could be used in indexed addressing
  mov eax,4       ; system call number (sys_write)
    ; eax aka the primary accumulator. Used in input/output and most arithmetic operations
  int 0x80        ; call kernel and perform the above

  mov eax,1       ; system call number (sys_exit)
  int 0x80        ; call kernel and exit 



;section.bss ; used for declaring variables
