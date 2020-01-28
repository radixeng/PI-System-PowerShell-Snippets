# This can be used to fetch any PI System Object (i.e. PI Points, Elements, Attributes, Analyses, Event Frames)

# Load AF SDK
$AFSDKAssembly = [Reflection.Assembly]::LoadWithPartialName("OSIsoft.AFSDK")  

# USER DEFINED VARIABLES (replace these)
$AF_OBJECT_PATH = "\\SERVER\AF_DATABASE\PARENT_ELEMENT\ELEMENT|ATTRIBUTE" # can get this by right-clicking and selecting "Copy Path" in PI System Explorer

[OSIsoft.AF.AFObject]::FindObject($AF_OBJECT_PATH)
