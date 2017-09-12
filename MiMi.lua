--
-- Addon       MiMi.lua
-- Author      marcob@marcob.org
-- StartDate   08/09/2017
--
local addon, mimi = ...

-- Inspect.Minion.Minion.List

local function createwindow()
   local mimicontext =  UI.CreateContext("mimi_context")
--    local mimiwin	   =  UI.CreateFrame("RiftWindow", "MiMi", mimicontext)
   local mimiwin	   =  UI.CreateFrame("Frame", "MiMi", mimicontext)
--    mimiwin:SetTitle("MiMi")
   mimiwin:SetHeight(mimi.gui.winh)
   mimiwin:SetWidth(mimi.gui.winw)
   mimiwin:SetBackgroundColor(0, 0, 0, .5)
   mimiwin:SetLayer(0)
   if mimi.gui.winx == nil or mimi.gui.winy == nil then
      -- first run, we position in the screen center
      mimiwin:SetPoint("CENTER", UIParent, "CENTER")
   else
      -- we have coordinates
      mimiwin:SetPoint("TOPLEFT", UIParent, "TOPLEFT", mimi.gui.winx or 0, mimi.gui.winy or 0)
   end

   -- EXTERNAL CUT CONTAINER FRAME
   local mimiextframe =  UI.CreateFrame("Frame", "mimi_external_frame", mimiwin)
   mimiextframe:SetPoint("TOPLEFT",     mimiwin, "TOPLEFT",       mimi.gui.border.left,   mimi.gui.border.top)
   mimiextframe:SetPoint("TOPRIGHT",    mimiwin, "TOPRIGHT",      -mimi.gui.border.right,  mimi.gui.border.top)
   mimiextframe:SetPoint("BOTTOMLEFT",  mimiwin, "BOTTOMLEFT",    mimi.gui.border.left,   -mimi.gui.border.bottom)
   mimiextframe:SetPoint("BOTTOMRIGHT", mimiwin, "BOTTOMRIGHT",   -mimi.gui.border.right,  -mimi.gui.border.bottom)
   mimiextframe:SetLayer(1)
--    mimiextframe:SetBackgroundColor(0, 0, 2, .5)
   mimiextframe:SetBackgroundColor(.1, .1, .1, .5)

   -- MASK FRAME
   local mimimaskframe = UI.CreateFrame("Mask", "mimi_mask_frame", mimiextframe)
   mimimaskframe:SetPoint("TOPLEFT",     mimiextframe, "TOPLEFT")
   mimimaskframe:SetPoint("TOPRIGHT",    mimiextframe, "TOPRIGHT",   -(mimi.gui.border.right + mimi.gui.scroll.width),  0)
   mimimaskframe:SetPoint("BOTTOMLEFT",  mimiextframe, "TOPLEFT",    0, mimi.gui.panelheight)
   mimimaskframe:SetPoint("BOTTOMRIGHT", mimiextframe, "TOPRIGHT",   -(mimi.gui.border.right + mimi.gui.scroll.width), mimi.gui.panelheight)
   mimimaskframe:SetLayer(2)

   -- CONTAINER FRAME
   local mimiframe =  UI.CreateFrame("Frame", "mimi_frame", mimimaskframe)
   mimiframe:SetAllPoints(mimimaskframe)
--    mimiframe:SetBackgroundColor(2, 0, 0, .5)
   mimiframe:SetBackgroundColor(.3, .3, .3, .7)
   mimiframe:SetLayer(2)

   -- MASK FRAME
   local mimimaskinfo = UI.CreateFrame("Mask", "mimi_mask_info", mimiextframe)
   mimimaskinfo:SetPoint("TOPLEFT",     mimiextframe, "BOTTOMLEFT",  mimi.gui.border.left, -(mimi.gui.infoheight + mimi.gui.border.bottom))
   mimimaskinfo:SetPoint("TOPRIGHT",    mimiextframe, "BOTTOMRIGHT", -(mimi.gui.border.right + mimi.gui.scroll.width), -(mimi.gui.infoheight + mimi.gui.border.bottom))
   mimimaskinfo:SetPoint("BOTTOMLEFT",  mimiextframe, "BOTTOMLEFT")
   mimimaskinfo:SetPoint("BOTTOMRIGHT", mimiextframe, "BOTTOMRIGHT")
   mimimaskinfo:SetLayer(2)

   -- INFO FRAME
   local mimiinfoframe =  UI.CreateFrame("Frame", "mimi_info_frame", mimimaskinfo)
   mimiinfoframe:SetAllPoints(mimimaskinfo)
