# Load AFSDK
[void] [Reflection.Assembly]::LoadWithPartialName("OSIsoft.AFSDK")

# User supplied values
$DATA_ARCHIVE_NAME = 'CENTRALPISERVER'
$TAG_NAME = 'SINUSOID'
$START_TIME = '*'
$END_TIME = '*-8h'
$MAX_VALUE_COUNT = 100

# Connect to Data Archive
$dataArchive = [OSIsoft.AF.PI.PIServer]::FindPIServer($DATA_ARCHIVE_NAME)
$piPoint = [OSISoft.AF.PI.PIPoint]::FindPIPoint($dataArchive, $TAG_NAME)

# Collect PI Point Values
$piPointValues = $piPoint.RecordedValues(
    [OSIsoft.AF.Time.AFTimeRange]::new(
        [OSIsoft.AF.Time.AFTime]::new($START_TIME),
        [OSIsoft.AF.Time.AFTime]::new($END_TIME)
    ),
    [OSIsoft.AF.Data.AFBoundaryType]::Inside,
    $null,
    $true,
    $MAX_VALUE_COUNT
)

# Output PI Point Values to gridview
$piPointValues | Out-GridView