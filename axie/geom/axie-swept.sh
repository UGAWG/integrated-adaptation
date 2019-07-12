#!/usr/bin/env bash

set -e
set -u
set -x

serveCSM -batch axie-swept.csm | tee axie-swept-csm.txt

ref bootstrap axie-swept.egads | tee axie-swept-boot.txt

ref_driver -i axie-swept-vol.meshb \
	   -g axie-swept.egads \
	   -o axie-swept01 | tee axie-swept-crv.txt

