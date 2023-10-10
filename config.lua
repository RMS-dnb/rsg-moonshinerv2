Config = {}
Config = Config or {}
Config.PlayerProps = {}

-- settings
Config.Prop = 'p_still04x' -- prop used for the moonshine
Config.LawJobName = 'police' -- job that can distroy moonshines
Config.BrewTime = 30000 -- brewtime in milliseconds
-- settings
Config.MenuKeybind          = 'J'
Config.MaxPropCount         = 5 -- maximum props
Config.MaintenancePerCycle  = 1 -- $ amount for prop maintenance
Config.PurgeStorage         = true
Config.BillingCycle         = 1 -- will remove credit every x hour/s
Config.ServerNotify         = true

-- blacksmith crafting
Config.MoonshineCrafting = {

    -- tools
    {
        title =  'Moonshine Mash',
        
        

        ingredients = { 
            [1] = { item = "water", amount = 1 },
            [2] = { item = "sugar",  amount = 1 },
            [3] = { item = "corn",  amount = 1 },
        },
      
    },


}
