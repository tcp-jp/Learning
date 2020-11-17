; ** How to make a System Call **
; To make a syscall, put the syscall number in the EAX register
; Store the arguments to the system call in the registers EBX, ECX, etc...
; Call the relevant interupt (80h)
; The end result is usually returned in the EAX register

; ** Registers **
; There are six registers that store the arguments of the system call used. 
; EBX, ECX, EDX, ESI, EDI and the EBP. 
; These registers take the consecutive arguments, starting with the EBX register
; If more than six arguments are required, then the memory location of the first argument is stored in the EBX
; register

; Example SysCalls
; %EAX |   Name    |     %EBX       |    %ECX      |  %EDX  | %esx | %edi
;   1  | sys_exit  | int            | -            | -      |  -   |  - 
;   2  | sys_fork  | struct pt_regs | -            | -      |  -   |  - 
;   3  | sys_read  | unsigned int   | char *       | size_t |  -   |  -   
;   4  | sys_write | unsigned int   | const char * | size_t |  -   |  - 
;   5  | sys_open  | const char *   | int          | int    |  -   |  - 
;   6  | sys_close | unsigned int   |  -           | -      |  -   |  - 

; 3 Standard POSIX File Descriptors
; 0 | stdin 
; 1 | stdout
; 2 | stderr

; ** Examples **
; sys_exit 
; mov eax,1 ; 1 is the system call for sys_exit
; int 0x80  ; call interupt (0x80 for kernel)

; sys_write
; mov eax,4 ; syscall number for sys_write
; mov ebx,1 ; file descriptor (stdout)
; mov ecx,msg ; text to write
; mov edx,4 ; text length
; int 0x80 ; call interupt (0x80 for kernel)

; ====

section .data 
  userMsg db 'Please enter the text you want to print : ' 
  lenUserMsg equ $-userMsg
  nl db 0xA
  lenl equ $-nl

section .bss 
  string resb 5

section .text
  global _start

_start:
  ; Print userMsg variable to screen
  mov eax,4  ; sys_write
  mov ebx,1  ; file descriptor (stdout)
  mov ecx,userMsg ; string to print
  mov edx,lenUserMsg ; length of string being printed
  int 0x80 ; call interupt (kernel)

  ; read and store input
  mov eax,3  ; sys_read
  mov ebx,1  ; file descriptor (stdin)
  mov ecx,string
  mov edx,5
  int 0x80
  pop rcx

  ; print input
  mov eax,4
  mov ebx,1
  mov ecx,string
  mov edx,8
  int 0x80
  pop rcx
  jmp _start


