$CSVData = "$($PSScriptRoot)\data.csv"
class Pokemon {
    [Int]$DexNumber
    [String]$Name
    [String]$Type
    [Double]$Weight
    [Double]$Height
    [String]$Gender
    [Int]$EvolvedFrom
    # [String]$EvolvesInto
    [Boolean]$FinalEvolution

    [String]GetName() {
        return "$($this.Name)"
    }
    [String]GetType() {
        return "$($this.Type)"
    }
    [String]GetGender() {
        return "$($this.Gender)"
    }
    [Int]GetEvolvedFrom() {
        return "$($this.EvolvedFrom)"
    }
    # [String]GetEvolvesInto() {
    #     return "$($this.EvolvesInto)"
    # }
    [Double]GetHeight() {
        return "$($this.Height)"
    }
    [Double]GetWeight() {
        return "$($this.Weight)"
    }
    [Int]GetDexNumber() {
        return "$($this.DexNumber)"
    }
    [Boolean]GetFinalEvolution() {
        return "$($this.FinalEvolution)"
    }
}

$PokeDex = Import-CSV -Path $CSVData | ForEach-Object {
    [Pokemon]@{
        Name = $_.name
        Type = $_.type
        Gender = $_.gender
        EvolvedFrom = $_.evolvedfrom
        Height = $_.height
        Weight = $_.weight
        DexNumber = $_.dexnumber
        FinalEvolution = $_.finalevolution
    }
}

$PokemonTypeColors = @{
    Grass = "Green"
    Poison = "DarkGreen"
    Fire = "Red"
    Flying = "Gray"
    Water = "Blue"
    Bug = "Green"
    Normal = "White"
    Electric = "Yellow"
    Fairy = "Cyan"
    Ground = "DarkGray"
    Fighting = "DarkRed"
    Psychic = "Magenta"
    Rock = "DarkYellow"
    Ice = "Blue"
    Ghost = "Gray"
    Steel = "Blue"
}

$PokemonTypes = @(
    "Grass"
    "Poison"
    "Fire"
    "Flying"
    "Water"
    "Bug"
    "Normal"
    "Electric"
    "Fairy"
    "Ground"
    "Fighting"
    "Psychic"
    "Rock"
    "Ice"
    "Ghost"
    "Steel"
)

function SearchForPokemon {
    param ([String]$PokemonToSearchFor)

    $PokemonToSearchFor = Read-Host "Search for Pokemon by name"

    $SearchedForPokemon = $PokeDex | Where-Object { $_.Name -like "*$PokemonToSearchFor*" } | Select-Object -ExpandProperty Name

    if ($SearchedForPokemon) {
        Write-Host "Pokemen matching $($PokemonToSearchFor): $($SearchedForPokemon -join ', ')"
    } else {
        Write-Host "No matches found for: $PokemonToSearchFor"
    }
    Pause
}

function ShowRandomPokemon {
    $RandomPokemon = $PokeDex | Get-Random | Select-Object -ExpandProperty Name

    Write-Host "Random pokeman is:`n"
    ShowPokemon $RandomPokemon
}

function ShowPokemonByType {
    param([String]$PokemonByType)

    if (-not $PokemonByType) {
        $PokemonByType = Read-Host "Enter a pokemon type"
    }

    $AllPokemonByType = $Pokedex | Where-Object { $_.Type -eq $PokemonByType } | Select-Object -ExpandProperty Name
    
    foreach ($Type in $PokemonTypes) {
        switch ($Type) {
            "Grass" {
                Write-Host "All $PokemonByType pokemen: $($AllPokemonByType -join ', ')"
            }
        }
    }
    # Main
}
 
function ShowPokemon {
    param ([String]$PokemonToDisplay)

    if (-not $PokemonToDisplay) {
        $PokemonToDisplay = Read-Host "Which pokeman do you want to see information about: "
    }

    $SelectedPokemon = $PokeDex | Where-Object { $_.Name -eq $PokemonToDisplay }
    $SelectedName = $SelectedPokemon.GetName()
    $SelectedType = $SelectedPokemon.GetType() -Split ' and '
    $SelectedGender = $SelectedPokemon.GetGender()
    $EvolvedFrom = $Pokedex | Where-Object { $_.DexNumber -eq $SelectedPokemon.EvolvedFrom } | Select-Object -ExpandProperty Name
    $SelectedHeight = $SelectedPokemon.GetHeight()
    $SelectedWeight = $SelectedPokemon.GetWeight()
    $SelectedDexNumber = $SelectedPokemon.GetDexNumber()

    if ($SelectedPokemon) {
        Write-Host $SelectedName

        # $PokemonTypes = $SelectedPokemon.GetType() -split ' and '

        foreach ($Type in $SelectedType) {
            $TypeColor = $PokemonTypeColors[$Type]
            Write-Host $Type -ForegroundColor $TypeColor
        }
        
        Write-Host "Gender: $($SelectedGender)"
        If ($EvolvedFrom) { Write-Host "Evolved from: $($EvolvedFrom)" }

        Write-Host "Height: $($SelectedHeight) in"
        Write-Host "Weight: $($SelectedWeight) lbs"
        Write-Host "Pokeman no.: $($SelectedDexNumber)`n"
    } else {
        Write-Host "Pokeman `'$($PokemonToDisplay)`' not found"
    }
    Pause
    Main
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

function ExitApplication {
    $Title = "Good evening"
    $Question = "Exit the program?"
    $Choices = @(
        [System.Management.Automation.Host.ChoiceDescription]::new("&Yes", "What is the charge?!")
        [System.Management.Automation.Host.ChoiceDescription]::new("&No", "Are you the one...?")
        )
    $DefaultChoice = -1

    $Decision = $Host.UI.PromptForChoice($Title, $Question, $Choices, $DefaultChoice)

    if ($Decision -eq 0) {
        Write-Host "Tata and farewell..."
        Exit
    } else {
        Main
    }
}

function Main {
    do {
        MainMenu
        $Choice = Read-Host "What do you want to do? Enter a number"

        switch ($Choice) {
            1 { SearchForPokemon }
            2 { ShowPokemon }
            3 { ShowRandomPokemon }
            4 { ShowPokemonByType }
            5 { ExitApplication }
            default { Write-Host "Invalid choice" }
        }
    } while ($Choice -ne 4)
}

# Main
ShowPokemonByType -PokemonByType "Grass"
