--event listening frame
-- listens for events registered below and calls methods depending on what events were caught
SolaceGG.Frame = CreateFrame("Frame")
SolaceGG.Frame:RegisterEvent("CHAT_MSG_GUILD")
SolaceGG.Frame:RegisterEvent("PLAYER_ENTERING_WORLD")
SolaceGG.Frame:RegisterEvent("CHALLENGE_MODE_COMPLETED")
SolaceGG.Frame:SetScript("OnEvent", function(self, event, ...)
   if event == "CHAT_MSG_GUILD" then
      local msg, sender = ...
      print("Player key data exists:", SolaceSavedKey[SolaceGG.Player] ~= nil)
      print(string.format("Message event caught: %s", msg))
      SolaceGG:KeyRespond(msg)
   else
      SolaceGG:SaveKey()
   end
end)
