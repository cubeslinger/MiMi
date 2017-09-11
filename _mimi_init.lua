--
-- Addon       _mimi_init.lua
-- Author      marcob@marcob.org
-- StartDate   09/09/2017
--

local addon, mimi = ...

mimi.addon              =  Inspect.Addon.Detail(Inspect.Addon.Current())["name"]
mimi.version            =  Inspect.Addon.Detail(Inspect.Addon.Current())["toc"]["Version"]
--
mimi.gui                =  {}
mimi.gui.font           =  {}
mimi.gui.font.size      =  12
mimi.gui.border         =  {}
mimi.gui.border.left    =  16
mimi.gui.border.right   =  16
mimi.gui.border.top     =  54
mimi.gui.border.bottom  =  12
mimi.gui.scroll         =  {}
mimi.gui.scroll.width   =  4
mimi.gui.visible        =  false
mimi.gui.mmbtnheight    =  38
mimi.gui.mmbtnwidth     =  38
mimi.gui.mmbtnobj       =  nil
mimi.gui.panelheight    =  300
mimi.gui.infoheight     =  200
--

local function updateguicoordinates()
   return
end


function mimi.makeDraggable(window)
   
   local objtype = Utility.Type(window)
   
   print(string.format("MIMI window=[%s], objtype=%s", window, objtype))
   
   local dx = nil
   local dy = nil
   local function leftDown()
      local mouse = Inspect.Mouse()
      dx = mouse.x - window:GetLeft()
      dy = mouse.y - window:GetTop()
   end
   local function leftUp()
      dx = nil
      dy = nil
   end
   local function mouseMove()
      if(dx) then
         local mouse = Inspect.Mouse()
         window:SetPoint("TOPLEFT", UIParent, "TOPLEFT", mouse.x - dx, mouse.y - dy)
      end
   end

   local content = window:GetContent()
   local border = window:GetBorder()
   content:EventAttach(Event.UI.Input.Mouse.Left.Down, leftDown, "")
   content:EventAttach(Event.UI.Input.Mouse.Left.Up, leftUp, "")
   content:EventAttach(Event.UI.Input.Mouse.Left.Upoutside, leftUp, "")
   content:EventAttach(Event.UI.Input.Mouse.Cursor.Move, mouseMove, "")

   border:EventAttach(Event.UI.Input.Mouse.Left.Down, leftDown, "")
   border:EventAttach(Event.UI.Input.Mouse.Left.Up, leftUp, "")
   border:EventAttach(Event.UI.Input.Mouse.Left.Upoutside, leftUp, "")
   border:EventAttach(Event.UI.Input.Mouse.Cursor.Move, mouseMove, "")
   
   updateguicoordinates()
   
   return
end
