# load libraries ----
library(tidyverse)
library(lterdatasampler)

# clean data ----
clean_trout <- and_vertebrates |>
  filter(species == "Cutthroat trout") |> # filter by species, on selecting "Cutthroat trout"
  select(sampledate, section, species, length_mm = length_1_mm, weight_g, channel_type = unittype) |> # selecting columns we want, renaming column names
  mutate(section = case_when(
    section == "CC" ~ "clear cut forest",
    section == "OG" ~ "old growth forest"
  )) |>
  drop_na()

# practice filtering
trout_filtered_df <- clean_trout |>
  filter(channel_type %in% c("R", "C")) |>
  filter(section %in% c("clear cut forest"))

# plot ----
ggplot(trout_filtered_df, aes(x = length_mm, y = weight_g,
                        color = channel_type)) +
  geom_point(alpha = 0.7, size = 5) +
  scale_color_manual(values = c("R" = "blue", 
                                "C" = "purple", 
                                "S" = "black", 
                                "P" = "yellow", 
                                "SC" = "green", 
                                "I" = "orange", 
                                "IP" = "red"))




