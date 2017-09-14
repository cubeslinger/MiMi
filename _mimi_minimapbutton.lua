--
-- Addon       _mimi_minimapbutton.lua
-- Author      marcob@marcob.org
-- StartDate   09/09/2017
--

local addon, mimi = ...

function mimi.showhidewindow(visible)

   if not mimi.gui.winobj then

--       mimi.job_search()
      mimi.searchformissing()
--       corout(mimi.searchformissing, "Corout mimi.searchformissing")
      visible  =  true
   end

   if visible then
      mimi.gui.visible   =  true
   else
      mimi.gui.visible  =  (not mimi.gui.winobj:GetVisible())
--       if mimi.gui.visible == true   then  mimi.gui.visible   =  false
--                                     else  mimi.gui.visible   =  true
--       end
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

      -- MiniMapButton Icon
      mmbutton = UI.CreateFrame("Texture", "mimi_mmBtnIcon", mmbtncontext)
      --       mmbutton:SetTexture("Rift", "Minion_I15B.dds")
      mmbutton:SetTexture("Rift", "Icon_Dominion_sm.png.dds")
      mmbutton:SetLayer(2)
      mmbutton:SetHeight(mimi.gui.mmbtnheight)
      mmbutton:SetWidth(mimi.gui.mmbtnwidth)
      mmbutton:EventAttach(Event.UI.Input.Mouse.Left.Click, function() mimi.showhidewindow() end, "Show/Hide Pressed" )

      if mimi.gui.mmbtnx == nil or mimi.gui.mmbtny == nil then
         -- first run, we position in the screen center
         mmbutton:SetPoint("CENTER", UIParent, "CENTER")
      else
         -- we have coordinates
         mmbutton:SetPoint("TOPLEFT", UIParent, "TOPLEFT", mimi.gui.mmbtnx, mimi.gui.mmbtny)
      end

      mimi.gui.mmbtnobj   =  mmbutton
   else
      mmbutton = mimi.gui.mmbtnobj
   end

   Library.LibDraggable.draggify(mimi.gui.mmbtnobj, mimi.updateguicoordinates)

   return mmbutton
end
