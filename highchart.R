install.packages("sankeywheel")
install.packages("highcharter")

library(sankeywheel)
library(highcharter)

sankeywheel(from = sankeydf$from,
            to = sankeydf$to,
            weight = sankeydf$weight,
            type = "dependencywheel", 
            width = "100%")

sankeywheel(from = sankeydf$from,
            to = sankeydf$to,
            weight = sankeydf$weight,
            type = "sankey", 
            width = "100%")
head(sankeydf)
# from       to weight
# 1 Brazil Portugal      5
# 2 Brazil   France      1
# 3 Brazil    Spain      1
# 4 Brazil  England      1
# 5 Canada Portugal      1
# 6 Canada   France      5

source("sankeyData2.R")

col_names <- c("orig.ident", "group", "cancerType", "company", "celltype", "pID")

tt <- sankeyData2(data= data_mini2, col_names = col_names)

sankeywheel(from = tt$from,
            to = tt$to,
            weight = tt$weight,
            type = "dependencywheel", 
            width = "100%")

sankeywheel(from = tt$from,
            to = tt$to,
            weight = tt$weight,
            type = "sankey", 
            width = "100%")

highchart() %>%
  hc_title(text = "桑基图") %>%
  hc_add_series(data = tt,type = "sankey",hcaes(from = from,to = to,weight = weight)) %>%
  hc_add_theme(hc_theme_google())

highchart() %>%
  hc_title(text = "桑基图") %>%
  hc_add_series(data = tt,type = "sankey",hcaes(from = from,to = to,weight = weight)) %>%
  hc_add_theme(hc_theme_economist())
