# Linux
リーナス・トーバルズ氏によって開発された無料で使用できるオープンソースのOS。  
狭義ではLinuxカーネルというOSの中核を構成するソフトウェアのこと。  
広義では、Linuxディストリビューションという様々なソフトウェアを組み合わせ、パッケージ化し、OSとして動作するようにたものである。

## 特徴
### 無料
Linuxは無料で公開・配布されているため、誰でも手軽に使うことができる。

### カスタマイズ可能
オープンソースなため、ソースコードを書き換え、新たな機能や独自のOSを作ることも可能。

## Linuxディストリビューション
LinuxをカーネルをOSとして利用しやすいように様々なソフトウェアと組み合わせ、パッケージ化したもの。  
下記に代表的な例を挙げるが、その他にも多くのディストリビューションが存在する。

### 代表的なディストリビューション
#### Red Hat系
- Red Hat Enterprise Linux  
　RHELとも呼ばれる。Red Hat社が提供する企業向けディストリビューション。
　Red Hat社のサポートと合わせて有償で提供されている。
- CentOS  
　RHELとほぼ100%の互換性。Red Hat社のサポートはないが、RHEL互換という
　エンタープライズディストリビューションが無償で利用できることから人気が高い。
- Fedora  
　CentOS同様に無償で提供されている。最新のソフトウェアがすぐに導入される
　傾向にあり、個人ユーザに人気がある。Red Hat社がプロジェクトを支援している。

#### Debian系
- Debian GNU/Linux  
  フリーソフトウェアのみを使用して作成されているディストリビューション。無償で提供。
- Ubuntu  
  Debian GNU/Linuxから派生したディストリビューション。無償で提供。
- Linux Mint  
  Ubuntuをベースとして作成されたディストリビューション。マルチメディア関連が強化。
- Edubuntu  
  Ubuntuから派生したディストリビューション。教育関連のソフトウェアが充実。

## Linuxコマンド
LinuxをCUI (文字によってコンピューター間での情報のやり取りや操作を行う方法) で操作する際に使われる、あらかじめ決められた命令文のこと。

例：hoge.txtファイルの中身を行番号付きで表示する
```
cat -n hoge.txt
[コマンド] [オプション] [パラメータ]
```
コマンド：コンピュータに特定の機能の実行を指示する命令
オプション：コマンドの動作を指定あるいは変更するもの 
パラメーター：コマンドの処理対象などを示すもの

### パイプライン
パイプ「 | 」を使用し、コマンドの標準出力を次のコマンドに渡すことで複数のコマンドを組み合わせて処理を行うことができる。  
パイプを使った処理のことを「パイプライン処理」という。

例：psコマンドの結果の中からパターン (apache) を検索
```
ps aux | grep apache
```

### 参考
- [What is the Linux kernel?](https://www.redhat.com/ja/topics/linux/what-is-the-linux-kernel)
- [カーネル（kernel）とは \- IT用語辞典 e\-Words](https://e-words.jp/w/%E3%82%AB%E3%83%BC%E3%83%8D%E3%83%AB.html)
- [Linuxディストリビューション（Linux distribution）とは \- IT用語辞典 e\-Words](https://e-words.jp/w/Linux%E3%83%87%E3%82%A3%E3%82%B9%E3%83%88%E3%83%AA%E3%83%93%E3%83%A5%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3.html)
- [Linuxとは？初心者でもわかる基本情報とメリットを紹介｜発注成功のための知識が身に付く【発注ラウンジ】](https://hnavi.co.jp/knowledge/blog/linux-merit/)
- [Linuxをはじめから \- Linuxの超基礎を解説](https://www.infraeye.com/study/linuxz0.html)
- [【エンジニア監修】Linuxとは何か？初心者目線でやさしく解説してみた \| 侍エンジニアブログ](https://www.sejuku.net/blog/4948)
- [パイプ「\|」を使って 複数のコマンドを組み合わせる \- Linux入門 \- Webkaru](https://webkaru.net/linux/commands-pipeline/)