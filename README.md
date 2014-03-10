chef-repo
=========
# Vagrant knife-solo �A�g

## �y���z
	 �z�X�gOS�FWindows7 64bit
	 ���z���\�t�g�FVirtualBox 4.3.8
	 Vagrant�o�[�W�����F1.4.3
	 �Q�X�gOS�FCentOS 6.5 32bit
	 Chef-Client�F11.6.0.1

1.Chocolatey���C���X�g�[��

2.Chocolatey���g�p���āAVirualBox���C���X�g�[��

3.Chocolatey���g�p���āAVagrant���C���X�g�[��

4.Chocolatey���g�p���āAChef-client���C���X�g�[��
	 (Ruby,Ruby-DevKit���C���X�g�[�������)

5.rsync,ssh�̃C���X�g�[��

	 1.mingw-get���C���X�g�[��(GUI���g�p����)

	 2.MinGW Installer���N�����āAAll Package����mysys-openssh�Amysys-rsync���C���X�g�[��

	 3.���[�U���ϐ�
		�yHOME���쐬�z
		 %USERPROFILE%
		�yPATH�ɐݒ�z
		 C:\MinGW\bin
		 C:\MinGW\msys\1.0\bin

	 4.knife-solo�Ή�
		 C:\MinGW\msys\1.0\etc/fstab ���쐬
		 c:    /cygdrive/c

	 5.vagrant��MinGW���g�p����悤�ɕύX

		 1.C:\MinGW �z���� C:\HashiCorp\Vagrant\embedded �z���փR�s�[

		 2.C:\MinGW\var\lib\mingw-get\data\defaults.xml ��ҏW
			 <sysroot subsystem="MSYS" path="%R/msys/1.0" />��
			 <sysroot subsystem="MSYS" path="/HashiCorp/Vagrant/embedded" />��

		 3.C:\MinGW\var\lib\mingw-get\data\profile.xml ��ҏW
			 ��L�Ɠ��l�ɏC��

6.gem���g�p���āAknife-solo���C���X�g�[��

7.knife configure�����s
	 �I�����͑S�ăf�t�H���g

8.knife.rb�̕ҏW

	 %USERPROFILE%\.chef\knife.rb��ҏW
	 knife[:solo_path]='/tmp/chef-solo'���ŏI�s�ɒǉ�

7.vagrant�ݒ�

	 32bit��OS���g�p
	 vagrant box add centos65 http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5-i386_chef-provisionerless.box

8.vagrant�����쐬

	 ��Ɨp�f�B���N�g���쐬�E�ړ�
	 vagrant init centos65

9.vagrant�N��

	 vagrant up
	 vagrant ssh-config --host centos65 >> C:/Users/yoshikazu/.ssh/config
	 ssh �z�X�g���ŃA�N�Z�X

10.knife solo init chef-repo�����s

11.Cookbook�쐬

	 cd chef-repo
	 knife cookbook create ntp -o site-cookbooks

12.���V�s�ҏW

	 site-cookbooks\ntp\recipes\default.rb��ҏW

13.knife solo prepare centos65

14.JSON�t�@�C���ҏW

	 nodes\centos65.json

15.knife solo cook centos65
