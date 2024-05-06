function Remove-PwpushUrl
{
    <#
    .SYNOPSIS
        Expires a push
    .DESCRIPTION
        Expires a push immediately. Must be authenticated & owner of the push or the push must have been created with deleteable_by_viewer  
    .LINK
        https://pwpush.com/api/1.0/passwords/destroy.en.html
    .PARAMETER UrlToken
        Token of a push
    .EXAMPLE
        Remove-KpPwPush -UrlToken abc123
        Expires token abc123
    #>
    [cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [string]$UrlToken
    )
    
    $endpoint = "r/$($UrlToken).json"

    $params = @{
        Endpoint = $endpoint 
        Method   = "Delete" 
    }
    Invoke-PwpushRequest @params
}