chef-repo
=========
# Vagrant knife-solo 連携

## 【環境】
	 ホストOS：Windows7 64bit
	 仮想化ソフト：VirtualBox 4.3.8
	 Vagrantバージョン：1.4.3
	 ゲストOS：CentOS 6.5 32bit
	 Chef-Client：11.6.0.1

1.Chocolateyをインストール

2.Chocolateyを使用して、VirualBoxをインストール

3.Chocolateyを使用して、Vagrantをインストール

4.Chocolateyを使用して、Chef-clientをインストール
	 (Ruby,Ruby-DevKitもインストールされる)

5.rsync,sshのインストール

	 1.mingw-getをインストール(GUIも使用する)

	 2.MinGW Installerを起動して、All Packageからmysys-openssh、mysys-rsyncをインストール

	 3.ユーザ環境変数
		【HOMEを作成】
		 %USERPROFILE%
		【PATHに設定】
		 C:\MinGW\bin
		 C:\MinGW\msys\1.0\bin

	 4.knife-solo対応
		 C:\MinGW\msys\1.0\etc/fstab を作成
		 c:    /cygdrive/c

	 5.vagrantのMinGWを使用するように変更

		 1.C:\MinGW 配下を C:\HashiCorp\Vagrant\embedded 配下へコピー

		 2.C:\MinGW\var\lib\mingw-get\data\defaults.xml を編集
			 <sysroot subsystem="MSYS" path="%R/msys/1.0" />を
			 <sysroot subsystem="MSYS" path="/HashiCorp/Vagrant/embedded" />へ

		 3.C:\MinGW\var\lib\mingw-get\data\profile.xml を編集
			 上記と同様に修正

6.gemを使用して、knife-soloをインストール

7.knife configureを実行
	 選択肢は全てデフォルト

8.knife.rbの編集

	 %USERPROFILE%\.chef\knife.rbを編集
	 knife[:solo_path]='/tmp/chef-solo'を最終行に追加

7.vagrant設定

	 32bitのOSを使用
	 vagrant box add centos65 http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5-i386_chef-provisionerless.box

8.vagrant環境を作成

	 作業用ディレクトリ作成・移動
	 vagrant init centos65

9.vagrant起動

	 vagrant up
	 vagrant ssh-config --host centos65 >> C:/Users/yoshikazu/.ssh/config
	 ssh ホスト名でアクセス

10.knife solo init chef-repoを実行

11.Cookbook作成

	 cd chef-repo
	 knife cookbook create ntp -o site-cookbooks

12.レシピ編集

	 site-cookbooks\ntp\recipes\default.rbを編集

13.knife solo prepare centos65

14.JSONファイル編集

	 nodes\centos65.json

15.knife solo cook centos65
