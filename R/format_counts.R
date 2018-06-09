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
    outdat <- as.data.frame(t(M[,-1]))
    colnames(outdat) <- M$ID
    rownames(outdat) <- hcols_to_ss_rows(subtypes_in)
    
  } else if (package == "signeR"){
    outdat <- M[,-1]
    colnames(outdat) <- hcols_to_signer_cols(subtypes_in)
    rownames(outdat) <- M[,1]
    
  } else if (package == "YAPSA"){
    outdat <- as.data.frame(t(M[,-1]))
    colnames(outdat) <- M$ID
    rownames(outdat) <- hcols_to_yapsa_rows(subtypes_in)
  }
  
  return(outdat)
}