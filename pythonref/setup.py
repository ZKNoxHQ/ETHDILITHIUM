from setuptools import setup, find_packages

def parse_requirements(filename):
    """Parse requirements.txt, separating regular packages from git URLs"""
    with open(filename) as f:
        lines = f.read().splitlines()
    
    regular_requires = []
    for line in lines:
        line = line.strip()
        if line and not line.startswith('#'):
            # Skip git+ URLs, they need to be installed separately
            if not line.startswith('git+') and not line.startswith('-e git+'):
                regular_requires.append(line)
    
    return regular_requires

setup(
    name="dilithium-py",
    version="0.1.0",
    packages=find_packages(),
    install_requires=parse_requirements('requirements.txt'),
)