df=read.csv("Downloads/hurdat2-atlanic-1851-2020-052921.csv") #raw data with preprocessing to remove extra columns
df$z0=as.character(x=df$z0)
al=df$z0[which(substr(df$z0,1,2)=="AL")]
nm=substr(al,nchar(al)-3,nchar(al))
qw=table(nm)
um=data.frame(qw)
um$Freq=as.numeric(x=um$Freq)
um$nm=as.numeric(x=um$nm)

pf=read.csv("Downloads/hurdat2-nepac-1949-2020-043021a.csv") #raw data with preprocessing to remove extra columns
pf$z0=as.character(x=pf$z0)
ep=pf$z0[which(substr(pf$z0,1,2)=="EP")]
bruh=substr(ep,nchar(ep)-3,nchar(ep))
lul=table(bruh)
tot=data.frame(lul)
tot$Freq=as.numeric(x=tot$Freq)
tot$bruh=as.numeric(x=tot$bruh)

write.csv(x = um,file="Downloads/atlanticfrqdf.csv")
write.csv(x = tot,file="Downloads/pacificfrqdf.csv")
#formatted in excel to combine atlantic and pacific to be FreqA and FreqP respectively in new file
uo=read.csv("Downloads/combinatlpac.csv")



library(ggplot2)
ggplot(uo) + 
  geom_point(colour="#4bd693",size=2,aes(x=uo$nm, y = uo$FreqA)) +
  geom_point(colour="#8686f0",size=2,aes(x=uo$nm, y = uo$FreqP))+
  geom_smooth(span=0.3,col="#4bd693",aes(x=uo$nm, y = uo$FreqA))+
  geom_smooth(span=0.3,col="#8686f0",aes(x=uo$nm, y = uo$FreqP))+
  ggtitle("Hurricane Frequency In Pacific/Atlantic Over Time")+
  xlab("Year")+
  ylab("Frequency of Hurricane/Tsunami Events")+
  theme_bw()+
  scale_x_continuous(limits = c(1949, 2020))
  #scatterwloess

ggsave(filename = "Documents/Rplot5.png", width = 10, height=5, scale=1, units=c("in"), dpi=800)
ggsave(
  pngfile, 
  p, 
  device = agg_png, 
  width = 10, height = 6, units = "cm", res = 300,
  scaling = 0.5
)

---------------
  #excess code
#ggplot(uo) + 
 # geom_point(colour="#4bd693", size=2,aes(x=uo$nm, y = uo$FreqA)) +
 # geom_point(colour="#8686f0", size=2,aes(x=uo$nm, y = uo$FreqP))+
 # geom_smooth(span=0.3,method="lm",col="#4bd693",aes(x=uo$nm, y = uo$FreqA))+
 # geom_smooth(span=0.3,method="lm",col="#8686f0",aes(x=uo$nm, y = uo$FreqP))+
 # scale_x_continuous(limits = c(98, 170))#scatterwlm

# Change the point size, and shape
# lmfao <-ggplot(um, aes(nm, Freq)) +
#   geom_point(size=2, shape=19,col="#00A5FF") +
#   geom_smooth(span=0.3,col="#AC88FF")+
#   ggtitle("Hurricane Frequency Over Time")+
#   xlab("Years Since 1851")+
#   ylab("Frequency of Hurricane/Tsunami Events Since 1851")+
#   geom_line()
# lmfao + ggplot(tot, aes(bruh, Freq)) +
#   geom_point(size=2, shape=19,col="#00A5FF") +
#   geom_smooth(span=0.3,col="#AC88FF")+
#   ggtitle("Hurricane Frequency Over Time")+
#   xlab("Years Since 1949")+
#   ylab("Frequency of Hurricane/Tsunami Events Since 1949")# for the y axis label
#x <- um$nm
#y <- um$Freq
#plot(x, y, main = "year vs frq of hurricane events", xlab = "year", ylab = "frq", pch = 19, frame = TRUE)
#lines(lowess(x, y), col = "blue")
#plot(qw,xlab="Year",ylab="Frq of Hurricane/Tsunami Events",col="#5f9ed9")
#plot(qw,xlab="Year",ylab="Frq of Hurricane/Tsunami Events",col=rgb(red=0, green=1, blue=0, alpha="0.5"))
#library(ggplot2)
# Basic scatter plot
#ggplot(um, aes(x=um$nm, y=um$Freq))+ geom_point()
# Change the point size, and shape
#ggplot(um, aes(y=um$Freq, x=um$nm)) + 
#  geom_smooth(method="auto", se=TRUE, fullrange=FALSE, level=0.95)

#zamn=read.csv("Downloads/Book4.csv")
#lines(lowess(zamn$year, zamn$flood.fatalities), col = "blue")
#plot(zamn)


#abline(lm(as.numeric(zamn$year) ~ as.numeric(zamn$flood.fatalities), data = zamn), col = "blue")

#df$z0=as.character(x=df$z0)
#abline(lm(as.numeric(poop$V1) ~ as.numeric(poop$X0), data = poop), col = "blue")

#sum(df$z0 == "1851")

#pp$X0=as.character(x = pp$X0)
#pp=as.data.frame(pp)
#pp$X0 = substr(pp$X0,1,nchar(pp$X0)-4)
#library(data.table)
#pp$X.1=as.character(x = pp$X.1)
#pp$X.1 = substr(pp$X.1,1,nchar(pp$X.1)-1)
#pp$X.1=as.numeric(x = pp$X.1)
#poop=setDT(pp)[, X.1[max(X.1)], X0]
#poop=na.omit(poop)
#plot(x=poop$X0,y=poop$V1)
#abline(lm(as.numeric(poop$V1) ~ as.numeric(poop$X0), data = poop), col = "blue")
