-- As of now main.lua is for defining globals that must be loaded before the files that depend on them
SolaceGG = {}
SolaceSavedKey =  SolaceSavedKey or {}
SolaceGG.Player = string.format("%s-%s", UnitName("Player"), GetRealmName())
