#! /bin/bash
set -euo pipefail

# render-live.sh renders and/or converts to "live" a set of .Rmd notebooks by 
# calling `make-live.R` for each notebook in turn.
# Rendering is done by default, but can be skipped  by setting the RENDER_RMD to FALSE:
# For example: RENDER_RMD=FALSE bash render-live.sh

# Set the working directory to the directory of this file
cd "$(dirname "${BASH_SOURCE[0]}")"
# move back up to the training modules root
cd ..

# We will render if the $RENDER_RMD environment variable is TRUE (or set it)
render="${RENDER_RMD:-TRUE}"

# array of files to transform
files=(
  intro-to-R-tidyverse/01-intro_to_base_R.Rmd
  intro-to-R-tidyverse/02-intro_to_ggplot2.Rmd
  intro-to-R-tidyverse/03-intro_to_tidyverse.Rmd
  RNA-seq/02-gastric_cancer_tximeta.Rmd
  RNA-seq/03-gastric_cancer_exploratory.Rmd
  RNA-seq/05-nb_cell_line_DESeq2.Rmd
  scRNA-seq/01-filtering_scRNA-seq.Rmd
  scRNA-seq/02-normalizing_scRNA-seq.Rmd
  scRNA-seq/04-tag-based_scRNA-seq_processing.Rmd
  scRNA-seq/05-dimension_reduction_scRNA-seq.Rmd
  machine-learning/01-openpbta_heatmap.Rmd
  machine-learning/02-openpbta_consensus_clustering.Rmd
  #  machine-learning/03-openpbta_PLIER.Rmd
  #  machine-learning/04-openpbta_plot_LV.Rmd
  pathway-analysis/01-overrepresentation_analysis.Rmd
  pathway-analysis/02-gene_set_enrichment_analysis.Rmd
  pathway-analysis/03-gene_set_variation_analysis.Rmd
)
for file in ${files[@]}
do
  Rscript --vanilla scripts/make-live.R --notebook ${file} --render ${render}
done
