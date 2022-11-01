function Get-Pwpush
{
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