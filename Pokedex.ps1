<#
national_number: The entry number of the Pokémon in the National Pokédex
gen: The numbered generation which the Pokémon was first introduced
english_name: The English name of the Pokémon
japanese_name: The Original Japanese name of the Pokémon
primary_type: The Primary Type of the Pokémon
secondary_type: The Secondary Type of the Pokémon
classification: The Classification of the Pokémon as described by the Sun and Moon or Sword and Shield Pokédex
percent_male: The percentage of the species that are male (Blank if the Pokémon is genderless)
percent_female: The percentage of the species that are female (Blank if the Pokémon is genderless)
height_m: Height of the Pokémon in metres
weight_kg: The Weight of the Pokémon in kilograms
capture_rate: Capture Rate of the Pokémon
base_egg_steps: The number of steps required to hatch an egg of the Pokémon
hp: The Base HP of the Pokémon
attack: The Base Attack of the Pokémon
defense: The Base Defense of the Pokémon
sp_attack: The Base Special Attack of the Pokémon
sp_defense: The Base Special Defense of the Pokémon
speed: The Base Speed of the Pokémon
abilities_*: Four features that denote abilities that the Pokémon is capable of having
against_*: Eighteen features that denote the amount of damage taken against an attack of a particular type
is_sublegendary: Denotes if the Pokémon is sublegendary
is_legendary: Denotes if the Pokémon is legendary
is_mythical: Denotes if the Pokémon is mythical
evochain_*: Seven features that indicate the evolutionary chain and triggers
gigantamax: Form of Pokémon if gigantamax capable
mega_evolution: Form of Pokémon if mega evolution capable
mega_evolution_alt: Alternative form of Pokémon if mega evolution capable
description: Pokédex description from official Pokémon website
#>

#region TODO
<#
ShowRandomPokemon
    Display all found pokemen and let user choose which pokeman to see information about.

SearchForPokemon
    Be able to search for by more than just EnglishName

ShowPokemonInfo
    Render an ASCII art image of the chosen pokeman

#>
#endregion

$CSVData = "$($PSScriptRoot)\pokemon.csv"
class Pokemon {
    #region Variable declarations
    [Int]$NationalNumber
    [Int]$Generation

    [String]$EnglishName
    [String]$JapaneseName

    [String]$PrimaryType
    [String]$SecondaryType

    [String]$Classification

    [Double]$PercentMale
    [Double]$PercentFemale

    [Double]$Height # Metric
    [Double]$Weight # Metric

    [Int]$CaptureRate
    [Int]$BaseEggSteps # Steps taken needed to hatch

    [Int]$HP
    [Int]$Attack
    [Int]$Defence
    [Int]$SpecialAttack
    [Int]$SpecialDefence
    [Int]$Speed

    [String]$Abilities0
    [String]$Abilities1
    [String]$Abilities2
    [String]$AbilitiesHidden

    [Double]$AgainstNormal
    [Double]$AgainstFire
    [Double]$AgainstWater
    [Double]$AgainstElectric
    [Double]$AgainstGrass
    [Double]$AgainstIce
    [Double]$AgainstFighting
    [Double]$AgainstPoison
    [Double]$AgainstGround
    [Double]$AgainstFlying
    [Double]$AgainstPsychic
    [Double]$AgainstBug
    [Double]$AgainstRock
    [Double]$AgainstGhost
    [Double]$AgainstDragon
    [Double]$AgainstDark
    [Double]$AgainstSteel
    [Double]$AgainstFairy

    [Int]$IsSublegendary
    [Int]$IsLegendary
    [Int]$IsMythical

    [String]$Evochain0 # First pokemon, unevolved. Eggs count as $Evochain0 as well
    [String]$Evochain1 # Condition for evolving first time
    [String]$Evochain2 # First evolution
    [String]$Evochain3 # Condition for evolving second time
    [String]$Evochain4 # Final evolution for non-egg pokemon
    [String]$Evochain5 # Condition for evolving
    [String]$Evochain6 # Final evolution for egg pokemon

    [String]$Gigantamax
    [String]$MegaEvolution
    [String]$MegaEvolutionAlt

    [String]$Description
    #endregion

