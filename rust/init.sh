#!/bin/bash

echo "[+] Initializing the Rust plugins"

# Helper tools
HELPER_TOOLS=(
    'cargo-update'
    'rustfmt'
    'clippy'
    'cargo-mod'
    'cargo-count'
    'cargo-edit'
    'cargo-license'
    'cargo-tree'
    'cargo-graph'
    'cargo-outdated'
    'cargo-modules'
)

# Testing etc.
TESTING_TOOLS=(
    'cargo-fuzz'
    'cargo-audit'
    '--git https://github.com/evernym/cargo-test-xunit'
)

# Specific tools
SPECIFIC_TOOLS=(
    'cargo-apk'
    'dinghy'
    'cargo-script'
    'mdbook'
    'cross'
)

for tool in ${HELPER_TOOLS[@]} ${TESTING_TOOLS[@]} ${SPECIFIC_TOOLS[@]}; do
    echo "[+] Installing/Updating $tool"
    cargo install $tool
done
