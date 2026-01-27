#!/bin/sh
#PBS -N qnscf
#PBS -V
#PBS -l select=1:ncpus=68
#PBS -q normal
#PBS -l walltime=48:00:00
#PBS -A qe

cd $PBS_O_WORKDIR

module purge
module load craype-mic-knl
module load craype-mic-knl intel/17.0.5 impi/17.0.5 qe/6.1

mpirun pw.x -i nscf.in > nscf.out


exit 0
