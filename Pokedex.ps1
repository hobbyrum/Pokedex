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
$CSVData = "$($PSScriptRoot)\data.csv"
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

function SearchForPokemon {
    param ($PokemonToSearchFor)

    [String]$PokemonToSearchFor = Read-Host "Search for Pokemon by name"

    $SearchedForPokemon = $PokeDex | Where-Object { $_.Name -like "*$PokemonToSearchFor*" } | Select-Object -ExpandProperty Name

    if ($SearchedForPokemon) {
        Write-Host "Pokemen matching $($PokemonToSearchFor): $($SearchedForPokemon -join ', ')"
    } else {
        Write-Host "No matches found for: $PokemonToSearchFor"
    }
    MainMenu $false
}
function DisplayPokemon {
    [String]$PokemonToDisplay = Read-Host "Which pokeman do you want to see information about: "

    $SelectedPokemon = $PokeDex | Where-Object { $_.Name -eq $PokemonToDisplay }
    $EvolvedFrom = $Pokedex | Where-Object { $_.DexNumber -eq $SelectedPokemon.EvolvedFrom } | Select-Object -ExpandProperty Name

    if ($SelectedPokemon) {
        Write-Host "Name: $($SelectedPokemon.GetName())"
        Write-Host "Type: $($SelectedPokemon.GetType())"
        Write-Host "Gender: $($SelectedPokemon.GetGender())"
        If ($EvolvedFrom) { Write-Host "Evolved from: $($EvolvedFrom)" }
        Write-Host "Height: $($SelectedPokemon.GetHeight()) in"
        Write-Host "Weight: $($SelectedPokemon.GetWeight()) lbs"
        Write-Host "Dex no.: $($SelectedPokemon.GetDexNumber())"
        If ($SelectedPokemon.FinalEvolution -eq 'true' -and $SelectedPokemon.EvolvedFrom -ne 0) { Write-Host "Final evolution" }
    } else {
        Write-Host "Pokeman `'$($PokemonToDisplay)`' not found"
    }
    MainMenu $false
}

function MainMenu {
    param ([Boolean]$FirstVisit = $true)
        if ($FirstVisit) {
            Write-Host "`nWelcome to the magical Pokedex"
        }

        $NewLine = If ($FirstVisit) { "`n" } else { "" }
        $WhatToDo = Read-Host -Prompt ($NewLine + "`n1: Search for pokemon by name`n2: Display information about a specific pokemon`nEnter your choice:")

        switch($WhatToDo) {
            1 { SearchForPokemon; break }
            2 { DisplayPokemon; break }
            default { Write-Host "Invalid option. Enter a valid choice."}
        }
}
MainMenu

# function DisplayAllPokemon {
#     foreach ($pokemon in $Pokedex) {
#         Write-Host "Name: $($pokemon.GetName()) | Type: $($pokemon.GetType()) | Evolved from: $($pokemon.GetEvolvedFrom())"
#     }
# }
# DisplayAllPokemon
