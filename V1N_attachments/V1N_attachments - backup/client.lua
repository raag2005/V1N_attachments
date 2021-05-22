--[[
────────────────────────────────────────────────────────────────────────────────
─██████──██████─████████───██████──────────██████─████████████───██████████████─
─██░░██──██░░██─██░░░░██───██░░██████████──██░░██─██░░░░░░░░████─██░░░░░░░░░░██─
─██░░██──██░░██─████░░██───██░░░░░░░░░░██──██░░██─██░░████░░░░██─██░░██████████─
─██░░██──██░░██───██░░██───██░░██████░░██──██░░██─██░░██──██░░██─██░░██─────────
─██░░██──██░░██───██░░██───██░░██──██░░██──██░░██─██░░██──██░░██─██░░██████████─
─██░░██──██░░██───██░░██───██░░██──██░░██──██░░██─██░░██──██░░██─██░░░░░░░░░░██─
─██░░██──██░░██───██░░██───██░░██──██░░██──██░░██─██░░██──██░░██─██████████░░██─
─██░░░░██░░░░██───██░░██───██░░██──██░░██████░░██─██░░██──██░░██─────────██░░██─
─████░░░░░░████─████░░████─██░░██──██░░░░░░░░░░██─██░░████░░░░██─██████████░░██─
───████░░████───██░░░░░░██─██░░██──██████████░░██─██░░░░░░░░████─██░░░░░░░░░░██─
─────██████─────██████████─██████──────────██████─████████████───██████████████─
────────────────────────────────────────────────────────────────────────────────
Discord: V1NDs#0977
Steam: http://steamcommunity.com/id/V1NDs
Youtube: https://www.youtube.com/channel/UCaBZGvYryg09IS-uaSHyfPw
Github: https://github.com/V1NDs
]]--

--==vRP connection==--
local vRP = Proxy.getInterface("vRP")
--===================================--

--==Events==--
RegisterNetEvent("V1N_attachments:equipComponent", function(item)
    for k,v in pairs(cfg.attachments) do
        if cfg.attachments[k].itemName == item then
            local components = cfg.attachments[k].components
            for k,v in pairs(components) do
                local hashKey = GetSelectedPedWeapon(GetPlayerPed(-1))
                if DoesWeaponTakeWeaponComponent(hashKey, GetHashKey(v)) then
                    if not HasPedGotWeaponComponent(GetPlayerPed(-1), hashKey, GetHashKey(v)) then
                        GiveWeaponComponentToPed(PlayerPedId(), hashKey, GetHashKey(v))
                        vRP.notify({'~b~Du satte en '..item:lower()..' på dit våben'})
                    else
                        RemoveWeaponComponentFromPed(PlayerPedId(), hashKey, GetHashKey(v))
                        vRP.notify({'~b~Du tog en '..item:lower()..' af dit våben'})
                    end
                end
            end
        end
    end
end)
--===================================--