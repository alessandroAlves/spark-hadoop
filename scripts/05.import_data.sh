#! /bin/bash

echo "Descompactando arquivos do TSE ... " 
cd /tmp
mkdir eleicoes 
cd eleicoes
unzip -o '/vagrant/resources/data/*2014.zip'


echo "Removendo arquivos desnecessários... "
rm -f *.pdf *brasil.txt *sup.txt *elp.txt *comite* *partido* *receita* *votacao*


echo "Convertendo arquivos para UTF-8"
mkdir /tmp/eleicoes_utf8
find . -name "*.txt" -exec iconv -f ISO-8859-1 -t UTF-8  {} -o /tmp/eleicoes_utf8/{} \; 


echo "Preparando diretórios no hdfs ..."
hdfs dfs -mkdir /user/root/eleicoes
hdfs dfs -mkdir /user/root/eleicoes/votacao
hdfs dfs -mkdir /user/root/eleicoes/receita
hdfs dfs -mkdir /user/root/eleicoes/despesa
hdfs dfs -mkdir /user/root/eleicoes/consultas
hdfs dfs -ls /user/root/eleicoes


echo "Carregando dados para o HDFS ... "
hdfs dfs -put /tmp/eleicoes_utf8/detalhe_votacao* /user/root/eleicoes/votacao
hdfs dfs -put /tmp/eleicoes_utf8/receitas* /user/root/eleicoes/receita
hdfs dfs -put /tmp/eleicoes_utf8/despesas* /user/root/eleicoes/despesa


echo "Limpando arquivos após importação"
cd /root
rm -rf /tmp/eleicoes /tmp/eleicoes_utf8

 
