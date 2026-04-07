# verify-claude-md-refs.ps1 — CLAUDE.md 内のパス参照が実在するか検証する（冪等）

$errors = 0

function Check-Exists {
    param([string]$ref)
    if (-not (Test-Path $ref)) {
        Write-Error "CLAUDE.md参照切れ: $ref"
        $script:errors++
    }
}

# CLAUDE.md が参照するパス・ファイルを検証
Check-Exists ".agent-team"
Check-Exists "scripts\init-workspace.ps1"
Check-Exists "shared\review-findings.schema.json"
Check-Exists "shared\result.schema.json"
Check-Exists "shared\coordination-protocol.md"
Check-Exists ".claude\agents"
Check-Exists ".claude\settings.json"

# エージェント件数の整合性チェック
$expected = 19
$actual = (Get-ChildItem ".claude\agents\*.md" -ErrorAction SilentlyContinue | Measure-Object).Count
if ($expected -ne $actual) {
    Write-Error "エージェント件数不一致: CLAUDE.md記載=$expected / ファイル実数=$actual"
    $errors++
}

if ($errors -gt 0) {
    Write-Error "検証失敗: $errors 件の参照切れ"
    exit 2
}

Write-Host "CLAUDE.md参照検証 OK（エージェント${actual}件）"
