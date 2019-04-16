#!/usr/bin/env bash

serveCSM -batch jsm-nac-box.csm | tee jsm-nac-box-csm.txt

ref bootstrap jsm-nac-box.egads | tee jsm-nac-box-boot.txt

ref_driver -i jsm-nac-box-vol.meshb \
	   -g jsm-nac-box.egads \
	   -o jsm-nac-box01 \
	   | tee jsm-nac-box-crv.txt

