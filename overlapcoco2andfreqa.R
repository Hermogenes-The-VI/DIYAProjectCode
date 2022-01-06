library(ggpubr)
#import pkg
iop=read.csv("Downloads/atlpacsince1990.csv")
#formatted to include frq of hurricanes and greenhouse gas analysis
#NOTE: hurricane frequencies have an added constant of 450 on in order to overlap graphs, but secondary axis used to differentiate on a different scale
cor.test(iop$freqa,iop$coco2, method ="pearson" )
library(ggplot2)
ggplot(iop)+
  geom_line(colour="#436da0",size=1,aes(x=iop$g1, y = iop$freqa))+
  #atlantic hu/ts freq line
  geom_line(colour="#a4e3cd",size=1,aes(x=iop$g1, y = iop$coco2))+
  #carbon monoxide and dioxide emissions
  scale_y_continuous(
    "CO + CO2 Detected",
    sec.axis = sec_axis(~ . - 450,name="Freq of Atl HU/TS")
  )+
  annotate("text", x=1998, y=495, label=("P-Val  = 0.0356, R = 0.3787"), size=3.5)+
  labs(x="Year", title="Greenhouse Gases and Freq of Atl HU/TS")

  #stat_cor(method="pearson",aes(x=iop$freqa, y=iop$coco2), label.x=1995, label.y=495, )
ggsave(filename = "Documents/Rplot8.png", scale=1, units=c("in"), dpi=800)