--    mimiinfoframe:SetBackgroundColor(0, 2, 0, .5)
   mimiinfoframe:SetBackgroundColor(.3, .3, .3, .7)
   mimiinfoframe:SetLayer(2)

      local miminame  =  UI.CreateFrame("Text", "mimi_name", mimiinfoframe)
      miminame:SetFontSize(mimi.gui.font.size)
      miminame:SetLayer(3)
      miminame:SetPoint("TOPLEFT", mimiinfoframe, "TOPLEFT",  mimi.gui.border.left, 0)
      mimi.gui.name  =  miminame

      local mimiobtained  =  UI.CreateFrame("Text", "mimi_obtained", mimiinfoframe)
      mimiobtained:SetFontSize(mimi.gui.font.size)
      mimiobtained:SetLayer(3)
      mimiobtained:SetPoint("TOPRIGHT", mimiinfoframe, "TOPRIGHT",  -mimi.gui.border.right, 0)
      mimi.gui.obtained =  mimiobtained

      -- Detail Field
      local mimidetail  =  UI.CreateFrame("Text", "mimi_detail", mimiinfoframe)
      mimidetail:SetFontSize(mimi.gui.font.size)
      mimidetail:SetLayer(3)
      mimidetail:SetPoint("TOPLEFT",   miminame,      "BOTTOMLEFT")
      mimidetail:SetPoint("TOPRIGHT",  mimiobtained,  "BOTTOMRIGHT")
      mimidetail:SetWordwrap(true)
      mimi.gui.detail   =  mimidetail

   -- ITEMS SCROLLBAR
   mimiscroll = UI.CreateFrame("RiftScrollbar","mimi_scrollbar", mimiextframe)
   mimiscroll:SetVisible(true)
   mimiscroll:SetEnabled(true)
   mimiscroll:SetOrientation("vertical")
   mimiscroll:SetLayer(2)
   mimiscroll:SetPoint("TOPRIGHT",     mimiextframe,  "TOPRIGHT")
   mimiscroll:SetPoint("BOTTOMRIGHT",  mimiextframe,  "TOPRIGHT", 0, mimi.gui.panelheight)
   mimiscroll:EventAttach(   Event.UI.Scrollbar.Change,
                           function()
                              local pos = mimiscroll:GetPosition()
                              mimiframe:SetPoint("TOPLEFT", mimimaskframe, "TOPLEFT", 0, -math.floor((mimi.gui.font.size*2) * pos) )
                           end,
                           "TotalsFrame_Scrollbar.Change"
                        )
   -- Enable Dragging
   Library.LibDraggable.draggify(mimiwin, mimi.updateguicoordinates)

   return mimiwin, mimiframe, mimiinfoframe, mimiscroll
end


function mimi.showdetail(minionname)
   mimi.gui.name:SetText("")
   mimi.gui.name:SetText(minionname)
   --
   mimi.gui.obtained:SetText("")
   mimi.gui.obtained:SetText(mimi.db[minionname].obtained)
   --
   mimi.gui.detail:SetText("")
   mimi.gui.detail:SetText(mimi.db[minionname].details)

   return
end

local function createline(number, minionname, miniontbl, mimiframe)

   local missingframe   =  UI.CreateFrame("Frame", "mimilineframe", mimiframe)
   missingframe:SetHeight(mimi.gui.font.size*2)
   missingframe:EventAttach(Event.UI.Input.Mouse.Left.Click, function() mimi.showdetail(minionname) end, "Show/Hide Pressed" )

   local num           =  UI.CreateFrame("Text", "missingminionnum",   missingframe)
   num:SetFontSize(mimi.gui.font.size)
   num:SetText(string.format("%s", number))
   num:SetLayer(3)
   num:SetPoint("TOPLEFT",   missingframe, "TOPLEFT")

   local line           =  UI.CreateFrame("Text", "missingminionline",   missingframe)
   line:SetFontSize(mimi.gui.font.size)
   line:SetText(string.format("%s", minionname))
   line:SetLayer(3)
   line:SetPoint("TOPLEFT",   num, "TOPRIGHT", mimi.gui.font.size, 0)

   local obtained       =  UI.CreateFrame("Text", "missingminionobtained",   missingframe)
   obtained:SetFontSize(mimi.gui.font.size)
   obtained:SetText(string.format("%s", miniontbl.obtained))
   obtained:SetLayer(3)
   obtained:SetPoint("TOPLEFT",   line, "TOPRIGHT", mimi.gui.font.size, 0)

   local details       =  UI.CreateFrame("Text", "missingminiondetails",   missingframe)
   details:SetFontSize(mimi.gui.font.size)
   details:SetText(string.format("%s", miniontbl.details))
   details:SetLayer(3)
   details:SetPoint("TOPLEFT",   obtained, "TOPRIGHT", mimi.gui.font.size, 0)

   return(missingframe)
end


