--
-- Addon       MiMi.lua
-- Author      marcob@marcob.org
-- StartDate   08/09/2017
--
local addon, mimi = ...

-- Inspect.Minion.Minion.List

local function buildiconstrip(frame, name, tbl)
   local stat     =  nil
   local lasticon =  nil

   for _, stat in ipairs( {"earth", "wind", "fire", "water", "life", "death", "hunting", "diplomacy", "harvesting", "dimension", "artifact", "assasination"} ) do
      if tbl[stat] ~= "" then

         local iconele = UI.CreateFrame("Texture", "mimi_iconele_"..stat, frame)
--          print(string.format("stat=[%s] iconele=[%s]", stat, mimi.db.icons[stat]))
         iconele:SetTexture("Rift", mimi.db.icons[stat])
         iconele:SetHeight(mimi.gui.font.size)
         iconele:SetWidth(mimi.gui.font.size)
         iconele:SetLayer(2)
         if not lasticon then
            iconele:SetPoint("TOPLEFT", frame, "TOPLEFT")
         else
            iconele:SetPoint("TOPLEFT", lasticon, "TOPRIGHT")
         end
         lasticon =  iconele
      end
   end

--    if not lasticon then iconstrip = nil end
--    return iconstrip
   return

end

local function buildiconstripextended(frame, name, tbl)
   local stat     =  nil
   local lasticon =  nil
   local icons    =  {}
   local cnt      =  1

   -- reset old icons
--    print ("PRE")
   if mimi.gui.iconstockidx > 0 then
      while (cnt <= mimi.gui.iconstockidx) do
         mimi.gui.iconstock[cnt]:SetVisible(false)
--          print ("cnt ("..cnt..")")
         cnt = cnt + 1
      end
   end
--    print ("POST")

   for _, stat in ipairs( {"earth", "wind", "fire", "water", "life", "death", "hunting", "diplomacy", "harvesting", "dimension", "artifact", "assasination"} ) do
      if tbl[stat] ~= "" then

         if not mimi.gui.iconstock[cnt]   then
            mimi.gui.iconstock[cnt]  =  UI.CreateFrame("Texture", "mimi_icons["..cnt.."]_"..stat, frame)
--             print(string.format("stat=[%s] icons[]=[%s]", stat, mimi.db.icons[stat]))
         end
         mimi.gui.iconstock[cnt]:SetTexture("Rift", mimi.db.icons[stat])
         mimi.gui.iconstock[cnt]:SetHeight(mimi.gui.font.size)
         mimi.gui.iconstock[cnt]:SetWidth(mimi.gui.font.size)
         mimi.gui.iconstock[cnt]:SetLayer(2)
         mimi.gui.iconstock[cnt]:SetVisible(true)
         if not lasticon then
            mimi.gui.iconstock[cnt]:SetPoint("TOPLEFT", frame, "TOPLEFT")
         else
            mimi.gui.iconstock[cnt]:SetPoint("TOPLEFT", lasticon, "TOPRIGHT")
         end

         lasticon =  mimi.gui.iconstock[cnt]
         mimi.gui.iconstockidx   =  cnt
         cnt      =  cnt   +  1
      end
   end

   if not lasticon then
      mimi.gui.iconstock      =  {}
      mimi.gui.iconstockidx   =  0
   end

   return

end



