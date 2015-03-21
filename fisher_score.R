#generate random zsore for Drug, disease, control with each has 1000 features
cmap_data_mat = replicate(3, rnorm(1000))
rownames(cmap_data_mat) <- rownames(cmap_data_mat, do.NULL = FALSE, prefix = "tag")
colnames(cmap_data_mat) <- c("Drug","Disease","Control")
cmap

#convert to CMAPCollection
cmap <- CMAPCollection(cmap_data_mat)

#induce
cmap <- induceCMAPCollection(cmap, "members", lower=-1, higher=1)

#calculate fisher score and display the zscore
result.list <- fisher_score(cmap, cmap, universe = featureNames( cmap))
sapply(result.list, function(x){zscores( x )[sampleNames(cmap)]})

#calculate connectivity score
connectivity_score(cmap,cmap,"members")