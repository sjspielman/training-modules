#!/bin/bash

# This script runs the snakemake workflows to populate the
# `/shared/training-modules/RNA-seq` directory with preprocessed data
# for the notebooks in that module


# safety flags
set -euo pipefail

# Set the working directory to the directory of this file
cd "$(dirname "${BASH_SOURCE[0]}")"

jobs=12

# create gastric cancer files (keep fastq)
snakemake -j ${jobs} --notemp --configfile config-GC.yaml

# create NB cell line files (fastq will be deleted)
snakemake -j ${jobs} --configfile config-NB.yaml

# create leukemia files
snakemake -j ${jobs} --configfile config-leukemia.yaml

# create zebrafish cortisol files (fastq will be deleted)
snakemake -j ${jobs} --configfile config-zebrafish.yaml
