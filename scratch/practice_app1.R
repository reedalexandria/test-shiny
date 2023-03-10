# load packages
library(palmerpenguins)
library(tidyverse)
library(DT)

# filter data ----
body_mass_df <- penguins |>
  filter(body_mass_g %in% 3000:4000) # %in%  = within

# plot
ggplot(na.omit(body_mass_df), #na.omit deleting any row with NA
       aes(x = flipper_length_mm, y = bill_length_mm,
           color = species, shape = species)) +
  geom_point() +
  scale_color_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "#B251F1", "Gentoo" = "#4BA4A4")) +
  scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15))

# filter for years ----
year_df <- penguins |>
  filter(year %in% c(2007,2008))

# make DT
DT::datatable(year_df) # does not contain year 2009
