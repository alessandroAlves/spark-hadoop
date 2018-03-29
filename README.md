# Ambiente Vagrant para Spark, Hadoop e Solr

# Introdução 
Projeto vagrant para provisionamento de ambiente com as seguintes ferramentas Apache:

* Spark 2.3.0 
* Hadoop 2.7.5
* Hive 1.2.2 

*Obs.:* O Apache Hive é instalado apenas para comparação ao spark nos jobs de mapreduce, caso não queira instalar esse componenete, comente a linha *43* no arquivo Vagrantfile

# Requisitos
* Virtual Box 5.2.6+   	https://download.virtualbox.org/virtualbox/5.2.6/
* Vagrant 2.0.1+       	https://www.vagrantup.com/downloads.html
* Putty					https://www.putty.org/

# Vagrant vbguest
Após a instalação do vagrant, acesse seu terminal e instale o plugin vbguest, que irá evitar que erros de montagem aconteçam no ambiente
```
vagrant plugin install vagrant-vbguest
vagrant vbguest
```

# Instalação 
Após executar o clone do repositório, será necessário fazer download dos instaladores e arquivos de dados para o diretório */resources*.  

* Os arquivos estão disponíveis no link https://drive.google.com/open?id=1V7M7KF5gydQ73cZ6e3d8CALAGTZHi98t 

Ao final do download, cole os arquivos nos diretórios *installers* e *data*, assim como estão no Google Drive.

Agora inicie o terminal de sua preferência dentro do diretório *spark-hadoop-solr* onde o projeto foi clonado e execute o seguinte comando 

``` 
$ vagrant up
```

# Gerenciando os serviços
Junto com a inicialização do sistema operacional, os serviços do haddop são iniciados. Mas caso queira pará-los, existe um script para facilitar essa tarefa
De qualquer lugar do sistema, digite 
```
haddop-service {start | stop | restart}
```

# Acessando as aplicações

No seu browser, utilize as seguintes uris

```
http://localhost:8088       #yarn
http://localhost:4040       #spark
http://localhost:50070      #hadoop
```

# Acessando a VM
Use o putty  para acessar a vm via ssh com os dados abaixo:
```
ip: 		localhost
porta:		2222
usuário:	vagrant
senha:		vagrant
```

# Desligando a VM 
Dentro do terminal, powershell, etc.. faça
```
vagrant halt
```

# Salvando o estado atual da VM
É recomendado após a instalação da VM realizar um snapshot da mesma, para que qualquer alteração feita que venha a causar algum problema possa ser facilmente contornada.
Dentro do terminal, powershell, etc... faça
```
vagrant snapshot save [nome_do_snapshot]
```

# Deletando a VM
Dentro do terminal, powershell, etc.. faça
```
vagrant destroy
```

