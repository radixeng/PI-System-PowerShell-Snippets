
# USER DEFINED VARIABLES (replace these)
$ROOT_VISION_URL = "https://localhost/PIVision/"

# Get PI Vision dashboard metadata
$domainCredential = Get-Credential # Will prompt user to input credentials
$visionDashboards = Invoke-WebRequest `
    -Uri "$($ROOT_VISION_URL)/Services/Repository?storagetype=StandardDisplay&storagetype=ProcessBookDisplay&storagetype=EventCompareDisplay" `
    -Credential $domainCredential | ConvertFrom-Json

# Sort PI Vision dashboard metadata for dashboard owners 
$displayOwners = $visionDashboards | Select-Object Owner -Unique
$displayOwners

