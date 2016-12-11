p = read.csv("INFM600_0201_Fabulous_DataSet\\INFM600_0201_Fabulous_RidershipPerStartAndEndLargerThan500.csv")
s=read.csv("INFM600_0201_Fabulous_DataSet\\INFM600_0201_Fabulous_DataSet_StationForVisulization.csv")
library(ggplot2)
library(ggrepel)
library(ggmap)

p1 <- ggplot(p) +
  geom_segment(aes(x=p$start_long, xend=p$end_long, y=p4start_lat, yend=p$end_lat, size=p$Ridership, colour=p$Ridership, alpha=p$Ridership)) +
  geom_point(data=s, aes(x=s$long, y=s$lat), size=4) +
  geom_text_repel(data=s, aes(x=long, y=lat, label=name), size=4) +
  theme_light(base_size=10) +
  scale_colour_gradientn(colors=c("#ffb7b5", "#7a0501"), limits=c(500, max(p$Ridership)), name="Number of Trips") +
  scale_alpha(limits=c(0, max(p$Ridership)), guide=FALSE) +
  scale_size(limits=c(0, max(p$Ridership)), guide=FALSE) + 
  coord_fixed() +
  theme(axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        panel.grid=element_blank(),
        panel.border=element_blank())

ggsave("test123.pdf",p1)