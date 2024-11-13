## Created by: Caleb Nekrasoff
## Date created: Nov 13, 2024
## Purpose: To reverse a given string and return the result.

function Reverse-Input {

    param (
        $String
    )

    $ReversedString = ""

    for ($i = $String.Length; $i -gt 0; $i--) {
        $ReversedString = $ReversedString + $String.Substring(($i - 1), 1)
    }

    Write-Output $ReversedString
}

$Input = Read-Host -Prompt "Please enter a string you want reversed"
Reverse-Input -String $Input