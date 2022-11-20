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
    .EXAMPLE
        Connect-KpPwpush
        Connects to https://pwpush.com server
    #>
    
    
    [cmdletbinding()]
    param(
        [string]$Server = "https://pwpush.com/"
    )

    if ($Server[-1] -eq "/")
    {
        $Server = $server.Substring(0, $Server.Length - 1) 
    }

    $Script:Connection = @{
        Server = $server
    }
}