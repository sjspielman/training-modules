# Advanced Single Cell RNA-seq training data setup

This document describes how the training data is prepared for the advanced single cell RNA-seq training data on the RStudio Server.

As new training data is added, notebooks, scripts, and/or workflows should be added to this directory to describe the steps required to recreate the required training input files. 
These files should include source locations for downloading raw data as appropriate, and all processing steps required to prepare data for use.

## File locations

On the RStudio server the main location for the files needed for this training module will be `/shared/data/training-modules/scRNA-seq-advanced/data`.
The files are then organized by dataset.

After setup, the symlinks should be established from `/shared/data/training-modules/scRNA-seq-advanced/data` to `training-modules/scRNA-seq-advanced/data` as appropriate.
These links will usually be created using the script at `training-modules/scripts/link-data.sh`, so directories and files should be added to the `link_locs` array in that script.
If no data will be written to a data directory, linking to that directory will be sufficient, but in some cases links to individual files may be required.


## Data Sets

### Mitochondrial gene lists

An R notebook to create a table of human mitochondrial genes is found in the `mito_gene_lists.Rmd` notebook.
This can be opened and run to create the table, which will saved at `/shared/data/training-modules/scRNA-seq-advanced/data/reference`.

### Glioblastoma

This data comes from this 10x Genomics Dataset: https://www.10xgenomics.com/resources/datasets/2-k-sorted-cells-from-human-glioblastoma-multiforme-3-v-3-1-3-1-standard-6-0-0.

Quoting from the data page:

> Human Glioblastoma Multiforme cells from a male donor aged 71 were obtained by 10x Genomics from Discovery Life Sciences.

> Libraries were generated following the Chromium Next GEM Single Cell 3ʹ Reagent Kits v3.1 (Dual Index) User Guide (CG000315) and sequenced on Illumina NovaSeq 6000.


To download the files, change directories to the `setup/glioblastoma` directory and run:

```sh
snakemake -j2 
```

This will place the downloaded files in `/shared/data/training-modules/scRNA-seq-advanced/data/glioblastoma`


### PBMC TotalSeq-B

This data comes from this 10x Genomics Dataset: https://software.10xgenomics.com/single-cell-gene-expression/datasets/6.0.0/10k_PBMCs_TotalSeq_B_3p.

Quoting from the data page:

> Peripheral blood mononuclear cells (PBMCs) from a healthy donor were obtained by 10x Genomics from AllCells and were labelled with a panel of a panel of nine [TotalSeq™-B antibodies (BioLegend)](https://www.biolegend.com/en-us/products/totalseq-b-human-tbnk-cocktail-19043).

> Libraries were generated following the Chromium Next GEM Single Cell 3ʹ Reagent Kits v3.1 (Dual Index) with Feature Barcode technology for Cell Surface Protein and Cell Multiplexing User Guide (CG000390) and sequenced on Illumina NovaSeq 6000.

To download the files, change directories to the `setup/PBMC_TotalSeqB` directory and run:

```sh
snakemake -j2 
```

This will place the downloaded files in `/shared/data/training-modules/scRNA-seq-advanced/data/PBMC_TotalSeqB`