--[[ LibDraggable
  Library.LibDraggable.draggify(window)
]]--

if not Library then Library = {} end
local Draggable = {}
if not Library.LibDraggable then Library.LibDraggable = Draggable end

Draggable.DebugLevel = 0
Draggable.Version = "0.5-130712-20:34:32"

Draggable.printf = Library.printf.printf

Draggable.windows = {}

function Draggable.draggify(window, callback)

  local newtab = { dragging = false, x = 0, y = 0 }
  Draggable.windows[window] = newtab
  newtab.callback = callback

  local border =  nil
  if Utility.Type(window) == "window"  then  border = window:GetBorder()
                                       else  border = window
  end
--   local border = window:GetBorder()
--   local border = window
  border:EventAttach(Event.UI.Input.Mouse.Right.Down, function(...) Draggable.rightdown(window, ...) end, "draggable_right_down")
  border:EventAttach(Event.UI.Input.Mouse.Cursor.Move, function(...) Draggable.mousemove(window, ...) end, "draggable_mouse_move")
  border:EventAttach(Event.UI.Input.Mouse.Right.Up, function(...) Draggable.rightup(window, ...) end, "draggable_right_up")
  border:EventAttach(Event.UI.Input.Mouse.Right.Upoutside, function(...) Draggable.rightupoutside(window, ...) end, "draggable_right_upoutside")
  Draggable.windows[window] = newtab
end

function Draggable.rightdown(window, event, ...)
  local win = Draggable.windows[window]
  if not win then
    Draggable.windows[window] = { dragging = false, x = 0, y = 0 }
    win = Draggable.windows[window]
  end
  win.dragging = true
  win.win_x = window:GetRight()
  win.win_y = window:GetTop()
  local l, t, r, b = window:GetBounds()
  window:ClearAll()
  window:SetPoint("TOPLEFT", UIParent, "TOPLEFT", l, t)
  window:SetWidth(r - l)
  window:SetHeight(b - t)
  win.ev_x = Inspect.Mouse().x
  win.ev_y = Inspect.Mouse().y
end

function Draggable.mousemove(window, event, ...)
  local event, x, y = ...
  local win = Draggable.windows[window]
  if win and win.dragging then
    local win = Draggable.windows[window]
    local new_x = win.win_x + x - win.ev_x
    local new_y = win.win_y + y - win.ev_y
    window:SetPoint("TOPLEFT", UIParent, "TOPLEFT", new_x, new_y)
    if win.callback then
      win.callback(window, new_x, new_y)
    end
  end
end

function Draggable.rightup(window, event, ...)
  local win = Draggable.windows[window]
  if win then
    win.dragging = false
    win.ev_x = nil
    win.ev_y = nil
  end
end

function Draggable.rightupoutside(window, event, ...)
  local win = Draggable.windows[window]
  if win then
    win.dragging = false
    win.ev_x = nil
    win.ev_y = nil
  end
end
