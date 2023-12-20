--[[
NOTE

If I declare local function/variable here, it won't be detected in other files even if this file is included via 'include()'.
Declare this file as module, or define function/variable as global to use them in other files.
]]
function CheckSAdmin(target)
  return IsValid(target) and target:IsPlayer() and target:IsUserGroup("superadmin")
end

function CheckSAdminConsole(target)
  return target == NULL or not CheckSAdmin(target)
end

function GetTraceEntity(ply)
  local tr = util.GetPlayerTrace(ply)
  tr.mask = bit.bor(CONTENTS_SOLID, CONTENTS_MOVEABLE, CONTENTS_MONSTER, CONTENTS_WINDOW, CONTENTS_DEBRIS, CONTENTS_GRATE, CONTENTS_AUX)
  local trace = util.TraceLine(tr)
  if trace.Hit then return trace.Entity end
end

function HasValue(tbl, val)
  for k, v in ipairs(tbl) do
    if v == val then return true end
  end

  return false
end

function MsgTo(target, msg)
  if target == NULL then
    MsgN(msg)
  elseif IsValid(target) and target:IsPlayer() then
    target:ChatPrint(msg)
  end
end

function GetPlayerByName(name)
  for _, p in ipairs(player.GetHumans()) do
    if string.lower(p:GetName()) == name then return p end
  end

  return nil
end
