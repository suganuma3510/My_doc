
- [ステージングエリアに登録](#ステージングエリアに登録)
- [コミット](#コミット)
- [プッシュ（現在のブランチ）](#プッシュ現在のブランチ)
- [push先のリポジトリを登録](#push先のリポジトリを登録)
- [push先のリポジトリの登録を削除](#push先のリポジトリの登録を削除)
- [ブランチ作成](#ブランチ作成)
- [ブランチ移動](#ブランチ移動)
- [ブランチを作成と同時に移動](#ブランチを作成と同時に移動)
- [ローカルを最新のリポジトリに更新](#ローカルを最新のリポジトリに更新)
- [作業中のリポジトリに反映](#作業中のリポジトリに反映)
- [コミットメッセージ変更](#コミットメッセージ変更)
- [ブランチ名変更](#ブランチ名変更)
- [差分をチェック](#差分をチェック)
- [違うブランチで作業をしたとき](#違うブランチで作業をしたとき)

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
git pull origin develop
```

#### 作業中のリポジトリに反映
```
git checkout
git merge develop
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

1.今の作業ブランチを確認
```
git branch
```

2.変更した分を退避させ、クリーンになっているか確認
```
git stash
git status
```
4.本来作業したかったブランチに切り替える
```
git checkout
```
5.退避させた変更分を反映
```
git stash apply
```