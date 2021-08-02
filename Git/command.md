- [ステージングエリアに登録](#ステージングエリアに登録)
- [コミット](#コミット)
- [プッシュ（現在のブランチ）](#プッシュ現在のブランチ)
- [push先のリポジトリを登録](#push先のリポジトリを登録)
- [push先のリポジトリの登録を削除](#push先のリポジトリの登録を削除)
- [ブランチ作成](#ブランチ作成)
- [ブランチ削除](#ブランチ削除)
- [ブランチ移動](#ブランチ移動)
- [ブランチを作成と同時に移動](#ブランチを作成と同時に移動)
- [ローカルを最新のリポジトリに更新](#ローカルを最新のリポジトリに更新)
- [作業中のリポジトリに反映](#作業中のリポジトリに反映)
- [変更の取り消し](#変更の取り消し)
- [コミットメッセージ変更](#コミットメッセージ変更)
- [ブランチ名変更](#ブランチ名変更)
- [差分をチェック](#差分をチェック)
- [違うブランチで作業をしたとき](#違うブランチで作業をしたとき)
- [リモートブランチ取得](#リモートブランチ取得)
- [アカウント変更](#アカウント変更)

#### ステージングエリアに登録
```
git add .
```
```
git add -A- [ステージングエリアに登録](#ステージングエリアに登録)
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

#### 作業中のリポジトリに反映
```
git checkout
git merge develop
```

#### 変更の取り消し
```
git checkout .
```

#### コミットメッセージ変更
```
git commit --amend -m ""
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

#### アカウント変更
```
git config --global user.name "<YOUR_NAME>"
git config --global user.email "<YUOR_EMAIL>"
```