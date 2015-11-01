# General powershell tips

# Set strict mode and fail script on errors
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# Use DATA to define constants
# https://technet.microsoft.com/en-us/library/hh848302.aspx 
$myVar = DATA { "value" }

# Exit code of last-executed call
$lastExitCode 