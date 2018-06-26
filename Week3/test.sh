#!/bin/bash
echo "$1"
salt "*$1" cmd.run 'apt install cowsay'
#> test.txt
