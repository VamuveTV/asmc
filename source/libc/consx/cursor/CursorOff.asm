include consx.inc

    .code

CursorOff proc
local cu:CONSOLE_CURSOR_INFO

    mov cu.dwSize,CURSOR_NORMAL
    mov cu.bVisible,0
    push eax
    SetConsoleCursorInfo(hStdOutput, &cu)
    pop  eax
    ret

CursorOff endp

    END
