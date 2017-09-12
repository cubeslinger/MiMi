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
mimi.gui.border.left    =  4
mimi.gui.border.right   =  4
mimi.gui.border.top     =  38
mimi.gui.border.bottom  =  4
mimi.gui.scroll         =  {}
mimi.gui.scroll.width   =  14
mimi.gui.scroll.lastpos =  0
mimi.gui.visible        =  false
mimi.gui.mmbtnheight    =  38
mimi.gui.mmbtnwidth     =  38
mimi.gui.mmbtnobj       =  nil
mimi.gui.panelheight    =  300
mimi.gui.infoheight     =  150
mimi.gui.winobj         =  nil
mimi.gui.winx           =  nil
mimi.gui.winy           =  nil
mimi.gui.winh           =  500
mimi.gui.winw           =  350
mimi.gui.mmbtnx         =  nil
mimi.gui.mmbtny         =  nil
mimi.gui.name           =  nil
mimi.gui.obtained       =  nil
mimi.gui.detail         =  nil
mimi.gui.listeleheight  =  nil
--

function mimi.round(num, digits)
   local floor = math.floor
   local mult = 10^(digits or 0)

   return floor(num * mult + .5) / mult
end


function mimi.updateguicoordinates(win, x, y)
--    print(string.format("mimi.updateguicoordinates win=%s x=%s y=%s", win, x, y))
   if win ~= nil then
      local winname = win:GetName()
--       print("updateguicoordinates WINNAME ("..winname..")")
      if winname  == "MiMi" then
         mimi.gui.winx   = mimi.round(x)
         mimi.gui.winy   =	mimi.round(y)
      end

--       if winname == "mimi_mmBtnIconBorder" then
--    if winname == "mimi_mmBtnFrame" then
   if winname == "mimi_mmBtnIcon" then
         mimi.gui.mmbtnx   =  mimi.round(x)
         mimi.gui.mmbtny   =  mimi.round(y)
      end
   end

   return
end


function mimi.loadvariables(_, addonname)
   if addon.name == addonname then
--       print("mimi.loadvariables ("..addonname..")")
      if gui then
         local key, val = nil, nil
         for key, val in pairs(gui) do
            mimi.gui[key]   =  val
--             print(string.format("key=%s val=%s mimi.gui[key]=%s", key, val, mimi.gui[key]))
         end


      end
   end
   return
end

function mimi.savevariables(_, addonname)
   if addon.name == addonname then
      local a     =  {}
      a.winx      =  mimi.gui.winx
      a.winy      =  mimi.gui.winy
      a.mmbtnx    =  mimi.gui.mmbtnx
      a.mmbtny    =  mimi.gui.mmbtny
      a.visible   =  mimi.gui.visible
      gui         =  a
   end

   return
end


function mimi.makeDraggable(window)

   local objtype = Utility.Type(window)
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
--          window:SetPoint("TOPLEFT", UIParent, "TOPLEFT", lastx, lasty)
         lastx =  mouse.x - dx
         lasty =  mouse.y - dy

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

--    print(string.format("lastx = %s lasty = %s", lastx, lasty))
   if (lastx and lasty) then updateguicoordinates(window, lastx, lasty)  end

   return
end

-- Command.Event.Attach(Event.Addon.SavedVariables.Load.End,   mimi.loadvariables,   "MiMi: Load Variables")
-- Command.Event.Attach(Event.Addon.SavedVariables.Save.Begin, mimi.savevariables,   "MiMi: Load Variables")
