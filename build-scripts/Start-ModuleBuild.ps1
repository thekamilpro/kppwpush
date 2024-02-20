param (
    [string]$Version = "1.0.0",

    [string]$Name = "KpPwpush"
)

#Requires -Module "ModuleBuilder"

Write-Host "Building module: [$($Name)] version: [$($Version)]"

$root = Resolve-Path -Path "$PSScriptRoot/../"

Write-Host "root: [$($root)]"

$params = @{
    SourcePath = "$PSScriptRoot/../src/KpPwpush.psd1" 
    UnversionedOutputDirectory = $true
    Version = $Version 
    Passthru = $true
    Verbose = $true
    OutputDirectory = "$root/build"
}

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