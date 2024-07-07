# Delamotte-et-al.-2024
Metabolic-based Polyclonality in a Drosophila Intestinal Tumor Model

Single-cell RNAseq data

- "scRNAseq Notebook for resource.Rmd" gathers all the R sessions written to analyze the sequenced tumors. The code has been uploaded the same way it was used on the machine that processed the samples (working directories will have to be changed and packages may slightly differ);

- "mitogenes.csv" corresponds to the mitochondrial genes ID used for quality control as these are not implemented for Drosophila in standard Seurat procedures;

- "pool gene list.csv" corresponds to the list of all cluster marker genes found differentially expressed in the pool of tumors (once all individual tumor samples have been merged);

- "KEGG.csv" and "METAB.csv" correspond to KEGG pathway gene lists (https://www.genome.jp/kegg/brite.html) and Flybase metabolic gene lists (http://flybase.org/) used for reference;

- "ULTIMATE.csv" is the shortest metabolic gene list that was selected according to our observations on "METAB.csv" and "pool gene list.csv";

- "GO BP pool.csv", "GO CC pool.csv" and "GO MF pool.csv" are the details of the biological process, cellular component, and molecular function analysis performed on the pool of tumors.


