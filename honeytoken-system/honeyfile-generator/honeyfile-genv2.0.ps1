# Honeyfile Generator v2.0 - Simplified for .txt and .csv
# Author: Emily Fagan
# Description: Generates realistic decoy files with fake HR data

# Prompt for path
$targetFolder = Read-Host "Enter full path to store honeyfiles (e.g., C:\HRConfidential\Salary_Information)"
if (-Not (Test-Path $targetFolder)) {
    Write-Host "That path doesn't exist." -ForegroundColor Red
    exit
}

# Prompt for file count and type
$numFiles = Read-Host "How many honeyfiles would you like to generate?"
$fileType = Read-Host "Choose file type: txt or csv"
$numEntries = Read-Host "How many entries per file?"

# Fake data pools
$names = @("Alice", "Bob", "Carol", "David", "Eva", "Frank", "Grace", "Hannah", "Iris", "Jake", "Liam", "Maya", "Noah", "Olivia", "Quinn", "Sophie")
$roles = @("Engineer", "Analyst", "Manager", "Director", "Intern")
$departments = @("IT", "HR", "Finance", "Legal", "Marketing", "Sales", "Product", "Support")

# Loop to generate files
for ($i = 1; $i -le $numFiles; $i++) {
    $name = Get-Random -InputObject $names
    $role = Get-Random -InputObject $roles
    $dept = Get-Random -InputObject $departments
    $date = (Get-Date).AddDays(-1 * (Get-Random -Minimum 30 -Maximum 365))
    $customName = Read-Host "Enter a name for honeyfile #$i (do not include the extension)"
    $filename = "$customName.$fileType"
    $filepath = Join-Path $targetFolder $filename

    switch ($fileType.ToLower()) {
        "txt" {
            $header = @"
# Classification: Confidential
# Created by: HR
# Created on: $($date.ToShortDateString())

*** DO NOT SHARE ***
"@
            $content = $header + "`n"

            for ($j = 1; $j -le $numEntries; $j++) {
                $username = Get-Random -InputObject $names
                $role = Get-Random -InputObject $roles
                $dept = Get-Random -InputObject $departments
                $password = Get-Random -InputObject @(
                    "$username@Fagan",
                    "$username!2024",
                    "Welcome123!",
                    "P@ssw0rd!",
                    "$($username.Substring(0,1).ToUpper())$($username.Substring(1))#HR"
                )
                $content += "Employee: $username`nRole: $role`nDepartment: $dept`nAccess Level: Admin`nPassword: $password`n`n"
            }

            Set-Content -Path $filepath -Value $content
        }

        "csv" {
            $content = "Name,Role,Department,Salary`n"

            for ($j = 1; $j -le $numEntries; $j++) {
                $n = Get-Random -InputObject $names
                $r = Get-Random -InputObject $roles
                $d = Get-Random -InputObject $departments
                $salary = Get-Random -Minimum 60000 -Maximum 150000
                $content += "$n,$r,$d,$salary`n"
            }

            Set-Content -Path $filepath -Value $content
        }

        Default {
            Write-Host "Unsupported file type: $fileType" -ForegroundColor Red
            exit
        }
    }

    Write-Host "Created: $filename ($numEntries entries)"
}
