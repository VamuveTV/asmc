
test.exe:
    asmc -win64 -ws ..\..\dz_lnk\$*.asm
    link /map /libpath:%AsmcDir%\lib\amd64 /machine:x64 /subsystem:console test.obj
    $@
    pause
    del $*.obj
    del $*.exe


