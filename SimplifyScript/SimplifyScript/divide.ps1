param (
    [double]$number,
    [double]$simplifyto
)

# utilizes the equation:
# timesToDivide = log(Base2) (number / simplifyto)

# Step 1: Divide the number by 2
$Divided = $number / $simplifyto

# Step 2: Perform the logarithm
$timesToDivide = [Math]::Log($Divided, 2)

# Step 3: Truncate to get rid of excessive decimals
$timesToDivide =[Math]::Truncate($timesToDivide)

# Push the "number of times to divide" to a text file without BOM
$utf8NoBom = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllText("output.txt", "$timesToDivide`r`n", $utf8NoBom)