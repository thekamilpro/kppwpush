function New-PwpushPush {
    [cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Payload,

        [string]$Note = "",
            
        [ValidateRange(1, 90)]
        [int]$ExpireAfterDays = 7,
        
        [ValidateRange(1, 100)]
        [int]$ExpireAfterViews = 5,
        
        [bool]$DeletableByViewer = $true,
        
        [bool]$RetrievalStep = $false
    )
    
    $endpoint = "p.json"

    $body = @{
        password = @{
            "payload" = $Payload
            "note" = $Note
            "expire_after_days" = $ExpireAfterDays
            "expire_after_views" = $ExpireAfterViews
            "deletable_by_viewer" = $DeletableByViewer
            "retrieval_step" = $RetrievalStep
        }
    } | ConvertTo-Json

    $params = @{
        Endpoint = $endpoint 
        Method = "Post" 
        Body = $body
    }
    Invoke-PwpushRequest @params
}

#curl -X POST -H "X-User-Email: <email>" -H "X-User-Token: MyAPIToken" --data "password[payload]=mypassword&password[expire_after_days]=2&password[expire_after_views]=10" https://pwpush.com/p.json
