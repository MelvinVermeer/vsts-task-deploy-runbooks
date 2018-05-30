[CmdletBinding()]
Param(
    [String] [Parameter(Mandatory = $true)] $ConnectedServiceNameSelector,    
    [String] [Parameter(Mandatory = $true)] $ConnectedServiceNameARM, 
    [string] [Parameter(Mandatory = $true)] $ResourceGroupName,
    [string] [Parameter(Mandatory = $true)] $AutomationAccount,
    [string] [Parameter(Mandatory = $true)] $RunbookFiles
)

$RunbookFilesPath = [System.IO.Path]::Combine($env:SYSTEM_ARTIFACTSDIRECTORY, $env:BUILD_DEFINITIONNAME, "drop", $RunbookFiles)

Write-Output "Starting runbook deployment to: $ResourceGroupName/$AutomationAccount"
Write-Output "Project path: $RunbookFilesPath"

Get-ChildItem $RunbookFilesPath -Recurse | where {$_.Extension -eq ".ps1"} | % {
    Write-Output "Upload runbook file" $_.FullName
    Import-AzureRMAutomationRunbook -Path $_.FullName -ResourceGroupName $ResourceGroupName -AutomationAccountName $AutomationAccount -Type PowerShell -Published:$true -Force | out-null
}

Write-Output "Finished runbook deployment to: $ResourceGroupName/$AutomationAccount"