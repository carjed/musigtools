library("musigtools")

data("subtype_count_matrix")

dsdat <- format_counts(subtype_count_matrix, "deconstructSigs")
# sum(colnames(dsdat) == colnames(sigs.input)) == 96
# 
# ssdat <- format_counts(mu_counts, "SomaticSignatures")
# sum(rownames(ssdat) == rownames(sca_mm)) == 96
# 
# signerdat <- format_counts(mu_counts, "signeR")
# sum(colnames(signerdat) == colnames(mut)) == 96
# # somaticsigs
# sca_mm
# 
# # deconstructsigs
# require(deconstructSigs)
# sigs.input <- mut.to.sigs.input(mut.ref = sample.mut.ref, 
#                                 sample.id = "Sample", 
#                                 chr = "chr", 
#                                 pos = "pos", 
#                                 ref = "ref", 
#                                 alt = "alt")
# sigs.input
# 
# # signer
# mut <- read.table(system.file("extdata","21_breast_cancers.mutations.txt",
#                               package="signeR"), header=TRUE, check.names=FALSE)