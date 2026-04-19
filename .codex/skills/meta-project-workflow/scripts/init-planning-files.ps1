param(
    [Parameter(Mandatory = $true)]
    [string]$TaskSlug,

    [string]$ProjectRoot = (Get-Location).Path,

    [switch]$Force
)

$taskSlugSafe = $TaskSlug.Trim().ToLower()
$taskSlugSafe = [regex]::Replace($taskSlugSafe, "\s+", "-")
$invalidChars = [System.IO.Path]::GetInvalidFileNameChars()
$taskSlugSafe = -join ($taskSlugSafe.ToCharArray() | Where-Object { $_ -notin $invalidChars })
$taskSlugSafe = [regex]::Replace($taskSlugSafe, "-{2,}", "-").Trim("-",".")

if (-not $taskSlugSafe) {
    throw "TaskSlug cannot be empty."
}

$skillRoot = Split-Path -Parent $PSScriptRoot
$templateRoot = Join-Path $skillRoot "templates"
$planningRoot = Join-Path $ProjectRoot ".planning"
$activeRoot = Join-Path $planningRoot "active"
$targetRoot = Join-Path $activeRoot $taskSlugSafe

New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null

$files = @(
    "task_plan.md",
    "findings.md",
    "progress.md"
)

foreach ($file in $files) {
    $source = Join-Path $templateRoot $file
    $target = Join-Path $targetRoot $file

    if ((Test-Path $target) -and -not $Force) {
        Write-Output "Skipped existing file: $target"
        continue
    }

    Copy-Item -LiteralPath $source -Destination $target -Force
    Write-Output "Created: $target"
}

Write-Output "Planning workspace ready at: $targetRoot"
