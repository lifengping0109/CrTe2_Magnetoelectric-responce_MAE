#!/bin/bash
#SBATCH -J bT_0
#SBATCH -o md_%j.out
#SBATCH -p mem1500b
#SBATCH -N 1
#SBATCH -n 16

source /etc/profile.d/modules.sh
module purge
module add mpi/2021.6.0
module add mkl/2022.1.0

QE=/home/lfp0109/0-soft/qe/q-e-qe-6.1.0/bin

export MKL_DYNAMIC=FALSE
export MKL_NUM_THREADS=$SLURM_NTASKS

date
mpirun -np $SLURM_NTASKS $QE/pw.x -inp scf.in > scf.out
sleep 1
rm -r tmp
