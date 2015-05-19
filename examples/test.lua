#!/usr/bin/lua

vm = require("luaVM.vm")

program = {
  'PSH', 3,
  'PSH', 6,
  'ADD',
  'POP',
  'JMP', 14,
  'PSH', 24,
  'PSH', 24,
  'ADD',
  'HLT'
}

vm.run(program)
