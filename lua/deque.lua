local M = {}

---@class Deque A double ended list.
M.Deque = {}

function M.Deque:__len()
  return self._last - self._first
end

function M.Deque:new(t)
  t = t or {}
  t._first = 0
  t._last = #t
  self.__index = self
  -- self.__index = function(x)
  --   if type(x) == "number" then
  --     return rawget(self, x - self._first)
  --   end
  --   return rawget(self, x)
  -- end
  setmetatable(t, self)
  return t
end

---Appends to the right end of the deque.
---@param x any
---@return nil
function M.Deque:push_right(x)
  self._last = self._last + 1
  self[self._last] = x
end

---Appends to the left end of the deque.
---@param x any
---@return nil
function M.Deque:push_left(x)
  self[self._first] = x
  self._first = self._first - 1
end

---Pops from the right end of the deque.
---@return any
function M.Deque:pop_right()
  local out = self[self._last]
  self[self._last] = nil
  self._last = self._last - 1
  return out
end

---Pops from the left end of the deque.
---@return any
function M.Deque:pop_left()
  self._first = self._first + 1
  local out = self[self._first]
  self[self._first] = nil
  return out
end

---Returns from the right end of the deque witout removing.
---@return any
function M.Deque:peek_right()
  return self[self._last]
end

---Returns from the left end of the deque witout removing.
---@return any
function M.Deque:peek_left()
  return self[self._first + 1]
end

return M