local function createwindow()
   local mimicontext =  UI.CreateContext("mimi_context")
   local mimiwin	   =  UI.CreateFrame("Frame", "MiMi", mimicontext)
   mimiwin:SetHeight(mimi.gui.winh)
   mimiwin:SetWidth(mimi.gui.winw)
   mimiwin:SetBackgroundColor(0, 0, 0, .5)
   mimiwin:SetLayer(0)
   if mimi.gui.winx == nil or mimi.gui.winy == nil then
      -- first run, we position in the screen center
      mimiwin:SetPoint("CENTER", UIParent, "CENTER")
   else
      -- we have coordinates
      mimiwin:SetPoint("TOPLEFT", UIParent, "TOPLEFT", mimi.gui.winx, mimi.gui.winy)
   end


   -- EXTERNAL CUT CONTAINER FRAME
   local mimiextframe =  UI.CreateFrame("Frame", "mimi_external_frame", mimiwin)
   mimiextframe:SetPoint("TOPLEFT",     mimiwin, "TOPLEFT",       mimi.gui.border.left,   mimi.gui.border.top)
   mimiextframe:SetPoint("TOPRIGHT",    mimiwin, "TOPRIGHT",      -mimi.gui.border.right,  mimi.gui.border.top)
   mimiextframe:SetPoint("BOTTOMLEFT",  mimiwin, "BOTTOMLEFT",    mimi.gui.border.left,   -mimi.gui.border.bottom)
   mimiextframe:SetPoint("BOTTOMRIGHT", mimiwin, "BOTTOMRIGHT",   -mimi.gui.border.right,  -mimi.gui.border.bottom)
   mimiextframe:SetLayer(1)
   mimiextframe:SetBackgroundColor(.1, .1, .1, .5)

   -- Title Frame
      local mimititleframe =  UI.CreateFrame("Frame", "mimi_title_frame", mimiextframe)
      mimititleframe:SetHeight(mimi.gui.font.size)
      mimititleframe:SetPoint("TOPLEFT",  mimiextframe, "TOPLEFT",   mimi.gui.border.left, 0)
      mimititleframe:SetPoint("TOPRIGHT", mimiextframe, "TOPRIGHT",  -mimi.gui.border.right, 0)

         -- MiniMapButton Icon
         local mimitileicon = UI.CreateFrame("Texture", "mimi_title_icon", mimiextframe)
         mimitileicon:SetTexture("Rift", "Icon_Dominion_sm.png.dds")
         mimitileicon:SetLayer(2)
         mimitileicon:SetHeight(mimi.gui.font.size*2)
         mimitileicon:SetWidth(mimi.gui.font.size*2)
         mimitileicon:SetPoint("TOPLEFT",     mimititleframe, "TOPLEFT", 0, -4)


         local mimititle  =  UI.CreateFrame("Text", "mimi_title", mimititleframe)
         mimititle:SetFontSize(mimi.gui.font.size)
         mimititle:SetHeight(mimi.gui.font.size)
         mimititle:SetText(mimi.html.title, true)
         mimititle:SetLayer(2)
         mimititle:SetBackgroundColor(.1, .1, .1, .5)
--          mimititle:SetPoint("TOPLEFT",     mimititleframe, "TOPLEFT")
         mimititle:SetPoint("TOPLEFT",     mimitileicon, "TOPRIGHT", mimi.gui.border.left, 2)


         -- HEADER ICONIZE BUTTON
         local mimiiconizeButton = UI.CreateFrame("Texture", "mimi_iconize button", mimititleframe)
         mimiiconizeButton:SetTexture("Rift", "splitbtn_arrow_D_(normal).png.dds")
         mimiiconizeButton:SetHeight(mimi.gui.font.size)
         mimiiconizeButton:SetWidth(mimi.gui.font.size)
         mimiiconizeButton:SetLayer(2)
         mimiiconizeButton:EventAttach( Event.UI.Input.Mouse.Left.Click, function() mimi.gui.winobj:SetVisible(false) mimi.gui.visible = false end, "MiMi Iconize Button Pressed" )
         mimiiconizeButton:SetPoint("TOPRIGHT", mimititleframe, "TOPRIGHT", -mimi.gui.border.right, 1)
--          cD.attachTT(iconizeButton, "minimize")

      -- LIST MASK FRAME
      local mimimaskframe = UI.CreateFrame("Mask", "mimi_mask_frame", mimiextframe)
      mimimaskframe:SetPoint("TOPLEFT",     mimititleframe, "BOTTOMLEFT",  0, mimi.gui.border.top*2)
      mimimaskframe:SetPoint("TOPRIGHT",    mimititleframe, "BOTTOMRIGHT", -(mimi.gui.border.right + mimi.gui.listscroll.width),  mimi.gui.border.top*2)
      mimimaskframe:SetPoint("BOTTOMLEFT",  mimiextframe, "TOPLEFT",    0, mimi.gui.panelheight)
      mimimaskframe:SetPoint("BOTTOMRIGHT", mimiextframe, "TOPRIGHT",   -(mimi.gui.border.right + mimi.gui.listscroll.width), mimi.gui.panelheight)
      mimimaskframe:SetLayer(2)

      -- LIST CONTAINER FRAME
      local mimiframe =  UI.CreateFrame("Frame", "mimi_frame", mimimaskframe)
      mimiframe:SetAllPoints(mimimaskframe)
      mimiframe:SetLayer(2)

      -- INFO MASK FRAME
      local mimimaskinfo = UI.CreateFrame("Mask", "mimi_mask_info", mimiextframe)
      mimimaskinfo:SetPoint("TOPLEFT",     mimimaskframe, "BOTTOMLEFT",  0, mimi.gui.border.top)
      mimimaskinfo:SetPoint("TOPRIGHT",    mimimaskframe, "BOTTOMRIGHT", 0, mimi.gui.border.top)
      mimimaskinfo:SetPoint("BOTTOMLEFT",  mimimaskframe, "BOTTOMLEFT",  0, (mimi.gui.border.top + mimi.gui.infoheight))
      mimimaskinfo:SetPoint("BOTTOMRIGHT", mimimaskframe, "BOTTOMRIGHT", 0, (mimi.gui.border.top + mimi.gui.infoheight))
