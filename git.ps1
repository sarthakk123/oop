$User = "sarthakk123"
$Repo = Read-Host "Enter repository name (e.g. FDS)"
$Branch = Read-Host "Enter branch name (default: main)"
if (-not $Branch) { $Branch = "main" }

$FileName = Read-Host "Enter file name (example: FDS 1 or folder/file.txt)"

$FileUrl = "https://raw.githubusercontent.com/$User/$Repo/refs/heads/$Branch/$FileName"

try {
    $Response = Invoke-RestMethod -Uri $FileUrl -UseBasicParsing
    Write-Host "----- FILE CONTENT START -----`n"
    Write-Host $Response
    Write-Host "`n----- FILE CONTENT END -----"
}
catch {
    Write-Host "❌ Error fetching file: $($_.Exception.Message)"
}
