﻿function Invoke-PwpushRequest
{
    <#
    .SYNOPSIS
        Main function for interacting with pwpush API
    .DESCRIPTION
        This function takes care of all headers, pagination, body formatting etc. for pwpush api calls.
    #>
    [cmdletbinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Endpoint,

        [object]$Body,

        [ValidateSet("Get", "Post", "Delete")]
        [string]$Method = "Get",

        [switch]$ReturnRaw
    )

    if ( -not ($Script:Connection))
    {
        Throw "Please connect to Pwpush via Connect-KpPwpush"
    }

    $url = "$($Script:Connection.Server)/$Endpoint"

    $params = @{
        UseBasicParsing = $true
        Method = $Method
        Uri = $Url
    }

    if ($PSBoundParameters.ContainsKey('Body'))
    {
        $params.Add("Body", $Body)
        $params.Add("ContentType", "application/json")
    }

    if ($Script:Connection.ContainsKey('userEmail'))
    {
        $headers = @{
            "X-User-Email" = $Script:Connection.userEmail
            "X-User-Token" = $Script:Connection.userToken
        }
        $params.Add("headers", $headers)
    }

    try
    {
        $reposne = Invoke-WebRequest @params
    }
    catch
    {
        throw
    }
    
    if ($ReturnRaw.IsPresent)
    {
        return $reposne
    }

    return $reposne.Content | ConvertFrom-Json
}