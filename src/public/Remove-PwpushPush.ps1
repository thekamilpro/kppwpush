function Remove-PwpushPush
{
    [cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [string]$UrlToken
    )
    
    $endpoint = "p/$($UrlToken).json"

    $params = @{
        Endpoint = $endpoint 
        Method   = "Delete" 
    }
    Invoke-PwpushRequest @params
}