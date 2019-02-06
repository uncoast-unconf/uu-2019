library(tidyverse)
library(sf)
library("rnaturalearth")
library("rnaturalearthdata")

dat <- read_csv("data/app_locations_anon.csv")
world <- ne_countries(scale = "medium", returnclass = "sf")

ggplot() + 
  geom_sf(data = world, fill = "#87bc97", alpha = .7, color = "white", size = .1) + 
  geom_point(data = dat, aes(x = long, y = lat), shape = 1) + 
  theme(panel.background = element_rect(fill = "#a4c9f999")) + 
  labs(x = "", y="") + 
  coord_sf()
