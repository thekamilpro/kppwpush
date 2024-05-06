function Get-PwpushUrl
{
    <#
    .SYNOPSIS
        Retrieves a URL push.
    .DESCRIPTION
        Retrieves a push including it’s payload and details. If the push is still active, this will burn a view and the transaction will be logged in the push audit log.    
    .PARAMETER UrlToken
        Token of the push
    .LINK
        https://pwpush.com/api/1.0/urls/show.en.html
    .EXAMPLE
        Get-KpPwpushUrl -UrlToken abc123
        Retrieves push with token abc123
    #>
    [cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [string]$UrlToken
    )

    $endpoint = "r/$($UrlToken).json"

    $params = @{
        Endpoint = $endpoint
        Method   = "Get"
    }
    Invoke-PwpushRequest @params
}