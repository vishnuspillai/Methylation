#!/usr/bin/env Rscript

# ===============================================================
# Title: Quantile Normalization for EPIC Methylation Dataa
# Author: Vishnu S. Pillai
# Description: This script reads IDATs and sample sheet,
# performs quantile normalization using preprocessQuantile(),
# and saves M-values + PCA plot.
# ===============================================================

# --- Load required packages ---
suppressMessages({
  library(minfi)
  library(IlluminaHumanMethylationEPICmanifest)
  library(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)
})

# --- Set paths ---
input_dir <- "../data"
output_dir <- "../results"
plot_dir <- "../figures"

# --- Read sample sheet ---
cat("Reading sample sheet...\n")
targets <- read.metharray.sheet(input_dir, pattern = "csv$")
RGset <- read.metharray.exp(targets = targets)

# --- Quantile normalization ---
cat("Performing quantile normalization...\n")
Mset.quantile <- preprocessQuantile(RGset)

# --- Extract M-values ---
Mvals <- getM(Mset.quantile)

# --- Save M-values ---
cat("Saving M-values...\n")
saveRDS(Mvals, file = file.path(output_dir, "Mvals_quantile.rds"))

# --- PCA plot ---
cat("Creating PCA plot...\n")
pca <- prcomp(t(Mvals), scale. = TRUE)
png(file = file.path(plot_dir, "PCA_Quantile_Mvals.png"))
plot(pca$x[,1:2], col = "forestgreen", pch = 16, main = "PCA: Quantile M-values")
dev.off()

cat("✅ Done: preprocess_quantile.R complete\n")
