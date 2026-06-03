[CmdletBinding()]
param(
    [string]$ProjectRoot = (Get-Location).Path
)

$planningRoot = Join-Path $ProjectRoot ".planning"
$activeRoot = Join-Path $planningRoot "active"
$activePointer = Join-Path $planningRoot ".active_plan"
$slugPattern = '^[A-Za-z0-9_][A-Za-z0-9._-]*$'

function Test-SafeSlug {
    param([string]$Slug)
    return -not [string]::IsNullOrWhiteSpace($Slug) -and $Slug -match $slugPattern
}

function Resolve-Slug {
    param([string]$Slug)
    if (-not (Test-SafeSlug -Slug $Slug)) {
        return $null
    }

    $candidate = Join-Path $activeRoot $Slug
    $planFile = Join-Path $candidate "task_plan.md"
    if ((Test-Path -LiteralPath $candidate -PathType Container) -and
        (Test-Path -LiteralPath $planFile -PathType Leaf)) {
        return (Resolve-Path -LiteralPath $candidate).Path
    }

    return $null
}

$envSlug = $env:META_PLAN_ID
if (-not $envSlug) {
    $envSlug = $env:PLAN_ID
}

$resolved = Resolve-Slug -Slug $envSlug
if ($resolved) {
    Write-Output $resolved
    exit 0
}

if (Test-Path -LiteralPath $activePointer -PathType Leaf) {
    $pointerSlug = (Get-Content -LiteralPath $activePointer -Raw).Trim([char]0xFEFF).Trim()
    $resolved = Resolve-Slug -Slug $pointerSlug
    if ($resolved) {
        Write-Output $resolved
        exit 0
    }
}

if (Test-Path -LiteralPath $activeRoot -PathType Container) {
    $latest = Get-ChildItem -LiteralPath $activeRoot -Directory -ErrorAction SilentlyContinue |
        Where-Object {
            $_.Name -match $slugPattern -and
            (Test-Path -LiteralPath (Join-Path $_.FullName "task_plan.md") -PathType Leaf)
        } |
        Sort-Object LastWriteTimeUtc -Descending |
        Select-Object -First 1

    if ($latest) {
        Write-Output $latest.FullName
        exit 0
    }
}

exit 0
