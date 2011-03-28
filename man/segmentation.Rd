\name{segmentation}
\alias{segmentation}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Segmentation
}
\description{
This function determines change points after the smoothing function.
}
\usage{
segmentation(samplename, chrs = 1:23, gender = NULL, MIN.SNPS = 20, regroup.percent = 0.05, combine.alpha = 0.01, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
 \item{samplename}{A name for a sample, from which the data is produced, such as patient ID}
  \item{chrs}{The chromosomes of the sample to be segmented.  Its default value is 1:23.}
  \item{gender}{The function "Segmentation" will determine the gender of the person, from which the sample is obtained, when 23 is included in the "chrs" no match what input of "gender" is.  However, if 23 is not included in the chrs, the gender of the person will be taken as its input. Its default value is NULL.}
  \item{MIN.SNPS}{specifies the minimum number of SNPs required to be a segment. Its default value is 20.}
%  \item{MIN.HET.SNPS}{specifies the minimum number of heterozyous SNPs in a segment.  Its default value is 5.} 
  \item{regroup.percent}{When regrouping using Bfrequency, if the obtained percent of heterozyous SNPs is less than the regroup.percent, some current homozyous SNPs will be classified as heterozyous. Its default value is 0.05.}
  \item{combine.alpha}{the significance level of hypotheses tesing for combining adjacent segments.  Its default value is 0.01.}
  \item{...}{Additional arguments to be passed to the low level regression fitting functions}
}
\details{
After this function, change points are estimated.
}
\value{
It output files with names: samplename.Chr1.Segment.Rdata, samplename.Chr1.pscn.Rdata.
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
\link{smoothing}, \link{pscnlist}, \link{pscn.plot}.  
}
\examples{
##  This function uses result from the function \link{smoothing}.
#  segmentation(samplename="TCGA.02.0332",  chrs=3, MIN.SNPS=50) # uncomment to run, same below 
#  segmentation(samplename="TCGA.02.0258", chrs=2, MIN.SNPS=50)
#  segmentation(samplename="TCGA.23.1027", chrs=2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
