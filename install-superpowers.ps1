#Requires -Version 5.1
# ==============================================================================
# SUPERPOWERS FOR VS CODE - INSTALLER & UPDATER (PowerShell)
# ==============================================================================
# Windows port of install-superpowers.sh
#
# USAGE:
#   Open PowerShell in your project root (where .git/ lives) and run:
#   irm https://raw.githubusercontent.com/abatplus/discover-ai-with-ai/main/install-superpowers.ps1 | iex
#
#   Or locally:
#   .\install-superpowers.ps1
# ==============================================================================

$ErrorActionPreference = "Stop"

# --- CONFIGURATION ---
$RepoUrl = "https://github.com/obra/superpowers"
$CacheRoot = if ($env:XDG_CACHE_HOME) { $env:XDG_CACHE_HOME } else { Join-Path $HOME ".cache" }
$InstallDir = Join-Path $CacheRoot "superpowers"

# Project locations (relative to where you run the script)
$TargetDir = ".github"
$InstructionsFile = Join-Path $TargetDir "copilot-instructions.md"
$PromptsDir = Join-Path $TargetDir "prompts"

# --- COMMAND MAPPING ---
$SkillsToInstall = @(
    # Core workflow
    @{ Src = "writing-plans";       Cmd = "write-plan";       Desc = "Create a detailed implementation plan (Superpowers)" }
    @{ Src = "executing-plans";     Cmd = "execute-plan";     Desc = "Execute an implementation plan with checkpoints" }
    @{ Src = "brainstorming";       Cmd = "brainstorm";       Desc = "Generate creative solutions and explore ideas" }
    # Testing & Debugging
    @{ Src = "test-driven-development";    Cmd = "tdd";            Desc = "Implement code using strict TDD cycles" }
    @{ Src = "systematic-debugging";       Cmd = "investigate";    Desc = "Perform systematic root-cause analysis" }
    @{ Src = "verification-before-completion"; Cmd = "verify";     Desc = "Ensure fixes work before claiming success" }
    # Git Workflows
    @{ Src = "using-git-worktrees";            Cmd = "worktree";       Desc = "Create isolated workspace for parallel development" }
    @{ Src = "finishing-a-development-branch";  Cmd = "finish-branch";  Desc = "Merge, PR, or discard completed work" }
    # Code Review
    @{ Src = "requesting-code-review";  Cmd = "review";          Desc = "Request a self-correction code review" }
    @{ Src = "receiving-code-review";   Cmd = "receive-review";  Desc = "Respond to code review feedback" }
    # Advanced Development
    @{ Src = "subagent-driven-development";   Cmd = "subagent-dev";     Desc = "Dispatch subagents for task-by-task development" }
    @{ Src = "dispatching-parallel-agents";   Cmd = "dispatch-agents";  Desc = "Run concurrent subagent workflows" }
    # Meta
    @{ Src = "writing-skills";      Cmd = "write-skill";   Desc = "Create new skills following TDD best practices" }
    @{ Src = "using-superpowers";   Cmd = "superpowers";   Desc = "Learn about the Superpowers capabilities" }
)

$StartTag = "<!-- SUPERPOWERS-START -->"
$EndTag   = "<!-- SUPERPOWERS-END -->"

# ==============================================================================

Write-Host ""
Write-Host "====================================" -ForegroundColor Cyan
Write-Host " Superpowers Installer & Updater"     -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# --- CHECK: git available? ---
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: git is not installed or not in PATH." -ForegroundColor Red
    Write-Host "Please install Git for Windows: https://git-scm.com/download/win"
    exit 1
}

# --- PREVIEW ---
Write-Host "PREVIEW: Superpowers Installation Plan" -ForegroundColor Yellow
Write-Host ("=" * 60)
Write-Host ""
Write-Host "  Cache Location : $InstallDir"
Write-Host "  Workspace Link : .\.superpowers"
Write-Host "  Instructions   : .\$InstructionsFile"
Write-Host "  Prompts Dir    : .\$PromptsDir"
Write-Host "  Skills         : $($SkillsToInstall.Count) slash commands"
Write-Host ""

# Detect current state
if (Test-Path $InstallDir) {
    Write-Host "  [update] Global cache (pull latest)" -ForegroundColor DarkCyan
} else {
    Write-Host "  [clone]  Global cache" -ForegroundColor Green
}

