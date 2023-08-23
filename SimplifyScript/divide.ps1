param (
    [double]$number
)

# Step 3: Divide the number by 2
# truncate gets rid of excess decimals
$Divided = $number / 30000000
$timesToDivide = [Math]::Log($Divided, 2)
$timesToDivide =[Math]::Truncate($timesToDivide)

# Push the divided result to a text file without BOM
$utf8NoBom = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllText("output.txt", "$timesToDivide`r`n", $utf8NoBom)