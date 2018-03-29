from pyspark import SparkFiles
from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql.types import FloatType
from  pyspark.sql.functions import monotonically_increasing_id

base_path 	= 	'/user/root/eleicoes'
file_path 	= 	base_path + '/despesa/despesas_candidatos_*.txt'
query_path 	= 	base_path + '/consultas'


def main():	
	#Spark Session
	spark = start_spark(app_name='despesas_job') 

	#Read TSE Files
	df = spark.read.format('com.databricks.spark.csv')  \
						.option('header', 'true')  \
						.option('delimiter', ';')  \
						.option('inferSchema', 'true') \
						.load(file_path)
	
	#Convert String to float
	udf_to_value = F.udf(to_value, FloatType())
	despesas_df = df.withColumn('Valor', udf_to_value(df['Valor Despesa'])) 

	#Query's
	query1 = despesas_por_partido(despesas_df)
	save_query(query1, 'despesas_por_partido')

	query2 = despesas_por_regiao(despesas_df)
	save_query(query2, 'despesas_por_regiao')

	query3 = despesas_por_cargo(despesas_df)
	save_query(query3, 'despesas_por_cargo')

	query4 = despesas_por_tipo(despesas_df)
	save_query(query4, 'despesas_por_tipo')
    
	return None 


#COMMON FUNCTIONS 
def start_spark(app_name):
	spark_builder = (
        SparkSession
        .builder
        .master('yarn')
		.appName(app_name))
	spark_session = spark_builder.getOrCreate()
	return spark_session


def to_value(string):
	return float(string.replace(",","."))


def save_query(df, name):
	df.write.format('com.databricks.spark.csv') \
  			.option('delimiter', ';') \
  			.save(query_path + '/' + name + '.csv', mode='overwrite')


#QUERY'S  
def despesas_por_partido(df):
	result = df.groupBy('Sigla  Partido') \
				.sum('Valor') \
				.orderBy('sum(Valor)', ascending=False)
	return result

def despesas_por_regiao(df):
	result = df.groupBy('UF') \
				.sum('Valor') \
				.orderBy('sum(Valor)', ascending=False)
	return result

def despesas_por_cargo(df):
	result = df.groupBy('Cargo') \
				.sum('Valor') \
				.orderBy('sum(Valor)', ascending=False)
	return result

def despesas_por_tipo(df):
	result = df.groupBy('Tipo despesa') \
				.sum('Valor') \
				.orderBy('sum(Valor)', ascending=False)
	return result


#Start Script
if __name__ == '__main__':
	main()