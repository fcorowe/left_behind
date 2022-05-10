## Install packages to make sankey diagrams
#install.packages("Rtools")
#install.packages("cli")
#install.packages("devtools")
#devtools::install_github("davidsjoberg/ggsankey")
library(ggsankey)

## Install other libraries
library(tidyverse)
library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(grid)
library(gridExtra)
library(ggpubr)

## Read data about LSOA clusters and domains from csv.
data <- read.csv("IMD_ClustersandDomains.csv")
names(data)

data$X2010 <- as.character(data$X2010) # Convert IMD variables into characters not numbers
data$X2015 <- as.character(data$X2015)
data$X2019 <- as.character(data$X2019)

## Select data for a single cluster
table(data$CLUSTER) # Check the cluster numbers and descriptions

## Cluster 1 plot
target_C1 <- c("C1") # Create new object for cluster 1

data_C1 <- data %>% # Create new object by filtering only cluster 1 values
  filter(CLUSTER %in% target_C1)

data_long_C1 <- data_C1 %>% # Convert data into long format using the ggsankey format
  make_long(X2010, X2015, X2019) # See guidance on make_long() function on github

x_labels <- c('2010', '2015', '2019') # Create an object with column labels

Cluster1 <- data_long_C1 %>% 
  mutate(node = fct_relevel(node, "1", "2", "3", "4", "5", "6"), # Relevel so that 10 doesn't come first
         next_node = fct_relevel(next_node, "1", "2", "3", "4", "5", "6")) %>%
  ggplot(aes(x = x, next_x = next_x, # x, next_x, node and next_node are specified by make_long function above
          node = node, next_node = next_node,
          fill = factor(node),
          label = node))+
  geom_sankey(flow.alpha =.8, # Set transparency levels on flows
              node.color = 1,
              show.legend = FALSE)+ 
  geom_sankey_label(color = 1, # Set labels
                    show.legend = FALSE,
                    size=6)+
  scale_fill_manual(values = c("1" = "#a50026",# Manually fill with RdYlBu ColorBrewer palette values
                                 "2" = "#d73027", # Different clusters have different deciles
                                 "3" = "#f46d43", # Change for each cluster image
                                 "4" = "#fdae61",
                                 "5" = "#fee090",
                                 "6" = "#e0f3f8"))+
  theme_sankey(base_size = 20)+
  xlab("")+
  labs(fill="IMD decile")+
  scale_x_discrete(labels = x_labels) # Set labels from x_labels object above

## Cluster 2 plot
target_C2 <- c("C2") # Create new object for cluster 2

data_C2 <- data %>% 
  filter(CLUSTER %in% target_C2)

data_long_C2 <- data_C2 %>%
  make_long(X2010, X2015, X2019)

Cluster2 <- data_long_C2 %>%
  mutate(node = fct_relevel(node, "1", "2", "3", "4", "5", "6", "7"),
         next_node = fct_relevel(next_node, "1", "2", "3", "4", "5", "6", "7")) %>%
  ggplot(aes(x = x, next_x = next_x,
           node = node, next_node = next_node,
           fill = factor(node),
           label = node))+
  geom_sankey(flow.alpha =.8,
              node.color = 1,
              show.legend = FALSE)+
  geom_sankey_label(color = 1,
                    show.legend = FALSE,
                    size=6)+
  scale_fill_manual(values = c("1" = "#a50026",
                               "2" = "#d73027",
                               "3" = "#f46d43",
                               "4" = "#fdae61",
                               "5" = "#fee090",
                               "6" = "#e0f3f8"))+
  theme_sankey(base_size = 20)+
  xlab("")+
  labs(fill="IMD decile")+
  scale_x_discrete(labels = x_labels)

## Cluster 3 plot
target_C3 <- c("C3") # Create new object for cluster 3

data_C3 <- data %>% 
  filter(CLUSTER %in% target_C3)

data_long_C3 <- data_C3 %>%
  make_long(X2010, X2015, X2019)

Cluster3 <- data_long_C3 %>%
  mutate(node = fct_relevel(node, "1", "2", "3", "4", "5", "6", "7"),
         next_node = fct_relevel(next_node, "1", "2", "3", "4", "5", "6", "7")) %>%
  ggplot(aes(x = x, next_x = next_x,
                       node = node, next_node = next_node,
                       fill = factor(node),
                       label = node))+
  geom_sankey(flow.alpha =.8,
              node.color = 1,
              show.legend = FALSE)+
  geom_sankey_label(color = 1,
                    show.legend = FALSE,
                    size=6)+
  scale_fill_manual(values = c("1" = "#a50026",
                               "2" = "#d73027",
                               "3" = "#f46d43",
                               "4" = "#fdae61",
                               "5" = "#fee090",
                               "6" = "#e0f3f8",
                               "7" = "#abd9e9"))+
  theme_sankey(base_size = 20)+
  xlab("")+
  labs(fill="IMD decile")+
  scale_x_discrete(labels = x_labels)

