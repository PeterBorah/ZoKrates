#!/bin/bash

function decompose()
{
  result=""
  temp="$1"

  for n in {1..32}
  do
    result="$(($temp % 2)) $result"
    temp="$(($temp / 2))"
  done

  printf "$result"
}

intArgs=""

for arg in "${@:2}"
do
  intArgs="$intArgs $(decompose $arg)"
done

./target/release/zokrates compile -i $1 && ./target/release/zokrates compute-witness -a $intArgs
