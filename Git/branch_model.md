# ブランチモデル
開発を進めるにあたって、どのようにブランチを活用していくかのルールのこと

## Git-flow
役割が決められた5種類のブランチを切り替えながら開発を進めていくブランチモデル

特徴：
長いインターバルで定期的なデプロイを行うようなチームに向いている。  
大規模な開発で使われることが多い。

メリット：
- 本番環境と開発環境の区別が明確になる
- リリース、修正、機能追加などの違う作業を同時並行で進めることができる。

デメリット：
- 構造が少し複雑

5種類のブランチ
- master
- develop
- feature
- release
- hotfix


|  種類   | 分岐元  |    マージ先     |                                 用途途                                  |
| :-----: | :-----: | :-------------: | :---------------------------------------------------------------------: |
| feature | develop |     develop     | 機能実装やバグ修正などの開発作業を行う<br>例：feature/add_function_name |
| release | develop | developとmaster |         リリース準備作業を行う<br>例：release/add_function_name         |

## GitHub-flow

主に2種類のブランチ(master・feature)を使い開発を行う。  

特徴：
- 毎日デプロイを行うようなチームに向いている
- 小規模な開発で使われることが多い
- Pull Requestを活用する
- masterブランチは常にデプロイ可能

メリット：
- 手順がシンプル
- 定期デプロイを行うので、大きなバグが少ない

デメリット：
- ブランチ運用ルールが簡略化されすぎているため大規模開発には向いていない


## 参考記事
- [非エンジニアのためのGit\-flowの運用方法とケーススタディをご紹介 \| Digitoo](https://digitoo.trans-cosmos.co.jp/blog/git-flow/#section4)
- [GitHub Flowとは \- Qiita](https://qiita.com/tatane616/items/aec00cdc1b659761cf88)