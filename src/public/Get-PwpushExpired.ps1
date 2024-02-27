function Get-PwpushExpired
{
     <#
    .SYNOPSIS
        Returns the list of password pushes that you previously pushed which have expired.
    #>
    [cmdletbinding()]
    param (
    )

    $endpoint = "p/expired.json"

    $params = @{
        Endpoint = $endpoint
        Method   = "Get"
    }
    Invoke-PwpushRequest @params
}