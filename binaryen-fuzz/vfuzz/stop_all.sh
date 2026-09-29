#!/bin/bash
# kill every vfuzz worker (drive.py / tv.py); run this file, never inline the pattern
for p in $(pgrep -f "vfuzz/(drive|tv)\.py"); do kill $p; done
