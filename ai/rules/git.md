# Git

## 方針

具体的な Git 運用ルールが必要になったときに、このファイルへ追記します。

## ルール

### ブランチ運用および開発フロー（GitHub Flow 準拠）

- `main` ブランチへ直接 `git commit` または `git push` は行いません。
- すべての作業は、`main` から分岐した専用のトピックブランチで行います。ブランチ名には `feature/xxx`、`fix/xxx`、`refactor/xxx` などを使用します。
- 作業完了時は Pull Request（PR）を作成します。PR の Description には、`walkthrough.md` を参考に具体的な変更内容と検証結果を記述します。
- 新しい変更をコミットして `git push` する際は、PR の Description も常に最新の内容へ更新します。
