Simu_Geno_Pipeline
=======
This repo outlines a pipeline to generate large-scale, multi-ancestry genotype data using HapGen2 (Zhan et al., 2011, Bioinformatics) and the 1000 Genomes Project Phase 3 reference dataset. The reference includes data from 5 ancestral populations: African (AFR), American/Latino (AMR), East Asian (EAS), European (EUR), South Asian (SAS).

Usage
=======
[The vignette](https://andrewhaoyu.github.io/Simu_Geno_Pipeline/) will provide a good start point for using implementing pipeline.

Data Preparasion
======
[HapGen2](https://mathgen.stats.ox.ac.uk/genetics_software/hapgen/hapgen2.html) requires specific information from the reference population: 1) Legend files, which include SNP ID, position, A0 (non-coding allele), A1 (coding allele), SNP type (e.g. Biallelic SNP), and allele frequencies. 2) A haplotype file, where each row represents a SNP and every two columns represent an individual, with 0 0 representing A0 A0, 1 0 representing A1 A0, and 1 1 representing A1 A1. 3) Map files, which have the SNP position, combined rate (cM/Mb), and genetic map (cM). The 1000 Genomes reference data was separated by ancestry, with the legend and map files remaining the same. Mono-morphic SNPs in a population result in all 0s in the haplotype data row. The cleaned data, including legend files, haplotype files for each ancestry, and map files, can be found on Harvard Dataverse: https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/DZAYXC.
