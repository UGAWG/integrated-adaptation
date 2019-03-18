#!/usr/bin/env bash

serveCSM -batch diamond.csm

ref bootstrap diamond.egads

ref_driver -i diamond-vol.meshb -g diamond.egads -o diamond01
