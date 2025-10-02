# ベースイメージとして公式のPythonイメージを使用
FROM python:3.11-slim

# uvをインストール
RUN pip install uv

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係ファイルをコピー
COPY pyproject.toml uv.lock* ./

# uvを使って依存関係をインストール
# uv.lockが存在しない場合も考慮
RUN uv sync --system || uv pip install -r <(uv pip compile pyproject.toml --output-file -)

# アプリケーションのソースコードとテンプレートをコピー
COPY main.py .
COPY templates/ ./templates/

# ポートを公開
EXPOSE 8000

# アプリケーションを起動
CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
