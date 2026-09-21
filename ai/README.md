# AI 共通ルール

このディレクトリには、仕事と私用のどちらの環境でも共有できる、AI エージェント向けの一般的なルールと設定のみを置きます。

## 置いてよいもの

- 一般的なコーディング規約
- 設計・レビュー・テスト・Git に関する一般的な方針
- Claude、Codex などの AI エージェントへの共通指示
- 秘密情報や環境固有の情報を含まない再利用可能なテンプレート

## 置かないもの

次の情報は、このディレクトリに追加しません。

- 会社または顧客に関する情報
- 仕事固有のソースコード、仕様、プロジェクト情報
- 議事録
- 人名または組織情報
- 個人または家族に関する情報
- 個人メモ
- パスワード、API キー、トークンなどの資格情報や秘密情報

内容に機密性がある、または利用する環境に依存する可能性がある場合は、このディレクトリには保存しません。

## 構成

- `AGENTS.md`: AI エージェント共通の指示
- `rules/`: 分野ごとの一般ルール

## セットアップ

ここでは、dotfiles を `~/Works/github.com/kojoma/dotfiles` に配置した場合を例にします。別の場所に配置している場合は、以下のパスを実際の絶対パスへ置き換えてください。

### Codex

Codex のグローバル指示ファイル `~/.codex/AGENTS.md` に、共有ルールの正本を参照する指示を記載します。

```md
# 共有 AI ルール

すべての作業を開始する前に、共有ルールの正本である `/Users/<ユーザー名>/Works/github.com/kojoma/dotfiles/ai/AGENTS.md` を参照してください。

作業内容に応じて、同じディレクトリにある `rules/` 以下の関連するルールも参照してください。共有ルールの更新が必要な場合は、`AGENTS.md` に記載された手順に従います。
```

設定後は、新しい Codex セッションを開始してください。

### Claude Code

Claude Code のグローバル指示ファイル `~/.claude/CLAUDE.md` から、共有ルールを読み込みます。

```md
# 共有 AI ルール

@~/Works/github.com/kojoma/dotfiles/ai/AGENTS.md
@~/Works/github.com/kojoma/dotfiles/ai/rules/coding.md
@~/Works/github.com/kojoma/dotfiles/ai/rules/testing.md
@~/Works/github.com/kojoma/dotfiles/ai/rules/git.md
```

設定後は、新しい Claude Code セッションを開始してください。

### 運用上の注意

- 共有ルールを更新した場合は、各Macで `dotfiles` を最新化してから新しいセッションを開始します。
- 会社やプロジェクト固有の指示は、この共有ルールには追加せず、対象リポジトリ内の `CLAUDE.md` や `AGENTS.md` に置きます。
