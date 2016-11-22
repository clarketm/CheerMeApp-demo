#!/usr/bin/env bash

python -s runbackend.py &
http-server frontend -s -p 8080 &