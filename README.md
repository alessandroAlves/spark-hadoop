# Ambiente Vagrant para Spark, Hadoop e Solr

# Introdução 
Projeto vagrant para provisionamento de ambiente com as seguintes ferramentas Apache:

* Spark 2.3.0 
* Hadoop 2.7.5
* Solr 7.2.1

# Requisitos
* Virtual Box 5.2.6+   https://download.virtualbox.org/virtualbox/5.2.6/
* Vagrant 2.0.1+       https://www.vagrantup.com/downloads.html

# Instalação 
Após executar o clone do repositório, será necessário fazer download dos instaladores e arquivos de dados para o diretório */resources*.  

* Os instaladores estão disponíveis no link https://drive.google.com/open?id=1V7M7KF5gydQ73cZ6e3d8CALAGTZHi98t 

Ao final do download, cole os arquivos nos diretórios *installers* e *data*, assim como estão no Google Drive.

Agora inicie o terminal de sua preferência dentro do diretório *spark-hadoop-solr* onde o projeto foi clonado e execute o seguinte comando 

``` 
$ vagrant up
```
# Acessando as aplicações

No seu browser, utilize as seguintes uris

```
http://localhost:8088       #yarn
http://localhost:8983       #solr
http://localhost:4040       #spark
http://localhost:50070      #hadoop
```
