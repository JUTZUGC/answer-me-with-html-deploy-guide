# Answer me with HTML 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/QingYunA/answer-me-with-html/blob/main/INSTALL.md
# 更新日期：2026-10-29
# 类型：script
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw '需要先安装 Git' }
if (-not (Get-Command node -ErrorAction SilentlyContinue)) { throw '需要先安装 Node.js' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

node -e "const a=+process.versions.node.split('.')[0]; if(a<20){console.error('需要 Node.js 20+，当前 '+process.versions.node);process.exit(1)}"
npx -y skills add QingYunA/answer-me-with-html -g -y
Write-Host '安装完成：在 Agent 里问一个复杂问题试试'

Write-Host ''

Write-Host '安装完成：在 Agent 里问一个复杂问题，例如 Explain the TCP three-way handshake，生成的页面会落在技能输出目录'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/QingYunA/answer-me-with-html/blob/main/INSTALL.md'
