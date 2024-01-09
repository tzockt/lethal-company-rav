# Aktuellen Arbeitsordner als Quellpfad verwenden
$sourcePath = Get-Location
$zipFileName = "manifest.zip"
$zipFilePath = Join-Path -Path $sourcePath -ChildPath $zipFileName

# Überprüfen, ob die Zip-Datei bereits existiert, und löschen
if (Test-Path $zipFilePath) {
    Remove-Item $zipFilePath -Force
    Write-Host "Vorhandenes Archiv gelöscht: $zipFileName"
}

# Liste der zu inkludierenden Dateien
$includedFiles = @("manifest.json", "icon.png", "README.md")

# Zippen der ausgewählten Dateien
Compress-Archive -Path $includedFiles -DestinationPath $zipFilePath

Write-Host "Erfolgreich in $zipFileName gepackt."
