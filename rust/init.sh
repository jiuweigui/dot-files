#!/bin/bash

echo "[+] Initializing the Rust plugins"

# Helper tools
cargo install cargo-update
cargo install rustfmt
cargo install clippy
cargo install cargo-mod
cargo install cargo-count
cargo install cargo-edit
cargo install cargo-license
cargo install cargo-tree
cargo install cargo-graph
cargo install cargo-outdated
cargo install cargo-modules

# Testing etc.
cargo install cargo-fuzz
cargo install cargo-audit
cargo install --git https://github.com/evernym/cargo-test-xunit

# Specific tools
cargo install cargo-apk
cargo install dinghy
cargo install cargo-script
