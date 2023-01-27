# load packages ----
library(shiny)
library(palmerpenguins)
library(tidyverse)
library(DT)

# ui ----
ui <- fluidPage(
  
  # app title ----
  tags$h1("My app title"), # could write h1("my app title")

  # app subtitle ----
  tags$p(tags$strong("Exploring Antarctic Penguin Data")),

  # body mass sliderInput (creating slider widget)----
  sliderInput(inputId = "body_mass_input", label = "Select a range of body masses (g):",
              min = 2700, max = 6300, value = c(3000, 4000)),
  
  # body mass plot output ----
  plotOutput(outputId = "bodyMass_scatterPlot"),
  
  # year input ----
  checkboxGroupInput(inputId = "year_input", label = "Select year(s):",
                     choices = c("The year 2007" = "2007", "2008", "2009"), #could put unique(penguins$year)
                     selected = c("2007", "2008")),
  
  # DT output ----
  DT::dataTableOutput(outputId = "penguin_data")
  
  
) # END fluidPage



# server ----
server <- function(input, output) {

  # filter data ----
  body_mass_df <- reactive({
    
    penguins |>
      filter(body_mass_g %in% input$body_mass_input[1]:input$body_mass_input[2]) 
    
  })
    
  # render scatter plot ----
  output$bodyMass_scatterPlot <- renderPlot({
    
    # code to generate plot here
    ggplot(na.omit(body_mass_df()), #na.omit deleting any row with NA
           aes(x = flipper_length_mm, y = bill_length_mm,
               color = species, shape = species)) +
      geom_point() +
      scale_color_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "#B251F1", "Gentoo" = "#4BA4A4")) +
      scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15))
    
    
  }) # END render scatter plot 
  
  
  # filter for years ----
  year_df <- reactive({
    penguins |>
      filter(year %in% c(input$year_input))
  })
  
  # render DT ----
  output$penguin_data <- DT::renderDataTable({
    
    DT::datatable(year_df()) 
    
  })
  
  
} # END server

# combine ui & server ---- 
# don't need to do this for two-file app
shinyApp(ui = ui, server = server)




