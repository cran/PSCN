\name{pscnlist}
\alias{pscnlist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generate Lists Showing Parent Specific DNA Copy Numbers
}
\description{
This function generates lists showing parent specific DNA copy numbers for each sample.
}
\usage{
pscnlist(samplename, chrs = 1:23, MIN.SNPS = 20, alpha = 0.01, FWalpha = 0.01, threshold = 0.18, hard.threshold = 0.125, GLBalance = TRUE, ratio0 = 0.8, cutdev = 0.4, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{samplename}{A name for a sample, from which the data is produced, such as patient ID}
  \item{chrs}{The chromosomes of the sample to be put in the lists.  Its default value is 1:23.}
  \item{MIN.SNPS}{specifies the minimum number of SNPs required to be a segment. Its default value is 20.}
  \item{alpha}{significance level for each segment needed for being considered having copy number variant at the initial round.}
  \item{FWalpha}{ significance level for the family of segments needed for being considered having copy number variant at the second round.}
  \item{threshold}{In a segment, if copy numbers for both chromosomes are considered to be changed (hypothesis tests significant), then the one having copy number closer to the normal copy number will be tested to see if it differs from the normal copy number as large as this threshold; if not, treat it as normal.}
  \item{hard.threshold}{In a segment, if copy numbers for both chromosomes are considered to be changed (hypothesis tests significant).  Then, both will be tested to see if they differ from the normal copy number as large as this threshold; if both not, consider both to be normal.  This threshold should be smaller than the "threshold" above}
  \item{GLBalance}{If this argument is true.  Those segments undergo Gain in one chromosome and Loss in the other will be tested to see if it is a balanced Gain/Loss.}
  \item{ratio0}{This argument is only used when GLBalance is TRUE. } %For each Gain/Loss segment, the ratio (major copy number - normal copy number)/(normal copy number - minor copy number) needs to between ratio0 and 1/ratio0 to be considered balanced.}
  \item{cutdev}{This argument is only used when GLBalance is TRUE.}
  \item{...}{Additional arguments to be passed to the low level regression fitting functions}

}
\details{
In this step, the segments with no change are first determined using a modified BIC criterion, then the normal mean and variance.  For other segments, a mixed Gaussian model is used to estimate the mean and variance of the two component Gaussian densities.  They are compared with the normal mean and variance to determine whether its copy number changes.
}
\value{
The output files are of names: samplename.longlist.txt, samplename.shortlist.txt, samplename.shortlist2.txt.  The samplename.shortlist2.txt is output only when the argument GLBalance is TRUE.  The difference between the samplename.longlist.txt and samplename.shortlist.txt is that in the shortlist, the consective segments with the same type of change status, such as both are Gain/Loss, are combined.
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
\link{smoothing}, \link{segmentation}, \link{pscn.plot}.  
}
\examples{
## follows the result of \link{segmentation}.  this function can only be run after the function \link{segmentation}.
#  pscnlist(samplename="TCGA.02.0332", chrs=3, MIN.SNPS=50) # uncomment to run, same below
#  pscnlist(samplename="TCGA.02.0258", chrs=2, MIN.SNPS=50)
#  pscnlist(samplename="TCGA.23.1027", chrs=2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
