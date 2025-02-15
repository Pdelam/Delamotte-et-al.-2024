# Comparing samples
# Here, the objective is to compare samples to visualize any variability

#Loading gene lists
METAB <- read.csv2("User's directory\\METAB.csv", header=T, sep=";", dec=".")
KEGG <- read.csv2("User's directory\\KEGG.csv", header=T, sep=";", dec=".")
FACS <- read.csv2("User's directory\\FACS.csv", header=T, sep=";", dec=".")
ULTIMATE <- read.csv2("User's directory\\ULTIMATE.csv", header=T, sep=";", dec=".")

# Loading samples
T1.data <- Read10X("C:\\Users\\Pierre\\Documents\\Doctorat 2020-2024\\Tumeurs\\scRNAseq\\23-D0337A Final experiment\\counts\\T1test\\filtered_feature_bc_matrix\\")
T1 <- CreateSeuratObject(counts=T1.data, project="T1test")

T2.data <- Read10X("C:\\Users\\Pierre\\Documents\\Doctorat 2020-2024\\Tumeurs\\scRNAseq\\23-D0337A Final experiment\\counts\\T2test\\filtered_feature_bc_matrix\\")
T2 <- CreateSeuratObject(counts=T2.data, project="T2test")

J74.data <- Read10X("C:\\Users\\Pierre\\Documents\\Doctorat 2020-2024\\Tumeurs\\scRNAseq\\23-D0337A Final experiment\\counts\\JAMO74\\filtered_feature_bc_matrix\\")
J74 <- CreateSeuratObject(counts=J74.data, project="JAMO74")

J75.data <- Read10X("C:\\Users\\Pierre\\Documents\\Doctorat 2020-2024\\Tumeurs\\scRNAseq\\23-D0337A Final experiment\\counts\\JAMO75\\filtered_feature_bc_matrix\\")
J75 <- CreateSeuratObject(counts=J75.data, project="JAMO75")

J78.data <- Read10X("C:\\Users\\Pierre\\Documents\\Doctorat 2020-2024\\Tumeurs\\scRNAseq\\23-D0337A Final experiment\\counts\\JAMO78\\filtered_feature_bc_matrix\\")
J78 <- CreateSeuratObject(counts=J78.data, project="JAMO78")

J80.data <- Read10X("C:\\Users\\Pierre\\Documents\\Doctorat 2020-2024\\Tumeurs\\scRNAseq\\23-D0337A Final experiment\\counts\\JAMO80\\filtered_feature_bc_matrix\\")
J80 <- CreateSeuratObject(counts=J80.data, project="JAMO80")

J81.data <- Read10X("C:\\Users\\Pierre\\Documents\\Doctorat 2020-2024\\Tumeurs\\scRNAseq\\23-D0337A Final experiment\\counts\\JAMO81\\filtered_feature_bc_matrix\\")
J81 <- CreateSeuratObject(counts=J81.data, project="JAMO81")

# Quality control samples
mito_limit <- 15
mito_genes <- c("FBgn0013686", "FBgn0013679", "FBgn0013680", "FBgn0013681", "FBgn0262952", "FBgn0013683", "FBgn0013684","FBgn0013685", "FBgn0013688", "FBgn0013689", "FBgn0013704", "FBgn0013701", "FBgn0013691","FBgn0013690", "FBgn0013703", "FBgn0013692", "FBgn0013694", "FBgn0013695", "FBgn0013696", "FBgn0013699","FBgn0013698", "FBgn0013697", "FBgn0013700", "FBgn0013693", "FBgn0013702", "FBgn0013705", "FBgn0013706","FBgn0013707", "FBgn0013709", "FBgn0013710", "FBgn0013708")

T1[["percent.mt"]] <- PercentageFeatureSet(object = T1, features = mito_genes)
T2[["percent.mt"]] <- PercentageFeatureSet(object = T2, features = mito_genes)
J74[["percent.mt"]] <- PercentageFeatureSet(object = J74, features = mito_genes)
J75[["percent.mt"]] <- PercentageFeatureSet(object = J75, features = mito_genes)
J78[["percent.mt"]] <- PercentageFeatureSet(object = J78, features = mito_genes)
J80[["percent.mt"]] <- PercentageFeatureSet(object = J80, features = mito_genes)
J81[["percent.mt"]] <- PercentageFeatureSet(object = J81, features = mito_genes)

