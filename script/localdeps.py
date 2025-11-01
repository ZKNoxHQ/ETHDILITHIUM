import sys
import os

repo_root = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
pythonref_path = os.path.join(repo_root, "pythonref")

if pythonref_path not in sys.path:
    sys.path.insert(0, pythonref_path)
