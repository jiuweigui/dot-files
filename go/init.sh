#!/bin/bash

TOOLS=(
    'github.com/KyleBanks/goggles'
    'github.com/KyleBanks/depth'
    'github.com/dominikh/go-tools/cmd/...'
    'github.com/alecthomas/gocyclo'
    'github.com/360EntSecGroup-Skylar/goreporter'
    'github.com/cweill/gotests'
    'github.com/TrueFurby/go-callvis'
    'github.com/golang/dep/cmd/dep'
    'github.com/tebeka/go2xunit'
    'github.com/go-swagger/go-swagger/cmd/swagger'
    'github.com/davecheney/gcvis'
    'github.com/tsenart/deadcode'
    'github.com/dvyukov/go-fuzz/go-fuzz'
    'github.com/dvyukov/go-fuzz/go-fuzz-build'
    'github.com/GoASTScanner/gas/cmd/gas/...'

)

for tool in ${TOOLS[@]}; do
    echo "[+] Installing/Updating $tool"
    go get -u -v $tool
done
