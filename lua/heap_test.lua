local heap = require("heap")

local h = heap.Heap:new()
h:push(7)
h:push(1)
h:push(6)
h:push(2)
h:push(9)
h:push(5)
h:push(4)
h:push(10)
h:push(8)
h:push(3)

while #h > 0 do
  assert(h:pop() == 1, "1")
  assert(h:pop() == 2, "2")
  assert(h:pop() == 3, "3")
  assert(h:pop() == 4, "4")
  assert(h:pop() == 5, "5")
  assert(h:pop() == 6, "6")
  assert(h:pop() == 7, "7")
  assert(h:pop() == 8, "8")
  assert(h:pop() == 9, "9")
  assert(h:pop() == 10, "10")
end