    #region Class function declarations
    [Int]GetNationalNumber() {
        return "$($this.NationalNumber)"
    }
    [Int]GetGeneration() {
        return "$($this.Generation)"
    }
    [String]GetEnglishName() {
        return "$($this.EnglishName)"
    }
    [String]GetJapaneseName() {
        return "$($this.JapaneseName)"
    }
    [String]GetPrimaryType() {
        return "$($this.PrimaryType)"
    }
    [String]GetSecondaryType() {
        return "$($this.SecondaryType)"
    }
    [String]GetClassification() {
        return "$($this.Classification)"
    }
    [Double]GetPercentMale() {
        return "$($this.PercentMale)"
    }
    [Double]GetPercentFemale() {
        return "$($this.PercentFemale)"
    }
    [Double]GetHeight() {
        return "$($this.Height)"
    }
    [Double]GetWeight() {
        return "$($this.Weight)"
    }
    [Double]GetCaptureRate() {
        return "$($this.CaptureRate)"
    }
    [Int]GetBaseEggSteps() {
        return "$($this.BaseEggSteps)"
    }
    [Int]GetHP() {
        return "$($this.HP)"
    }
    [Int]GetAttack() {
        return "$($this.Attack)"
    }
    [Int]GetDefence() {
        return "$($this.Defence)"
    }
    [Int]GetSpecialAttack() {
        return "$($this.SpecialAttack)"
    }
    [Int]GetSpecialDefence() {
        return "$($this.SpecialDefence)"
    }
    [Int]GetSpeed() {
        return "$($this.Speed)"
    }
    [String]GetAbilities0() {
        return "$($this.Abilities0)"
    }
    [String]GetAbilities1() {
        return "$($this.Abilities1)"
    }
    [String]GetAbilities2() {
        return "$($this.Abilities2)"
    }
    [String]GetAbilitiesHidden() {
        return "$($this.AbilitiesHidden)"
    }
    [Double]GetAgainstNormal() {
        return "$($this.AgainstNormal)"
    }
    [Double]GetAgainstFire() {
        return "$($this.AgainstFire)"
    }
    [Double]GetAgainstWater() {
        return "$($this.AgainstWater)"
    }
    [Double]GetAgainstElectric() {
        return "$($this.AgainstElectric)"
    }
    [Double]GetAgainstGrass() {
        return "$($this.AgainstGrass)"
    }
    [Double]GetAgainstIce() {
        return "$($this.AgainstIce)"
    }
    [Double]GetAgainstFighting() {
        return "$($this.AgainstFighting)"
    }
    [Double]GetAgainstPoison() {
        return "$($this.AgainstPoison)"
    }
    [Double]GetAgainstGround() {
        return "$($this.AgainstGround)"
    }
    [Double]GetAgainstFlying() {
        return "$($this.AgainstFlying)"
    }
    [Double]GetAgainstPsychic() {
        return "$($this.AgainstPsychic)"
    }
    [Double]GetAgainstBug() {
        return "$($this.AgainstBug)"
    }
    [Double]GetAgainstRock() {
        return "$($this.AgainstRock)"
    }
    [Double]GetAgainstGhost() {
        return "$($this.AgainstGhost)"
    }
    [Double]GetAgainstDragon() {
        return "$($this.AgainstDragon)"
    }
    [Double]GetAgainstDark() {
        return "$($this.AgainstDark)"
    }
    [Double]GetAgainstSteel() {
        return "$($this.AgainstSteel)"
    }
    [Double]GetAgainstFairy() {
        return "$($this.AgainstFairy)"
    }
    [Int]GetIsSublegendary() {
        return "$($this.IsSublegendary)"
    }
    [Int]GetIsLegendary() {
        return "$($this.IsLegendary)"
    }
    [Int]GetIsMythical() {
        return "$($this.IsMythical)"
    }
    [String]GetEvochain0() {
        return "$($this.Evochain0)"
    }
    [String]GetEvochain1() {
        return "$($this.Evochain1)"
    }
    [String]GetEvochain2() {
        return "$($this.Evochain2)"
    }
    [String]GetEvochain3() {
        return "$($this.Evochain3)"
    }
    [String]GetEvochain4() {
        return "$($this.Evochain4)"
    }
    [String]GetEvochain5() {
        return "$($this.Evochain5)"
    }
    [String]GetEvochain6() {
        return "$($this.Evochain6)"
    }
    [String]GetGigantamax() {
        return "$($this.Gigantamax)"
    }
    [String]GetMegaEvolution() {
        return "$($this.MegaEvolution)"
    }
    [String]GetMegaEvolutionAlt() {
        return "$($this.MegaEvolutionAlt)"
    }
    [String]GetDescription() {
        return "$($this.Description)"
    }
    #endregion
}