--       mimimaskinfo:SetBackgroundColor(1, 0, 0, .5)
      mimimaskinfo:SetLayer(2)

      -- INFO CONTAINER FRAME
      local mimiinfoframe =  UI.CreateFrame("Frame", "mimi_info_frame", mimimaskinfo)
      mimiinfoframe:SetAllPoints(mimimaskinfo)
      mimiinfoframe:SetLayer(2)

         -- Minion Name Field
         local miminame  =  UI.CreateFrame("Text", "mimi_name", mimiinfoframe)
         -- Name in nicer without monospace fonts
         -- miminame:SetFont(mimi.addon, mimi.gui.font.face)
         miminame:SetFontSize(mimi.gui.font.size * 2)
         miminame:SetFontColor(1, 1, 0, .4)
         miminame:SetLayer(3)
         miminame:SetPoint("TOPLEFT",  mimiinfoframe, "TOPLEFT",   mimi.gui.border.left,  0)
         miminame:SetPoint("TOPRIGHT", mimiinfoframe, "TOPRIGHT", -mimi.gui.border.right, 0)
         mimi.gui.name  =  miminame

         -- Icons Field
         local iconframe =  UI.CreateFrame("Frame", "mimi_info_iconframe_frame_", mimiinfoframe)
         iconframe:SetHeight(mimi.gui.font.size)
         iconframe:SetPoint("TOPLEFT",    miminame,   "BOTTOMLEFT",  0, mimi.gui.border.top)
         iconframe:SetPoint("TOPRIGHT",   miminame,   "BOTTOMRIGHT", 0, mimi.gui.border.top)
         mimi.gui.iconframe   =  iconframe

         -- Obtained Field
         local mimiobtained  =  UI.CreateFrame("Text", "mimi_info_obtained", mimiinfoframe)
         mimiobtained:SetFontSize(mimi.gui.font.size)
         mimiobtained:SetFont(mimi.addon, mimi.gui.font.face)
         mimiobtained:SetLayer(3)
         mimiobtained:SetPoint("TOPLEFT",    iconframe,   "BOTTOMLEFT",  0, mimi.gui.border.top)
         mimiobtained:SetPoint("TOPRIGHT",   iconframe,   "BOTTOMRIGHT", 0, mimi.gui.border.top)
         mimi.gui.obtained =  mimiobtained

         -- Detail Field
         local mimidetail  =  UI.CreateFrame("Text", "mimi_info_detail", mimiinfoframe)
         mimidetail:SetFontSize(mimi.gui.font.size)
         mimidetail:SetFont(mimi.addon, mimi.gui.font.face)
         mimidetail:SetLayer(3)
         mimidetail:SetPoint("TOPLEFT",  mimiobtained,  "BOTTOMLEFT", 0, mimi.gui.border.top)
         mimidetail:SetPoint("BOTTOMRIGHT",  mimiinfoframe,  "BOTTOMRIGHT", 0, -mimi.gui.border.bottom)
         mimidetail:SetWordwrap(true)
