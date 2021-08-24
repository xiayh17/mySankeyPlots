plotSankey <- function(data,cols,vcols) {
  base_plot <- ggplot(data = data,
                      aes(x = Class, y = V1, 
                          stratum = stratum, alluvium = alluvium)) +
    geom_flow(aes(fill = stratum),
              curve_type = "xspline", show.legend = F,aes.flow = "forward",alpha = 0.7) +
    geom_stratum(aes(fill = ifelse(as.numeric(Class) == 1, as.character(stratum), NA)), 
                 stat = "stratum",width = 1/4,color = NA) +
    geom_stratum(aes(fill = ifelse(as.numeric(Class) == 2, as.character(stratum), NA)), 
                 stat = "stratum",width = 1/4,color = NA) +
    geom_stratum(aes(fill = ifelse(as.numeric(Class) == 3, as.character(stratum), NA)), 
                 stat = "stratum",width = 1/4,color = NA) +
    geom_stratum(aes(fill = ifelse(as.numeric(Class) == 4, as.character(stratum), NA)),
                 stat = "stratum",width = 1/4,color = NA) +
    geom_stratum(aes(fill = ifelse(as.numeric(Class) == 5, as.character(stratum), NA)), 
                 stat = "stratum",width = 1/4,color = NA) +
    geom_stratum(aes(fill = ifelse(as.numeric(Class) == 6, as.character(stratum), NA)), 
                 stat = "stratum",width = 1/4,color = NA) +
    scale_fill_manual(values = c(cols[[2]],cols[[5]],cols[[4]],vcols,cols[[3]],cols[[1]]), name = "Company Cancer Type", na.translate = F,
                      breaks = c(names(cols[[2]]),names(cols[[5]]),names(cols[[4]]),names(vcols),names(cols[[3]]),names(cols[[1]]))) +
    geom_text(aes(label = ifelse(as.numeric(Class) == 1, as.character(stratum), NA)),stat = "stratum", size = 3) +
    geom_text(aes(label = ifelse(as.numeric(Class) == 2, as.character(stratum), NA)),stat = "stratum", size = 3) +
    geom_text(aes(label = ifelse(as.numeric(Class) == 3, as.character(stratum), NA)),stat = "stratum", size = 3) +
    geom_text(aes(label = ifelse(as.numeric(Class) == 4, as.character(stratum), NA)),stat = "stratum", size = 3) +
    geom_text(aes(label = ifelse(as.numeric(Class) == 5, as.character(stratum), NA)),stat = "stratum", size = 3) +
    geom_text(aes(label = ifelse(as.numeric(Class) == 6, as.character(stratum), NA)),stat = "stratum", size = 3) +
    scale_x_discrete(limits = c("company","cancerType", "pID", "orig.ident", "group","celltype"), expand = c(.05, .05)) +
    labs(x = NULL, y = "Freq")+
    theme(legend.position="none",
          axis.ticks = element_line(linetype = "blank"),
          panel.grid.minor = element_line(linetype = "blank"),
          axis.title = element_text(family = "serif",
                                    size = 13, face = "bold", colour = "chocolate4"),
          axis.text = element_text(family = "serif"),
          axis.text.x = element_text(size = 12,
                                     colour = "black"), 
          panel.background = element_rect(fill = NA),
          plot.background = element_rect(fill = "aliceblue"))
  
  return(base_plot)
  

    
  
}