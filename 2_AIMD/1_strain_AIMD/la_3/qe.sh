#!/bin/bash
#SBATCH -J bl_3
#SBATCH -o myMPI.o%j
#SBATCH -p mem190
#SBATCH -N 1
#SBATCH -n 20

source /etc/profile.d/modules.sh
module purge
module add mpi/2021.6.0
module add mkl/2022.1.0

esp=/home/lfp0109/0-soft/qe/q-e-qe-6.1.0/bin

export MKL_DYNAMIC=FALSE
export MKL_NUM_THREADS=$SLURM_NTASKS

date
mpirun -np $SLURM_NTASKS $esp/pw.x -inp scf.in > scf.out
