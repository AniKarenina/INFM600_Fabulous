p = read.csv("INFM600_0201_Fabulous_DataSet\\INFM600_0201_Fabulous_DistanceBetweenStartAndEnd.csv")
s=read.csv("INFM600_0201_Fabulous_DataSet\\Station.csv")
library(ggplot2)
library(ggrepel)
p1 <- ggplot(p) +
  geom_segment(aes(x=p$start_long, xend=p$end_long, y=p$start_lat, yend=p$end_lat, size=p$Ridership, colour=p$Ridership, alpha=p$Ridership)) +
  geom_point(data=s, aes(x=s$long, y=s$lat), size=0.1) +
  geom_text_repel(data=s, aes(x=long, y=lat, label=""), size=10) +
  theme_light(base_size=10) +
  scale_colour_gradientn(colors=c("#dddddd", "#ff2020"), limits=c(0, max(p$Ridership)), name="Number of Trips") +
  scale_alpha(limits=c(0, max(p$Ridership)), guide=FALSE) +
  scale_size(limits=c(0, max(p$Ridership)), guide=FALSE) +
  xlab("") +
  ylab("") +
  coord_fixed() +
  theme(axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        panel.grid=element_blank(),
        panel.border=element_blank())


ggsave("DC_trips.pdf", p1, width=100, height=80, units="in",limitsize=FALSE)

