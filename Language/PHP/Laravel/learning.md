## 学習したことメモ

- [学習したことメモ](#学習したことメモ)
  - [laravel 8でcssファイルにアクセスする方法](#laravel-8でcssファイルにアクセスする方法)
  - [バリデーション方法](#バリデーション方法)
    - [バリデーションルールの適用](#バリデーションルールの適用)
    - [エラーメッセージのカスタマイズ](#エラーメッセージのカスタマイズ)
      - [特定の属性のみ指定する](#特定の属性のみ指定する)
    - [エラーメッセージの属性名(:attributes)を変更する](#エラーメッセージの属性名attributesを変更する)
    - [ユニークチェック](#ユニークチェック)
  - [マイグレーションファイルの書き方](#マイグレーションファイルの書き方)
  - [参考](#参考)

### laravel 8でcssファイルにアクセスする方法
cssファイルを`public/css`ファルダ内に入れて、適用したいファイルに以下のように記述する。
```
<link rel="stylesheet" href="{{ asset('/css/app.css') }}">
```

### バリデーション方法
#### バリデーションルールの適用
```php
$rules = [
    'employeeId' => ['required', 'size:10', 'regex:/YZ+\d{8}/', 'unique:employee,employee_id'],
    'familyName' => 'required | max:25',
    'firstName' => 'required | max:25',
    'sectionId' => ['required', 'regex:/[1-3]/'],
    'mail' => ['required', 'max:256', 'regex:/^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+$/'],
    'genderId' => ['required', 'regex:/[12]/'],
];
```

- [Laravelのバリデーションで指定できる内容をざっくりまとめ直しました。 \- Qiita](https://qiita.com/fagai/items/9904409d3703ef6f79a2)

#### エラーメッセージのカスタマイズ
```php
$messages = [
    'required' => '必須： :attribute を入力してください',
    'size' => '桁数： :attribute は :size 文字で入力してください',
    'max' => '最大桁数： :attributeは :max 文字以内で入力してください',
    'unique' => '重複：入力した :attribute はすでに登録されています',
    'regex' => '書式： :attribute を正しく入力してください',
];
```

##### 特定の属性のみ指定する
```php
$messages = [
    'email.required' => ' :attribute を入力してください',
];
```

#### エラーメッセージの属性名(:attributes)を変更する
`resources\lang\en\validation.php`ファイルの`attributes`を下記のように編集する。

```php
'attributes' => [
    'employeeId' => '社員ID',
    'familyName' => '社員名（姓）',
    'firstName' => '社員名（名）',
    'sectionId' => '所属セクション',
    'mail' => 'メールアドレス',
    'genderId' => '性別',
],
```

#### ユニークチェック
```php
$request->validate([
    // usersテーブルの「mail_address」カラムで一意チェック
    'email' => 'unique:users,mail_address'
]);
```

- [unique:テーブル,カラム,除外ID,IDカラム](https://readouble.com/laravel/8.x/ja/validation.html#rule-unique)

### マイグレーションファイルの書き方
- [【Laravel】初めてのマイグレーション \- Qiita](https://qiita.com/manbolila/items/c19735438affefbfbe69)

### 参考
- [Laravel 8.x バリデーション](https://readouble.com/laravel/8.x/ja/validation.html)
- [【laravel】Validatorによるバリデーション \- Qiita](https://qiita.com/gone0021/items/c613ef7e006b6f5d47ce)