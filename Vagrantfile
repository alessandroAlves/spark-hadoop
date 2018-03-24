# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	
	if Vagrant.has_plugin?("vagrant-proxyconf") && ENV['http_proxy']
		config.proxy.http     = ENV['http_proxy'] 
		config.proxy.https    = ENV['https_proxy']
		config.proxy.no_proxy = "localhost,127.0.0.1"
	end
	
	config.vm.boot_timeout = 600
	config.vm.box = "bento/centos-7.4"
	
	config.vm.box_check_update = false
	
	config.vm.network "private_network", ip: "192.168.33.10"
	
	config.vm.network "forwarded_port", guest: 8000, host: 8000  	#django
	config.vm.network "forwarded_port", guest: 8983, host: 8983     #solr
	config.vm.network "forwarded_port", guest: 8088, host: 8088   	#hadoop
	config.vm.network "forwarded_port", guest: 4040, host: 4040   	#spark
	config.vm.network "forwarded_port", guest: 18080, host: 18080  	#spark-history
	config.vm.network "forwarded_port", guest: 50070, host: 50070   #hadoop
	
	config.vm.provider "virtualbox" do |vb|
		vb.memory = "5120"
	end
  
	config.vm.provision "shell", inline: <<-SHELL
		
		sudo su
				
		#opcional - Necessita conexão com a internet
		yum -y update 
		yum -y install kernel-headers kernel-devel
		
		#opcional - https://simpletutorials.com/c/1238/Simple+Vim+Reference
		yum -y install vim 
		cp /vagrant/resources/config/.vimrc /root/.vimrc 
		
		sh /vagrant/scripts/01.install_java.sh
		sh /vagrant/scripts/02.install_hadoop.sh 	
		sh /vagrant/scripts/03.install_spark.sh		
		sh /vagrant/scripts/04.install_solr.sh
		sh /vagrant/scripts/05.common.sh

		. ~/.bashrc
		
		#iniciando serviços
		sh /opt/scrips/spark-hadoop-solr.sh start
	SHELL
end
