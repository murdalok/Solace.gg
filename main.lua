--Globals defined here
SolaceGG = SolaceGG or {}
SolaceGG.KeyData = SolaceGG.KeyData or {}

--event listening frame
local eventFrame = CreateFrame("EventFrame")
eventFrame:RegisterEvent("CHAT_MSG_GUILD")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("CHALLENGE_MODE_COMPLETED")
eventFrame:SetScript("OnEvent", function(self, event, ...)
   if SolaceGG.OnEvent then
      SolaceGG.OnEvent(self, event, ...)
   end
end)