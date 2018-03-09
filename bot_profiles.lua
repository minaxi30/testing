
local nk = require("nakama")
  local colors = require ("ansicolors")
------------
-- A module which consist of update / fetch bots profiles
-- @module bot_profiles



local function update_bots_profile(context, payload)
	local record = {
	  Bucket = "rcb2",
	  Collection = "configuration",
	  Record = "bots_config",
	  UserId = nil,
	  Value = payload,
	  PermissionRead = 2,
	  PermissionWrite = 0,
	  --Version = "*"       -- only write record if it does not already exist.
	}

 local status , result = pcall(nk.storage_write, { record }) 
 if not status then 
 	error("storage_failed")
 end	
end

nk.register_http(update_bots_profile, "bots_profile.update_bots_profile")
