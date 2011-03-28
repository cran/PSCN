\name{pscn.plot}
\alias{pscn.plot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plot Function for Visualizing PSCN results
}
\description{
This function provides a variety of plots showing results of a PSCN analysis after \code{\link{smoothing}}, \code{\link{segmentation}} and \code{\link{pscnlist}}.   
}
\usage{
pscn.plot(samplename, chrid, which.plot = "bfreq", region = FALSE, regionid = NULL, region.col = NULL, scatter = FALSE, Contour = FALSE, use.main = FALSE, cnlist = "shortlist", use.pos = FALSE, loc = NULL, changepoint = TRUE, col.gain = "red", col.loss = "blue", col.normal = "green", ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{samplename}{A name for a sample, from which the data is produced, such as patient ID}
  \item{chrid}{The chromosome of the sample to be ploted.}
  \item{which.plot}{can only be any of "bfreq" (plot B-allele freqency), "logR" (plot logR), "A" (plot allele A intensity), "B" (plot allele B intensity), "R" (plot the sum of allele A and B intensities), "copy number" (plot major and minor copy numbers). Its default value is "bfreq".}
  \item{region}{Applicable when which.plot is "bfreq", "logR", "A", "B" or "R". If TRUE, plot different segments with different colors; otherwise, plot the four states with different colors.  Its default value is FALSE.}
  \item{regionid}{Applicable when which.plot is "bfreq", "logR", "A", "B" or "R". Specifies the segments to be ploted.}
  \item{region.col}{Applicable when which.plot is "bfreq", "logR", "A", "B" or "R". Specifies the colors used for segments. }
  \item{scatter}{If TRUE, plots allele B intersity vs. allele A intensity.  Its default value is FALSE.}
  \item{Contour}{create contour plot for B vs A.  Its default value is FALSE.}
  \item{use.main}{If TRUE, main title will be generated.  Its default value is FALSE.}
  \item{cnlist}{Indicates which list generated from \link{pscnlist}.  Its default value is "shortlist", which can be changed to "longlist" or "shortlist2".}
  \item{use.pos}{If TRUE, the x axis will be position (Mb) rather than SNP index.  Its default value is FALSE.}
  \item{loc}{specifies the SNPs to be ploted, eg 2000:3000.   If NULL (default), all SNPs of the chromosome are plotted.}
  \item{changepoint}{Applicable when which.plot is "bfreq", "logR", "A", "B" or "R". If TRUE, changepoints will be indicated by black vertical lines. Its default value is FALSE.}
  \item{col.gain}{Applicable when which.plot is "copy number", to specifies the color for gain chromosome regions.  (Default=red)}
  \item{col.loss}{Applicable when which.plot is "copy number", to specifies the color for loss chromosoem regions.  (Default=blue)}
  \item{col.normal}{Applicable when which.plot is "copy number", to specifies the color for normal chromosome regions.  (Default=green)}
  \item{...}{Additional arguments to be passed to the low level regression fitting functions}
}
%\details{
%%%  ~~ If necessary, more details than the description above ~~
%}
%\value{
%%%  ~Describe the value returned
%%%  If it is a LIST, use
%%%  \item{comp1 }{Description of 'comp1'}
%%%  \item{comp2 }{Description of 'comp2'}
%%% ...
%}
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
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\link{smoothing}, \link{segmentation}, \link{pscnlist}.   
}
\examples{
## view major and minor copy numbers of a chromosome (use result from \link{pscnlist}).
  pscn.plot(samplename="TCGA.02.0332", chrid=3, which.plot="copy number")
  # if want x axis to be position rather than SNP index and show title
  pscn.plot(samplename="TCGA.02.0332", chrid=3, which.plot="copy number", use.pos=TRUE, use.main=TRUE) # the disconneted region indicates cetromere region
  # change gain, loss, normal colors  
  pscn.plot(samplename="TCGA.02.0332", chrid=3, which.plot="copy number", use.pos=TRUE, use.main=TRUE, col.gain="purple", col.loss="yellow", col.normal="lightblue")
  
## view logR, Bfreqency, allele A raw copy number, allele B raw copy number, or total raw copy number (R) (use result from \link{segmentation} and \link{pscnlist}) )
  pscn.plot(samplename="TCGA.02.0332", chrid=3, which.plot="bfreq") # change which.plot to logR, A, B or R to view logR, A, B or total raw copy number, same following.
  # if do not want to see the black vertical lines showing changepoint
  pscn.plot(samplename="TCGA.02.0332", chrid=3, which.plot="bfreq", changepoint=FALSE)
  # to color different segment differently
  pscn.plot(samplename="TCGA.02.0332", chrid=3, which.plot="bfreq", region=TRUE)
  # only view SNPs from 2000 to 3000 
  pscn.plot(samplename="TCGA.02.0332", chrid=3, which.plot="bfreq", loc=2000:3000)   
  pscn.plot(samplename="TCGA.02.0332", chrid=3, which.plot="bfreq", changepoint=FALSE, loc=2000:3000)        
  pscn.plot(samplename="TCGA.02.0332", chrid=3, which.plot="bfreq", region=TRUE, loc=2000:3000)
  # only view segments 4-8                                               
  pscn.plot(samplename="TCGA.02.0332", chrid=3, which.plot="bfreq", region=TRUE, regionid=4:8)
  pscn.plot(samplename="TCGA.02.0332", chrid=3, which.plot="bfreq", region=TRUE, regionid=4:8, region.col=c("blue","green","yellow","red","black")) #specifies the colors for segments by oneself
  
## scatter plot
  pscn.plot(samplename="TCGA.02.0332", chrid=3, scatter=TRUE)  # color the four states differently
  pscn.plot(samplename="TCGA.02.0332", chrid=3, scatter=TRUE, region=TRUE)  # color different segment differently
  pscn.plot(samplename="TCGA.02.0332", chrid=3, scatter=TRUE, loc=2000:3000) # only view SNPs from 2000 to 3000
  pscn.plot(samplename="TCGA.02.0332", chrid=3, scatter=TRUE, region=TRUE, loc=2000:3000)
  pscn.plot(samplename="TCGA.02.0332", chrid=3, scatter=TRUE, regionid=3)
  pscn.plot(samplename="TCGA.02.0332", chrid=3, scatter=TRUE, region=TRUE, regionid=2:3)
  pscn.plot(samplename="TCGA.02.0332", chrid=3, scatter=TRUE, region=TRUE, regionid=2:3, region.col=c("blue","green"))

## contour plot
  pscn.plot(samplename="TCGA.02.0332", chrid=3, Contour=TRUE)  # color different segment differently
  pscn.plot(samplename="TCGA.02.0332", chrid=3, Contour=TRUE, loc=2000:3000) # only view SNPs from 2000 to 3000
  pscn.plot(samplename="TCGA.02.0332", chrid=3, Contour=TRUE, regionid=2)
  pscn.plot(samplename="TCGA.02.0332", chrid=3, Contour=TRUE, regionid=2:3)
  pscn.plot(samplename="TCGA.02.0332", chrid=3, Contour=TRUE, region=TRUE, regionid=2:3, region.col=c("blue","green"))
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
