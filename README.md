# README

## 開発言語
* Ruby 3.0.1
* Ruby on Rails 6.0.3

## 就業Termの技術
* Devise
* Ajax

## カリキュラム外の技術
* gem rails_admin, gem cancancanを使った管理者機能
* Action Cableを使った、送信時のリロード無しのチャット機能
* Active Job

## 実行手順

お使いのPCにredisがインストールされていない場合はredisをインストールして起動

```
$ brew install redis
$ brew services start redis
```

インストール済みの方はここから
```
$ git clone git@github.com:mayuNishikawa/CALL_ME.git
$ cd call_me
$ bundle
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails s
```  

## カタログ設計, テーブル設計
https://docs.google.com/spreadsheets/d/1-zMcNmPU1Q9A7_kPtnfObJQAuauv85yxryIuGpWcK_I/edit?usp=sharing


## ワイヤーフレーム
https://cacoo.com/diagrams/vKCzX7Jafv5J6Kk8/ED6A3
![CALL MEワイヤーフレーム](https://user-images.githubusercontent.com/103108809/183274313-b2c85fe4-8450-467f-a895-4984820a58f2.png)


## 画面遷移図
![CALL ME画面遷移図 ](https://user-images.githubusercontent.com/103108809/183274316-6873a8f9-f6f5-4336-89c2-6d52014fef5c.png)


## ER図　
![CALL ME ER図](https://user-images.githubusercontent.com/103108809/184061272-3fe682ab-45dc-4c49-aed9-8981767d1329.png)


