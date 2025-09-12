#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=02:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH -J "rse"

## /SBATCH -p general # partition (queue)
#SBATCH -o rse-slurm.%N.%j.out
#SBATCH -e rse-slurm.%N.%j.err

python -u -c "import PyHipp as pyh; \
import time; \
import os; \
t0 = time.time(); \
print(time.localtime()); \
os.chdir('sessioneye'); \
pyh.RPLSplit(SkipLFP=False, SkipHighPass=False); \
print(time.localtime()); \
print(time.time()-t0);"

