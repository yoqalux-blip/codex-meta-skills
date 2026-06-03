[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$TaskSlug,

    [string]$ProjectRoot = (Get-Location).Path,

    [ValidateSet("General", "Manuscript")]
    [string]$Mode = "General",

    [switch]$Force
)

$taskSlugSafe = $TaskSlug.Trim().ToLowerInvariant()
$taskSlugSafe = [regex]::Replace($taskSlugSafe, "\s+", "-")
$invalidChars = [System.IO.Path]::GetInvalidFileNameChars()
$taskSlugSafe = -join ($taskSlugSafe.ToCharArray() | Where-Object { $_ -notin $invalidChars })
$taskSlugSafe = [regex]::Replace($taskSlugSafe, "[\\/]+", "-")
$taskSlugSafe = [regex]::Replace($taskSlugSafe, "-{2,}", "-").Trim("-", ".")

if (-not $taskSlugSafe) {
    throw "TaskSlug cannot be empty."
}

if ($taskSlugSafe -notmatch '^[a-z0-9_][a-z0-9._-]*$') {
    throw "TaskSlug contains unsupported characters after normalization: $taskSlugSafe"
}

$skillRoot = Split-Path -Parent $PSScriptRoot
$templateRoot = Join-Path $skillRoot "templates"
$planningRoot = Join-Path $ProjectRoot ".planning"
$activeRoot = Join-Path $planningRoot "active"
$targetRoot = Join-Path $activeRoot $taskSlugSafe
$activePointer = Join-Path $planningRoot ".active_plan"

New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null

$files = @(
    "task_plan.md",
    "findings.md",
    "progress.md"
)

if ($Mode -eq "Manuscript") {
    $files += @(
        "manuscript_map.md",
        "claim_evidence_matrix.md",
        "source_register.md",
        "decision_log.md"
    )
}

foreach ($file in $files) {
    $source = Join-Path $templateRoot $file
    $target = Join-Path $targetRoot $file

    if (-not (Test-Path -LiteralPath $source)) {
        throw "Missing template: $source"
    }

    if ((Test-Path -LiteralPath $target) -and -not $Force) {
        Write-Output "Skipped existing file: $target"
        continue
    }

    Copy-Item -LiteralPath $source -Destination $target -Force
    Write-Output "Created: $target"
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($activePointer, $taskSlugSafe, $utf8NoBom)

Write-Output "Active plan: $taskSlugSafe"
Write-Output "Mode: $Mode"
Write-Output "Planning workspace ready at: $targetRoot"
