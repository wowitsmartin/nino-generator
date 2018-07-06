function New-RandomNino {
    $allowedFirst = @('A', 'B', 'C', 'E', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'W', 'X', 'Y', 'Z');
    $allowedSecond = @('A', 'B', 'C', 'E', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'R', 'S', 'T', 'W', 'X', 'Y', 'Z');
    $prohibitedPrefixes = @('BG', 'GB', 'NK', 'KN', 'TN', 'NT', 'ZZ');
    $allowedSuffixes = @('A', 'B', 'C', 'D');

    $prefix = "";
    $isPrefixValid = $false;

    while ($isPrefixValid -ne $true) {
        $randomIndex = Get-Random -Maximum ($allowedFirst.Length - 1);
        $prefix = $allowedFirst[$randomIndex];
        $randomIndex = Get-Random -Maximum ($allowedSecond.Length - 1);
        $prefix += $allowedSecond[$randomIndex];
        $isPrefixValid = $true;
        foreach ($prohibitedPrefix in $prohibitedPrefixes) {
            if ($prefix -eq $prohibitedPrefix) {
                $isPrefixValid = $false;
                break;
            }
        }
    }

    [string]$digits = "";
    
    for ($i = 1; $i -le 6; $i++) {
        $digits += Get-Random -Maximum 9;
    }

    $randomIndex = Get-Random -Maximum ($allowedSuffixes.Length - 1);
    $suffix = $allowedSuffixes[$randomIndex];

    return $prefix + $digits + $suffix;
}
