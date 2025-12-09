import sys
from pathlib import Path

# Add root path to sys.path
root_path = Path(__file__).parent
sys.path.insert(0, str(root_path))

from app.main import main

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n👋 Bye!")
        sys.exit(0)
