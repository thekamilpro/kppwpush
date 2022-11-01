function Connect-Pwpush
{
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