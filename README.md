# Differential-gene-expression-analysis-in-hypoxic-HT-29
Part of a practical course on RT-qPCR in my univeristy (Higher school of economics, Cell and Molecular Biotechnology) in 2022

Aim: to master the measurement of differential gene expression in mammalian cell lines
using real-time polymerase chain reaction (PCR).
Objectives of the practical:
1. Based on the results of processing and analysing microarray data, determine the levels
of gene expression in experimental and control cell lines.
2. Based on the data from point (1) and a review of the literature, select reference and target
genes for measuring expression levels using real-time PCR.
3. Furhter the chosen target genes' expression was tested in normal and hypoxic conditions with qPCR


Assessing the stability of reference genes is necessary to identify the most
‘average’ reference gene, which, on average, best
normalises the expression levels of the target genes.The method requires data on
the cycle threshold (Ct) value for RT-qPCR across several biological
replicates. I had data for 5 potential reference
genes: CDC42BPA, LBR, ROCK1, ACTB, GAPDH.

In the R script:
Loads RNA-seq count data, Separates samples into: hypoxia and normal.
Uses DESeq2 to identify genes that change expression. Calculates: fold changes and statistical significance.
Saves the ranked gene list.

In the jupyter noebook:
For each gene, I calculate the differences, row by row, between its Ct values and
the Ct values for each of the other genes. Thus, for each
gene, I obtain 6 differences (the number of rows) for each of the 4 genes being
compared.
Then, for each gene1-gene2 pair, I calculate the standard deviation
of the Ct difference values for that pair. Next, for each gene, I calculate the mean
of these standard deviations.
