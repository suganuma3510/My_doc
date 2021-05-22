# Markdown記法

- [Markdown記法](#markdown記法)
  - [コードの挿入](#コードの挿入)
    - [見出し](#見出し)
    - [強調・強勢](#強調強勢)
    - [打ち消し線](#打ち消し線)
    - [折りたたみ](#折りたたみ)
  - [Lists - リスト](#lists---リスト)
    - [Disc型](#disc型)
    - [Decimal型](#decimal型)
    - [Definition型](#definition型)
    - [Checkbox型](#checkbox型)
  - [Blockquotes - 引用](#blockquotes---引用)
  - [Horizontal rules - 水平線](#horizontal-rules---水平線)
  - [Links - リンク](#links---リンク)
  - [Images - 画像埋め込み](#images---画像埋め込み)
  - [テーブル記法](#テーブル記法)
  - [数式の挿入](#数式の挿入)
  - [注釈](#注釈)
  - [絵文字](#絵文字)
  - [コンテンツの埋め込み](#コンテンツの埋め込み)
    - [Twitter](#twitter)
    - [YouTube](#youtube)
    - [SlideShare](#slideshare)
    - [Google Slide](#google-slide)
  - [source: https://qiita.com/Qiita/items/c686397e4a0f4f11683d](#source-httpsqiitacomqiitaitemsc686397e4a0f4f11683d)

## コードの挿入

> \`\`\`ruby:qiita.rb
> puts 'The best way to log and share programmers knowledge.'
> \`\`\`

**結果**

```qiita.rb
puts 'The best way to log and share programmers knowledge.'
```

また、コードをインライン表示することも可能です。

> \`#ffce44\`  
> \`rgb(255,0,0)\`  
> \`rgba(0,255,0,0.4)\`  
> \`hsl(100, 10%, 10%)\`  
> \`hsla(100, 24%, 40%, 0.5)\`

**結果**

`#ffce44`  
`rgb(255,0,0)`  
`rgba(0,255,0,0.4)`  
`hsl(100, 10%, 10%)`  
`hsla(100, 24%, 40%, 0.5)`

### 見出し

-   \# これはH1タグです
-   \## これはH2タグです
-   \###### これはH6タグです

### 強調・強勢

```
_ か * で囲むとHTMLのemタグになります。Qiitaでは*イタリック体*になります。
__ か ** で囲むとHTMLのstrongタグになります。Qiitaでは**太字**になります。
```

\_ か \* で囲むとHTMLのemタグになります。Qiitaでは_イタリック体_になります。  
\_\_ か \*\* で囲むとHTMLのstrongタグになります。Qiitaでは**太字**になります。

### 打ち消し線

```
打ち消し線を使うには ~~ で囲みます。 ~~打ち消し~~
```

打ち消し線を使うには `~~` で囲みます。 ~~打ち消し~~

イタリックや太文字と同様に前後に **半角スペース** か **改行文字** が必要です。

### 折りたたみ

```
追加情報としたい内容を、detailsタグで囲みます。そして、要約として表示したい文章をsummaryタグで記載します。

Qiitaとは

<details><summary>Qiita(キータ)は、プログラマのための技術情報共有サービスです。</summary>プログラミングに関することをどんどん投稿して、知識を記録、共有しましょう。
Qiitaに投稿すると、自分のコードやノウハウを見やすい形で残すことができます。
技術情報はテキストファイルへのメモではなく、タグを付けた文章、シンタックスハイライトされたコードで保存することで初めて再利用可能な知識になる、そうQiitaでは考えています。</details>
```

追加情報としたい内容を、detailsタグで囲みます。そして、要約として表示したい文章をsummaryタグで記載します。

Qiitaとは

<details><summary>Qiita(キータ)は、プログラマのための技術情報共有サービスです。</summary>プログラミングに関することをどんどん投稿して、知識を記録、共有しましょう。
Qiitaに投稿すると、自分のコードやノウハウを見やすい形で残すことができます。
技術情報はテキストファイルへのメモではなく、タグを付けた文章、シンタックスハイライトされたコードで保存することで初めて再利用可能な知識になる、そうQiitaでは考えています。</details>

折りたたんだ部分で Markdown を使いたい場合は、折りたたまれる部分全体を `<div>` で囲ってください。（\\\` は実際は \\ を含みません。また `<div>` とコードブロックの間には空白行が一つ以上必要です。）

```
<details><summary>サンプルコード</summary><div>

\```rb
puts 'Hello, World'
\```
</div></details>
```

<details><summary>サンプルコード</summary><div>

```rb
puts 'Hello, World'
```
</div></details>

## Lists - リスト

### Disc型

-   文頭に「\*」「+」「-」のいずれかを入れるとDisc型リストになります
-   要点をまとめる際に便利です
-   リストを挿入する際は、 **リストの上下に空行がないと正しく表示されません。また「\*」「+」「-」の後にはスペースが必要です**

### Decimal型

1.  文頭に「数字.」を入れるとDecimal型リストになります
2.  後からの挿入/移動を考慮して、1. 2. 3. と順番にするのではなく、1. 1. 1. という風に同じ数字にしておくといい具合です。
3.  リストを挿入する際は、 **リストの上下に空行がないと正しく表示されません。また「数字.」の後にはスペースが必要です**

### [](https://qiita.com/Qiita/items/c686397e4a0f4f11683d#definition%E5%9E%8B)Definition型

HTMLの`<dl>`タグをそのまま使うことで実現できます。

```
<dl>
  <dt>リンゴ</dt>
  <dd>赤いフルーツ</dd>
  <dt>オレンジ</dt>
  <dd>橙色のフルーツ</dd>
</dl>
```

次のようになります。

<dl>
  <dt>リンゴ</dt>
  <dd>赤いフルーツ</dd>
  <dt>オレンジ</dt>
  <dd>橙色のフルーツ</dd>
</dl>

注意するべきは、Definition型のリスト内ではMarkdown記法が使えないということです。例えば以下のように書いてはなりません。

Definition型リスト内ではMarkdown記法ではなくて、HTMLタグを使って修飾しなければならないので、正しくは次のようになります。

```
<dl>
  <dt>リンゴ</dt>
  <dd> とても<strong>赤い</strong>フルーツ </dd>
</dl>
```
<dl>
  <dt>リンゴ</dt>
  <dd> とても<strong>赤い</strong>フルーツ </dd>
</dl>

Markdown記法とHTMLタグの対応は次のようになっています。

`** **`

`<strong></strong>`

イタリック

`_ _`

`<em></em>`

コード

` `` `

`<code></code>`

リンク

`[text](url)`

`<a href="url">text</a>`

### Checkbox型

```
- [ ] タスク1
- [x] タスク2
```

- [ ] タスク1
- [x] タスク2

## Blockquotes - 引用

> \> 文頭に>を置くことで引用になります。  
> \> 複数行にまたがる場合、改行のたびにこの記号を置く必要があります。  
> \> **引用の上下にはリストと同じく空行がないと正しく表示されません**  
> \> 引用の中に別のMarkdownを使用することも可能です。
> 
> > これはネストされた引用です。

## Horizontal rules - 水平線

下記は全て水平線として表示されます

> \* \* \*  
> \*\*\*  
> \*\*\*\*\*  
> \- - -  
> \---------------------------------------

## Links - リンク

-   \[リンクテキスト\](URL "タイトル")
    -   タイトル付きのリンクを投稿できます。  
        (タイトルは、リンク上にマウスホバーすることで表示されます。)
```
[リンクテキスト]()
```


## Images - 画像埋め込み
```
![代替テキスト]()
```

## テーブル記法

```
| Left align | Right align | Center align |
|:-----------|------------:|:------------:|
| This       | This        | This         |
| column     | column      | column       |
| will       | will        | will         |
| be         | be          | be           |
| left       | right       | center       |
| aligned    | aligned     | aligned      |
```


## 数式の挿入

コードブロックの言語指定に "math" を指定することでTeX記法を用いて数式を記述することができます。

> \`\`\`math  
> \\left( \\sum\_{k=1}^n a\_k b\_k \\right)^{!!2} \\leq  
> \\left( \\sum\_{k=1}^n a\_k^2 \\right) \\left( \\sum\_{k=1}^n b\_k^2 \\right)  
> \`\`\`

(∑k\=1nakbk)2≤(∑k\=1nak2)(∑k\=1nbk2)

`$2^3$` のように数式を "$" で挟むと行中に数式を埋め込むこともできます。

> x^2 + y^2 = 1 をインライン表示すると x2+y2\=1 になります。

ただしインライン数式の中でコントロールシンボル（`\{`のような、バックスラッシュの後に記号が続くもの）を使うと、後述のバックスラッシュによるMarkdownのエスケープと衝突してしまいます。

> a\=1,2,3

なので次のように二つのバックスラッシュを使います。

> a\={1,2,3}

## 注釈

本文中に`[^1]`や`[^example]`のように文字列を記述することで、脚注へのリンクを表現できます。注釈内容は、同じく本文中に `[^1]: ...` というように記述します[1](https://qiita.com/Qiita/items/c686397e4a0f4f11683d#fn1 "注釈内容を記述する位置は、本文の途中でも末尾でも構いません。")。

## 絵文字

厳密には Markdown 記法の外ですが、`:` で囲って、絵文字を埋め込めます。

**例**

```
\:kissing_closed_eyes: chu☆
```

> ![:kissing_closed_eyes:](https://cdn.qiita.com/emoji/twemoji/unicode/1f61a.png ":kissing_closed_eyes:") chu☆

絵文字チートシート  
[http://www.emoji-cheat-sheet.com/](http://www.emoji-cheat-sheet.com/)

## コンテンツの埋め込み

以下のサービスの埋め込みスクリプト/Embedタグが利用可能です。

-   [Twitter](https://twitter.com/)
-   [Asciinema](https://asciinema.org/)
-   [CodePen](https://codepen.io/)
-   [YouTube](https://www.youtube.com/)
-   [SlideShare](https://www.slideshare.net/)
-   [Google Slide](https://www.google.com/intl/ja_jp/slides/about/)
-   [Speaker Deck](https://speakerdeck.com/)

### Twitter

twitter

> (空行)  
> [https://twitter.com/Qiita/status/1365218441011990531](https://twitter.com/Qiita/status/1365218441011990531)  
> (空行)


### [](https://qiita.com/Qiita/items/c686397e4a0f4f11683d#youtube)YouTube

YouTube

```
<iframe width="560" height="315" src="https://www.youtube.com/embed/M7lc1UVf-VE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
```

<iframe width="100%" height="315" src="https://www.youtube.com/embed/M7lc1UVf-VE" frameborder="0" allowfullscreen=""></iframe>

### SlideShare

SlideShare

```
<iframe src="//www.slideshare.net/slideshow/embed_code/key/B6SfqHFrWhihpr" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> 
```

### Google Slide

Google\_Slide

```
<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vQGCGO4BKNKmsm3Oml53J5vTzK7dRBqXHoABnftOb5n3HLiixWzNCMmwc2w7InQig/embed?start=false&loop=false&delayms=3000" frameborder="0" width="500" height="569" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
```

---
tags: [Qiita,Markdown]
source: https://qiita.com/Qiita/items/c686397e4a0f4f11683d
---