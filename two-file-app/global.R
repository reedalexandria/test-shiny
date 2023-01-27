# load packages ----
library(shiny)
library(tidyverse)
library(shinyWidgets)
library(lterdatasampler)
library(shinycssloaders)

#source("file/path/tofile")

# data wrangling (trout) ----
clean_trout <- and_vertebrates |>
  filter(species == "Cutthroat trout") |> # filter by species, on selecting "Cutthroat trout"
  select(sampledate, section, species, length_mm = length_1_mm, weight_g, channel_type = unittype) |> # selecting columns we want, renaming column names
  mutate(section = case_when(
    section == "CC" ~ "clear cut forest",
    section == "OG" ~ "old growth forest"
  )) |>
  drop_na()

# data wrangling (penguin) ----