# T1 quality control
VlnPlot(T1, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
plot1 <- FeatureScatter(T1, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(T1, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
plot1 + plot2
T1 <- subset(T1, subset = nFeature_RNA > 100 & nFeature_RNA < 2000 & percent.mt < mito_limit)
# T2 quality control
VlnPlot(T2, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
plot1 <- FeatureScatter(T2, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(T2, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
plot1 + plot2
T2 <- subset(T2, subset = nFeature_RNA > 100 & nFeature_RNA < 2000 & percent.mt < mito_limit)
# JAMO74 quality control
VlnPlot(J74, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
plot1 <- FeatureScatter(J74, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(J74, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
plot1 + plot2
J74 <- subset(J74, subset = nFeature_RNA > 100 & nFeature_RNA < 2000 & percent.mt < mito_limit)
# JAMO75 quality control
VlnPlot(J75, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
plot1 <- FeatureScatter(J75, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(J75, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
plot1 + plot2
J75 <- subset(J75, subset = nFeature_RNA > 100 & nFeature_RNA < 2000 & percent.mt < mito_limit)
# JAMO78 quality control
VlnPlot(J78, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
plot1 <- FeatureScatter(J78, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(J78, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
plot1 + plot2
J78 <- subset(J78, subset = nFeature_RNA > 100 & nFeature_RNA < 2000 & percent.mt < mito_limit)
# JAMO80 quality control
VlnPlot(J80, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
plot1 <- FeatureScatter(J80, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(J80, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
plot1 + plot2
J80 <- subset(J80, subset = nFeature_RNA > 100 & nFeature_RNA < 2000 & percent.mt < mito_limit)
# JAMO81 quality control
VlnPlot(J81, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
plot1 <- FeatureScatter(J81, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 <- FeatureScatter(J81, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
plot1 + plot2
J81 <- subset(J81, subset = nFeature_RNA > 100 & nFeature_RNA < 2000 & percent.mt < mito_limit)

# Comparing datasets
# Control
single_tumor <- list()
single_tumor[["T1test"]] <- T1
single_tumor[["T2test"]] <- T2
single_tumor[["JAMO74"]] <- J74
single_tumor[["JAMO75"]] <- J75
single_tumor[["JAMO78"]] <- J78
single_tumor[["JAMO80"]] <- J80
single_tumor[["JAMO81"]] <- J81

for (i in 1:length(single_tumor)) {
  single_tumor[[i]] <- NormalizeData(single_tumor[[i]], verbose = F)
  single_tumor[[i]] <- FindVariableFeatures(single_tumor[[i]], selection.method = "vst", nfeatures = 2000, verbose = F)
}

tumor_anchors <- FindIntegrationAnchors(object.list = single_tumor, dims = 1:30)

tumor_seurat <- IntegrateData(anchorset = tumor_anchors, dims = 1:30)

rm(single_tumor)
rm(tumor_anchors)

# Before integration Control
DefaultAssay(tumor_seurat) <- "RNA"
tumor_seurat <- NormalizeData(tumor_seurat, verbose = F)
tumor_seurat <- FindVariableFeatures(tumor_seurat, selection.method = "vst", nfeatures = 2000, verbose = F)
tumor_seurat <- ScaleData(tumor_seurat, verbose = F)
tumor_seurat <- RunPCA(tumor_seurat, npcs = 30, verbose = F)
tumor_seurat <- RunUMAP(tumor_seurat, reduction = "pca", dims = 1:30, verbose = F)
DimPlot(tumor_seurat,reduction = "umap")

#After integration Control
DefaultAssay(tumor_seurat) <- "integrated"
tumor_seurat <- ScaleData(tumor_seurat, verbose = F)
tumor_seurat <- RunPCA(tumor_seurat, npcs = 30, verbose = F)
tumor_seurat <- RunUMAP(tumor_seurat, reduction = "pca", dims = 1:30, verbose = F)

DimPlot(tumor_seurat,reduction = "umap")
DimPlot(tumor_seurat,reduction = "umap", split.by = "orig.ident")

##Adding integrated matrix Control
tumor_seurat <- FindNeighbors(tumor_seurat, dims = 1:30, k.param = 10, verbose = F)
tumor_seurat <- FindClusters(tumor_seurat, verbose = F)
DimPlot(tumor_seurat,label = T) + NoLegend()

## Cluster counts Control
count_table <- table(tumor_seurat@meta.data$seurat_clusters, tumor_seurat@meta.data$orig.ident)
count_table
pool.markers <- FindAllMarkers(tumor_seurat, only.pos = TRUE, min.pct = 0.25, logfc.threshold = 0.25)
pool.markers %>%
  group_by(cluster) %>%
  slice_max(n = 2, order_by = avg_log2FC)

DoHeatmap(tumor_seurat, features = as.character(unique(FACS$FBgn)), assay = "RNA")
DoHeatmap(tumor_seurat, features = as.character(unique(grpA)), assay = "RNA")

#Groups of genes from Fig2
grpA <- c("FBgn0003071","FBgn0267385","FBgn0038952","FBgn0038258","FBgn0031462","FBgn0022160","FBgn0283450","FBgn0001258","FBgn0266064")
grpB <- c("FBgn0017558","FBgn0028325","FBgn0261955","FBgn0037988","FBgn0010100","FBgn0001248","FBgn0010352","FBgn0261439","FBgn0262559","FBgn0262782","FBgn0011211","FBgn0031830","FBgn0021906")
grpC <- c("FBgn0001098","FBgn0030478","FBgn0036927","FBgn0001124","FBgn0001125","FBgn0027580","FBgn0003067","FBgn0034356","FBgn0032820","FBgn0031463")
grpD <- c("FBgn0020236","FBgn0033246","FBgn0283427","FBgn0029975","FBgn0027579","FBgn0034971","FBgn0036622","FBgn0263593","FBgn0033216","FBgn0020930","FBgn0030731")
grpE <- c("FBgn0004057","FBgn0004654","FBgn0030239","FBgn0002719","FBgn0010222","FBgn0036157","FBgn0020385")
grpF <- c("FBgn0004914","FBgn0261283","FBgn0032940","FBgn0039509","FBgn0014135")

#Selected genes
definitive_list <- c("FBgn0267385","FBgn0001258","FBgn0038952","FBgn0011211","FBgn0031830","FBgn0001098","FBgn0033246","FBgn0283427","FBgn0034356")
labels_01 <- c("PyK CG7070", "LDH CG10160", "PyK CG7069", "blw CG3612", "COX5B CG11015", "GDH CG5320", "ACC CG11198", "FASN1 CG3523", "PEPCK2 CG10924")

plot <- DotPlot(tumor_seurat, definitive_list, assay ="RNA")
plot <- plot + theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))
plot <- plot + scale_colour_gradient2(low = "#EF2F30", mid = "#E0E3E8", high = "#399EC5")
plot <- plot + scale_x_discrete(breaks=definitive_list,
                                labels=labels_01)
#plot <- plot + coord_flip()
plot <- plot + scale_size_continuous(limits = c(0, 100), range = c(1, 8))
