include conio.inc

    .code

_wherex proc
local ci:CONSOLE_SCREEN_BUFFER_INFO

    .if GetConsoleScreenBufferInfo(hStdOutput, addr ci)

        movzx eax,ci.dwCursorPosition.x
        movzx edx,ci.dwCursorPosition.y
    .endif
    ret

_wherex endp

    END
