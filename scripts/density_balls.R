# Script name: Generative art
# Purpose: make some generative art from some random data
# Author: Jordan Iles
# Date created: 2019-05-15
# Contact: jordan.iles@jcu.edu.au

#### Clear workspace ----
rm(list = ls(all.names = TRUE))

#### load required packages ----
require(tidyverse)

#### Set working directory ----
# setwd('~/../Dropbox/JCU/R/Second_GIT')


dat <- tibble(x = c(1:1000),
              y = log(c(1:1000)),
              z = rnorm(1000), 
              g = c(rep('1', 250), rep('2', 250), rep('3', 250), rep('4', 250)))

p1 <- ggplot(dat, aes(x = x, y = y, z = z)) +
  geom_density_2d(aes(col = g),
                  show.legend = FALSE) +
  scale_color_manual(values = c('light blue', 'blue', 'dark blue', 'black')) +
  theme_void()

ggsave(filename = 'output/plots/dense.png', 
       plot = p1,
       width = 10, height = 10, units = 'cm')

p2 <- dat %>% 
  mutate(x1 = x  + y * z,
         y1 = log(y) - z,
         g1 = as.numeric(g) * z) %>% 
  ggplot(aes(x = x1, y = y1)) +
  geom_point(aes(col = g1, size = x1), show.legend = FALSE) +
  theme_void()
  
ggsave(filename = 'output/plots/blobs.png', 
       plot = p2,
       width = 10, height = 10, units = 'cm')
