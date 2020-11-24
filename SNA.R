##----create_import_node_link----
library(dplyr)
library(tidyr)
link <- read.csv("./inputs/link.csv")
# node <- pivot_longer(link, 2:3, names_to = "name", values_to = "value")
# node <- unique(node$value)
# node <- data.frame(
#   ID = 1:31,
#   name = node
# )
# write.csv(node, "./inputs/node.csv")
# remove ID colume of link and re-order the columnes of node (start with names) so that they can be transformed to an igraph object.
# https://github.com/nicolewhite/neo4j-alchemy-cluster/issues/2
node <- read.csv("./inputs/nodes.csv")
node$name <- as.character(node$name)
node$type <- as.character((node$type))
##----convert_to_igraph----
# igraph: http://pablobarbera.com/big-data-upf/html/02a-networks-intro-visualization.html
library(igraph)
g <- graph_from_data_frame(d=link, vertices=node, directed=TRUE)
g

# library(network)
# n <- network(link, vertex.attr = node, matrix.type = "edgelist",
#          directed=TRUE,
#          ignore.eval = FALSE)# keep link attribute
# n
##----plot----
# http://briatte.github.io/ggnet/

library(GGally)
ggnet2(g, color = "type", palette = "Set2", arrow.size = 12, arrow.gap = 0.025,
       label = T,
       shape = "interview", shape.palette = c("yes" = 19, "redirect" = 18,
                                              "no_capacity" = 17,
                                              "no_reply" = 6,
                                              "na" = 0),
       size = 12)

# https://rpubs.com/wctucker/302110#:~:text=Social%20Network%20Analysis%20in%20R%201%20Introduction.%20Social,...%207%20Military%20Utility.%20...%208%20Exercises.%20
