library('gCMAP')

file_drug = "D:\\1.gct";                                    ##Test purpose
file_disease = "D:\\1.gct";                                 ##Test purpose

table_drug = read.table(file_drug, header=T, quote="", sep = "\t", stringsAsFactors = F)
table_disease = read.table(file_disease, header=T, quote="", sep = "\t", stringsAsFactors = F)

disease_cmap = CMAPCollection(as.matrix(table_disease[,9])) ##Test purpose
drug_cmap = CMAPCollection(as.matrix(table_drug[,10:20]))   ##Test purpose

rownames(drug_cmap)=table_drug$pr_gene_symbol
rownames(disease_cmap)=table_disease$pr_gene_symbol

disease_cmap = induceCMAPCollection(disease_cmap, higher=1, lower=-1, element="members")
drug_cmap = induceCMAPCollection(drug_cmap, higher=1, lower=-1, element="members")
print(cmapTable(wilcox_score(disease_cmap, drug_cmap,element="members")))

