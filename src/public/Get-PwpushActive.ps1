function Get-PwpushActive
{
    <#
    .SYNOPSIS
        Returns the list of password pushes that you previously pushed which are still active.
    #>
    [cmdletbinding()]
    param (
    )

    $endpoint = "p/active.json"

    $params = @{
        Endpoint = $endpoint
        Method   = "Get"
    }
    Invoke-PwpushRequest @params
}