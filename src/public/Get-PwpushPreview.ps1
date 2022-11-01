function Get-PwpushPreview
{
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