# load packages
library(tidyverse)
library(leaflet)

# read in data
filtered_lakes <- read_csv("shinydashboard/data/lake_data_processed.csv")

# practice filtering
lakes_new <- filtered_lakes |>
  filter(AvgTemp >= 4 & AvgTemp <= 6)

# leaflet map 
leaflet() |>
  addProviderTiles("Esri.WorldImagery") |> 
  setView(lng = -152, lat = 70, zoom = 6) |>
  addMiniMap(toggleDisplay = TRUE, minimized = TRUE) |> # view to Alaska
  addMarkers(data = filtered_lakes, 
             lng = filtered_lakes$Longitude,
             lat = filtered_lakes$Latitude, 
             popup = paste("Site Name:", filtered_lakes$Site, "<br>",
                           "Elevation", filtered_lakes$Elevation, "meters (above SL)", "<br>",
                           "Avg Depth:", filtered_lakes$AvgDepth, "meters", "<br>", 
                           "Avg Lake Bed Temperature:", filtered_lakes$AvgTemp, "deg Celsius")) 
  
  
