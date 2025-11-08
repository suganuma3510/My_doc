# GitHub Actions
GitHubが提供するCI/CDサービス
リポジトリ内でコードのビルド、テスト、デプロイなどの自動化されたワークフローを作成および管理できる

## 推奨される設定
### ブランチプロテクションルール
GitHubのブランチプロテクションルールを設定することで、特定のブランチに対する変更を制限できる。
以下のようなルールを設定することができる。
- プルリクエストを通じてのみ変更を許可
- 特定のレビュアーによる承認を必須にする
- CI/CDの成功を必須にする
- 強制プッシュを禁止する
- ブランチの削除を禁止する
- etc...

### シークレットスキャン
GitHubのシークレットスキャンを有効にすることで、リポジトリにシークレットが含まれている場合に通知を受け取ることができる。

## Tips
### Bashのトレーシングオプションの有効化
`set -x`を実行すると、実行されるコマンドとその結果が表示されるようになるため、デバッグ時に有効。

```yml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Enable tracing
        run: |
          set -x
          hostname
```

### ログのグループ化
`group`を指定することで、ログをグループ化できる。

```yml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Grouped log
        run: |
          echo "::group::My group"
          echo "This is a grouped log"
          echo "::endgroup::"
```
