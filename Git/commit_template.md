#### コミットメッセージテンプレート
```
fix：バグ修正
hotfix：緊急性の高いバグ修正
add：新規（ファイル）機能追加
update：機能修正（バグではない）
change：仕様変更
clean：整理（リファクタリング等）
disable：無効化（コメントアウト等）
remove：削除（ファイル）
upgrade：バージョンアップ
revert：変更取り消し
```

#### コミットメッセージ書き方
```
1行目：変更内容の要約（タイトル、概要）
2行目：空行
3行目以降：変更した理由（内容、詳細）

Add: グローバルナビゲーションを追加する

ファイルは〇〇で管理する。
構成が大きく変わるため、スマホとタブレット以降で別のHTMLを表示している。
```

#### ブランチ名

| 種類    |  分岐元 |    マージ先     |                                 用途途                                  |
| :------: | :------: | :-------------: | :---------------------------------------------------------------------: |
| feature | develop |     develop     | 機能実装やバグ修正などの開発作業を行う<br>例：feature/add_function_name |
| release | develop | developとmaster |         リリース準備作業を行う<br>例：release/add_function_name         |

#### 参考文献
[GitHubで使われている実用英語コメント集](https://qiita.com/shikichee/items/a5f922a3ef3aa58a1839)
[Gitのコミットメッセージの書き方](https://qiita.com/itosho/items/9565c6ad2ffc24c09364)
[BcRikko/【メモ】Issueの書き方.md](https://gist.github.com/BcRikko/6af0b248148c12d3ab90)
[git-flowとgithub-flow](https://www.atmarkit.co.jp/ait/articles/1708/01/news015.html#021)
