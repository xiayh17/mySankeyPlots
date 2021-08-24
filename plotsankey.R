
library(ggplot2)
library(magrittr)
library(plyr)
library(dplyr)

library(ggalluvial)
library(Cairo)

download.file("https://cdn.jsdelivr.net/gh/xiayh17/Figs@main/uPic/data_mini2_20210817.Rdata",
              "data_mini2_20210817.Rdata")
load("data_mini2_20210817.Rdata")
source("sankeyData.R")
source("plot_sankey.R")

sankey_data <- sankeyData(data_mini2)

cols = list(
  colors = c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69'),
  cols= c("#1b9e77","#d95f02"),
  gcols <- c('#fbb4ae','#b3cde3','#ccebc5','#decbe4'),
  pcols <- c('#7fc97f','#beaed4','#fdc086','#ffff99','#386cb0','#f0027f','#bf5b17'),
  ccols <- c('#fb9a99','#b2df8a',"#fdbf6f")
)

#vcols <- viridis::viridis(34)
vcols <- c('#543005','#8c510a','#bf812d','#dfc27d','#f6e8c3','#c7eae5','#80cdc1','#35978f','#01665e','#003c30',
           '#8e0152','#c51b7d','#de77ae','#f1b6da','#fde0ef','#e6f5d0','#b8e186','#7fbc41','#4d9221','#276419',
           '#40004b','#762a83','#9970ab','#c2a5cf','#e7d4e8','#d9f0d3','#a6dba0','#5aae61','#1b7837','#00441b',
           '#92c5de','#4393c3','#2166ac','#053061')
names(vcols) = c("p501", "p502", "p503", "p504", "p505", "p507", "p509", "p601",
                 "p605", "p607", "p701", "p702", "p704", "p705", "p707", "p801",
                 "p802", "p804", "p805", "p807", "p809", "pDSSC004", "pDSSC005", "pDSSC007",
                 "pDSSS202", "pDSSS203", "pDSSS204", "pDSSS205", "pDSSS207", "pDSSS209", "pDSSS401", "pDSSS403",
                 "pDSSS405", "pDSSS409")
names(cols[[1]]) = c('Tcells', 'epithelial', 'myeloid', 'Bcells', 'stromal', 'mast', 'unkown')
names(cols[[2]]) = c('beirui','boao')
names(cols[[3]]) = c('ap','ln','normal','tumor')
names(cols[[4]]) = c('0', '4', '6', '8', '2', '5', '7')
names(cols[[5]]) = c('LCA', 'LUAD', 'LUSC')

plotSankey(sankey_data,cols =cols,vcols = vcols)

# save in pdf -------------------------------------------------------------
Cairo(16000, 8000, file="plotSankey.pdf", type="pdf", bg="white",dpi = 300,units = "px")
plotSankey(sankey_data,cols =cols,vcols = vcols)
dev.off()
