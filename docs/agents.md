# エージェント一覧

## 全エージェント

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
| security-expert | SEC | セキュリティ |
| reviewer | REV | コードレビュー |
| tester | TEST | テスト |
| document-writer | DOC | ドキュメント整備 |

## ディスパッチ経路

```
Human → CEO
  ├─ CEO が直接ディスパッチ: AR / KM / CG / ARCH-EVAL / DESIGN-EVAL
  └─ AR 経由でディスパッチ: ARCH / TL / UIUX / DBA / PM / FE / BE / INFRA / CICD / SEC / REV / TEST / DOC
```

## CEO を経由しない直呼び条件

次の**すべて**を満たす場合のみ `reviewer` を直呼びしてよい:

- 対象が 1 ファイル以内
- lint / タイポ / フォーマット修正のみ（仕様変更を伴わない）
- 他エージェントの成果物への影響がない

それ以外は必ず CEO 経由。迷ったら CEO。
