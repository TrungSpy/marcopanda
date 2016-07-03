# marcopanda
http://www.hackathon.io/marcopanda

# サーバー構築方法

[docs/setup/install.md](https://github.com/birdhxc/marcopanda/blob/master/docs/setup/install.md)に格納しています。

# API

## API定義書

http://api.marcopanda.dreamsfor.com/apidefine/

## APIリスト及びテスト方法（curlコマンド）

## 実装済みAPI

- ユーザ登録（プレゼンのためUUIDのみ登録）


`curl -X POST -d '{"user_uuid":"DsMjyOQu7JxMgQtksYMRoTtCCKMwBGw9CxETCB3Q"}' http://api.marcopanda.dreamsfor.com/user/uuid_regist.json`


- 旅行誌画像登録

`curl -F file1=@post01.jpg http://api.marcopanda.dreamsfor.com/article/fileupload.json`

- 旅行誌登録

`curl -X POST -d '{"longitude":"139.729249","latitude":"35.660464","category_id":"3","cost_id":"8","multimedia_id":[1,2],"article_text":"A happy day!"}' http://api.marcopanda.dreamsfor.com/article/post.json`

- 画像ダウンロード

http://api.marcopanda.dreamsfor.com/multimedia/download?path=2016-07-03/11b94aa158d38b270da53743e30a9cf8.png

- スポット検索（現在地検索）
 
`curl -X POST -d '{"longitude":"139.729249","latitude":"35.660464","zoom":"15"}' http://api.marcopanda.dreamsfor.com/map/search.json`

- 旅行誌検索（現在地検索）

`curl -X POST -d '{"longitude":"139.729249","latitude":"35.660464","zoom":"15"}' http://api.marcopanda.dreamsfor.com/article/search.json`

### API未実装

- スポット検索（地名検索）
- スポット検索（特定ユーザの投稿）
- スポット検索（私がいいねを付けた旅行誌）
- 旅行誌検索（地名検索）
- 旅行誌検索（特定スポット限定の投稿）
- 旅行誌検索（特定ユーザの投稿）
- いいねを付ける
- 星を付ける
- 旅行誌にコメントする

# アプリ

## 対応iOS

iOS9以上

## 環境構築、ビルド手順

+ Xcode 8をインストールしてください。
+ cd /marcopanda/ios/marcopandaios
+ pod install (pod 1.0.0が必要です)
+ xocde8でビルドする

## 実機で実行する方法

### デベロッパーアカウントを持っていない方

iPhoneをUSBでPCと繋いて、XCode経由でアプリにインストールする

### デベロッパーアカウントを持っている方

端末のUDIDを収集して、iOS developer centerに端末を登録して、
デベロッパー用プロビジョニングファイルを更新、或いは作成して、
それを使って、端末にインストールできるバイナリデータをビルドする。

ビルドしたら、iTunesでAdhoc版アプリをインストールするや、
OTA経由端末にインストールするやなど方法でインストールする。

# オープンソース

## サーバー

- fuelphp

http://fuelphp.com/

- phpMyAdmin

MySQL GUIツール

https://www.phpmyadmin.net/

- apidoc

RESTful API定義書作成ツール

http://apidocjs.com/

## アプリ

- Google Map Kit

https://developers.google.com/maps/ios/

- AFNetworking

https://github.com/AFNetworking/AFNetworking

- SDWebImage（現時点使っていない）

https://github.com/rs/SDWebImage

## 素材作成

- GIMP

https://www.gimp.org/
