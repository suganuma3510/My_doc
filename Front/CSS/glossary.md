## CSSでレスポンシブデザイン

### PC用やスマホ用に画面を切り替える方法

> @media (max-width: px / min-width: px)

```css
@media (max-width: px / min-width: px) {
  適応させるCSS
}
```
上記のコードの中にあるように、@mediaの次のカッコ内（ ）でどの画面のサイズの時に適応されるCSSなのか条件を指定する。

例えば、max-width: 1000pxとすると、1000pxより小さい時にCSSが適応され、min-width: 1000pxとすると、1000pxより大きい時にCSSが適応される。

### レスポンシブデザインで使われるcssのプロパティ

> display: none;

```css
nav ul {
    display: none;
}
```

`display: none;`を使用することで使用した要素を非表示にすることができる。パソコンでの全画面表示と携帯電話画面の表示を変えるレスポンシブなwebサイトで、displayプロパティを使用する。

上記のコードのように使用すると、navタグの中で使われているulタグの要素が非表示となり、これを＠mediaなどと組み合わせることによって、画面サイズごとに違うデザインにすることができる。

> flex-flow: column;

```css
nav ul {
    flex-flow: column;
}
```
flex-flowプロパティは、フレックスコンテナ内のアイテムの配置方向と折り返し方法をまとめて指定する際に使用する。  
`flex-flow: column;`を使用することで要素を立て並びにすることができる。スマホは縦長の画面なので立て並びはよく使用する。

## 気になったcss

> a:link/a:visited/a:hover/a:active

以上は疑似クラスといい、選択された要素に対して特定の状態を指定する。例えば :hover 擬似クラスで、ユーザーのポインターが当たったときにボタンの色を変更することができます。

a要素で使用する疑似クラス
| 疑似クラス名 | どんな状態で適用されるか       |
| :----------- | :----------------------------- |
| :link        | 未訪問リンク                   |
| :visited     | 訪問済みリンク                 |
| :hover       | カーソルが重なった時           |
| :active      | クリックしてから離される時まで |

---

> box-shadow: px;

`box-shadow`プロパティは、ボックスに1つまたは複数の影をつける際に使用する。  
![sample2](https://user-images.githubusercontent.com/57606507/83368571-46006480-a3f4-11ea-8fa8-7b1ca391d2eb.png)

---

> border-radius: px;

`border-radius`プロパティは、ボックスの４つのコーナーの角丸をまとめて指定する際に使用する。
![sample1](https://user-images.githubusercontent.com/57606507/83232346-fb9aa000-a1c7-11ea-9c10-4766339f1dff.png)

## 参考リンク
- [@media - CSS: カスケーディングスタイルシート | MDN](https://developer.mozilla.org/ja/docs/Web/CSS/@media)  
- [display－スタイルシートリファレンス](http://www.htmq.com/style/display.shtml)  
- [flex-flow－CSSリファレンス](http://www.htmq.com/css/flex-flow.shtml)  
- [:hover擬似クラス－スタイルシートリファレンス](http://www.htmq.com/selector/hover.shtml)  
- [box-shadow－CSS3リファレンス](http://www.htmq.com/css3/box-shadow.shtml)  
- [border-radius－CSS3リファレンス ](http://www.htmq.com/css3/border-radius.shtml)  
- [よく見かけるよく使うボタンエフェクト - Qiita](https://qiita.com/sugar_tk/items/89cc75ada6c7067bc819)  



