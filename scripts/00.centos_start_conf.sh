	
	yum -y update

	#for vagrant vbguest 
	yum -y install kernel-headers kernel-devel 

	yum -y install zip unzip 
	
	#opcional - https://simpletutorials.com/c/1238/Simple+Vim+Reference
	yum -y install vim 
	cp /vagrant/resources/config/.vimrc /root/.vimrc 

	yum --enablerepo=extras install -y epel-release

	yum install -y python-pip

	pip install upgrade pip

	yum clean all