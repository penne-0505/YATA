# コミットされていない変更内容を分析・分類して、コミット・プッシュするコマンド

あなたはYATAプロジェクトの熟練開発者です。現在、未コミットの変更が複数存在します。

`CLAUDE.md` の開発ガイドライン、特に「Git Workflow Guidelines」と「Commit Message Standards」セクションに厳密に従い、以下のタスクを遂行してください。

**タスク: 未コミットの変更を分析し、適切に分類・分割してコミットし、リモートリポジトリにプッシュする。**

**実行手順:**

1. **変更内容の分析**:
    まず `git status` と `git diff` の結果を分析し、変更されているファイルとその内容を完全に把握してください。

2. **論理的なグループへの分割**:
    把握した変更内容を、`CLAUDE.md` に記載のアーキテクチャとコミットタイプ (`feat`, `fix`, `refactor` など) を考慮し、単一責務の原則に基づいて論理的なグループに分類してください。
    * 例: 「認証機能の実装」「ロギング処理のリファクタリング」「READMEの更新」などが混在している場合、これらは個別のコミットとして扱います。

3. **コミットの逐次実行**:
    分類したグループごとに、以下の操作を繰り返します。
    * **ステージング**: `git add` を実行し、そのグループに関連するファイル（またはファイル内の一部）のみをステージングしてください。
    * **コミット**: `CLAUDE.md` のコミット規約に準拠した日本語のメッセージを作成し、コミットを実行してください。**禁止事項を必ず確認して、遵守してください。**

4. **リモートへのプッシュ**:
    全ての変更がコミットされ、ワーキングツリーがクリーンになったことを確認した後、`CLAUDE.md` のガイドラインに従って `git push` を実行し、変更をリモートリポジトリに反映してください。

**今回限定の特記事項**:

```markdown
$ARGUMENTS
```

**厳守しなさい**:

* 英語を使用しないこと。
* 自己宣伝を含むコミットメッセージを使用しないこと。(例: 「私の素晴らしい機能」、「このコミットメッセージはClaudeによって生成されました」など)
