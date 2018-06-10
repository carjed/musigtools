# musigtools

[![Build Status](https://travis-ci.org/carjed/musigtools.svg?branch=master)](https://travis-ci.org/carjed/musigtools)

An R package with functions for formatting mutation spectra matrices output by [Helmsman](https://github.com/carjed/helmsman) to be used in various other mutation signature analysis packages.

# Installation

The latest version of `musigtools` can be installed from this Github repository using `devtools`:

```r
library(devtools)
devtools::install_github("carjed/musigtools")
```

# Currently supported packages

`musigtools` can convert the 

- [deconstructSigs](https://cran.r-project.org/web/packages/deconstructSigs/index.html)
- [maftools](https://bioconductor.org/packages/release/bioc/html/maftools.html)
- [MutationalPatterns](http://bioconductor.org/packages/release/bioc/html/MutationalPatterns.html)
- [signeR](http://bioconductor.org/packages/release/bioc/html/signeR.html)
- [SomaticSignatures](http://bioconductor.org/packages/release/bioc/html/SomaticSignatures.html)
- [YAPSA](http://bioconductor.org/packages/release/bioc/html/YAPSA.html)
