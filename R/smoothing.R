smoothing <-
function(samplename, inputdata, platform="Unknown", genotype.freq=NULL, sm.plot=FALSE, ...){
  tempchr = inputdata$Chr
  for (j in 1:23){
    id = length(which(tempchr==j))
    if (id>0){
      chrdata = inputdata[which(tempchr==j),]
      chrdata = chrdata[sort(chrdata$Position,index.return=TRUE)$ix,]
      cnvobj = create.PSCN(chrdata[,3:4], chromosome=chrdata$Chr, pos=chrdata$Position, samplename=samplename, platform=platform, genotype.freq = genotype.freq)
      cnvobj = smooth.PSCN(cnvobj, plots=sm.plot, ...)
    }
    rm(id)
  }
}

