; _ALIGNED_MALLOC.ASM--
;
; Copyright (c) The Asmc Contributors. All rights reserved.
; Consult your license regarding permissions and restrictions.
;

include malloc.inc

    .code

_aligned_malloc proc dwSize:size_t, Alignment:UINT

    mov edx,Alignment
    mov eax,dwSize
    lea eax,[eax+edx+sizeof(HEAP)]

    .if malloc(eax)

        mov ecx,Alignment
        dec ecx
        .if eax & ecx

            lea edx,[eax-sizeof(HEAP)]
            lea eax,[eax+ecx+sizeof(HEAP)]
            not ecx
            and eax,ecx
            lea ecx,[eax-sizeof(HEAP)]
            mov [ecx].HEAP.prev,edx
            mov [ecx].HEAP.type,3

        .endif
    .endif
    ret

_aligned_malloc endp

    end