$Pokedex = Import-CSV -Path $CSVData | ForEach-Object {
    [Pokemon]@{
        NationalNumber = $_.national_number
        Generation = $_.gen
        #
        EnglishName = $_.english_name
        JapaneseName = $_.japanese_name
        #
        PrimaryType = $_.primary_type
        SecondaryType = $_.secondary_type
        #
        Classification = $_.classification
        #
        PercentMale = $_.percent_male
        PercentFemale = $_.percent_female
        #
        Height = $_.height_m
        Weight = $_.weight_kg
        #
        CaptureRate = $_.capture_rate
        BaseEggSteps = $_.base_egg_steps
        #
        HP = $_.hp
        Attack = $_.attack
        Defence = $_.defence
        SpecialAttack = $_.specialAttack
        SpecialDefence = $_.specialDefence
        Speed = $_.speed
        #
        Abilities0 = $_.abilities_0
        Abilities1 = $_.abilities_1
        Abilities2 = $_.abilities_2
        AbilitiesHidden = $_.abilities_hidden
        #
        AgainstNormal = $_.against_normal
        AgainstFire = $_.against_fire
        AgainstWater = $_.against_water
        AgainstElectric = $_.against_electric
        AgainstGrass = $_.against_grass
        AgainstIce = $_.against_ice
        AgainstFighting = $_.against_fighting
        AgainstPoison = $_.against_poison
        AgainstGround = $_.against_ground
        AgainstFlying = $_.against_flying
        AgainstPsychic = $_.against_psychic
        AgainstBug = $_.against_bug
        AgainstRock = $_.against_rock
        AgainstGhost = $_.against_ghost
        AgainstDragon = $_.against_dragon
        AgainstDark = $_.against_dark
        AgainstSteel = $_.against_steel
        AgainstFairy = $_.against_fairy
        #
        IsSublegendary = $_.is_sublegendary
        IsLegendary = $_.is_legendary
        IsMythical = $_.is_ythical
        #
        Evochain0 = $_.evochain_0
        Evochain1 = $_.evochain_1
        Evochain2 = $_.evochain_2
        Evochain3 = $_.evochain_3
        Evochain4 = $_.evochain_4
        Evochain5 = $_.evochain_5
        Evochain6 = $_.evochain_6
        #
        Gigantamax = $_.gigantamax
        MegaEvolution = $_.mega_volution
        MegaEvolutionAlt = $_.mega_evolution_Alt
        #
        Description = $_.description
        #endregion
    }
}

$PokemonTypeColors = @{
    Normal = "White"
    Fire = "Red"
    Water = "Blue"
    Electric = "Yellow"
    Grass = "Green"
    Ice = "Blue"
    Fighting = "DarkYellow"
    Poison = "DarkGreen"
    Ground = "Gray"
    Flying = "Cyan"
    Psychic = "DarkMagenta"
    Bug = "Green"
    Rock = "DarkGray"
    Ghost = "DarkCyan"
    Dragon = "DarkRed"
    Dark = "DarkGray"
    Steel = "White"
    Fairy = "Magenta"
}

$PokemonTypes = @(
    "Normal"
    "Fire"
    "Water"
    "Electric"
    "Grass"
    "Ice"
    "Fighting"
    "Poison"
    "Ground"
    "Flying"
    "Psychic"
    "Bug"
    "Rock"
    "Ghost"
    "Dragon"
    "Dark"
    "Steel"
    "Fairy"
)

