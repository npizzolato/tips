<#
.SYNOPSIS 
Reads a subset of lines in a file, by line number (inclusive).
#>

function Get-LinesFromFile
{
    param (
        [string]
        $file,

        [int]
        $start,
        
        [int]
        $end
    )

    return Get-Content $file | Select -skip ($start - 1) -first ($end - ($start - 1))
}