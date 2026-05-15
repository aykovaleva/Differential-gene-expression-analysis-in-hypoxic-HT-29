# -*- coding: utf-8 -*-
library(DESeq2)
library(apeglm)
setwd("~/Documents/hse/praktika_2022")

counts <- read.table("counts.tsv", sep = "\t", header = TRUE, row.names = 1, check.names = FALSE)
groups <- read.table("ht29_hypoxie_annotation.tsv", sep = "\t", header = TRUE)
expr_group <- "Hypoxie"  #cancer
ctrl_group <- "Normal"

groups$Group <- relevel(factor(groups$Group), ref = ctrl_group)
rownames(groups) <- groups$Sample
groups$Sample <- NULL

dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = groups,
                              design = ~ Group)

dds <- DESeq(dds)
res <- lfcShrink(dds, coef = paste("Group_", expr_group, "_vs_", ctrl_group, sep=""), type = "apeglm")
#res <- res[order(abs(res$log2FoldChange)),] # dont use it, do it in another python script
res <- res[order(res$padj),]

write.table(res, file = "results.tsv", sep = "\t", quote = FALSE)
