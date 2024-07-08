# Delamotte-et-al.-2024
Metabolic-based Polyclonality in a Drosophila Intestinal Tumor Model

#Single-cell RNAseq data#

- "scRNAseq Notebook for resource.Rmd" gathers all the R sessions written to analyze the sequenced tumors. The code has been uploaded the same way it was used on the machine that processed the samples (working directories will have to be changed and packages may slightly differ);

- "mitogenes.csv" corresponds to the mitochondrial genes ID used for quality control as these are not implemented for Drosophila in standard Seurat procedures;

- "pool gene list.csv" corresponds to the list of all cluster marker genes found differentially expressed in the pool of tumors (once all individual tumor samples have been merged);

- "KEGG.csv" and "METAB.csv" correspond to KEGG pathway gene lists (https://www.genome.jp/kegg/brite.html) and Flybase metabolic gene lists (http://flybase.org/) used for reference;

- "ULTIMATE.csv" is the shortest metabolic gene list that was selected according to our observations on "METAB.csv" and "pool gene list.csv";

- "GO BP pool.csv", "GO CC pool.csv" and "GO MF pool.csv" are the details of the biological process, cellular component, and molecular function analysis performed on the pool of tumors.

#Metabolic sensors#

- "LIF_toTIF_v4.ijm" is the fiji macro used to batch convert .lif files generated by the microscope software to .tif files that is used by the following macros;

- "Macro to get quotients FRET semi automated.ijm" was used to process large series of sensors;

- "FRET macro_for_vn_V2.ijm" is the macro used for all FRET-based sensors (e.g. P-Glucose, Pyronic, Laconic, CIT8);

- "Glutathion macor_for_vn_V2.ijm" is the macro used for redox sensors (e.g. Cyto- and Mito-glutathione sensors);

- "pHluorinSE macro_for_vn_V2.ijm" is the macro used for the pH sensor (e.g. pHluorinSE).

Note: to improve the image quality, the pictures presented in the article were processed manually, and brightness and contrast were enhanced if necessary.
