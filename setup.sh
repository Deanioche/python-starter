#!/bin/bash

VENV_DIR=".venv"
REQ_FILE="requirements.txt"
DIR_NAME=$(basename "$PWD")

echo "🛠️  Project Setup Initiated..."

# ---------------------------------------------------------
# 1. Git 리셋 로직 (확인 절차 제거됨)
# ---------------------------------------------------------
if [ -d ".git" ]; then
    
    # [Case A] 템플릿 원본(python-starter)인 경우 -> Skip
    if [[ "$DIR_NAME" == "python-starter" ]]; then
        echo "🛡️  Detected 'python-starter'. Skipping Git history reset."
    
    # [Case B] 다른 디렉토리(새 프로젝트)인 경우 -> 즉시 실행
    else
        echo "♻️  Resetting Git history..."
        rm -rf .git
        
        echo "📦 Initializing new Git repository..."
        git init -q
        git branch -M main
        git add .
        git commit -q -m "feat: project initialized"
    fi
fi

# ---------------------------------------------------------
# 2. 가상환경 구축
# ---------------------------------------------------------
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
    echo "✅ Created Virtual Environment ($VENV_DIR)"
else
    echo "♻️  Virtual Environment already exists."
fi

# ---------------------------------------------------------
# 3. 패키지 설치
# ---------------------------------------------------------
# pip 업그레이드
./$VENV_DIR/bin/pip install --upgrade pip --quiet

# requirements.txt 설치
if [ -f "$REQ_FILE" ]; then
    echo "📥 Installing dependencies..."
    ./$VENV_DIR/bin/pip install -r "$REQ_FILE"
fi

echo "🎉 Setup Complete! (Branch: main)"
echo "🚀 Run 'python run.py' to start."

# 스크립트 자체를 제거
rm -- "$0"
echo "🗑️ setup.sh removed."
