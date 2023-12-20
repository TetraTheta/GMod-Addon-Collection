hook.Add("EntityEmitSound", "DecreaseSound", function(t)
  -- Called only when Hunter dies from bullet (not combine ball or crush)
  if t["OriginalSoundName"] == "NPC_Hunter.Death" then
    t["Volume"] = t["Volume"] * 0.5
  end
  if t["OriginalSoundName"] == "solidmetal.bulletimpact" then
    t["Volume"] = t["Volume"] * 0.5
  end
  -- Print debug
  if not t["Entity"]:IsRagdoll() then
    PrintTable(t)
  end
  return true
end)
