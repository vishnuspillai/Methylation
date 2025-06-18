#!/usr/bin/env Rscript

# ===============================================================
# Title: Funnorm Preprocessing for Illumina EPIC Methylation Data
# Author: Vishnu S. Pillai
# Description: This script reads IDAT files and sample sheet,
# performs functional normalization using minfi::preprocessFunnorm,
# and saves M-values to results/.
# ===============================================================

# --- Load required packages ---
suppressMessages({
  library(minfi)
  library(IlluminaHumanMethylationEPICmanifest)
  library(IlluminaHumanMethylationEPICanno.ilm10b4.hg38)
})

# --- Set directories (relative paths) ---
input_dir <- "C:/Users/Vishnu S Pillai/Documents/GitHub/Methylation/data"
output_dir <- "C:/Users/Vishnu S Pillai/Documents/GitHub/Methylation/data/results"
plot_dir <- "C:/Users/Vishnu S Pillai/Documents/GitHub/Methylation/data/figures"

# --- Read Sample Sheet ---
cat("Reading sample sheet...\n")
targets <- read.metharray.sheet(input_dir, pattern = "csv$")

# --- Load raw data from IDATs ---
cat("Loading raw IDAT data...\n")
RGset <- read.metharray.exp(targets = targets)

# --- Perform Functional Normalization ---
cat("Performing functional normalization...\n")
Mset.funnorm <- preprocessFunnorm(RGset)

# --- Extract M-values ---
Mvals <- getM(Mset.funnorm)

# --- Save M-values to RDS file ---
cat("Saving normalized M-values...\n")
saveRDS(Mvals, file = file.path(output_dir, "Mvals_funnorm.rds"))

# --- Optional: PCA plot (M-values) ---
cat("Generating PCA plot...\n")
pca <- prcomp(t(Mvals), scale. = TRUE)
png(file = file.path(plot_dir, "PCA_Funnorm_Mvals.png"))
plot(pca$x[,1:2], col = "blue", pch = 16, main = "PCA: Funnorm M-values")
dev.off()

cat("✅ Done: preprocess_funnorm.R complete\n")
