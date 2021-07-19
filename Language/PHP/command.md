## PHPコマンド一覧

### Laravelプロジェクト作成
```
composer create-project --prefer-dist "laravel/laravel=8.*" .
```

### マイグレーション実行方法
```
php artisan migrate
```

### コントローラ作成
```
php artisan make:controller UserController
```

### モデル作成
```
php artisan make:model User
```

### Laravelキャッシュ削除
```
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
```

### シーダ実行
```
php artisan db:seed
```

#### テーブルを再構築し、シーダ実行
```
php artisan migrate:fresh --seed
```

### リクエストクラス作成
```
php artisan make:request EmployeeCreateRequest
```