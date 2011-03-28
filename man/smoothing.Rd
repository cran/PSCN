\name{smoothing}
\alias{smoothing}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimating Parent-Specific DNA Copy Number 
}
\description{
This function uses Bounded Complexity MIXture (BCMIX) algorithm to estimate parent-specify copy numbers.
}
\usage{
smoothing(samplename, inputdata, platform = "Unknown", genotype.freq = NULL, sm.plot = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{samplename}{A name for a sample, from which the data is produced, such as patient ID}
  \item{inputdata}{A file with four columns four columns "SNP Position (bp)", "Chromosome ID","logR" and "Bfrequency" with column names "Position", "Chr", "logR" and "bfreq"}
  \item{platform}{Specifies where is data is from, eg. Illumina or Affymetrix.  Its default value is "Unknown".}
  \item{genotype.freq}{The default value is "NULL", which assigns 1/4 to AA, AB, BA and BB as their prior probability.  Otherwise, construct a matrix with four columns representing the prior probability of AA, AB, BA and BB, and each row corresponding to each SNP.  This provides a way to specify copy number probes, i.e., assign 1 to AA and others 0 since their B-allele frequencies are 0. }
  \item{sm.plot}{If TRUE, then the interim results will be plotted.  Its default value is "FALSE". }
  \item{...}{Additional arguments to be passed to the low level regression fitting functions.}
}
\details{
This function typically takes 2-3 minutes for one Chromosome.
}
\value{
It outputs files with name: samplename.Chr1.Smooth.Rdata.
}
\references{
Chen, H., Xing, H. and Zhang, N.R. (2011) Estimation of parent specific DNA copy number
in tumors using high-density genotyping arrays.  PLoS Comput Biol 7(1). 

Online access: http://www.ploscompbiol.org/article/info\%3Adoi\%2F10.1371\%2Fjournal.pcbi.1001060
}
\author{
Hao Chen, Haipeng Xing, and Nancy R. Zhang

Maintainer:  Hao Chen (haochen@stanford.edu)
}
%\note{
%%%  ~~further notes~~
%}
%
%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
This function follows with \code{\link{segmentation}} and \code{\link{pscnlist}}. 
\code{\link{pscn.plot}} is the plot function to view a variety of results.  
}
\examples{
  data(Illu0332chr3) # This dataset has four columns "SNP Position (bp)", "Chromosome ID","logR" and "Bfrequency" with column names "Position", "Chr", "logR" and "bfreq".
#  smoothing(samplename="TCGA.02.0332", inputdata=Illu0332chr3, platform="Illumina")  # uncomment to run, same below.
#  data(Illu0258chr2)
#  smoothing(samplename="TCGA.02.0258", inputdata=Illu0258chr2, platform="Illumina")
#  data(Affy1027chr)
#  smoothing(samplename="TCGA.23.1027", inputdata=Affy1027chr2, platform="Affymetrix")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
