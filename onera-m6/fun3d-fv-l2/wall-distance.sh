#!/usr/bin/env bash

set -e # exit on first error
set -u # Treat unset variables as error

. /usr/local/pkgs/modules/init/bash

module use /u/shared/fun3d/fun3d_users/onering_modulefiles/linux-centos6-x86_64
module purge
module load Python_2.7.8
module load cmake-3.9.4-gcc-6.2.0-e24o65d
module load gcc_6.2.0
module load intel_2017.2.174
module load mpich-3.2-gcc-6.2.0-duvhaci
module load ParaView_5.4.1
module load gnuplot_4.6.3

set -x # echo commands

ugrid=$1
dist=${ugrid%b8.ugrid}dist
out=${ugrid%b8.ugrid}dist-out

echo "3 4 5 6 7 8 9 10 11 12" |
/misc/home2/mpark/gitlab/one-ring/parfait/build/utils/DistanceCalculator/DistanceCalculator $1 > ${out}

grep -v \# < distance.txt | cut -d' ' -f5 > ${dist}

