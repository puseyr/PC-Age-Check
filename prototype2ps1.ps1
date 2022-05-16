Import-Module ActiveDirectory

$computers = Get-Content '\\usnycsrv2uwfp1\upf\rpusey-sa\WF\RF\Documents\PowerShell building\PC Age\dedcompoopers.txt'

foreach ($computer in $computers) {
    if (Test-Connection $computer -Count 2 -Quiet) {
        Get-ADComputer -Identity $computer -Properties * | Select cn, created, lastlogondate | Export-Csv "\\usnycsrv2uwfp1\upf\rpusey-sa\WF\RF\Documents\PowerShell building\PC Age\DedCompoopsList.csv" -NoTypeInformation -Append
    }

    else{
        Get-ADComputer -Filter -Identity $_ -Properties * | Select cn, created, lastlogondate | Export-Csv "\\usnycsrv2uwfp1\upf\rpusey-sa\WF\RF\Documents\PowerShell building\PC Age\DedCompoopsList.csv" -NoTypeInformation -Append
    }
}