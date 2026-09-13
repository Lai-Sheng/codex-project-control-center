[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$TargetPath,
    [switch]$Force
)

$scriptRoot = Split-Path -Parent $PSCommandPath
$templatePath = Join-Path (Split-Path -Parent $scriptRoot) 'templates/control-center'
$resolvedTarget = [System.IO.Path]::GetFullPath($TargetPath)

if (-not (Test-Path -LiteralPath $templatePath -PathType Container)) {
    throw "Control-center template not found: $templatePath"
}

if (Test-Path -LiteralPath $resolvedTarget) {
    $existingItems = Get-ChildItem -LiteralPath $resolvedTarget -Force
    if ($existingItems.Count -gt 0 -and -not $Force) {
        throw "Target already contains files. Choose an empty folder or rerun with -Force: $resolvedTarget"
    }
} else {
    New-Item -ItemType Directory -Path $resolvedTarget -Force | Out-Null
}

Copy-Item -Path (Join-Path $templatePath '*') -Destination $resolvedTarget -Recurse -Force:$Force
Write-Host "Control center created at: $resolvedTarget"
