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
setwd('~/../Dropbox/JCU/R/Second_GIT')


dat <- tibble(x = rnorm(1000),
              y = rnorm(1000),
              z = rnorm(1000))

p1 <- ggplot(dat, aes(x = x, y = y)) +
  geom_path(aes(col = z, size = z), show.legend = FALSE) +
  theme_void()

ggsave(filename = 'output/plots/ball.png', 
       plot = p1,
       width = 10, height = 10, units = 'cm')
