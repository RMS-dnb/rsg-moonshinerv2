local Translations = {
    error = {
        something_went_wrong = 'something went wrong!',
        dont_have_animal = "don't have an animal on you",
        you_already_have_objects_down = 'You already have %{MaxPlantCount} objects down',
        you_dont_have_the_ingredients_to_make_this = 'You Dont Have The Ingredients To Make This',
        your_moonshine_still_has_been_dismantled = 'Your Moonshine Still Has Been Dismantled'
    },

    success = {
        you_made_some_moonshine = 'You made some moonshine',
        you_made_some_moonshine_mash = 'You made some moonshine mash',
    },
    primary = {
        var = 'text goes here',
    },
    menu = {
        close_menu = 'Close Menu',
        mash_menu = 'Mash Menu',

    },

    commands = {
        var = 'text goes here',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
