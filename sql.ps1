$ServerName = "D05UE0065.ac.lp.acml.com"
$DatabaseName = "SolaClient"
$Username = "user_webapp_solaclient"
$Password = "f9!%Bazv"
$Port = "16668"
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "Server=$ServerName,$Port;Database=$DatabaseName;User ID=$Username;Password=$Password"
$SqlConnection.Open()
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = "update [SolaClient].[dbo].[tblVersionControl] set CurrentVersion = 'sola-windows-6b8776ddf6-g2ffg', InitializedVersion = 'sola-windows-6b8776ddf6-g2ffg' where ModuleName = 'Hostname'"
$SqlCmd.Connection = $SqlConnection
$Reader = $SqlCmd.ExecuteReader()
while ($Reader.Read()) {
    Write-Host $Reader[0]
}
$SqlConnection.Close()