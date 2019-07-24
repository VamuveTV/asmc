; SETJMP.ASM--
;
; Copyright (c) The Asmc Contributors. All rights reserved.
; Consult your license regarding permissions and restrictions.
;
; int   __cdecl setjmp(jmp_buf);
; void  __cdecl longjmp(jmp_buf, int);
;
include setjmp.inc

    .code

    option win64:rsp noauto
    assume rcx:jmp_buf

setjmp proc buf:jmp_buf

    mov [rcx].J_RBP,rbp
    mov [rcx].J_RBX,rbx
    mov [rcx].J_RDI,rdi
    mov [rcx].J_RSI,rsi
    mov [rcx].J_R12,r12
    mov [rcx].J_R13,r13
    mov [rcx].J_R14,r14
    mov [rcx].J_R15,r15
    mov [rcx].J_RSP,rsp
    mov rax,[rsp]
    mov [rcx].J_RIP,rax
    xor rax,rax
    ret

setjmp endp

longjmp proc buf:jmp_buf, retval:int_t

    mov rbp,[rcx].J_RBP
    mov rbx,[rcx].J_RBX
    mov rdi,[rcx].J_RDI
    mov rsi,[rcx].J_RSI
    mov r12,[rcx].J_R12
    mov r13,[rcx].J_R13
    mov r14,[rcx].J_R14
    mov r15,[rcx].J_R15
    mov rsp,[rcx].J_RSP
    mov rax,[rcx].J_RIP
    mov [rsp],rax
    mov rax,rdx
    ret

longjmp endp

    end
