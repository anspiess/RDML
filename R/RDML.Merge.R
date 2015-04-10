#' Merges \code{RDML} objects
#' 
#' Merges one \code{RDML} object into another.
#' 
#' @param to.merge \code{RDML} object that should be merged into current object.
#' 
#' @docType methods
#' @name Merge
#' @aliases RDML.Merge
#' @rdname merge-method
#' @include RDML.R
#' @examples
#' \dontrun{
#' PATH <- path.package("RDML")
#' filename <- paste(PATH, "/extdata/", "lc96_bACTXY.rdml", sep ="")
#' lc96 <- RDML$new(filename)
#' filename <- paste(PATH, "/extdata/", "stepone_std.rdml", sep ="")
#' stepone <- RDML$new(filename)
#' lc96$Merge(stepone)
#' lc96$AsTable()
#' }
RDML$set("public", "Merge",
         function(to.merge) {
           
           for(element in c("id",
                            "experimenter",
                            "documentation",
                            "dye",
                            "sample",
                            "target",
                            "thermalCyclingConditions",
                            "experiment",
                            "dilutions",
                            "conditions"
                            )) {
             private[[paste0(".", element)]] <- 
               c(private[[paste0(".", element)]],
                 to.merge[[element]])
             private[[paste0(".", element)]] <- 
               private[[paste0(".", element)]][unique(
                 names(private[[paste0(".", element)]]))]
           }
         }
         , overwrite = TRUE)