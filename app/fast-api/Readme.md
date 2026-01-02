### Sobre

FastAPI é o nome definido para a aplicação que possue sua regra de negócio definida, desenvolvida em Python, utiliza uma de suas bibliotecas **"FastAPI"** que tem objetivo de criar de forma rápida e simples uma API Rest e que vai auxiliar na simulação de um ambiente de produção. 

Sua regra de negócio é receber requisições do tipo GET com um id, fazer uma consulta na fila SQS e salvar o resultado em um arquivo com formato txt em um **Bucket S3**.


### Componentes

- FastAPI (API HTTP)
- boto3 (AWS SDK)
- SQS
- S3
- Docker