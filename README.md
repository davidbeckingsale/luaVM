# LuaVM

LuaVM is an incredibly simple VM written in Lua. Inspired Felix Angell's
['Writing a Virtual Machine in C'][vmctut] article and the corresponding
[repository][vmcrepo], this one in written in Lua!

## Instructions

    op    usage       function
    ---------------------------------------------------------------
    HLT   HLT         halts program
    PSH   PSH val     pushes <val> to stack
    POP   POP         pops value from stack
    ADD   ADD         adds the top two vals on stack, pushes result
    JMP   JMP val     unconditional jump to <val>

[vmctut]: http://blog.felixangell.com/part-1-lets-build-an-interpreted-language-in-go/
[vmcrepo]: http://github.com/felixangell/mac
