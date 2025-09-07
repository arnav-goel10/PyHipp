#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH -J "rpllfp"

## /SBATCH -p general # partition (queue)
#SBATCH -o rpllfp-slurm.%N.%j.out
#SBATCH -e rpllfp-slurm.%N.%j.err

python -u -c "import PyHipp as pyh; \
import time; \
pyh.RPLLFP(saveLevel=1); \
print(time.localtime());"
