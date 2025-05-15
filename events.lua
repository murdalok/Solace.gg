function SolaceGG.OnEvent(self, event, ...)
    if event == "CHAT_MSG_GUILD" then
      local msg, sender = ...
      SolaceGG.KeyData:KeyRespond(msg)
   else
      SolaceGG.KeyData:SaveKey()
   end
end