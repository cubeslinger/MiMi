--
-- Addon       MiMi.lua
-- Author      marcob@marcob.org
-- StartDate   08/09/2017
--
local addon, mimi = ...

-- Inspect.Minion.Minion.List

local function createwindow()
   local mimicontext =  UI.CreateContext("mimi_context")
   local mimiwin	   =  UI.CreateFrame("RiftWindow", "MiMi", mimicontext)

   -- EXTERNAL CUT CONTAINER FRAME
   local mimiextframe =  UI.CreateFrame("Frame", "mimi_external_frame", mimiwin)
   mimiextframe:SetPoint("TOPLEFT",     mimiwin, "TOPLEFT",       mimi.gui.border.left,   mimi.gui.border.top)
   mimiextframe:SetPoint("TOPRIGHT",    mimiwin, "TOPRIGHT",      -mimi.gui.border.right,  mimi.gui.border.top)
   mimiextframe:SetPoint("BOTTOMLEFT",  mimiwin, "BOTTOMLEFT",    mimi.gui.border.left,   -mimi.gui.border.bottom)
   mimiextframe:SetPoint("BOTTOMRIGHT", mimiwin, "BOTTOMRIGHT",   -mimi.gui.border.right,  -mimi.gui.border.bottom)
   mimiextframe:SetLayer(1)

   -- MASK FRAME
   local mimimaskframe = UI.CreateFrame("Mask", "mimi_mask_frame", mimiextframe)
--    mimimaskframe:SetAllPoints(mimiextframe)
   mimimaskframe:SetPoint("TOPLEFT",     mimiextframe, "TOPLEFT")
   mimimaskframe:SetPoint("TOPRIGHT",    mimiextframe, "TOPRIGHT",   -(mimi.gui.border.right + mimi.gui.scroll.width),  0)
   mimimaskframe:SetPoint("BOTTOMLEFT",  mimiextframe, "TOPLEFT",    0, mimi.gui.panelheight)
   mimimaskframe:SetPoint("BOTTOMRIGHT", mimiextframe, "TOPRIGHT",   -(mimi.gui.border.right + mimi.gui.scroll.width), mimi.gui.panelheight)

   -- CONTAINER FRAME
   local mimiframe =  UI.CreateFrame("Frame", "mimi_frame", mimimaskframe)
   mimiframe:SetAllPoints(mimimaskframe)
   mimiframe:SetBackgroundColor(2, 0, 0, .5)
   mimiframe:SetLayer(1)

   
   -- MASK FRAME
   local mimimaskinfo = UI.CreateFrame("Mask", "mimi_mask_info", mimiextframe)
--    mimimaskinfo:SetPoint("TOPLEFT",     mimiextframe, "BOTTOMLEFT",  0, -(mimi.gui.border.bottom + mimi.gui.infoheight))
--    mimimaskinfo:SetPoint("TOPRIGHT",    mimiextframe, "BOTTOMRIGHT", 0, -(mimi.gui.border.bottom + mimi.gui.infoheight))
--    mimimaskinfo:SetPoint("BOTTOMLEFT",  mimiextframe, "BOTTOMLEFT",  0, -mimi.gui.border.bottom)
--    mimimaskinfo:SetPoint("BOTTOMRIGHT", mimiextframe, "BOTTOMRIGHT", 0, -mimi.gui.border.bottom)
   mimimaskinfo:SetPoint("TOPLEFT",     mimiextframe, "BOTTOMLEFT",  0, -(mimi.gui.infoheight))
   mimimaskinfo:SetPoint("TOPRIGHT",    mimiextframe, "BOTTOMRIGHT", 0, -(mimi.gui.infoheight))
   mimimaskinfo:SetPoint("BOTTOMLEFT",  mimiextframe, "BOTTOMLEFT",  0, 0)
   mimimaskinfo:SetPoint("BOTTOMRIGHT", mimiextframe, "BOTTOMRIGHT", 0, 0)


   -- INFO FRAME
   local mimiinfoframe =  UI.CreateFrame("Frame", "mimi_info_frame", mimimaskframe)
   mimiinfoframe:SetAllPoints(mimimaskinfo)
   mimiinfoframe:SetBackgroundColor(0, 2, 0, .5)
   mimiinfoframe:SetLayer(1)
   

--
   -- ITEMS SCROLLBAR
   mimiscroll = UI.CreateFrame("RiftScrollbar","mimi_scrollbar", mimiextframe)
   mimiscroll:SetVisible(true)
   mimiscroll:SetEnabled(true)
--    scroll:SetWidth(cD.sizes.toca[cD.text.base_font_size].sbwidth)
   mimiscroll:SetOrientation("vertical")
   mimiscroll:SetPoint("TOPRIGHT",     mimiextframe,  "TOPRIGHT")
--    mimiscroll:SetPoint("BOTTOMRIGHT",  mimiextframe,  "BOTTOMRIGHT")
   mimiscroll:SetPoint("BOTTOMRIGHT",  mimiextframe,  "TOPRIGHT", 0, mimi.gui.panelheight)
   mimiscroll:EventAttach(   Event.UI.Scrollbar.Change,
                           function()
                              local pos = mimiscroll:GetPosition()
                              mimiframe:SetPoint("TOPLEFT", mimimaskframe, "TOPLEFT", 0, -math.floor((mimi.gui.font.size*2) * pos) )
                           end,
                           "TotalsFrame_Scrollbar.Change"
                        )
--
   -- Enable Dragging
   mimi.makeDraggable(mimiwin)

   return mimiwin, mimiframe, mimiinfoframe, mimiscroll
end

local function createline(number, minionname, miniontbl, mimiframe)

   local missingframe   =  UI.CreateFrame("Frame", "mimilineframe", mimiframe)
   missingframe:SetHeight(mimi.gui.font.size*2)
   
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

   for name, tbl in pairs(mimi.db.name_obtained) do
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
   mimi.gui.win      =  mimiwin
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

table.insert(Command.Slash.Register("mimi"), {function (params) searchformissing(params)   end, mimi.addon, "Search Missing Minions"})