--          mimidetail:SetBackgroundColor(0, 1, 0, .5)
         mimi.gui.detail   =  mimidetail

      -- ITEMS SCROLLBAR
      mimilistscroll = UI.CreateFrame("RiftScrollbar","mimi_scrollbar", mimiextframe)
      mimilistscroll:SetVisible(true)
      mimilistscroll:SetEnabled(true)
      mimilistscroll:SetOrientation("vertical")
      mimilistscroll:SetWidth(mimi.gui.listscroll.width)
      mimilistscroll:SetLayer(2)
      mimilistscroll:SetPoint("TOPRIGHT",     mimititleframe,   "BOTTOMRIGHT", 0, mimi.gui.border.top)
      mimilistscroll:SetPoint("BOTTOMRIGHT",  mimiextframe,     "TOPRIGHT",    0, mimi.gui.panelheight)
      mimilistscroll:EventAttach(   Event.UI.Scrollbar.Change,
                                    function()
                                       local pos = mimi.round(mimilistscroll:GetPosition())
                                       if pos ~= mimi.gui.listscroll.lastpos then
                                          if pos == 1 then
                                             mimiframe:SetAllPoints(mimimaskframe)
                                          else
                                             mimi.gui.listscroll.lastpos =  pos
                                             local newy  =  -math.floor(mimi.gui.listeleheight * pos)
                                             mimiframe:SetPoint("TOPLEFT", mimimaskframe, "TOPLEFT", 0, newy )
                                          end
                                       end
                                    end,
                                    "TotalsFrame_Scrollbar.Change"
                                 )

      -- ITEMS INFO SCROLLBAR
      mimiinfoscroll = UI.CreateFrame("RiftScrollbar","mimi_info_scrollbar", mimiextframe)
      mimiinfoscroll:SetVisible(true)
      mimiinfoscroll:SetEnabled(true)
      mimiinfoscroll:SetOrientation("vertical")
      mimiinfoscroll:SetWidth(mimi.gui.infoscroll.width)
      mimiinfoscroll:SetLayer(2)
      mimiinfoscroll:SetPoint("TOPRIGHT",     mimimaskframe,   "BOTTOMRIGHT",  mimi.gui.infoscroll.width, mimi.gui.border.top)
      mimiinfoscroll:SetPoint("BOTTOMRIGHT",  mimimaskframe,   "BOTTOMRIGHT",  mimi.gui.infoscroll.width, mimi.gui.border.top + mimi.gui.infoheight)
      mimiinfoscroll:EventAttach(   Event.UI.Scrollbar.Change,
                                    function()
                                       local pos = mimi.round(mimiinfoscroll:GetPosition())
--                                        print("POS ("..pos..")")
                                       if pos ~= mimi.gui.infoscroll.lastpos then
                                          if pos == 1 then
                                             mimiinfoframe:SetAllPoints(mimimaskinfo)
--                                              print("POS is 1!")
                                          else
                                             mimi.gui.infoscroll.lastpos =  pos
                                             local newy        =  -math.floor(mimi.gui.font.size * pos)
                                             mimiinfoframe:SetPoint("TOPLEFT", mimimaskinfo, "TOPLEFT", 0, newy )
                                          end
                                       end
                                    end,
                                 "mimi_info_Scrollbar.Change"
                                 )

      -- Status Frame
      local mimistatusframe =  UI.CreateFrame("Frame", "mimi_status_frame", mimiextframe)
      mimistatusframe:SetPoint("TOPLEFT",     mimiinfoframe, "BOTTOMLEFT",  0,   mimi.gui.border.top)
      mimistatusframe:SetPoint("TOPRIGHT",    mimiinfoframe, "BOTTOMRIGHT", 0,   mimi.gui.border.top)
      mimistatusframe:SetPoint("BOTTOMLEFT",  mimiextframe,  "BOTTOMLEFT",  mimi.gui.border.left, -mimi.gui.border.bottom)
      mimistatusframe:SetPoint("BOTTOMRIGHT", mimiinfoframe, "BOTTOMRIGHT", -mimi.gui.border.right, -mimi.gui.border.bottom)
      mimistatusframe:SetLayer(1)
      mimistatusframe:SetBackgroundColor(.1, .1, .1, .5)

         local mimistatusmissinglabel =  UI.CreateFrame("Text", "mimi_status_missing_label", mimistatusframe)
         mimistatusmissinglabel:SetFont(mimi.addon, mimi.gui.font.face)
         mimistatusmissinglabel:SetText("Missing: ")
         mimistatusmissinglabel:SetFontColor(1, 1, 0, .4)
         mimistatusmissinglabel:SetPoint("TOPLEFT",     mimistatusframe, "TOPLEFT")
         mimistatusmissinglabel:SetLayer(2)

         local mimistatusmissing  =  UI.CreateFrame("Text", "mimi_status_missing_counter", mimistatusframe)
         mimistatusmissing:SetPoint("TOPLEFT",     mimistatusmissinglabel, "TOPRIGHT")
         mimistatusmissing:SetFont(mimi.addon, mimi.gui.font.face)
         mimistatusmissing:SetFontColor(1, 1, 0, .4)
         mimistatusmissing:SetText("0")
         mimistatusmissing:SetLayer(2)
         mimi.gui.missing        =  mimistatusmissing

         local mimistatuscollected   =  UI.CreateFrame("Text", "mimi_status_collected_counter", mimistatusframe)
         mimistatuscollected:SetPoint("TOPRIGHT",     mimistatusframe, "TOPRIGHT")
         mimistatuscollected:SetFont(mimi.addon, mimi.gui.font.face)
         mimistatuscollected:SetFontColor(1, 1, 0, .4)
         mimistatuscollected:SetText("0")
         mimistatuscollected:SetLayer(2)
         mimi.gui.collected         =  mimistatuscollected

         local mimistatuscollectedlabel =  UI.CreateFrame("Text", "mimi_status_collected_label", mimistatusframe)
         mimistatuscollectedlabel:SetFont(mimi.addon, mimi.gui.font.face)
         mimistatuscollectedlabel:SetText("Collected: ")
         mimistatuscollectedlabel:SetFontColor(1, 1, 0, .4)
         mimistatuscollectedlabel:SetPoint("TOPRIGHT",     mimistatuscollected, "TOPLEFT", -mimi.gui.border.right, 0)
         mimistatuscollectedlabel:SetLayer(2)


   -- Enable Dragging
   Library.LibDraggable.draggify(mimiwin, mimi.updateguicoordinates)

   return mimiwin, mimiframe, mimiinfoframe, mimilistscroll, mimiinfoscroll
