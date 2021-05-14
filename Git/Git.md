ステージングエリアに登録
```
git add .
git add -A
```

コミット
```
git commit -m "fix："
```

プッシュ（現在のブランチ）
```
git push origin HEAD 
```

push先のリポジトリを登録
```
git remote add origin git@github.com:MikotoSuganuma/media_app.git
```

push先のリポジトリの登録を削除
```
git remote rm origin
```

ブランチ作成
```
git branch develop
```

ブランチ移動
```
git checkout develop
```

ブランチを作成と同時に移動
```
git checkout develop
git checkout -b feature/
```

ローカルを最新のリポジトリに更新
```
git checkout develop
git pull origin develop
```

作業中のリポジトリに反映
```
git checkout 
git merge develop
```

コミットメッセージ変更
```
git commit --amend -m ""
```

ブランチ名変更
```
git branch -m feature/
```

差分
```
git diff
```

違うブランチで作業をしたとき

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
