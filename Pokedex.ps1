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

function GUI {
    [String]$PokemonToDisplay = Read-Host "Enter the name of a pokemon: "

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
        If ($SelectedPokemon.FinalEvolution -eq 'true') { Write-Host "Final evolution" }
    } else {
        Write-Host "Pokeman `'$($PokemonToDisplay)`' not found"
    }
}
GUI

# function DisplayAllPokemon {
#     foreach ($pokemon in $Pokedex) {
#         Write-Host "Name: $($pokemon.GetName()) | Type: $($pokemon.GetType()) | Evolved from: $($pokemon.GetEvolvedFrom())"
#     }
# }
# DisplayAllPokemon