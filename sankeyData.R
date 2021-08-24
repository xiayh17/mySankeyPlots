sankeyData <- function(data) {
  data <- data %>% 
    dplyr::select(orig.ident, group, cancerType, company, celltype, pID)
  res <- plyr::ddply(data,.(company, cancerType, pID, orig.ident, group, celltype),nrow) %>%
    to_lodes_form(
                  key = "Class",
                  axes = 1:6)
  return(res)
}

# sankeyData(phe)
