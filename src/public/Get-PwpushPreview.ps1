function Get-PwpushPreview
{
    <#
    .SYNOPSIS
        Retrieves the URL of a push.
    .DESCRIPTION
        Helper endpoint to retrieve the fully qualified secret URL of a push.
    .PARAMETER UrlToken
        Token of a secret
    .LINK
        https://pwpush.com/api/1.0/passwords/preview.en.html
    .EXAMPLE
        Get-KpPwpushPreview -UrlToken 123abc
        Retrieves URL for token 123abc
    #>
    [cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [string]$UrlToken
    )

    $endpoint = "p/$($UrlToken)/preview.json"

    $params = @{
        Endpoint = $endpoint
        Method   = "Get"
    }
    Invoke-PwpushRequest @params
}