<#
$Halopeeps = @('Master Chief', 'Cortana', 'Captain Keyes', 'Arbiter')
For($counter =0;$counter -le ($Halopeeps.Length -1);$counter++){
    Write-Host "Holy smokes, it's" $Halopeeps[$counter]
}
#>

$Halopeeps = @('Master Chief', 'Cortana', 'Captain Keyes', 'Arbiter')
Foreach ($peep in $Halopeeps) {
    Write-Host $peep "has arrived"
}