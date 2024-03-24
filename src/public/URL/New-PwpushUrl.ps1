function New-PwpushUrl
{
    <#
    .SYNOPSIS
        Create a new URL push.
    .DESCRIPTION
        Create a new URL push.
    .LINK
        https://pwpush.com/api/1.0/urls/create.en.html
    .EXAMPLE
        New-KpPwpushFile -Payload mySecret
        Creates a new push with payload of mySecret
    #>

    [cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Payload,

        [string]$Passphrase,

        [string]$Note = "",

        [ValidateRange(1, 90)]
        [int]$ExpireAfterDays = 7,

        [ValidateRange(1, 100)]
        [int]$ExpireAfterViews = 5,

        [bool]$DeletableByViewer = $true,

        [bool]$RetrievalStep = $false
    )

    $endpoint = "r.json"

    $data = @{
        url = @{
            "payload"             = $Payload
            "expire_after_days"   = $ExpireAfterDays
            "expire_after_views"  = $ExpireAfterViews
            "deletable_by_viewer" = $DeletableByViewer
            "retrieval_step"      = $RetrievalStep
        }
    }

    switch ($PSBoundParameters.GetEnumerator() )
    {
        { $_.Key -eq "Note" } { $data.url[$_.Key.ToLower()] = $_.Value }
        { $_.Key -eq "Passphrase" } { $data.url[$_.Key.ToLower()] = $_.Value }
    }

    $body = $data | ConvertTo-Json

    $params = @{
        Endpoint = $endpoint
        Method   = "Post"
        Body     = $body
    }
    Invoke-PwpushRequest @params
}