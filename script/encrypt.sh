#!/bin/bash -ue

key=age19xunqcpxm8uxl0aav534f0jsznswzy790ezh8cucgvmls2lhvg3q7wvkjr

secret=$1

if [[ ! -e secret/${secret}.in.txt ]]; then echo "secret/${secret}.in.txt not exists"; exit 1; fi

sops --encrypt \
	 --age ${key} \
	secret/${secret}.in.txt > terraform/sops/${secret}.json.tmp

cat terraform/sops/${secret}.json.tmp | jq . > terraform/sops/${secret}.enc.json

rm terraform/sops/${secret}.json.tmp
