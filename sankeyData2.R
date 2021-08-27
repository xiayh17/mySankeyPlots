sankeyData2 <- function(data,col_names) {
  
  data2 <- data.frame(
    from = unlist(data[,col_names[1:length(col_names)-1]]),
    to = unlist(data[,col_names[2:length(col_names)]])
  )
  
  data_weight <- data2 %>% group_by(from) %>%
    add_count(to,name = "weight") %>%
    distinct()
  
}
