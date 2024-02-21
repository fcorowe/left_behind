# Set new working directory
setwd("left_behind/places")
getwd()

# Install ggplot to create violin plots, one for each IMD domain and broken down by cluster
install.packages("ggplot2")
library(ggplot2)

# Install R Color Brewer for nice looking colour palettes
library(RColorBrewer)

# Install tidyr and plyr package, useful tools for tidying up your data
library(tidyr) 
library(plyr)

# Read csv. file with LSOA according to IMD domains and trajectory cluster
data <- read.csv(file = "IMD_ClustersandDomains.csv", check.names=FALSE)
colnames(data1)

# To divide the graph according to multiple domains, collapse the data into a long format using the gather() function
datalong <- gather(data, key="measure", value="value", c("Income","Employment","Education","Health and Disability","Crime","Housing and Services","Living Environment"))
head(datalong)

# Create violin plots
violin <- ggplot(datalong, aes(x=CLUSTER, y=value)) + 
  geom_violin(aes(fill=CLUSTER), color=NA)+
  labs(title="Clusters broken down by IMD Domains",y="Relative rank (where one is the most deprived)", x="Clusters")+
  scale_fill_manual(values=c("#f0027f", "#386cb0", "#fdc086","#7fc97f", "#ffff99", "#beaed4"), # Manually change the colours of the clusters based on ColorBrewer palette
                    name="IMD Decile",
                    breaks=c("C1", "C2", "C3", "C4", "C5", "C6"),
                    labels=c("C1", "C2", "C3", "C4", "C5", "C6"))+
  theme_gray()+
  theme(plot.title=element_text(face="bold"),
        axis.text.x=element_blank(), axis.title.x=element_blank(), axis.ticks.x=element_blank(),
        axis.text.y=element_text(size=12), axis.title.y=element_text(size=12),
        strip.text=element_text(size=12), 
        legend.text = element_text(size=12),legend.title=element_blank())+
  facet_wrap(~measure) # Produce multiple graphs, one for each
violin

# Export image as a high resolution tiff. image
tiff("Violin_400.tiff", width = 3200, height = 3000, res=300)
plot(violin)
dev.off()