## Cluster 4 plot
target_C4 <- c("C4") # Create new object for cluster 4

data_C4 <- data %>% 
  filter(CLUSTER %in% target_C4)

data_long_C4 <- data_C4 %>%
  make_long(X2010, X2015, X2019)

Cluster4 <- data_long_C4 %>%
  mutate(node = fct_relevel(node, "1", "2", "3", "4", "5", "6", "7", "8", "9"),
         next_node = fct_relevel(next_node, "1", "2", "3", "4", "5", "6", "7", "8", "9")) %>%
  ggplot(aes(x = x, next_x = next_x,
                       node = node, next_node = next_node,
                       fill = factor(node),
                       label = node))+
  geom_sankey(flow.alpha =.8,
              node.color = 1,
              show.legend = FALSE)+
  geom_sankey_label(color = 1,
                    show.legend = FALSE,
                    size=6)+
  scale_fill_manual(values = c("1" = "#a50026",
                               "2" = "#d73027",
                               "3" = "#f46d43",
                               "4" = "#fdae61",
                               "5" = "#fee090",
                               "6" = "#e0f3f8",
                               "7" = "#abd9e9",
                               "8" = "#74add1",
                               "9" = "#4575b4"))+
  theme_sankey(base_size = 20)+
  xlab("")+
  labs(fill="IMD decile")+
  scale_x_discrete(labels = x_labels)

## Cluster 5 plot
target_C5 <- c("C5") # Create new object for cluster 5

data_C5 <- data %>% 
  filter(CLUSTER %in% target_C5)

data_long_C5 <- data_C5 %>%
  make_long(X2010, X2015, X2019)

Cluster5 <- data_long_C5 %>%
  mutate(node = fct_relevel(node, "2", "3", "4", "5", "6", "7", "8", "9", "10"),
         next_node = fct_relevel(next_node, "2", "3", "4", "5", "6", "7", "8", "9", "10")) %>%
  ggplot(aes(x = x, next_x = next_x,
                       node = node, next_node = next_node,
                       fill = factor(node),
                       label = node))+
  geom_sankey(flow.alpha =.8,
              node.color = 1,
              show.legend = FALSE)+
  geom_sankey_label(color = 1,
                    show.legend = FALSE,
                    size=6)+
  scale_fill_manual(values = c("2" = "#d73027",
                               "3" = "#f46d43",
                               "4" = "#fdae61",
                               "5" = "#fee090",
                               "6" = "#e0f3f8",
                               "7" = "#abd9e9",
                               "8" = "#74add1",
                               "9" = "#4575b4",
                               "10" = "#313695"))+
  theme_sankey(base_size = 20)+
  xlab("")+
  labs(fill="IMD decile")+
  scale_x_discrete(labels = x_labels)

## Cluster 6 plot
target_C6 <- c("C6") # Create new object for cluster 6

data_C6 <- data %>% 
  filter(CLUSTER %in% target_C6)

data_long_C6 <- data_C6 %>%
  make_long(X2010, X2015, X2019)

Cluster6 <- data_long_C6 %>%
  mutate(node = fct_relevel(node, "5", "6", "7", "8", "9", "10"),
         next_node = fct_relevel(next_node, "5", "6", "7", "8", "9", "10")) %>%
  ggplot(aes(x = x, next_x = next_x,
             node = node, next_node = next_node,
             fill = factor(node),
             label = node))+
  geom_sankey(flow.alpha =.8,
              node.color = 1,
              show.legend = FALSE)+
  geom_sankey_label(color = 1,
                    show.legend = FALSE,
                    size=6)+
  scale_fill_manual(values = c("5" = "#fee090",
                               "6" = "#e0f3f8",
                               "7" = "#abd9e9",
                               "8" = "#74add1",
                               "9" = "#4575b4",
                               "10" = "#313695"))+
  theme_sankey(base_size = 20)+
  xlab("")+
  labs(fill="IMD decile")+
  scale_x_discrete(labels = x_labels)

##  Export as tiff with multiple images
tiff('sankey_500.tiff', units = "in", res = 500, height = 13, width = 17)
ggarrange(Cluster1, Cluster2, Cluster3, Cluster4, Cluster5, Cluster6)
dev.off()
