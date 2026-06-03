[CmdletBinding(DefaultParameterSetName = "Attest")]
param(
    [Parameter(ParameterSetName = "Show")]
    [switch]$Show,

    [Parameter(ParameterSetName = "Clear")]
    [switch]$Clear,

    [string]$ProjectRoot = (Get-Location).Path
)

$resolver = Join-Path $PSScriptRoot "resolve-planning-dir.ps1"
if (-not (Test-Path -LiteralPath $resolver -PathType Leaf)) {
    throw "Missing resolver script: $resolver"
}

$planDir = & $resolver -ProjectRoot $ProjectRoot
$planDir = ($planDir | Select-Object -First 1)

if (-not $planDir) {
    throw "No active task plan found. Run init-planning-files.ps1 first."
}

$planFile = Join-Path $planDir "task_plan.md"
if (-not (Test-Path -LiteralPath $planFile -PathType Leaf)) {
    throw "No task_plan.md found at: $planFile"
}

$attestationFile = Join-Path $planDir ".attestation"

if ($Show) {
    if (Test-Path -LiteralPath $attestationFile -PathType Leaf) {
        $hash = (Get-Content -LiteralPath $attestationFile -Raw).Trim()
        Write-Output "Plan: $planFile"
        Write-Output "Attestation: $attestationFile"
        Write-Output "SHA-256: $hash"
        exit 0
    }

    Write-Output "No attestation set for: $planFile"
    exit 1
}

if ($Clear) {
    if (Test-Path -LiteralPath $attestationFile -PathType Leaf) {
        Remove-Item -LiteralPath $attestationFile -Force
        Write-Output "Cleared attestation for: $planFile"
    } else {
        Write-Output "No attestation to clear."
    }
    exit 0
}

$hash = (Get-FileHash -LiteralPath $planFile -Algorithm SHA256).Hash.ToLowerInvariant()
$tmp = "$attestationFile.tmp.$PID"

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($tmp, $hash, $utf8NoBom)
Move-Item -LiteralPath $tmp -Destination $attestationFile -Force

Write-Output "Locked plan: $planFile"
Write-Output "SHA-256: $($hash.Substring(0, 12))... stored in $attestationFile"
Write-Output "Refresh this attestation after intentional plan edits."
