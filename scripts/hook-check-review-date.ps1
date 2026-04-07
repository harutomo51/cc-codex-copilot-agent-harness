foreach ($f in ($env:CLAUDE_FILE_PATHS -split '\s+' | Where-Object { $_ })) {
    if ($f -match '(^|[/\\])CLAUDE\.md$') {
        pwsh -File scripts/check-review-date.ps1
    }
}