function ShowPokemonInfo {
    param($PokemonToShow)

    if (-not $PokemonToShow) {
        $PokemonToShow = Read-Host "Enter name of a pokemon"
    }
    #region Variable declaration
    try {
        $SelectedPokemon = $Pokedex | Where-Object { $_.EnglishName -eq $PokemonToShow }
        $NationalNumber = $SelectedPokemon.GetNationalNumber()
        $Name = $SelectedPokemon.GetEnglishName()

        $PrimaryType = $SelectedPokemon.GetPrimaryType()
        $SecondaryType = $SelectedPokemon.GetSecondaryType()
        $Classification = $SelectedPokemon.GetClassification()

        # Not sure how $PercentMale and $PercentFemale are going to be displayed
        $PercentMale = $SelectedPokemon.GetPercentMale()
        $PercentFemale = $SelectedPokemon.GetPercentFemale()
        if (-not $PercentMale -and -not $PercentFemale) {
            $Gender = "None"
        }
        $Height = $SelectedPokemon.GetHeight()
        $Weight = $SelectedPokemon.GetWeight()
        $CaptureRate = $SelectedPokemon.GetCaptureRate()
        $BaseEggSteps = $SelectedPokemon.GetBaseEggSteps()
        $Attack = $SelectedPokemon.GetAttack()
        $Defence = $SelectedPokemon.GetDefence()
        $SpecialAttack = $SelectedPokemon.GetSpecialAttack()
        $SpecialDefence = $SelectedPokemon.GetSpecialDefence()
        $Speed = $SelectedPokemon.GetSpeed()

        $Abilities0 = $SelectedPokemon.GetAbilities0()
        $Abilities1 = $SelectedPokemon.GetAbilities1()
        $Abilities2 = $SelectedPokemon.GetAbilities2()
        $AbilitiesHidden = $SelectedPokemon.GetAbilitiesHidden()

        $AgainstNormal = $SelectedPokemon.GetAgainstNormal()
        $AgainstFire = $SelectedPokemon.GetAgainstFire()
        $AgainstWater = $SelectedPokemon.GetAgainstWater()
        $AgainstElectric = $SelectedPokemon.GetAgainstElectric()
        $AgainstGrass = $SelectedPokemon.GetAgainstGrass()
        $AgainstIce = $SelectedPokemon.GetAgainstIce()
        $AgainstFighting = $SelectedPokemon.GetAgainstFighting()
        $AgainstPoison = $SelectedPokemon.GetAgainstPoison()
        $AgainstGround = $SelectedPokemon.GetAgainstGround()
        $AgainstFlying = $SelectedPokemon.GetAgainstFlying()
        $AgainstPsychic = $SelectedPokemon.GetAgainstPsychic()
        $AgainstBug = $SelectedPokemon.GetAgainstBug()
        $AgainstRock = $SelectedPokemon.GetAgainstRock()
        $AgainstGhost = $SelectedPokemon.GetAgainstGhost()
        $AgainstDragon = $SelectedPokemon.GetAgainstDragon()
        $AgainstDark = $SelectedPokemon.GetAgainstDark()
        $AgainstSteel = $SelectedPokemon.GetAgainstSteel()
        $AgainstFairy = $SelectedPokemon.GetAgainstFairy()

        $IsSublegendary = $SelectedPokemon.GetIsSublegendary()
        $IsSublegendary = $SelectedPokemon.GetIsLegendary()
        $IsMythical = $SelectedPokemon.GetIsMythical()

        $Evochain0 = $SelectedPokemon.GetEvochain0()
        $Evochain1 = $SelectedPokemon.GetEvochain1()
        $Evochain2 = $SelectedPokemon.GetEvochain2()
        $Evochain3 = $SelectedPokemon.GetEvochain3()
        $Evochain4 = $SelectedPokemon.GetEvochain4()
        $Evochain5 = $SelectedPokemon.GetEvochain5()
        $Evochain6 = $SelectedPokemon.GetEvochain6()

        $Gigantamax = $SelectedPokemon.GetGigantamax()
        $MegaEvolution = $SelectedPokemon.GetMegaEvolution()
        $MegaEvolutionAlt = $SelectedPokemon.GetMegaEvolutionAlt()

        $Description = $SelectedPokemon.GetDescription()

    } catch {
        Write-Host "No pokemon named: " -ForegroundColor Red -NoNewline ; Write-Host $PokemonToShow -NoNewline ; Write-Host " exists." -ForegroundColor Red
    }
    #endregion

    if ($SelectedPokemon) {
        Write-Host "ID: $NationalNumber"
        Write-Host "Name: $Name"
        Write-Host "Type: " -NoNewline
        Write-Host $PrimaryType -ForegroundColor $PokemonTypeColors[$PrimaryType] -NoNewline ; if ($SecondaryType -and $SecondaryType -ne $PrimaryType) { Write-Host " and " -NoNewline ; Write-Host $SecondaryType -ForegroundColor $PokemonTypeColors[$SecondaryType] } ; if (-not $SecondaryType) { Write-Host "" }

        Write-Host "Classification: $Classification"
        Write-Host "Height: $Height m"
        Write-Host "Weight: $Weight kg"
        Write-Host "$Description`n"

        <#
        If ($Evochain0 -eq "Egg") {
            first evolution trigger -eq $evochain1
            base pokemon -eq $evochain2
            second evo trigger -eq $evochain3
            first evolution -eq $evochain4
            third evo trigger -eq $evochain5
            final evolution -eq evochain6
        } else {
        #>
            if ($Evochain2 -and $Evochain4) { Write-Host "Base pokemon is $Evochain0." }#`t`t Trigger for first evolution: $Evochain1"
            if ($Evochain2) { Write-Host "First evolution is $Evochain2"}#`t`t Trigger for first evolution: $($Evochain1)"
            if ($Evochain4) { Write-Host "Final evolution is $Evochain4"}#`t`t Trigger for second evolution: $($Evochain3)"
        #}
        if ($Gender) { Write-Host "Gender: $Gender" }
    }

}

function ShowRandomPokemon {
    try {
    $PokemonToShow = $Pokedex | Get-Random | Select-Object -ExpandProperty EnglishName

    ShowPokemonInfo $PokemonToShow

    } catch {
        # Shouldn't really be able to throw an error.
        $_
    }
}

function ShowAllPokemonOfType {
    param ($TypeToShow)

    if (-not $TypeToShow) {
        $TypeToShow = Read-Host "Enter a type"
    }
    try {
        
    $AllPokemonOfType = $Pokedex | Where-Object { $_.PrimaryType -eq $TypeToShow } | Select-Object -ExpandProperty EnglishName

    Write-Host "All $TypeToShow pokemon: $($AllPokemonOfType -join ', ')"

    } catch {
        $_
    }
}

function SuperSecretFunction {
    Write-Host "(●'◡'●) ┳━┳`n(ㆆ_ㆆ) ┳━┳`n( ˘︹˘ )`n(ヘ･_･)ヘ ┳━┳`n(╯°□°）╯︵ ┻━┻`n(●'◡'●)"
}

function SearchForPokemon {
    param ($PokemonToSearchFor)

    try {
        if (-not $PokemonToSearchFor) {
            $PokemonToSearchFor = Read-Host "Which pokeman do you want to show information about?"
        }
    } catch { # Should really not be able to throw error
        $_
    }

    ShowPokemonInfo $PokemonToSearchFor
}

function TopTenPokemonByStat {
    # TODO
    # Implement function
    param ($StatToDisplay)

    if (-not $StatToDisplay) {
        Write-Host "Stats you can search for are:`nHeight`nWeight`nHP`nAttack`nDefence`nSpecial attack`nSpecial defence`nSpeed"
    $StatToDisplay = Read-Host "Show top ten pokemen by which stat?"
    }

    $StatsTable = @{
        "Height" = "height_m"
        "Weight" = "weight_kg"
        "HP" = "HP"
        "Attack" = "attack"
        "Defence" = "defence"
        "Special attack" = "specialAttack"
        "Special defence" = "specialDefence"
        "Speed" = "speed"
    }

    try {
        $StatProperty = $StatsTable[$StatToDisplay]
        $TopTenPokemon = $Pokedex | Sort-Object -Property $StatProperty -Descending | Select-Object -First 10
        # $TopTenPokemon
        Write-Host "Top Ten Pokemon by $($StatToDisplay):`n"
        $TopTenPokemon | ForEach-Object {
            Write-Host "$($_.EnglishName) - $($_.StatProperty)"
        }
    } catch {
        $_
    }
}

function MainMenu {
    Clear-Host
    Write-Host "======== Pokedex ==========`n"
    Write-Host "1. Search for pokeman by name"
    Write-Host "2. Display information about a specific pokeman"
    Write-Host "3. Show information about a random pokeman"
    Write-Host "4. Show all pokemen by type"
    Write-Host "5. Exit`n"
}

function Main {
    MainMenu

    $Choice = Read-Host "Enter a number"

    switch($Choice) {
        1 { SearchForPokemon }
        2 { ShowPokemonInfo }
        3 { ShowRandomPokemon }
        4 { ShowAllPokemonOfType }
        5 { ExitApplication }
        69 { SuperSecretFunction }
        default { Write-Host "Good evening"; break }
    }
}

TopTenPokemonByStat
# Main
# ShowAllPokemonOfType 'Ghost'
# ShowPokemonInfo 'beedrill'
# ShowRandomPokemon
