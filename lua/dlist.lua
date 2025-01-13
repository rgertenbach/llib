local M = {}

---@class DoublyLinkedListNode<T>: {val: T}
---@field prev DoublyLinkedListNode?
---@field next DoublyLinkedListNode?

---@generic T
---@param val T
---@param prev DoublyLinkedListNode?
---@param next DoublyLinkedListNode?
---@return DoublyLinkedListNode<T>
function M.node(val, prev, next)
  return {val=val, prev=prev, next=next}
end

---@param node DoublyLinkedListNode
---@return nil
function M.remove_next(node)
  local nxt = node.next
  if nxt == nil then error("No element to remove") end
  node.next = nxt.next
  node.next.prev = node
end

---@param node DoublyLinkedListNode
---@return nil
function M.remove_prev(node)
  local prv = node.prev
  if prv == nil then error("No element to remove") end
  node.prev = prv.prev
  node.prev.next = node
end

---@param node DoublyLinkedListNode
---@param val any
---@return nil
function M.insert_after(node, val)
  local new = M.node(val, node, node.next)
  if node.next then node.next.prev = new end
  node.next = new
end

---@param node DoublyLinkedListNode
---@param val any
---@return nil
function M.insert_before(node, val)
  local new = M.node(val, node.prev, node)
  if node.prev then node.prev.next = new end
  node.prev = new
end

return M

