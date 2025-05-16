-- SolaceGG.KeyData = {} defined in main.lua

function SolaceGG:SaveKey()
   -- This method will write a new subtable [Player-Realm] to SolaceGG.KeyData
   -- or update the table if it exists already
   local mapID = C_MythicPlus.GetOwnedKeystoneChallengeMapID()
   local keyLevel = C_MythicPlus.GetOwnedKeystoneLevel()
   if mapID and keyLevel then
      local mapName = C_ChallengeMode.GetMapUIInfo(mapID)
      local keydata = {}
      keydata.character = SolaceGG.Player
      keydata.realm = GetRealmName()
      keydata.mapId = mapID
      keydata.mapName = mapName
      keydata.keyLevel = keyLevel
      SolaceSavedKey[SolaceGG.Player] = keydata
   end
end

function SolaceGG:KeyRespond(msg)
   -- Responds to @keys in guild chat with the players current key, will respond regardless of sender
   if SolaceSavedKey[SolaceGG.Player] and msg:lower():find("@keys") then
      local response = string.format("%d - %s", SolaceSavedKey[SolaceGG.Player].keyLevel, SolaceSavedKey[SolaceGG.Player].mapName)
      SendChatMessage(response, "GUILD")
   end
end
