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
  - [データベースのテストデータ自動生成](#データベースのテストデータ自動生成)
    - [モデルファクトリの利用](#モデルファクトリの利用)
    - [シーダファイルの書き方](#シーダファイルの書き方)
    - [Fakerの日本語化](#fakerの日本語化)
  - [FormRequestクラス](#formrequestクラス)
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

### データベースのテストデータ自動生成

#### モデルファクトリの利用
`database\factories\EmployeeFactory.php`
```php
public function definition()
{
  return [
    // YZ + 一意な8桁の乱数
    'employee_id' => 'YZ' . $this->faker->unique()->randomNumber(8),
    // 姓
    'family_name' => $this->faker->lastName(),
    // 名
    'first_name' => $this->faker->firstName(),
    // 1～3の乱数
    'section_id' => $this->faker->numberBetween(1, 3),
    // 一意かつ安全（存在しない）な電子メール
    'mail' => $this->faker->unique()->safeEmail(),
    // 1～2の乱数
    'gender_id' => $this->faker->numberBetween(1, 2),
  ];
}
```

#### シーダファイルの書き方
`database\seeders\DatabaseSeeder.php`
```php
public function run()
{
  // 10件のテストデータを生成
  \App\Models\Employee::factory(10)->create();
}
```

`app\Models\Employee.php`
```php
use Illuminate\Database\Eloquent\Factories\HasFactory; // 追記

class Employee extends Model
{
    use HasFactory; // 追記

    protected $table = 'employee';

    protected $fillable = [
        'employee_id',
        'family_name',
        'first_name',
        'section_id',
        'mail',
        'gender_id'
    ];

    public $timestamps = false;
}
```

#### Fakerの日本語化
`config/app.php`の`faker_locale`を下記のように変更する。
```php
'faker_locale' => 'ja_JP',
```

- [php artisan db:seed](https://readouble.com/laravel/8.x/ja/seeding.html)
- [Laravel7でよく使うfactoryのfakerダミーデータのチートシート](https://cross-accelerate-business-create.com/2021/01/02/laravel7-faker/)
- [Fakerチートシート \- Qiita](https://qiita.com/tosite0345/items/1d47961947a6770053af)

### FormRequestクラス
`app\Http\Requests\EmployeeRequest.php`
```php
namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EmployeeRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'employeeId' => ['required', 'size:10', 'regex:/YZ+\d{8}/', 'unique:employee,employee_id'],
            'familyName' => 'required | max:25',
            'firstName' => 'required | max:25',
            'sectionId' => ['required', 'regex:/[1-3]/'],
            'mail' => ['required', 'max:256', 'regex:/^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+$/'],
            'genderId' => ['required', 'regex:/[12]/'],
        ];
    }

    public function messages()
    {
        return [
            'required' => '必須：:attributeを入力してください',
            'size' => '桁数：:attributeは :size 文字で入力してください',
            'max' => '最大桁数：:attributeは :max 文字以内で入力してください',
            'unique' => '重複：入力した:attributeはすでに登録されています',
            'regex' => '書式：:attributeを正しく入力してください',
        ];
    }
}
```

上記のように記述することで、リクエストを送った際に自動でバリデーション処理を行ってくれる。

- [LaravelのFormRequestクラス機能まとめ \- Qiita](https://qiita.com/OKCH3COOH/items/53db8780027e5e11be82#%E6%A9%9F%E8%83%BD)

### 参考
- [Laravel 8.x バリデーション](https://readouble.com/laravel/8.x/ja/validation.html)
- [【laravel】Validatorによるバリデーション \- Qiita](https://qiita.com/gone0021/items/c613ef7e006b6f5d47ce)