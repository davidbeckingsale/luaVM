local VM = VM or {}

local pop = function()
  val = VM.stack[VM.sp]
  VM.sp = VM.sp - 1
  return val
end

local push = function(val)
  VM.sp = VM.sp + 1
  VM.stack[VM.sp] = val
end

local function fetch()
  return VM.program[VM.ip]
end

local function eval(instr)
  if instr == 'HLT' then
    VM.running = false
  elseif instr == 'PSH' then
    VM.ip = VM.ip + 1
    push(fetch())
  elseif instr == 'POP' then
    val = pop()
    print('Popped ' .. val)
  elseif instr == 'ADD' then
    a = pop()
    b = pop()
    result = b + a
    push(result)
  elseif instr == 'JMP' then
    VM.ip = VM.ip + 1
    val = fetch()
    print("Jumping to " .. val)
    VM.ip = val
    eval(fetch())
  end

  VM.ip = VM.ip + 1
end

VM.INSTRUCTION_SET = {
  PSH,
  ADD,
  POP,
  SET,
  HLT,
  JMP
}

VM.ip = 1
VM.sp = 0

VM.stack = {}

VM.running = true

VM.run = function(program)
  VM.program = program
  while VM.running do
    eval(fetch())
  end
end

VM.reset = function()
  VM.ip = 1
  VM.sp = 0
  VM.stack = {}
  VM.running = true
end


return VM
