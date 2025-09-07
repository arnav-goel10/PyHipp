#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=04:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH -J "rplhighpass_sort"

## /SBATCH -p general # partition (queue)
#SBATCH -o rplhighpass-sort-slurm.%N.%j.out
#SBATCH -e rplhighpass-sort-slurm.%N.%j.err

python -u -c "import PyHipp as pyh; \
import time; \
pyh.RPLHighPass(saveLevel=1); \
from PyHipp import mountain_batch; \
mountain_batch.mountain_batch(); \
from PyHipp import export_mountain_cells; \
export_mountain_cells.export_mountain_cells(); \
print(time.localtime());"
