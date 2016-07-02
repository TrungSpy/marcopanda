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
