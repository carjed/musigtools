#' Convert Helmsan subtype format to bracket subtype format
#' 
#' Used in deconstructSigs, maftools, and MutationalPatterns
#' 
#' @param subtypes A 96-element vector of mutation subtypes formatted as "C_A.TCG"
#' @return A 96-element vector of mutation subtypes formatted as "T[C>A]G"
#' @examples
#' \dontrun{
#' mu_counts <- read.table("/path/to/subtype_count_matrix.txt", header=T, stringsAsFactors=F)
#' subtypes_in <- colnames(mu_counts)[-1]
#' deconstructSigs_cols <- hcols_to_bracket_fmt(subtypes_in)
#'}
#' @export
hcols_to_bracket_fmt <- function(subtypes){
  subtypes_arrow <- gsub("_", ">", subtypes)
  subtypes_split <- strsplit(subtypes_arrow, "[.]")
  subtypes_split_bracket <- lapply(subtypes_split, function(x) c(paste0("[", x[1], "]"), x[2]))
  subtypes_out <- sapply(subtypes_split_bracket, function(x) paste0(substr(x[2], 1, 1), x[1], substr(x[2], 3, 3)))
  return(subtypes_out)
}

#' Convert Helmsan subtype format to signeR subtype format
#' 
#' @param subtypes A 96-element vector of mutation subtypes formatted as "C_A.TCG"
#' @return A 96-element vector of mutation subtypes formatted as "C>A:TCG"
#' @examples
#' \dontrun{
#' mu_counts <- read.table("/path/to/subtype_count_matrix.txt", header=T, stringsAsFactors=F)
#' subtypes_in <- colnames(mu_counts)[-1]
#' signeR_cols <- hcols_to_signer_fmt(subtypes_in)
#'}
#' @export
hcols_to_signer_fmt <- function(subtypes){
  subtypes_arrow <- gsub("_", ">", subtypes)
  subtypes_out <- gsub("[.]", ":", subtypes_arrow)
  return(subtypes_out)
}

#' Convert Helmsan subtype format to SomaticSignatures subtype format
#' 
#' @param subtypes A 96-element vector of mutation subtypes formatted as "C_A.TCG"
#' @return A 96-element vector of mutation subtypes formatted as "CA T.G"
#' @examples
#' \dontrun{
#' mu_counts <- read.table("/path/to/subtype_count_matrix.txt", header=T, stringsAsFactors=F)
#' subtypes_in <- colnames(mu_counts)[-1]
#' SomaticSigs_rows <- hcols_to_ss_fmt(subtypes_in)
#'}
#' @export
hcols_to_ss_fmt <- function(subtypes){
  subtypes_short <- gsub("_", "", subtypes)
  subtypes_space <- gsub("[.]", " ", subtypes_short)
  subtypes_out <- paste0(substr(subtypes_space, 1, 4), ".", substr(subtypes_space, 6, 6))
  return(subtypes_out)
}

#' Convert Helmsan subtype format to YAPSA subtype format
#' 
#' @param subtypes A 96-element vector of mutation subtypes formatted as "C_A.TCG"
#' @return A 96-element vector of mutation subtypes formatted as "C>A TCG"
#' @examples
#' \dontrun{
#' mu_counts <- read.table("/path/to/subtype_count_matrix.txt", header=T, stringsAsFactors=F)
#' subtypes_in <- colnames(mu_counts)[-1]
#' YAPSA_rows <- hcols_to_yapsa_fmt(subtypes_in)
#'}
#' @export
hcols_to_yapsa_fmt <- function(subtypes){
  subtypes_short <- gsub("_", ">", subtypes)
  subtypes_out <- gsub("[.]", " ", subtypes_short)
  return(subtypes_out)
}
