param (
    $Version = "1.0.0",

    $Name = "KpPwpush"
)

#Requires -Module "ModuleBuilder"

$params = @{
    SourcePath = "$PSScriptRoot/../src/KpPwpush.psd1" 
    UnversionedOutputDirectory = $true
    Version = $Version 
    Passthru = $true
    Verbose = $true
}

Write-Host "Building module $Name $Version"
$result = Build-Module @params

try 
{
    Write-Host "Loading module"
    Import-Module -Name $result.Path -ErrorAction stop
}
catch
{
    Throw "Failed to load module $_"
}
finally
{
    Write-Host "Unloading module"
    Remove-Module -Name $result.Name -ErrorAction SilentlyContinue
}