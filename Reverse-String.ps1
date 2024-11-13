## Created by: Caleb Nekrasoff
## Date created: Nov 13, 2024
## Purpose: To reverse a given string and return the result.

# Function to reverse the string. Accepts a string as an argument, then returns that string reversed.
function Reverse-Input {

    param (
        $String
    )

    $ReversedString = ""

    # For loop to go through string, starting from the end, and append the current character to
    # ReversedString.
    for ($i = $String.Length; $i -gt 0; $i--) {
        $ReversedString = $ReversedString + $String.Substring(($i - 1), 1)
    }

    Write-Output $ReversedString
}

# Gets user choice to determine whether they want to reverse a file or text they enter in on the CLI
Write-Host "If you have a file you'd like to reverse, enter '0'.`r`nIf you would like to directly type in the string, enter '1'."
$Choice = Read-Host -Prompt "Please enter your choice"
$Choice = $Choice.trim()

# Input validation for user's choice. If they don't pick one of the listed options, keep prompting
# them to do so until they pick a valid choice.
if (($Choice -ne "1") -and ($Choice -ne "0")) {
    while (($Choice -ne "1") -and ($Choice -ne "0")) {
        $Choice = Read-Host -Prompt "You may only enter '0' or '1'"
    }
}

# If statement to choose either to reverse the content of a file or text that the user directly enters in
if ($Choice -eq "0") {

    $UserInput = Read-Host -Prompt "Please enter the file path"

    $FileContent = Get-Content $UserInput.trim() # Gets all lines in file and stores each line as an element in an array

    # For loop to go through FileContent array and reverse each element, starting from the last element
    # and going backwards
    for ($i = $FileContent.Count; $i -ge 0; $i--) {
        Reverse-Input -String $FileContent[$i]
    }

} elseif ($Choice -eq "1") {
    
    # Read user input, then reverse it
    $UserInput = Read-Host -Prompt "Please type in the text you want reversed"
    Reverse-Input -String $UserInput

}