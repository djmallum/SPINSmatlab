#!/bin/bash
##SBATCH --test
#SBATCH --account=ctb-mmstastn
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=32G
#SBATCH --time=0-06:00
#SBATCH --output=TimeTest%j.log
#SBATCH --error=TimeTest%j.err

module load matlab/2023a.3
srun matlab -nodisplay -r "spins_readerTEST2"
