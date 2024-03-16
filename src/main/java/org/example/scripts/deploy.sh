#!/bin/bash

VAR1=$1
PATHSH="/src/main/java/org/example/scripts"
echo "git clone https://github.com/Duranna66/$VAR1.git"

touch "$PATHSH/tmp.txt"

echo "$VAR1" > "$PATHSH/tmp.txt"
sh "$PATHSH/test.sh"
