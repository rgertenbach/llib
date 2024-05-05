local M = {}

---@class Tuple
--- Represents a tuple. Tuples can be compared by element.
M.Tuple = {}

local function lt(a, b)
  local n =math.min(#a, #b)
  for i = 1, n do
    if a[i] < b[i] then return true
    elseif a[i] > b[i] then return false
    end
  end
  return #a < #b
end

local function eq(a, b)
  if #a ~= #b then return false end
  for i, x in ipairs(a) do
    if x ~= b[i] then return false end
  end
  return true
end

function M.Tuple:new(t)
  t = t or {}
  self.__index = self
  self.__lt = lt
  self.__eq = eq
  setmetatable(t, self)
  return t
end

return M
