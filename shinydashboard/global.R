# LOAD PACKAGES ----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(shinycssloaders)
library(leaflet)

# read in data ----
lake_data <- read_csv("data/lake_data_processed.csv") # didn't need to put shinydashboard before? and don't use here()


