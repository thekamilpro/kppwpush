function Connect-Pwpush
{
    <#
    .SYNOPSIS
        Connects to pwpush server and initialises the module
    .DESCRIPTION
        This must be first command used before running any other commands from this module. If no parameters are specified,
        defaults to pwpush.com server.
    .PARAMETER Server
        Server to connect to to
    .PARAMETER Credential
        User email and API token - token can be created at https://pwpush.com/en/users/token
    .EXAMPLE
        Connect-KpPwpush
        Connects to https://pwpush.com server
    #>
    [cmdletbinding()]
    param(
        [string]$Server = "https://pwpush.com/",

        [pscredential]$Credential
    )

    if ($Server[-1] -eq "/")
    {
        $Server = $server.Substring(0, $Server.Length - 1)
    }

    $Script:Connection = @{
        Server = $server
    }

    if ($PSBoundParameters.ContainsKey('Credential'))
    {
        $Script:Connection["userEmail"] = $Credential.UserName
        $Script:Connection["userToken"] = $Credential.GetNetworkCredential().Password
    }
}