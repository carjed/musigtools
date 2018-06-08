#' Coerce mutation spectra matrix output from Helmsman into formats 
#' compatible with existing mutation signature analysis packages
#' 
#' @param M Nx96 mutation count matrix output from Helmsman. Each row is a sample
#'   ID, and each column is a trinucleotide mutation subtype. Each entry is the 
#'   count of how many times a mutation with that trinucleotide context is seen 
#'   in the sample.
#' @param package Name of mutation signature analysis package
#' @return A Nx96 data frame with column and row names formatted according 
#'   to the specifications used
#'   Note that the SomaticSignatures packages uses a transposed mutation spectra 
#'   matrix, with subtypes as row names and sample IDs as column names
#' @examples
#' \dontrun{
#' mu_counts <- read.table("/path/to/subtype_count_matrix.txt", header=T, stringsAsFactors=F)
#' msm_deconstructSigs <- format_counts(mu_counts, "deconstructSigs")
#' msm_SomaticSignatures <- format_counts(mu_counts, "SomaticSignatures")
#' msm_signeR <- format_counts(mu_counts, "signeR")
#'}
#' @export
format_counts <- function(M, package){
  subtypes_in <- colnames(M)[-1]
  
  if(package == "deconstructSigs"){
    outdat <- M[,-1]
    colnames(outdat) <- hcols_to_ds_cols(subtypes_in)
    rownames(outdat) <- M[,1]
    
  } else if(package == "SomaticSignatures"){
    outdat <- as.data.frame(t(mu_counts[,-1]))
    colnames(outdat) <- M$ID
    rownames(outdat) <- hcols_to_ss_rows(subtypes_in)
    
  } else if (package == "signeR"){
    outdat <- M[,-1]
    colnames(outdat) <- hcols_to_signer_cols(subtypes_in)
    rownames(outdat) <- M[,1]
  }
  
  return(outdat)
}

# mu_counts <- read.table("/mnt/norbert/home/jedidiah/projects/doomsayer/demo/1kg_new_subtypes/subtype_count_matrix.txt", header=T, stringsAsFactors=F)

# dsdat <- format_counts(mu_counts, "deconstructSigs")
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
# sigs.input
# 
# # signer
# mut <- read.table(system.file("extdata","21_breast_cancers.mutations.txt",
#                               package="signeR"), header=TRUE, check.names=FALSE)