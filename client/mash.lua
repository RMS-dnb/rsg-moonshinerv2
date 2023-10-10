local RSGCore = exports['rsg-core']:GetCoreObject()
local GangCampGroup = GetRandomIntInRange(0, 0xffffff)
local CoolDown = 0
local SpawnedProps = {}
local isBusy = false
local PlayerGang = {}
local isBusy = false
local moonshinemashkit = 0
isLoggedIn = false
PlayerJob = {}


RegisterNetEvent('RSGCore:Client:OnPlayerLoaded')
AddEventHandler('RSGCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = RSGCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('RSGCore:Client:OnJobUpdate')
AddEventHandler('RSGCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

function DrawText3Ds(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(9)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
end
----------------------------------------

--requirements

function HasRequirements(requirements)
    local found_requirements = {}
    local count = 0
    local missing = {}
    for i, require in ipairs(requirements) do
        if RSGCore.Functions.HasItem(require) then
            found_requirements[#found_requirements + 1] = require
            count = count + 1
        else
            missing[#missing + 1] = require
        end
    end

    if count == #requirements then
        return true
    elseif count == 0 then
        RSGCore.Functions.Notify("You are missing all of the requirements: " .. table.concat(missing, ", "), 'error')
        return false
    else
        RSGCore.Functions.Notify("You are missing the following requirements: " .. table.concat(missing, ", "), 'error')
        return false
    end
end

-- make moonshine mash
-- make moonshine mash
-- make moonshine mash
-- Make Moonshine Mash
-- Make Moonshine Mash
-- Make Moonshine Mash
AddEventHandler("rsg-moonshinemash:client:moonshinemash", function()
    if isBusy then
        return
    else
        local hasItems = HasRequirements({'corn', 'water', 'sugar'})
        if hasItems then
            isBusy = not isBusy
            Citizen.InvokeNative(0x239879FC61C610CC, smoke, 0.0, 0.0, 0.0, false)
            local player = PlayerPedId()
            local playerCoords = GetEntityCoords(player)

            Citizen.CreateThread(function()
                -- Start your animation here (the same animation as Moonshine)
                RSGCore.Functions.RequestAnimDict('script_common@shared_scenarios@kneel@mourn@female@a@base')
                TaskPlayAnimAdvanced(player, 'script_common@shared_scenarios@kneel@mourn@female@a@base', 'base', 
                    playerCoords.x, playerCoords.y, playerCoords.z, 0, 0, 0, 1.0, 1.0, Config.BrewTime, 1, 0, 0, 0)

                TriggerServerEvent('rsg-moonshinemash:server:startsmoke', playerCoords)

                -- Start the progress circle (the same animation as Moonshine)
                if lib.progressCircle({
                    duration = Config.BrewTime,
                    position = 'bottom',
                    label = 'Mixing up some mash...',
                    useWhileDead = false,
                    canCancel = false,
                    anim = {
                        dict = 'script_common@shared_scenarios@kneel@mourn@female@a@base',
                        clip = 'empathise_headshake_f_001',
                        flag = 15,
                    },
                    disableControl = true,
                    text = 'Mixing up some mash...',
                }) then
                    -- Give the player some moonshine mash immediately when the timer is done
                    TriggerServerEvent('rsg-moonshinemash:server:givemoonshinemash', 1)

                    -- Generate a random number between 0 and 1
                    local randomOdds = math.random()

                    -- Define a threshold for the police alert
                    local policeAlertThreshold = 0.5  -- Adjust this value as needed

                    -- Check if the random number is below the threshold
                    if randomOdds < policeAlertThreshold then
                        TriggerServerEvent('police:server:policeAlert', 'moonshine mash being made')
                    end

                    PlaySoundFrontend("SELECT", "RDRO_Character_Creator_Sounds", true, 0)
                    Citizen.InvokeNative(0x239879FC61C610CC, smoke, 1.0, 1.0, 1.0, false)
                    isBusy = not isBusy
                else
                    -- Handle cancellation or failure
                    RSGCore.Functions.Notify("Mixing mash canceled or failed.", 'error')
                end
            end)
        else
            RSGCore.Functions.Notify('You dont have the ingredients to make this')
        end
    end
end)