end


function mimi.showdetail(minionname)
   mimi.gui.name:SetText("")
   mimi.gui.name:SetText(minionname)
   --
   buildiconstripextended(mimi.gui.iconframe, minionname, mimi.db.minions[minionname])
   --
   mimi.gui.obtained:SetText("")
   mimi.gui.obtained:SetText(mimi.db.minions[minionname].obtained)
   --
--    local h        =  mimi.gui.info:GetHeight()
--    local perframe =  mimi.round(h / mimi.gui.font.size)
--    local cnt   =  select(2, mimi.db.minions[minionname].details:gsub('\n', '\n'))
--    local scrollsteps =  (cnt - perframe) + mimi.gui.font.size
--    print("lines ("..cnt..") perframe ("..perframe..") scrollsteps ("..scrollsteps..")")
--    mimi.gui.infoscroll.obj:SetRange(1, scrollsteps)
   --
   mimi.gui.detail:SetText("")
   mimi.gui.detail:SetText(mimi.db.minions[minionname].details)

   return
end

local function createline(number, minionname, miniontbl, mimiframe)

   local missingframe   =  UI.CreateFrame("Frame", "mimilineframe", mimiframe)
   missingframe:SetHeight(mimi.gui.font.size*2)
   missingframe:EventAttach(Event.UI.Input.Mouse.Left.Click, function() mimi.showdetail(minionname) end, "Show/Hide Pressed" )
   missingframe:SetBackgroundColor(.0, .0, .0, .4)

   local num           =  UI.CreateFrame("Text", "missingminionnum",   missingframe)
   num:SetFont(mimi.addon, mimi.gui.font.face)
   num:SetFontSize(mimi.gui.font.size)
   num:SetWidth(mimi.gui.font.size*3)
   num:SetText(string.format("%s", number))
   num:SetLayer(3)
   num:SetPoint("TOPLEFT",   missingframe, "TOPLEFT")

   local mname           =  UI.CreateFrame("Text", "missingminionmname",   missingframe)
   mname:SetFont(mimi.addon, mimi.gui.font.face)
   mname:SetFontSize(mimi.gui.font.size)
   mname:SetWidth(mimi.gui.font.size*10)
   mname:SetText(string.format("%s", minionname))
   mname:SetLayer(3)
   mname:SetPoint("TOPLEFT",   num, "TOPRIGHT", mimi.gui.font.size, 0)

   local iconframe =  UI.CreateFrame("Frame", "mimi_iconframe_frame_"..minionname, missingframe)
   iconframe:SetHeight(mimi.gui.font.size)
   iconframe:SetWidth(mimi.gui.font.size*6)
   iconframe:SetPoint("TOPLEFT",  mname, "TOPRIGHT",   mimi.gui.border.left, 0)
   local iconstrip = buildiconstrip(iconframe, minionname, miniontbl)
   if iconstrip then iconstrip:SetPoint("TOPLEFT",   iconframe, "TOPLEFT", mimi.gui.font.size, 0) end

   local obtained       =  UI.CreateFrame("Text", "missingminionobtained",   missingframe)
   obtained:SetFont(mimi.addon, mimi.gui.font.face)
   obtained:SetFontSize(mimi.gui.font.size)
   obtained:SetText(string.format("%s", miniontbl.obtained))
   obtained:SetLayer(3)
   obtained:SetPoint("TOPLEFT",   iconframe, "TOPRIGHT", mimi.gui.font.size, 0)

