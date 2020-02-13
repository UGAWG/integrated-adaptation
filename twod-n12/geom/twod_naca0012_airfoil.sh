#! /bin/bash -ue
project=twod_naca0012_airfoil
serveCSM -batch ${project}.csm 
ref boostrap    ${project}.egads 
