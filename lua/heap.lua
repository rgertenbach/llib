local M = {}

---@class Heap
---A table that works like a heap.
M.Heap = {}

---Creates a new heap
---@generic T: any
---@param t T[]? An optional array to heapify.
---@param key (fun(x: T): any)? An optional function to convert the object for comparison.
---@return Heap
function M.Heap:new(t, key)
  t = t or {}
  key = key or function(x) return x end
  self.__index = self
  setmetatable(t, self)
  self:heapify()
  return t
end

---Reorder the heap from the bottom up. Used after inserting.
---@param i integer? The index to heapify. Defaults to the last element.
function M.Heap:heapify_up(i)
  i = i or #self
  if i <= 1 then return end
  local parent = math.floor(i / 2)
  if self[i] >= self[parent] then return end
  local temp = self[parent]
  self[parent] = self[i]
  self[i] = temp
  self:heapify_up(parent)
end


---Adds a new element to the heap.
---@param x any The element to add.
function M.Heap:push(x)
  table.insert(self, x)
  self:heapify_up()
end

---Heapifies a table top down (when initalizing or popping).
---@param i any? The index where to start. Defaults to the first element.
function M.Heap:heapify_down(i)
  i = i or 1
  if i >= #self then return end
  local lefti = i * 2
  local righti = lefti + 1
  local mini = i
  if lefti <= #self and self[lefti] < self[mini] then
    mini = lefti
  end
  if righti <= #self and self[righti] < self[mini] then
    mini = righti
  end
  if mini ~= i then
    local temp = self[i]
    self[i] = self[mini]
    self[mini] = temp
    self:heapify_down(mini)
  end
end

---Removes and returns an item from the heap.
---@param i integer? Which item to remove, defaults to the smallest item.
---@return any # The item from the stack.
function M.Heap:pop(i)
  i = i or 1
  local ret = self[i]
  self[i] = self[#self]
  self[#self] = nil
  self:heapify_down(i)
  return ret
end

---Sets up a table to be a heap.
function M.Heap:heapify()
  for i = 1, #self do
    self:heapify_down(i)
  end
end

return M
