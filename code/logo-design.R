library(sf)
library(USAboundaries)
library(ggplot2)
library(readr)
library(dplyr)
usmap <- USAboundaries::us_states()
coastal <- read_csv("data/coastal-states.csv")
coastal2 <- filter(usmap, !(state_name %in% coastal$State))
coastal2 <- filter(coastal2, state_name != "Puerto Rico")
coastal2 <- filter(coastal2, state_name != "Vermont")
coastal2 <- filter(coastal2, state_name != "District of Columbia")

library(magick)

logo <- image_read("img/Rlogo.png")
logo <- image_scale(logo, "50")

fig <- image_graph(width = 600, height = 400, res = 100)
ggplot() + 
  geom_sf(data = coastal2, fill = NA, color = "black") + 
  #geom_point(data = NULL, aes(y =41.5868, x = -93.6250 ), shape= 12) + 
  #geom_text(data = NULL, aes(y =41.5868, x = -93.6250 , label = "Des Moines, IA"),
  #         hjust = .5, vjust = -1) + 
  theme_void() + 
  theme(panel.grid = element_line(color = NA))
dev.off()

out <- image_composite(fig, logo, offset = "+315+155")
print(out)

# R logo copyright 2016 The R Foundation. Used with permission of the CC BY-SA 4.0 license. 
