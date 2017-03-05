#!/bin/bash

echo "[+] Initializing the Rust plugins"

# Helper tools
cargo install rustfmt
cargo install clippy
cargo install cargo-mod
cargo install cargo-count
cargo install cargo-edit
cargo install cargo-license
cargo install cargo-tree
cargo install cargo-graph
cargo install cargo-outdated

# Testing etc.
cargo install cargo-fuzz
cargo install cargo-audit

# Specific tools
cargo install cargo-apk
