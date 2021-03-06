#!/bin/bash
# preparing data
modelfile=ak135.mod
#sprep96 -HR 0 -HS 0 -M $modelfile -d dfile -NMOD 1 -R
sprep96 -HR 0 -HS 0 -M $modelfile -DT 0.1 -NPTS 1024 -NMOD 1 -R
#sprep96 -HR 0 -HS 0 -M test.mod -d dfile -NMOD 1 -R
# compute dispersion curve
sdisp96
#Get ASCII disersion curve, not required for computing normal mode synthetics
#sdpsrf96 -R -PER -XMIN 0.1 -XMAX 100 -ASC
# compute eigenfunctions
sregn96 -NOQ
sdpegn96 -R -U -ASC -TXT -PER
# compute normal mode synthetics -M 0 fundamental mode only
#spulse96 -d dfile -D -p -EX -l 4 > myf96
#f96tosac -B myf96
#rm myf96
