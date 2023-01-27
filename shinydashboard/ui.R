# comand i to align parenthesis 

# dashboard header -----------------------
header <- dashboardHeader(
  
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400
  
) # END dashboardHeader

# dashboard sidebar -----------------------
sidebar <- dashboardSidebar(
  
  # sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))
    
  ) # END sidebarMenu
  
) # END dashbaordSidebar

# dashboard body -----------------------
body <- dashboardBody(
  
  # tabItems
  tabItems(
    
    # welcome tabItem ----
    tabItem(tabName = "welcome",
            
            # left-hand column ----
            column(width = 6,
                   
                   #input left-box ----
                   box(width = NULL,
                       "background info here"
                   ) # END left-box
                   
            ), # END left-column
            
            # right-hand column ----
            column(width = 6,
                   # top fluid row ----
                   fluidRow(
                     # input box
                     box(width = NULL,
                         "data citation"
                     ) # END box
                     
                   ), # END top fluid row
                   
                   # bottom fluidRow ----
                   fluidRow(
                     box(width = NULL,
                         "disclaimer note"
                     ) # END box
                     
                   ) #END bottom fluidRow
                   
            ) # END right-column
            
    ), #END welcome tabItem
    
    #dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # fluidRow ----
            fluidRow(
              
              # input box ----
              box(width = 4, 
                  title = tags$strong("Adjust lake parameter ranges:"),
                  
                  # sliderInput for Elevation----
                  sliderInput(inputId = "elevation_slider_input",
                              label = "Elevation (meters above SL):",
                              min = min(lake_data$Elevation),
                              max = max(lake_data$Elevation),
                              value = c(min(lake_data$Elevation), max(lake_data$Elevation))
                              ) # END sliderInput for Elevation
                
              ), # END input box
              
              # leaflet box ----
              box(width = 8,
                  
                  title = tags$strong("Monitored lakes within Fish Creek Watershed:"),
                  
                  # leaflet output ----
                  leafletOutput(outputId = "lake_map") |>
                    withSpinner(type = 1,
                                color = "#742361")
                  
                  ) # END leaflet box
              
            ) # END fluidRow
            
    ) # END dashboard tabItem
    
  ) # END tabItem
  
) # END dashboardBody

# combine all -----------------------
dashboardPage(header, sidebar, body)