#!/usr/bin/env bash

set -e # exit on first error
set -u # Treat unset variables as error

. /usr/local/pkgs/modules/init/bash


module purge
module load gcc_6.2.0

set -x # echo commands

ugrid=$1
dist=${ugrid%b8.ugrid}dist
out=${ugrid%b8.ugrid}dist-out

echo "3 4 5 6 7 8 9 10 11 12" |
/u/abalan/parfait/build/utils/DistanceCalculator/DistanceCalculator $1 > ${out}

grep -v \# < distance.txt | cut -d' ' -f5 > ${dist}

