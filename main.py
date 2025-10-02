from fastapi import FastAPI
from fastapi.responses import FileResponse
import os

app = FastAPI()

# templatesディレクトリのパスを取得
template_dir = os.path.join(os.path.dirname(__file__), "templates")

@app.get("/")
async def read_root():
    return FileResponse(os.path.join(template_dir, "index.html"))