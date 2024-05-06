function Get-PwpushUrlActive
{
    <#
    .SYNOPSIS
        Returns the list of URL pushes that you previously pushed which are still active.
    #>
    [cmdletbinding()]
    param (
    )

    $endpoint = "r/active.json"

    $params = @{
        Endpoint = $endpoint
        Method   = "Get"
    }
    Invoke-PwpushRequest @params
}