$ErrorActionPreference = 'Stop'

$repositoryRoot = Split-Path -Parent $PSScriptRoot
$testRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("cpc-test-" + [guid]::NewGuid())

try {
    & (Join-Path $repositoryRoot 'scripts/bootstrap.ps1') -TargetPath $testRoot

    foreach ($expectedFile in 'AGENTS.md', 'PROJECTS.md', 'ARCHITECTURE.md') {
        if (-not (Test-Path -LiteralPath (Join-Path $testRoot $expectedFile) -PathType Leaf)) {
            throw "Bootstrap did not create $expectedFile"
        }
    }

    $failedAsExpected = $false
    try {
        & (Join-Path $repositoryRoot 'scripts/bootstrap.ps1') -TargetPath $testRoot
    } catch {
        $failedAsExpected = $true
    }

    if (-not $failedAsExpected) {
        throw 'Bootstrap must refuse a non-empty target unless -Force is given'
    }
} finally {
    if (Test-Path -LiteralPath $testRoot) {
        Remove-Item -LiteralPath $testRoot -Recurse -Force
    }
}
