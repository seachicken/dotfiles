#!/bin/bash

for n .??*
do
    [[ "$f" == ".git" ]] && continue

    echo "$f"
done
