---
--- Network
---

util.AddNetworkString("PRSBOX.PlayerMessages")

local function SendPlyMessage( name, id )
    net.Start("PRSBOX.PlayerMessages")
        net.WriteString(name)
        net.WriteUInt(id, 2)
    net.Broadcast()
end

hook.Add("PlayerDisconnected", "PRSBOX.PlayerMessages.Leave", function(ply)
    SendPlyMessage( ply:Nick(), 1 ) 
end)

hook.Add("PlayerConnect", "PRSBOX.PlayerMessages.Join", function(name)
    SendPlyMessage( name, 2 ) 
end)

hook.Add("PlayerFullLoad", "PRSBOX.PlayerMessages.PlayerFullLoad", function(ply)
    SendPlyMessage( ply:Nick(), 3 ) 
end)
