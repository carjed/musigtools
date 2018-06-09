library("musigtools")

data("subtype_count_matrix")

msm_deconstructSigs <- format_counts(subtype_count_matrix, "deconstructSigs")
msm_SomaticSignatures <- format_counts(subtype_count_matrix, "SomaticSignatures")
msm_signeR <- format_counts(subtype_count_matrix, "signeR")
msm_maftools <- format_counts(subtype_count_matrix, "maftools")
msm_MutationalPatterns <- format_counts(subtype_count_matrix, "MutationalPatterns")
