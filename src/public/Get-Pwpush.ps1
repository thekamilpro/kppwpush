function Get-Pwpush
{
    <#
    .SYNOPSIS
        Retrieves a push.
    .DESCRIPTION
        Retrieves a push including it’s payload and details. If the push is still active, this will burn a view and the transaction will be logged in the push audit log.
    .PARAMETER UrlToken
        Token of the push
    .LINK
        https://pwpush.com/api/1.0/passwords/show.en.html
    .EXAMPLE
        Get-KpPwpush -UrlToken abc123
        Retrieves push with token abc123
    #>
    [cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [string]$UrlToken
    )
    
    $endpoint = "p/$($UrlToken).json"

    $params = @{
        Endpoint = $endpoint 
        Method   = "Get" 
    }
    Invoke-PwpushRequest @params
}