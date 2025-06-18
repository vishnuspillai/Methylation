# Methylation Analysis

This repository contains the full analysis pipeline used to process and analyze DNA methylation data from Illumina EPIC 900K arrays under hypoxic conditions. The project follows standard preprocessing and quality control workflows, with inspiration from the [NBIS Epigenomics Workshop](https://nbis-workshop-epigenomics.readthedocs.io/en/latest/content/tutorials.html).

---

## 📁 Project Structure

Methylation-Analysis/
├── data/ # Raw IDAT files (ignored in git)
├── scripts/ # All R scripts used in the workflow
├── results/ # Processed data outputs (excluded from git)
├── figures/ # Plots and visualizations
├── README.md # This file
└── .gitignore # Git ignore settings

---

## 🧬 Workflow Summary

- Import and preprocess IDATs
- Perform multiple normalization techniques:  
  `preprocessRaw`, `preprocessIllumina`, `preprocessSWAN`, `preprocessFunnorm`, `preprocessQuantile`
- Use M-values for PCA-based outlier detection
- Visualization and interpretation
- Comparison of `minfi`, `ChAMP`, and `SeSAMe` methods (planned)

---

## 📚 Tutorials & References

- [NBIS Methylation Tutorials](https://nbis-workshop-epigenomics.readthedocs.io/en/latest/content/tutorials.html)
- [minfi package (Bioconductor)](https://bioconductor.org/packages/release/bioc/html/minfi.html)
- [Illumina HumanMethylationEPIC array](https://www.illumina.com/products/by-type/microarray-kits/infinium-methylation-epic.html)

---

## 📦 Software Requirements

- R version ≥ 4.2
- R packages: `minfi`, `limma`, `sva`, `ggplot2`, `ChAMP`, `SeSAMe`

---

## 📄 Citation

If you use this workflow in your research or adapt parts of the code, please cite:[Vishnu S Pillai], (2025). Methylation Analysis (v1.0) [GitHub repository]. https://github.com/vishnuspillai/Methylation-Analysis

---

## 👤 Author

**Vishnu S. Pillai**  
Biotechnologist | Bioinformatics & NGS | R and Python beginner  
Working on integrative methylation analysis  
Email: [vishnuspillaires@gmail.com]  

