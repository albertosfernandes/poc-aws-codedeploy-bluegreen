import boto3
import os
from datetime import datetime

SQS_QUEUE_URL = os.environ["SQS_QUEUE_URL"]
S3_BUCKET_NAME = os.environ["S3_BUCKET_NAME"]
AWS_REGION = os.environ.get("AWS_REGION", "us-east-1")

sqs = boto3.client("sqs", region_name=AWS_REGION)
s3 = boto3.client("s3", region_name=AWS_REGION)


def process_message(message_id: str):
    response = sqs.receive_message(
        QueueUrl=SQS_QUEUE_URL,
        MaxNumberOfMessages=10,
        WaitTimeSeconds=5
    )

    messages = response.get("Messages", [])

    for msg in messages:
        body = msg["Body"]

        if message_id in body:
            file_content = f"ID: {message_id}\nMensagem:\n{body}"

            filename = f"{message_id}_{datetime.utcnow().isoformat()}.txt"

            s3.put_object(
                Bucket=S3_BUCKET_NAME,
                Key=filename,
                Body=file_content.encode("utf-8")
            )

            # (Opcional) remover mensagem da fila
            sqs.delete_message(
                QueueUrl=SQS_QUEUE_URL,
                ReceiptHandle=msg["ReceiptHandle"]
            )

            return filename

    return None
