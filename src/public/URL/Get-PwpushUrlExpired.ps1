function Get-PwpushUrlExpired
{
     <#
    .SYNOPSIS
        Retrieves a push including it’s payload and details. If the push is still active, this will burn a view and the transaction will be logged in the push audit log.
    #>
    [cmdletbinding()]
    param (
    )

    $endpoint = "r/expired.json"

    $params = @{
        Endpoint = $endpoint
        Method   = "Get"
    }
    Invoke-PwpushRequest @params
}