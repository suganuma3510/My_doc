# 自動販売機の要件定義書
## 1. 背景

　ITの進歩に伴い、他社でもスマホ決済などのITを活用した自動販売機が増えてきた。  
そのため弊社も他社の自動販売競争に取り残されないよう、新たな自動販売機のシステム導入を検討している。  
　自動販売機は屋外での飲料販売を想定している。

## 2. 課題

　現在、明らかになっている課題は次のとおりである。

1. スマホ決済やポイント機能などITを活用した機能がなく、10代から30代の購入者が少ない
2. バリアフリーに対応しておらず、高齢者や障がいを持った方からの苦情が多い
3. システムが古いため、故障や通信障害が多い
4. デザインがありきたりなため、購入者からの興味を引くことができない
5. 機器が古くセキュリティも甘いため、釣銭や商品の盗難が他社と比べて多い

## 3. 目的・方針

　2に挙げる課題を解決しながら、さらに他社からの差別化を図るため、自動販売機本体をすべて液晶化しスマホ用アプリケーションを導入する。
 導入に当たり、次の3つの保身を掲げるものとする。
 
1. スマホ用アプリケーションを導入し、スマホ決済、指紋、顔認証、ランキング、予約、カスタムデザインなどの機能を追加し、若年層の顧客を増やす。
2. バリアフリーに対応させることで、高齢者や障がいを持った方からの購入にも対応できるようにする
3. 最新の技術を使い、システムを開発することで、障害に強いシステムを作る
4. 自動販売機の外装をすべて液晶化することで、購入者からの関心を引き、売上向上を目指す
5. 最新機器や防犯カメラ、通知機能を実装することで、セキュリティの向上を目指す

## 4. 概要

本システムは、屋外の飲料の自動販売機を想定し、他社の自動販売機システムと差別化を図るため、アプリケーションの導入、外装の液晶化などを実装する。
アプリケーションではスマホ用アプリを開発し、自動販売機と連携することで、自動決済、ユーザ認証機能などといった様々な機能を提供する。 

## 5. 用語の定義

- バリアフリー  
対象者である障害者を含む高齢者等が、社会生活に参加する上で生活の支障となる物理的な障害や、精神的な障壁を取り除くための施策

## 6. 機能

- スマホ決済  
スマホによる電子マネーでの決済、クレジットカードでの支払いも可能とする
- 指紋認証  
商品を選ぶ際に指紋認証を行うことでお金の投入することなく商品を買うことができる
- 顔認証  
商品を選ぶ際に顔認証を行うことでお金の投入することなく商品を買うことができる
- 予約  
スマホアプリでの予約を行うことで売り切れで購入できない事態をなくす
- カスタムデザイン  
商品を買った際などにその自販機の外装を独自にデザインできるようにすることで、購入を促進させる
- ランキング  
商品のランキングを表示させどの飲料が人気なのかをユーザに伝える
- おすすめ  
ユーザの購入履歴や見た目からおすすめの商品を紹介し、購入を促進させる

## 7. システム化の範囲

本システムでは、アプリケーションの導入に伴い、顧客のクレジットカードの情報や個人情報など機密度の高い情報を取り扱うため、その取扱いはデリケートでなければならない。
そのためこれらの情報を他システムから流用することは現実的ではない。

商品購入時の支払い方法を現金または電子マネーの２パターンをシステム化する

## 8. 導入・移行計画

1. ２０２０年６月２４日を持って、既存の自動販売機から新自動販売機に完全移行する
2. 既存システムが管理する過去の売り上げデータなどは新システムに移行する

## 9. 保守・運用

通常時の運用は、定期バックアップなどを含め、運用会社に委託する
故障発生時は運用会社から保守会社に連絡して対応する

## 10. 工程計画

仕様凍結：yyyy年mm月dd日  
設計完了：yyyy年mm月dd日  
開発完了：yyyy年mm月dd日  
試験完了：yyyy年mm月dd日  
導入　　：yyyy年mm月dd日  

## 11. 体制

1. システム部門は、システムに対して、導入まで責任を持って対応する
2. 運用部門は、運用保守に対して責任を持ち、顧客対応およびオンサイト保守を実施する

## 12. 成果物

1. 顧客ヒアリング議事録
2. システム設計書（外部設計書）
3. 内部設計書
4. 試験実施報告書、試験成績
5. 製造プログラムファイル一式
6. マニュアル（運用、保守、操作）