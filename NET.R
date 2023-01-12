install.packages("flextable")
install.packages("GGally")
install.packages("ggraph")
install.packages("gutenbergr")
install.packages("igraph")
install.packages("Matrix")
install.packages("network")
install.packages("quanteda")
install.packages("sna")
install.packages("tidygraph")
install.packages("tidyverse")
install.packages("tm")
install.packages("tibble")

library("flextable")
library("GGally")
library("ggraph")
library("gutenbergr")
library("igraph")
library("Matrix")
library("network")
library("quanteda")
library("sna")
library("tidygraph")
library("tidyverse")
library("tm")
library("tibble")


net <- read.csv("C:/Users/thiba/OneDrive/Documents/PAPERS/PROJET NET-IGF 2021/NETBASE.csv", 
                sep=";", header = T)

net <- as.matrix(net)

g <- graph_from_adjacency_matrix(net)

plot(g, label.cex = 0.1)

library(igraph)


network <- graph_from_adjacency_matrix(net)

# plot it
plot(network)



net %>%
  ggraph(layout = "fr") +
  geom_edge_arc(colour= "gray50",
                lineend = "round",
                strength = .1) +
  geom_node_point(size=log(v.size)*2) +
  geom_node_text(aes(label = name), 
                 repel = TRUE, 
                 point.padding = unit(0.2, "lines"), 
                 size=sqrt(v.size), 
                 colour="gray10") +
  scale_edge_width(range = c(0, 2.5)) +
  scale_edge_alpha(range = c(0, .3)) +
  theme_graph(background = "white") +
  guides(edge_width = FALSE,
         edge_alpha = FALSE)
