#!/bin/bash
./fetch-proof-response.sh
./fetch-broken-file.sh
python3 repair.py
./replace-broken-file.sh