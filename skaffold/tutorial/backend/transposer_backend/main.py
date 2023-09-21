from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import os
import uvicorn


class Text(BaseModel):
    content: str


app = FastAPI()

env_origins = os.environ.get("ORIGINS")
if env_origins is not None:
    origins = env_origins.split(" ")
else:
    origins = ["http://127.0.0.1", "http://127.0.0.1:5500"]

print("Adding origins: %s" % origins)

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/", status_code=200)
async def status():
    r = {"status": "online"}
    return r


@app.post("/reverse/")
async def reverse(text: Text):
    r = text.content[::-1]
    return r


def run():
    uvicorn.run("transposer_backend.main:app",
                host="0.0.0.0",
                port=8000,
                reload=False,
                log_level="info")
