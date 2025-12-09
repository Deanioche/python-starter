#!/bin/bash
# setup.sh in Git Repo

VENV_DIR=".venv"
REQ_FILE="requirements.txt"

echo "🛠️  Project Setup Initiated..."

# 1. 가상환경 생성
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
    echo "✅ Created Virtual Environment ($VENV_DIR)"
else
    echo "♻️  Virtual Environment already exists."
fi

# 2. Pip 업그레이드
./$VENV_DIR/bin/pip install --upgrade pip --quiet

# 3. 의존성 설치
if [ -f "$REQ_FILE" ]; then
    echo "📥 Installing dependencies..."
    ./$VENV_DIR/bin/pip install -r "$REQ_FILE"
fi

echo "🎉 Setup Complete! Run: 'python run.py'"