$PokemonNum = 300
If($PokemonNUm -ge 0 -and $PokemonNum -le 151) {
    Write-Host "Your Pokemon is from Kanto!"
} Elseif ($PokemonNUm -ge 152 -and $PokemonNum -le 251) {
    Write-Host "Your Pokemon is from Johto!"
} ElseIf ($PokemonNUm -ge 252 -and $PokemonNum -le 386) {
    Write-Host "Your Pokemon is from Hoenn!"
}
