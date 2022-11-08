# Snakemake tutorial for C-SCALE

This repository puts together the simplest workflow ever to ilustrate the
use of [snakemake](https://snakemake.readthedocs.io/) to create workflows.

# Run it

```bash
# create a working directory
mkdir working-dir
cd working-dir/

# install conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p conda-install
source conda-install/etc/profile.d/conda.sh 
conda install mamba -c conda-forge --yes

# install snakemake
mamba create -c bioconda -c conda-forge -n snakemake snakemake-minimal --yes
conda activate snakemake

# run the workflow
git clone https://github.com/c-scale-community/c-scale-tutorial-snakemake.git
cd c-scale-tutorial-snakemake/
snakemake -c1 plot_data --use-conda --conda-frontend mamba
```
