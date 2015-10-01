#!/bin/bash
#
# Simple bash script to regenerate a set of binary SDK subdirectories
# containing assembler code disassembled using xtobjdis.
#
#
INDIR=$1
OUTDIR=$2
if [ -z ${OUTDIR} ] || [ -z ${INDIR}; then
    echo "Usage: $0 [Input library dir] [Output binary_sdk dir]"
    exit 1
fi

INDIR=$(realpath ${INDIR})
OUTDIR=$(realpath ${OUTDIR})

set -e -x

for LIB in ${INDIR}/*.a; do
    LIB=$(basename ${LIB%.a})
    echo $LIB
    mkdir -p ${OUTDIR}/${LIB}
    cd ${OUTDIR}/$LIB
    ar x ${INDIR}/${LIB}.a
    for O in *.o; do
	O=${O%.o}
	xtobjdis --rewrite-as-source ${O}.o > ${O}.S
	rm ${O}.o
    done
done


