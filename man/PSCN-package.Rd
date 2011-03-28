\name{PSCN-package}
\alias{PSCN-package}
\alias{PSCN}
\docType{package}
\title{
Parent Specific DNA Copy Number Estimation
}
\description{
This package estimate parent specific DNA copy number for human genomes using high-density SNP arrays data, that is, the data has two component, logR and B-allele frequency.
}
\details{
\tabular{ll}{
Package: \tab PSCN\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-03-10\cr
License: \tab GPL(>=2)\cr
LazyLoad: \tab yes\cr
}

The input data format for this package is a text file which has four columns "SNP Position (bp)", "Chromosome ID", "logR" and "Bfrequency", with column names "Position", "Chr", "logR" and "bfreq", respectively. 
Three functions are called to do the inference: \code{\link{smoothing}} to estimate parent-specific DNA copy number for each position by maximizing likelihood, \code{\link{segmentation}} to determine change points and \code{\link{pscnlist}} to get a table showing major and minor copy numbers. 
\code{\link{pscn.plot}} is the plot function to view a variety of results. 
}
\author{
Hao Chen, Haipeng Xing, and Nancy R. Zhang
Maintainer: Hao Chen (haochen@stanford.edu)
}
\references{
Chen, H., Xing, H. and Zhang, N.R. (2011) Estimation of parent specific DNA copy number
in tumors using high-density genotyping arrays.  PLoS Comput Biol 7(1). 

Online access: http://www.ploscompbiol.org/article/info\%3Adoi\%2F10.1371\%2Fjournal.pcbi.1001060
}

\keyword{
PSCN
Parent Specific Copy Number
Copy Number Variation
}
\seealso{
\code{\link{smoothing}}, \code{\link{segmentation}}, \code{\link{pscnlist}}, \code{\link{pscn.plot}}
}
\examples{
# smoothing (estimate parent-specify DNA copy numbers)
  data(Illu0332chr3_mini) # This dataset has four columns "SNP Position (bp)", "Chromosome ID","logR" and "Bfrequency" with column names "Position", "Chr", "logR" and "bfreq".
  smoothing(samplename="TCGA.02.0332", inputdata=Illu0332chr3_mini, platform="Illumina")

# segmentation (determine change points) this function can only be run after the function "smoothing".
  segmentation(samplename="TCGA.02.0332", chrs=3, MIN.SNPS=50) 

# pscnlist (get a table showing major and minor copy numbers) this function can only be run after the function "segmentation".
  pscnlist(samplename="TCGA.02.0332", chrs=3, MIN.SNPS=50)

# pscn.plot (more example at \code{\link{pscn.plot}}) 
  pscn.plot(samplename="TCGA.02.0332", chrid=3, which.plot="copy number")
  pscn.plot(samplename="TCGA.02.0332", chrid=3, which.plot="bfreq", changepoint=FALSE)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
