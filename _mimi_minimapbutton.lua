--
-- Addon       _mimi_minimapbutton.lua
-- Author      marcob@marcob.org
-- StartDate   09/09/2017
--

local addon, mimi = ...

function mimi.showhidewindow(params)
   if not mimi.gui.winobj then mimi.searchformissing() end

   if mimi.gui.visible == true   then  mimi.gui.visible   =  false
                                 else  mimi.gui.visible   =  true
   end

   mimi.gui.winobj:SetVisible(mimi.gui.visible)

   return
end


function mimi.createminimapbutton()

   -- avoid creating multiple minimap buttons...
   if not mimi.gui.mmbtnobj then
      --       print(string.format("mimi.createMiniMapButton: mimi.gui.mmbtnobj=%s", mimi.gui.mmbtnobj))

      --Global context (parent frame-thing).
      mmbtncontext = UI.CreateContext("button_context")

--       mmbuttonframe  = UI.CreateFrame("Frame", "mimi_mmBtnFrame", mmbtncontext)
--       mmbuttonframe:SetHeight(mimi.gui.mmbtnheight)
--       mmbuttonframe:SetWidth(mimi.gui.mmbtnwidth)
--       mmbuttonframe:SetLayer(0)

      -- MiniMapButton Border
      mmbuttonborder = UI.CreateFrame("Texture", "mimi_mmBtnIconBorder", mmbtncontext)
--       mmbuttonborder = UI.CreateFrame("Texture", "mimi_mmBtnIconBorder", mmbuttonframe)
      mmbuttonborder:SetTexture("Rift", "icon_border.dds")
--       mmbuttonborder:SetTexture("Rift", "loot_gold_coins.dds")
--       mmbuttonborder:SetHeight(mimi.gui.mmbtnheight)
--       mmbuttonborder:SetWidth(mimi.gui.mmbtnwidth)
      mmbuttonborder:SetLayer(1)
      mmbuttonborder:EventAttach(Event.UI.Input.Mouse.Left.Click, function() mimi.showhidewindow() end, "Show/Hide Pressed" )

      print(string.format("mimi.gui.mmbtnx=%s mimi.gui.mmbtny=%s", mimi.gui.mmbtnx, mimi.gui.mmbtny))
      if mimi.gui.mmbtnx == nil or mimi.gui.mmbtny == nil then
         -- first run, we position in the screen center
         mmbuttonborder:SetPoint("CENTER", UIParent, "CENTER")
      else
         -- we have coordinates
         mmbuttonborder:SetPoint("TOPLEFT", UIParent, "TOPLEFT", mimi.gui.mmbtnx, mimi.gui.mmbtny)
      end

      -- MiniMapButton Icon
      mmbutton = UI.CreateFrame("Texture", "mimi_mmBtnIcon", mmbuttonborder)
      mmbutton:SetTexture("Rift", "Minion_1158.dds")
      mmbutton:SetLayer(1)
      mmbutton:SetPoint("TOPLEFT",     mmbuttonborder, "TOPLEFT",      12, 12)
      mmbutton:SetPoint("BOTTOMRIGHT", mmbuttonborder, "BOTTOMRIGHT", -12, -12)

      mimi.gui.mmbtnobj   =  mmbuttonborder
   else
      mmbutton = mimi.gui.mmbtnobj
   end

   Library.LibDraggable.draggify(mimi.gui.mmbtnobj, mimi.updateguicoordinates)

   return mmbutton
end