--    local details       =  UI.CreateFrame("Text", "missingminiondetails",   missingframe)
--    details:SetFontSize(mimi.gui.font.size)
--    details:SetText(string.format("%s", miniontbl.details))
--    details:SetLayer(3)
--    details:SetPoint("TOPLEFT",   obtained, "TOPRIGHT", mimi.gui.font.size, 0)


   return(missingframe)
end


local function populatemissinglist(missingtbl, sorttable, mimiframe)

   local lastline =  nil
   local cnt      =  0
   for _, name in pairs(sorttable) do
      cnt = cnt + 1
--       print(string.format("name=%s tbl=%s", name, missingtbl[name]))
      local line = createline(cnt, name, missingtbl[name], mimiframe)
      if not mimi.gui.listeleheight  then
         mimi.gui.listeleheight  =  line:GetHeight()
      end

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
   local outofdb        =  {}
   local outofdbno      =  0
   local minions        =  Inspect.Minion.Minion.List()
   local found          =  false
   local missingtbl     =  {}

   -- count collected and look for unknown minions
   for id, _ in pairs(minions) do
      collected = collected + 1

--       print(string.format("Name is >%s<", name))
      local t        =  Inspect.Minion.Minion.Detail(id)
      local myname   =  t.name
      local rarity   =  t.rarity

      -- DEBUG DUMPING - begin
      mimi.db.id[myname]   =  id
      if rarity   then  mimi.db.rarity[myname]  =  rarity   end
      -- DEBUG DUMPING - end

      if not mimi.db.minions[myname] then
         outofdbno   =  outofdbno + 1
         table.insert(outofdb, myname)
      end
   end

   for name, tbl in pairs(mimi.db.minions) do
      total = total + 1
      for id, _ in pairs(minions) do
         if (id) then
            local detail = Inspect.Minion.Minion.Detail(id)
            if name == detail.name then
               found = true
               break
            end
         end
      end

      if not found then
         missing   = missing   + 1
         missingtbl[name] = tbl
      end
      found =  false
   end

   local mimiwin, mimiframe, mimiinfoframe, mimilistscroll, mimiinfoscroll = createwindow()
   mimi.gui.winobj         =  mimiwin
   mimi.gui.frame          =  mimiframe
   mimi.gui.info           =  mimiinfoframe
   mimi.gui.listscroll.obj =  mimilistscroll
   mimi.gui.infoscroll.obj =  mimiinfoscroll

   -- sort missingtbl by Alphabetic Order
   local s     =  {}
   local a, b  =  nil, nil
   for a, b in pairs(missingtbl) do table.insert(s, a) end
   table.sort(s)

   populatemissinglist(missingtbl, s, mimiframe)

   local h           =  mimiframe:GetHeight()
   local perframe    =  mimi.round(h / mimi.gui.listeleheight)
   local scrollsteps =  (missing - perframe) + 1
   mimi.gui.listscroll.obj:SetRange(1, scrollsteps)

--    print(string.format("MiMi Total: %s, Collected: %s, Missing: %s OutofDb: %s", total, collected, missing, outofdbno))
--
--    mimi.gui.missing:SetText(missing)
--    mimi.gui.collected:SetText(collected)

   if (#outofdb > 0) then for _, myname in pairs(outofdb) do print(string.format("  outofdb: %s", myname)) end end

   return missing, collected, outofdbno, outofdb
end

Command.Event.Attach(Event.Addon.SavedVariables.Load.End,   mimi.loadvariables,   "MiMi: Load Variables")
Command.Event.Attach(Event.Addon.SavedVariables.Save.Begin, mimi.savevariables,   "MiMi: Load Variables")
Command.Event.Attach(Event.Unit.Availability.Full, function() mimi.gui.mmbtnobj =  mimi.createminimapbutton() end, "MiMi: mimimap Button")
