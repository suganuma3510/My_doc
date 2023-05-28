- [ステージングエリアに登録](#ステージングエリアに登録)
- [コミット](#コミット)
- [プッシュ（現在のブランチ）](#プッシュ現在のブランチ)
- [push先のリポジトリを登録](#push先のリポジトリを登録)
- [push先のリポジトリの登録を削除](#push先のリポジトリの登録を削除)
- [複数のリモートブランチを設定](#複数のリモートブランチを設定)
- [ブランチ作成](#ブランチ作成)
- [ブランチ削除](#ブランチ削除)
- [ブランチ移動](#ブランチ移動)
- [ブランチを作成と同時に移動](#ブランチを作成と同時に移動)
- [ローカルを最新のリポジトリに更新](#ローカルを最新のリポジトリに更新)
- [作業中のリポジトリに反映（マージ）](#作業中のリポジトリに反映マージ)
- [作業中のリポジトリに反映（リベース）](#作業中のリポジトリに反映リベース)
- [変更の取り消し](#変更の取り消し)
- [変更を退避 \& 適用](#変更を退避--適用)
- [コミットメッセージ変更](#コミットメッセージ変更)
- [コミット取り消し](#コミット取り消し)
- [ブランチ名変更](#ブランチ名変更)
- [差分をチェック](#差分をチェック)
- [違うブランチで作業をしたとき](#違うブランチで作業をしたとき)
- [派生元のブランチを間違え、既にコミット\&プッシュしたとき](#派生元のブランチを間違え既にコミットプッシュしたとき)
- [コミット履歴を確認](#コミット履歴を確認)
- [特定のバージョンに戻す](#特定のバージョンに戻す)
- [リモートブランチ取得](#リモートブランチ取得)
- [タグ操作](#タグ操作)
- [アカウント変更](#アカウント変更)
- [設定確認](#設定確認)
- [フェッチしてdevelopブランチをリベース](#フェッチしてdevelopブランチをリベース)

#### ステージングエリアに登録
```
git add .
```
```
git add -A
```

#### コミット
```
git commit -m "fix："
```

#### プッシュ（現在のブランチ）
```
git push origin HEAD
```

#### push先のリポジトリを登録
```
git remote add origin git@github.com:MikotoSuganuma/media_app.git
```

#### push先のリポジトリの登録を削除
```
git remote rm origin
```

#### 複数のリモートブランチを設定
```
git remote add github git@github.com:test/github.git
git remote -v
```

```
git push github master
```

#### ブランチ作成
```
git branch develop
```

#### ブランチ削除
```
git branch -d [ブランチ名]
```

#### ブランチ移動
```
git checkout develop
```

#### ブランチを作成と同時に移動
```
git checkout develop
git checkout -b feature/
```

#### ローカルを最新のリポジトリに更新
```
git checkout develop
git pull -r
```

```
git pull origin develop
```

複数の人が同じブランチで作業しているとき、他方の修正内容を反映
```
git pull -rp
```

#### 作業中のリポジトリに反映（マージ）
```
git checkout
git merge develop
```

#### 作業中のリポジトリに反映（リベース）
```
git fetch origin
git add .
git stash
git rebase origin/master
git stash pop
```

#### 変更の取り消し
```
git checkout .
```

#### 変更を退避 & 適用
退避
```
git stash
```

退避の一覧を表示
```
git stash list
```

退避した変更を適用
```
git stash apply
```

退避した変更を指定して適用
```
git stash apply 2
```

#### コミットメッセージ変更
```
git commit --amend -m ""
```

#### コミット取り消し
直前のコミットを取り消す
```
git reset --soft HEAD^
```

#### ブランチ名変更
```
git branch -m feature/
```

#### 差分をチェック
```
git diff

```
#### 違うブランチで作業をしたとき

1. 今の作業ブランチを確認
```
git branch
```

2. 変更した分を退避させ、クリーンになっているか確認
```
git stash
git status
```

3. 本来作業したかったブランチに切り替える
```
git checkout
```

4. 退避させた変更分を反映
```
git stash apply
```

#### 派生元のブランチを間違え、既にコミット&プッシュしたとき
1. リベース
```
git rebase --onto [新しい派生元ブランチ名] [間違えた派生元ブランチ名] [変更する派生先ブランチ名]
git rebase --onto staging develop feature/add_
```

2. 強制的に上書き
```
git push -f origin
```


#### コミット履歴を確認
```
git reflog
```

#### 特定のバージョンに戻す
1. コミット履歴を確認する
```
git reflog
```
2. 戻したいバージョンの番号を入力し、戻る
```
git reset --hard HEAD@{2}
```

#### リモートブランチ取得
```
git fetch
git branch -a
```

```
git checkout -b feature/ origin/feature/
```

```
git checkout -t origin/feature/
```

#### タグ操作

作成
```
git tag v1.0
git tag -a v1.0 -m 'Version 1.0'
```

リスト表示
```
git tag
```

削除
```
git tag -d tag-name
```

プッシュ
```
git push origin --tags
```

#### アカウント変更
```
git config --global user.name "<YOUR_NAME>"
git config --global user.email "<YUOR_EMAIL>"
```

#### 設定確認
```
git config --global --list
```

#### フェッチしてdevelopブランチをリベース
```
git fetch origin
git add .
git stash
git rebase origin/develop
git stash pop
```