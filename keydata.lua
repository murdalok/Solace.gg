-- SolaceGG.KeyData = {} defined in main.lua

local function getUniqueName()
   local name = UnitName("player")
   local realm = GetRealmName()
   return string.format("%s-%s", name, realm)
end

local player = getUniqueName()

function SolaceGG.KeyData:SaveKey()
   local mapID = C_MythicPlus.GetOwnedKeystoneChallengeMapID()
   local keyLevel = C_MythicPlus.GetOwnedKeystoneLevel()
   if mapID and keyLevel then
      local mapName = C_ChallengeMode.GetMapUIInfo(mapID)
      local keydata = {}
      keydata.character = player
      keydata.realm = GetRealmName()
      keydata.mapId = mapID
      keydata.mapName = mapName
      keydata.keyLevel = keyLevel
      self[player] = keydata
   end
end

function SolaceGG.KeyData:KeyRespond(msg)
   if  self[player] and msg:lower():find("@keys") then
      local response = string.format("%d - %s", self[player].keyLevel, self[player].mapName)
      SendChatMessage(response, "GUILD")
    end
end
