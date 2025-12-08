#!/bin/bash
echo "Running basic test..."
# check for common files in your repo
if [ -f Dockerfile ] || [ -f app.py ] || [ -f index.js ] || [ -f index.html ]; then
  echo "Test Passed: Required file exists."
  exit 0
else
  echo "Test Failed: Required file missing."
  exit 1
fi
