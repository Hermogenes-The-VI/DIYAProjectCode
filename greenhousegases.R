df=read.csv("Downloads/mlo_co2.csv")
pf=read.csv("Downloads/mlo_co.csv")
# rf=read.csv("Downloads/mlo_ch4.csv")
# extra data not plotted

df$analysis_value=as.numeric(x=df$analysis_value)
df$analysis_value[df$analysis_value == "-999.99"] <- NA

pf$analysis_value=as.numeric(x=pf$analysis_value)
pf$analysis_value[pf$analysis_value == "-999.99"] <- NA

#rf$analysis_value=as.numeric(x=rf$analysis_value)
#rf$analysis_value[rf$analysis_value == "-999.99"] <- NA
# extra data not plotted

lel=data_frame(df$sample_year,df$analysis_value)
oi=na.omit(lel)
#lil=data_frame(rf$sample_year,rf$analysis_value)
#oo=na.omit(lil)
# from extra data not plotted
lyl=data_frame(pf$sample_year,pf$analysis_value)
uu=na.omit(lyl)

data.frame(oi)

#data.frame(oo)
# from extra data not plotted

data.frame(uu)

ii <- data.frame(oi)

#zz <- data.frame(oo)
# from extra data not plotted

bb <- data.frame(uu)

yo=aggregate(ii$df.analysis_value, list(ii$df.sample_year), mean)
#ye=aggregate(zz$rf.analysis_value, list(zz$rf.sample_year), mean)
# from extra data not plotted
yy=aggregate(bb$pf.analysis_value, list(bb$pf.sample_year), mean)

#ggplot(yo)+
#  geom_point(colour="#4bd693",size=2,aes(x=yo$Group.1, y = yo$x))
#ggplot(ye)+
#  geom_point(colour="#4bd693",size=2,aes(x=ye$Group.1, y = ye$x))
#ggplot(yy)+
#  geom_point(colour="#4bd693",size=2,aes(x=yy$Group.1, y = yy$x))

#write.csv(x = yo,file="Downloads/co2procesd.csv")
#write.csv(x = ye,file="Downloads/ch4procesd.csv")
#write.csv(x = yy,file="Downloads/coprocesd.csv")
# code used initially to compound data into spreadsheet; post processing done and used "co2procesd.csv" as the compiled datasheet


library(ggplot2)

uou=read.csv("Downloads/co2procesd.csv")

ggplot(uou)+
  geom_line(colour="#6a7cb1",size=0.5, alpha=1, aes(x=uou$g1, y = uou$ch4))+
  #geom_line(colour="#6a7cb1",size=0.5, alpha=0.95, aes(x=uou$g1, y = uou$coch4))+
  geom_line(colour="#87c4ec",size=0.5, alpha=0.93, aes(x=uou$g1, y = uou$coch4co2))+
  geom_ribbon(colour="#6a7cb1",fill="#6a7cb1", alpha=1, aes(x=uou$g1,ymin=0, ymax=uou$co))+
  geom_ribbon(colour="#87c4ec",fill="#87c4ec", alpha=0.93, aes(x=uou$g1,ymin=uou$co, ymax=uou$coco2))+
  #geom_ribbon(colour="#87c4ec",fill="#87c4ec", alpha=0.93, aes(x=uou$g1,ymin=uou$coch4, ymax=uou$coch4co2))+
  ggtitle("Comparison of Two of Greenhouse Gas Emissions Measured in Hawaii")+
  xlab("Year")+
  ylab("PPM")+
  theme_bw()
  
ggsave(filename = "Documents/Rplot6.png", scale=1, units=c("in"), dpi=800)

#il=df$analysis_value[(substr(df$analysis_value,1,2)=="-9")]
#bob=substr(il,2,nchar(al)-7)
#ee=data.frame(bob)

