; _CLOSE.ASM--
;
; Copyright (c) The Asmc Contributors. All rights reserved.
; Consult your license regarding permissions and restrictions.
;

include io.inc
include errno.inc
include stdlib.inc
include winbase.inc

    .code

_close proc frame handle:int_t

    lea rax,_osfile
    .if ecx < 3 || ecx >= _nfile || !(byte ptr [rax+rcx] & FH_OPEN)

        _set_errno(EBADF)
        _set_doserrno(0)
        xor eax,eax
    .else

        mov byte ptr [rax+rcx],0
        lea rax,_osfhnd
        mov rcx,[rax+rcx*8]

        .ifd !CloseHandle(rcx)

            _dosmaperr(GetLastError())
        .else
            xor eax,eax
        .endif
    .endif
    ret

_close endp

    end
