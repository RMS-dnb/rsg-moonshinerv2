local RSGCore = exports['rsg-core']:GetCoreObject()

local CoolDown = 0
local SpawnedProps = {}
local isBusy = false
local PlayerGang = {}
local isBusy = false
local moonshinemashkit = 0
isLoggedIn = false
PlayerJob = {}


local RSGCore = exports['rsg-core']:GetCoreObject()


-------------------------------------

-- mix moonshine mash
RegisterServerEvent('rsg-moonshinemash:server:givemoonshinemash')
AddEventHandler('rsg-moonshinemash:server:givemoonshinemash', function(amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if amount == 1 then
       
        Player.Functions.RemoveItem('corn', 1)
        Player.Functions.RemoveItem('water', 1)
		Player.Functions.RemoveItem('sugar', 1)
        Player.Functions.AddItem('moonshinemash', 1)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['moonshinemash'], "add")
        RSGCore.Functions.Notify(src, Lang:t('success.you_made_some_moonshine_mash'), 'success')
    else
        RSGCore.Functions.Notify(src, Lang:t('error.something_went_wrong'), 'error')
        print('something went wrong with moonshinemash script could be exploit!')
    end
end)