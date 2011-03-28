print.PSCN <-
function(x, ... ){
    cat(paste("\n\nCNV object ",x$label,": total ", length(x), " SNPs on ",x$platform," platform.\n",sep=""))
    if(!is.null(x$sig)) cat("BCMIX fitted values available.\n")
    if(!is.null(x$sig.seg)) cat(paste("Segmented: total ",length(x$chpts)," change-points.\n\n",sep="")) 
    
    if(!is.null(x$cnvtable))  print(format(x$cnvtable,digits=2))        
}

