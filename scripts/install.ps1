param (
    [string]$RepoOwner = "YOUR_GITHUB_USERNAME",
    [string]$Branch = "master"
)

$SkillName = "de-ai-writing-style"
$TargetDir = Join-Path $HOME ".gemini\config\skills\$SkillName"

Write-Host "==> 准备部署 $SkillName 技能..." -ForegroundColor Cyan

if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
}

$LocalFile = Join-Path $PSScriptRoot "..\skills\$SkillName\SKILL.md"
$TargetFile = Join-Path $TargetDir "SKILL.md"

if (Test-Path $LocalFile) {
    Copy-Item -Force $LocalFile $TargetFile
    Write-Host "✅ [本地部署成功] 技能文件已复制到: $TargetFile" -ForegroundColor Green
} else {
    $RawUrl = "https://raw.githubusercontent.com/$RepoOwner/$SkillName/$Branch/skills/$SkillName/SKILL.md"
    Write-Host "==> [远程一键拉取] 正在从 $RawUrl 下载..." -ForegroundColor Yellow
    try {
        Invoke-RestMethod -Uri $RawUrl -OutFile $TargetFile
        Write-Host "✅ [远程部署成功] 技能文件已部署到: $TargetFile" -ForegroundColor Green
    } catch {
        Write-Error "下载失败，请检查网络连接或确认 GitHub 用户名是否正确配置。"
        exit 1
    }
}
Write-Host "🎉 部署完成！在 Antigravity 中输入方案润色或去AI味指令即可自动激活。" -ForegroundColor Cyan
