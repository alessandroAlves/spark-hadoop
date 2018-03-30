#TODO Hive example

Execute o seguinte comando no shell do centos

```
hive
```

Após iniciado o shell do hive, execute os seguintes comandos 

```
create database eleicoes;
```

```
CREATE TABLE IF NOT EXISTS eleicoes( cod_eleicao  STRING, eleicao  STRING,	data_hora  STRING,	 cnpj  STRING,	 seq_candidato  STRING,	 uf  STRING,	 partido  STRING,	 num_candidato  STRING,	 cargo  STRING,	 candidato  STRING,	 cpf  STRING,	 tipo_doc  STRING,	 num_doc  STRING,	 cpf_cnpj_fornecedor  STRING,	 fornecedor  STRING,	 fornecedor_rf  STRING,	 cod_setor_forn  STRING,	 setor_forn  STRING,	 dt_despesa  STRING,	 valor  FLOAT,	 tipo  STRING,	 desc_despesa STRING) 
STORED AS textfile;
```

```
load data local inpath '{descompactar algum arquivo de despesa_candidato e usar o path aqui}' into table eleicoes;
```

```
select partido, sum(valor) from default.eleicoes group by (partido);
```

