seconds_to_remove_corpse = 1
hook.Add(
  "CreateClientsideRagdoll",
  "ZINV_Cleanup_Corpse",
  function(entity, ragdoll)
    if entity:GetNWBool("ZINV_RemoveCorpse", false) ~= true then return end
    local owner = entity:GetOwner()
    if IsValid(owner) and not owner:GetNWBool("ZINV_RemoveCorpse", false) then return end
    timer.Simple(
      seconds_to_remove_corpse,
      function()
        if not IsValid(ragdoll) then return end
        ragdoll:SetSaveValue("m_bFadingOut", true)
      end
    )
  end
)