$superpowersPath = Join-Path "." ".superpowers"
if (Test-Path $superpowersPath) {
    $item = Get-Item $superpowersPath -Force
    if ($item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) {
        $target = $item.Target
        if ($target -eq $InstallDir) {
            Write-Host "  [skip]   Symlink already correct" -ForegroundColor DarkGray
        } else {
            Write-Host "  [replace] Symlink (wrong target: $target)" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  [backup] .superpowers dir -> .superpowers.old" -ForegroundColor Yellow
    }
} else {
    Write-Host "  [create] Symlink .superpowers" -ForegroundColor Green
}
Write-Host ""

# Confirm
$response = Read-Host "Proceed with installation? (Y/n)"
if ($response -and $response -notmatch '^[Yy]') {
    Write-Host "Cancelled."
    exit 0
}

Write-Host ""
Write-Host "EXECUTING INSTALLATION..." -ForegroundColor Cyan
Write-Host ("=" * 60)
Write-Host ""

# --- 0. HANDLE EXISTING .superpowers ---
if (Test-Path $superpowersPath) {
    $item = Get-Item $superpowersPath -Force
    if ($item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) {
        $target = $item.Target
        if ($target -eq $InstallDir) {
            Write-Host "[ok] .superpowers symlink already correct" -ForegroundColor Green
        } else {
            Write-Host "[replace] Removing old symlink (pointed to: $target)" -ForegroundColor Yellow
            Remove-Item $superpowersPath -Force
        }
    } else {
        Write-Host "[backup] Moving .superpowers -> .superpowers.old" -ForegroundColor Yellow
        if (Test-Path ".superpowers.old") { Remove-Item ".superpowers.old" -Recurse -Force }
        Rename-Item $superpowersPath ".superpowers.old"
    }
}

# --- 1. UPDATE SOURCE OF TRUTH ---
if (Test-Path $InstallDir) {
    Write-Host "[update] Updating Superpowers cache..." -ForegroundColor Cyan
    git -C $InstallDir pull -q
} else {
    Write-Host "[clone] Cloning Superpowers to $InstallDir..." -ForegroundColor Cyan
    $parentDir = Split-Path $InstallDir -Parent
    if (-not (Test-Path $parentDir)) { New-Item -ItemType Directory -Path $parentDir -Force | Out-Null }
    git clone -q $RepoUrl $InstallDir
}

# --- 1.5 CREATE SYMLINK ---
if (-not (Test-Path $superpowersPath)) {
    Write-Host "[link] Creating workspace symlink..." -ForegroundColor Cyan
    try {
        New-Item -ItemType SymbolicLink -Path $superpowersPath -Target $InstallDir -Force | Out-Null
        Write-Host "[ok] Symlink created: .\.superpowers -> $InstallDir" -ForegroundColor Green
    } catch {
        # Symlinks may require Developer Mode or admin on Windows
        Write-Host "[warn] Symlink failed (requires Developer Mode or admin)." -ForegroundColor Yellow
        Write-Host "       Falling back to directory junction..." -ForegroundColor Yellow
        try {
            cmd /c mklink /J "$superpowersPath" "$InstallDir" | Out-Null
            Write-Host "[ok] Junction created: .\.superpowers -> $InstallDir" -ForegroundColor Green
        } catch {
            Write-Host "[warn] Junction also failed. Copying files instead..." -ForegroundColor Yellow
            Copy-Item -Path $InstallDir -Destination $superpowersPath -Recurse -Force
            Write-Host "[ok] Files copied to .\.superpowers (no auto-update)" -ForegroundColor Green
        }
    }
} else {
    Write-Host "[ok] Symlink ready: .\.superpowers -> $InstallDir" -ForegroundColor Green
}

# --- 2. PREPARE THE KERNEL ---
$KernelSource = Join-Path (Join-Path (Join-Path $InstallDir "skills") "using-superpowers") "SKILL.md"
if (-not (Test-Path $KernelSource)) {
    Write-Host "ERROR: Could not find core skill at $KernelSource" -ForegroundColor Red
    exit 1
}

$KernelContent = @"
# SUPERPOWERS PROTOCOL
You are an autonomous coding agent operating on a strict "Loop of Autonomy."

## CORE DIRECTIVE: The Loop
For every request, you must execute the following cycle:
1. **PERCEIVE**: Read ``plan.md``. Do not act without checking the plan.
2. **ACT**: Execute the next unchecked step in the plan.
3. **UPDATE**: Check off the step in ``plan.md`` when verified.
4. **LOOP**: If the task is large, do not stop. Continue to the next step.

## YOUR SKILLS (Slash Commands)
VS Code reserved commands are replaced with these Superpowers equivalents:

- **Use ``/write-plan``** (instead of /plan) to interview me and build ``plan.md``.
- **Use ``/investigate``** (instead of /fix) when tests fail to run a systematic analysis.
- **Use ``/tdd``** to write code. NEVER write code without a failing test.

## RULES
- If ``plan.md`` does not exist, your ONLY valid action is to ask to run ``/write-plan``.
- Do not guess. If stuck, write a theory in ``scratchpad.md``.

## AVAILABLE SKILLS

All skill definitions are available at ``./.superpowers/skills/`` (workspace-resident).
This path keeps all Superpowers content within your workspace, preventing permission prompts.
"@

$NewInstructionBlock = @"
$StartTag
$KernelContent
$EndTag
"@

# --- 3. INJECT INTO copilot-instructions.md ---
if (-not (Test-Path $TargetDir)) { New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null }

if (Test-Path $InstructionsFile) {
    $content = Get-Content $InstructionsFile -Raw -Encoding UTF8
    if ($content -match [regex]::Escape($StartTag)) {
        Write-Host "[update] Updating existing Superpowers kernel..." -ForegroundColor Cyan
        $pattern = [regex]::Escape($StartTag) + "[\s\S]*?" + [regex]::Escape($EndTag)
        $content = [regex]::Replace($content, $pattern, $NewInstructionBlock)
        Set-Content -Path $InstructionsFile -Value $content -Encoding UTF8 -NoNewline
    } else {
        Write-Host "[backup] Found unmanaged instructions. Backing up..." -ForegroundColor Yellow
        Copy-Item $InstructionsFile "$InstructionsFile.old"
        $migrated = "# Custom Instructions`n(Migrated from old file)`n`n$NewInstructionBlock"
        Set-Content -Path $InstructionsFile -Value $migrated -Encoding UTF8 -NoNewline
        Write-Host "[ok] Old instructions backed up to $InstructionsFile.old" -ForegroundColor Green
    }
} else {
    Write-Host "[create] Initializing new instructions file..." -ForegroundColor Cyan
    Set-Content -Path $InstructionsFile -Value $NewInstructionBlock -Encoding UTF8 -NoNewline
}

# --- 4. INSTALL SKILLS AS PROMPTS ---
if (-not (Test-Path $PromptsDir)) { New-Item -ItemType Directory -Path $PromptsDir -Force | Out-Null }
Write-Host "[install] Installing skills as prompts..." -ForegroundColor Cyan

foreach ($skill in $SkillsToInstall) {
    $srcPath  = Join-Path (Join-Path (Join-Path $InstallDir "skills") $skill.Src) "SKILL.md"
    $destPath = Join-Path $PromptsDir "$($skill.Cmd).prompt.md"

    if (Test-Path $srcPath) {
        Write-Host "   -> /$($skill.Cmd) ($($skill.Desc))"
        $skillContent = Get-Content $srcPath -Raw -Encoding UTF8
        $promptContent = @"
---
name: $($skill.Cmd)
description: $($skill.Desc)
---
# Skill: $($skill.Src)
$skillContent
"@
        Set-Content -Path $destPath -Value $promptContent -Encoding UTF8 -NoNewline
    } else {
        Write-Host "   [warn] Skill '$($skill.Src)' not found in repo." -ForegroundColor Yellow
    }
}

# --- DONE ---
Write-Host ""
Write-Host "INSTALLATION COMPLETE" -ForegroundColor Green
Write-Host ("=" * 60)
Write-Host ""
Write-Host "  Symlink  : .\.superpowers -> $InstallDir" -ForegroundColor Green
Write-Host "  Config   : .\$InstructionsFile" -ForegroundColor Green
Write-Host "  Skills   : $($SkillsToInstall.Count) slash commands" -ForegroundColor Green
Write-Host ""
foreach ($skill in $SkillsToInstall) {
    Write-Host "   /$($skill.Cmd)" -ForegroundColor DarkCyan
}
Write-Host ""
Write-Host "NEXT STEP: Reload VS Code" -ForegroundColor Yellow
Write-Host '   Command Palette -> "Developer: Reload Window"'
Write-Host ""
Write-Host "NOTE: No permission prompts - skills are workspace-resident via symlink" -ForegroundColor DarkGray
Write-Host ""
Write-Host "Done! Superpowers is active." -ForegroundColor Green
