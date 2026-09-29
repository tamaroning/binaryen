#!/bin/bash
for p in $(cat $1/pids); do kill $p 2>/dev/null; done
