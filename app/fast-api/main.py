from fastapi import FastAPI, HTTPException
from app.aws import process_message

app = FastAPI(title="API SQS Processor")

@app.get("/health")
def healthcheck():
    return {"status": "ok"}

@app.get("/process/{message_id}")
def process(message_id: str):
    try:
        result = process_message(message_id)
        if not result:
            raise HTTPException(status_code=404, detail="ID não encontrado na fila")
        return {
            "status": "success",
            "message": f"Arquivo gerado e enviado para o S3",
            "s3_key": result
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
