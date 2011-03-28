.First.lib <- function(lib,pkg) {
	library.dynam("PSCN",pkg,lib)
   	cat("package PSCN loaded\n")
}
