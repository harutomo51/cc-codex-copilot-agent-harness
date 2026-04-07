# cc-copilot-agent-harness

Claude Code × GitHub Copilot Coding Agent によるマルチエージェント開発基盤。

19の専門エージェントが連携し、実装フェーズを GitHub Copilot に委任することで
設計・実装・レビューのサイクルを自動化します。

## 概要

- **性質**: Claude Code Agent Team のスキル定義・運用基盤（コード開発プロジェクトではない）
- **主要ファイル形式**: Markdown（エージェント定義）、JSON（スキーマ、タスク）
- **エージェント定義**: `.claude/agents/`（19エージェント）

## アーキテクチャ

```
Human → CEO → AR → 設計エージェント群（ARCH / TL / UIUX / DBA / PM）
                 ↓
         実装エージェント（FE / BE / INFRA / CICD）
                 ↓ GitHub Issue 作成 + Copilot に割り当て
         GitHub Copilot Coding Agent
                 ↓ PR 作成
         レビューエージェント（REV / SEC / TEST）
                 ↓ 承認
         人間が gh pr merge
```

FE / BE / INFRA / CICD は直接コードを書かず、GitHub Issue 経由で Copilot に実装を委任します。

## エージェント構成

| エージェント | 略称 | 役割 |
|------------|------|------|
| **ceo** | CEO | 統括者・人間との唯一の窓口 |
| **agent-router** | AR | 専門エージェントへのルーティング・実行計画策定 |
| **knowledge-manager** | KM | 知識・コンテキスト管理 |
| **context-graph** | CG | 依存関係グラフ・変更影響分析 |
| **architect-evaluator** | ARCH-EVAL | Gate 1: アーキテクチャ評価 |
| **design-evaluator** | DESIGN-EVAL | Gate 2: デザイン評価 |
| architect | ARCH | システム構造設計 |
| tech-lead | TL | 技術スタック選定・規約策定 |
| ui-ux-designer | UIUX | UI/UX設計 |
| database-specialist | DBA | DB設計・スキーマ |
| project-manager | PM | タスク管理・WBS |
| frontend-expert | FE | UI実装（GitHub Copilot 経由） |
| backend-expert | BE | API実装（GitHub Copilot 経由） |
| infra-expert | INFRA | インフラ構築（GitHub Copilot 経由） |
| cicd-engineer | CICD | CI/CDパイプライン（GitHub Copilot 経由） |
| security-expert | SEC | セキュリティレビュー |
| reviewer | REV | コードレビュー |
| tester | TEST | テスト |
| document-writer | DOC | ドキュメント整備 |

詳細は [docs/agents.md](docs/agents.md) を参照。

## 使い方

開発タスクは **CEO エージェント** に委任してください。

```
CEO -> AR -> 専門エージェント群
```

詳細なオペレーションシーケンスは [OPERATION-SEQUENCE.md](OPERATION-SEQUENCE.md) を参照。
Copilot 連携の詳細は [docs/copilot-coding-agent.md](docs/copilot-coding-agent.md) を参照。

## ワークスペース初期化

初回利用前（または新規クローン後）にワークスペースを初期化してください。
セッション開始時にも自動実行されます。

- Windows: `pwsh -File scripts/init-workspace.ps1`
- Linux / macOS: `bash scripts/init-workspace.sh`

## 環境

- OS: Windows 11 / シェル: bash (Git Bash) または PowerShell
- Python: 3.11+（検証スクリプト用）/ 依存管理: `uv`
- Hook 依存: `jsonschema`, `markdownlint-cli`

## ライセンス

[MIT](LICENSE)
