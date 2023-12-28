#!/bin/bash

# =======================
# Install commitlint
# =======================
npm install -g @commitlint/cli @commitlint/config-conventional

echo "module.exports = {extends: ['@commitlint/config-conventional']}" > commitlint.config.js

# Test commitlint
echo 'foo: bar' | commitlint
