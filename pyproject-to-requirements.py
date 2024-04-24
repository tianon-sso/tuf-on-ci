#!/usr/bin/env python3

import tomllib

with open("pyproject.toml", "rb") as f:
    data = tomllib.load(f)
    print("\n".join(data["project"]["dependencies"]))