local function populatemissinglist(missingtbl, mimiframe)

   local lastline =  nil
   local cnt      =  0
   for name, tbl in pairs(missingtbl) do
      cnt = cnt + 1
--       print(string.format("name=%s tbl=%s", name, tbl))
      local line = createline(cnt, name, tbl, mimiframe)

      if lastline then
         line:SetPoint("TOPLEFT",  lastline, "BOTTOMLEFT")
         line:SetPoint("TOPRIGHT", lastline, "BOTTOMRIGHT")
      else
         line:SetPoint("TOPLEFT",  mimiframe, "TOPLEFT")
         line:SetPoint("TOPRIGHT", mimiframe, "TOPRIGHT")
      end

      lastline =  line
   end

   return
end

function mimi.searchformissing()
   local id, tbl, name  =  nil, nil, {}
   local total          =  0
   local collected      =  0
   local missing        =  0
   local minions        =  Inspect.Minion.Minion.List()
   local found          =  false
   local missingtbl     =  {}

   for name, tbl in pairs(mimi.db) do
      total = total + 1
      for id, _ in pairs(minions) do
         local detail = Inspect.Minion.Minion.Detail(id) if name == detail.name then found = true break end
      end

      if found then
         collected = collected + 1
      else
         missing   = missing   + 1
         missingtbl[name] = tbl
      end
      found =  false
   end

   print(string.format("MiMi Total: %s, Collected: %s, Missing: %s", total, collected, missing))

   local mimiwin, mimiframe, mimiinfoframe, mimiscroll = createwindow()
   mimi.gui.winobj   =  mimiwin
   mimi.gui.frame    =  mimiframe
   mimi.gui.info     =  mimiinfoframe
   mimi.gui.scroll   =  mimiscroll

--    mimiscroll:SetRange(1, missing)
   mimi.gui.scroll:SetRange(1, missing)
--    ilScrollStep   =  cD.round(cD.sCACFrames.cacheitemsframe:GetHeight()/cnt)

   populatemissinglist(missingtbl, mimiframe)

   return
end

if not mimi.gui.mmbtnobj then
   mimi.gui.mmbtnobj =  mimi.createminimapbutton()
--    mimi.makeDraggable(mimi.gui.mmbtnobj)
end

-- table.insert(Command.Slash.Register("mimi"), {function (params) mimi.searchformissing(params)   end, mimi.addon, "Search Missing Minions"})
   table.insert(Command.Slash.Register("mimi"), {function() mimi.showhidewindow() end, mimi.addon, "Search Missing Minions"})

--[[
function()
   local pos = cD.round(cD.sCACFrames.cacheitemsscroll:GetPosition())
   local smin, smax = cD.sCACFrames.cacheitemsscroll:GetRange()
   if pos == smin  then
      cD.sCACFrames.cacheitemsframe:ClearPoint("TOPLEFT")
      cD.sCACFrames.cacheitemsframe:ClearPoint("BOTTOMLEFT")
      cD.sCACFrames.cacheitemsframe:SetPoint("TOPLEFT",      cD.sCACFrames.cacheitemsmaskframe, "TOPLEFT")
   else
      if (cD.sCACFrames.cacheitemsframe:GetBottom() - ilScrollStep*pos) >= cD.sCACFrames.cacheitemsmaskframe:GetTop() then
      cD.sCACFrames.cacheitemsframe:ClearPoint("TOPLEFT")
      cD.sCACFrames.cacheitemsframe:ClearPoint("BOTTOMLEFT")
      cD.sCACFrames.cacheitemsframe:SetPoint("TOPLEFT", cD.sCACFrames.cacheitemsmaskframe, "TOPLEFT", 0, -(ilScrollStep*pos) )
   end
   end
-- end

]]--


-- function()
--    local pos = mimi.round(mimiscroll:GetPosition())
--    local smin, smax = mimiscroll:GetRange()
--    if pos == smin  then
--       mimiframe:ClearPoint("TOPLEFT")
--       mimiframe:ClearPoint("BOTTOMLEFT")
--       mimiframe:SetAllPoints(mimimaskframe)
--    else
-- --       -math.floor((mimi.gui.font.size*2) * pos)
--       if (mimiframe:GetBottom() - (math.floor((mimi.gui.font.size*2) * pos)) >= mimimaskframe:GetTop() then
--          miiframe:ClearPoint("TOPLEFT")
--          mimiframe:ClearPoint("BOTTOMLEFT")
-- --          mimiframe:SetPoint("TOPLEFT", mimi.sCACFrames.cacheitemsmaskframe, "TOPLEFT", 0, -(ilScrollStep*pos) )
--          mimiframe:SetPoint("TOPLEFT", mimimaskframe, "TOPLEFT", 0, -math.floor((mimi.gui.font.size*2) * pos) )
--       end
--    end
-- end,
