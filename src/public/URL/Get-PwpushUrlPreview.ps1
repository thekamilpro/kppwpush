function Get-PwpushUrlPreview
{
    <#
    .SYNOPSIS
        Helper endpoint to retrieve the fully qualified secret URL of a push.
    .DESCRIPTION
        Helper endpoint to retrieve the fully qualified secret URL of a push.
    .PARAMETER UrlToken
        Secret URL token of a previously created push
    .LINK
        https://pwpush.com/api/1.0/urls/preview.en.html
    .EXAMPLE
        Get-KpPwpushPreviewUrl -UrlToken 123abc
        Retrieves URL for token 123abc
    #>
    [cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [string]$UrlToken
    )

    $endpoint = "r/$($UrlToken)/preview.json"

    $params = @{
        Endpoint = $endpoint
        Method   = "Get"
    }
    Invoke-PwpushRequest @params
}