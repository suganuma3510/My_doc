## PowerShell
PowerShell はマイクロソフトが開発している .NET ベースのスクリプト言語およびCLI。  
オブジェクト指向が取り入れられており、フォルダ構造などを文字ではなくオブジェクトとして扱うことができるため、より直感的にスクリプトを組みやすくなっている。またシステム管理向けのコマンドが多く用意されている。

### 変数の使い方
- 変数名に `$` をつける
```powershell
    $hoge
```
- 型は基本的に代入された値に準ずる
    - 型を明示したい場合は [int] など明示することもできる

#### 実行例
```powershell
PS Z:\> $sample = "こんにちは！"
PS Z:\> Write-Host "$sample"
こんにちは！
PS Z:\> Write-Host '$sample'
$sample
```

- `""` は変数の中身が表示される
- `''` は変数が中身が表示されず変数名が表示される

### 比較演算子
| PowerShell | 意味                       |
| :--------: | :------------------------- |
|    -eq     | 等しい                     |
|    -ne     | 等しくない                 |
|    -gt     | より大きい                 |
|    -ge     | 以上                       |
|    -lt     | より小さい                 |
|    -le     | 以下                       |
|   -like    | ワイルドカードと等しい     |
|  -notlike  | ワイルドカードと等しくない |
|   -match   | 正規表現と等しい           |
| -notmatch  | 正規表現と等しくない       |

ワイルドカード：任意の文字列を指定する際に使用する特殊文字のこと

### if文
```powershell
    if ($hoge1 -eq 1) {
        Write-Host "a"
    } elseif ($hoge2 -eq 2) {
        Write-Host "b"
    } else {
        Write-Host "c"
    }
```

[ResourceUtilization/Script言語課題\.md at master · numazuvtcSeClass/ResourceUtilization](https://github.com/numazuvtcSeClass/ResourceUtilization/blob/master/Script%E8%A8%80%E8%AA%9E%E8%AA%B2%E9%A1%8C.md)