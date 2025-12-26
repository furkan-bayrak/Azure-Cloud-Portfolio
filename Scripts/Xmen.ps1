$Xmen = @('Wolverine', 'Cyclops', 'Storm', 'Professor X', 'Gambit', 'Dr. Jean Grey')
$counter = 0
while($counter -ne 6) {
    Write-Host $Xmen[$counter] "is a muant!"
    $counter++;
}