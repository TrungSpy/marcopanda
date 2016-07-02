# サーバー構築手順
## 事前準備
aliyun ecsインスタンスを先に作成しました。
OSをCentos7.2に選択しています。
サーバーにSSHログインできるようにしました。

## yumを最新化
yum update

## php5.6、apache2.4インストール
下記サイトを参考している。
http://weblabo.oscasierra.net/centos7-php56-install/

実行コマンド

    yum -y install epel-release
    cd /etc/yum.repos.d
    wget http://rpms.famillecollet.com/enterprise/remi.repo
    yum -y --enablerepo=remi,remi-php56 install httpd php php-common

    vi /etc/php.ini

    ;data.timezone = 

    を下記に変更

    date.timezone = Asia/Tokyo

    systemctl enable httpd.service
    systemctl start httpd.service
    vi /var/www/html/info.php

    <?php
        phpinfo();
    ?>


## ファイアウォール設定
デフォルトで22ポートしか空いていないので、httpとhttpsのポートを開放するように設定します。

許可するポートを確認する

    firewall-cmd --list-all

httpとhttpsポートを開放する

    firewall-cmd --permanent --add-service=http --add-service=https
    firewall-cmd --reload

許可するポートを確認する

    firewall-cmd --list-all

http://47.90.38.52

http://47.90.38.52/info.php

が見れることを確認する

## ドメイン設定
お名前.comで事前に取ったドメインにサブドメインを作って、
ecsサーバーのIPに指すようにDNSレコードを登録する。
DNSレコードの反映はすこし時間がかかりますが、
一定時間空いてから、下記URLが見れるようになります。
http://api.marcopanda.dreamsfor.com/info.php

## 必要なミドルウェアをインストール
    yum install git

## RDS開設
- aliyunのコンソール画面にRDSのインスタンスを作る
- フル権限アカウント作成
- 読み込みのみアカウント作成
- データベース作成

ECSサーバーにmysqlクライアントインストール

    yum -y --enablerepo=remi,remi-php56 install mysql

RDSにmysqlログインできるか確認

    mysql -u [username] -p -h [host] [dbname]

ECSサーバーにphpmyadminインストール

    yum -y --enablerepo=remi,remi-php56 install phpMyAdmin

IP確認君でグローバルIPを確認して、
そのIPアドレスをphpmyadmin.confの設定ファイルに追加する

    vi /etc/httpd/conf.d/phpMyAdmin.conf

    Require local

の後ろに下記を追加する（２箇所）。

    Require ip [確認君で取得したグローバルIP]

    systemctl restart httpd.service

    vi /etc/phpMyAdmin/config.inc.php

    $cfg['Servers'][$i]['host'] = 'localhost';

にlocalhostの部分を実際のRDSホストに変更する。

http://api.marcopanda.dreamsfor.com/phpmyadmin/

で確認する。

## fuelphpインストール

### ダウンロード

http://fuelphp.com/
から最新版fuelphpをダウンロードして、
gitに保管して、サーバーでgit pullする（apache権限）。

### httpd設定

vi /etc/httpd/conf/httpd.conf

    DocumentRoot "/var/www/html"

を下記に変更

    DocumentRoot "/var/www/html/server/public"
    SetEnv FUEL_ENV production

また

    <Directory "/var/www/html">
	
を下記に変更

    <Directory "/var/www/html/server/public">

また下記を追加

    <Directory "/var/www/html/docs/apiDefine/doc">
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>

    Alias /apidefine /var/www/html/docs/apiDefine/doc

API定義書は下記のURLで見れる

http://api.marcopanda.dreamsfor.com/apidefine/index.html

### composer更新

    cd /var/www/html/server/
    php composer.phar self-update
    php composer.phar update



# Google API KEY取得
- Google Maps APIs

https://developers.google.com/maps/documentation/

サーバーのIPアドレスをGoogle APIのコンソール画面に登録する

- Google Maps API呼び出しを試す

https://maps.googleapis.com/maps/api/geocode/json?address=roppongi&key=YOUR_API_KEY

https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&key=YOUR_API_KEY

上記APIをサーバー側で

    curl [url]

で実行して、結果が返ってくることを確認する。
