# 学習したことメモ
### laravel 8でcssファイルにアクセスする方法
cssファイルを`public/css`ファルダ内に入れて、適用したいファイルに以下のように記述する。
```
<link rel="stylesheet" href="{{ asset('/css/app.css') }}">
```