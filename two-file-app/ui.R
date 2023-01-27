# user interface ----
ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # page 1: Intro tabPanel ----
  tabPanel(title = "About this App",
           
           "background info here"
           
  ), # END page 1 tabPanel
  
  # page 2: data tabPanel ----
  tabPanel(title = "Explore the Data",
           
           # tabsetPanel ----
           tabsetPanel(
             
             # trout tab ----
             tabPanel(title = "Trout",
                      
                      #trout sidebarLayout ----
                      sidebarLayout(
                        
                        #trout sidebarPanel ----
                        sidebarPanel(
                          
                          # channel type pickerInput ----
                          shinyWidgets::pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s):",
                                      choices = unique(clean_trout$channel_type),
                                      options = pickerOptions(actionsBox = TRUE),
                                      selected = c("C", "S"),
                                      multiple = TRUE
                                      ), # END pickerInput
                          
                          # checkboxGroupButtonInput ----
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select a sampling section(s):",
                                               choices = unique(clean_trout$section),
                                               selected = c("clear cut forest"),
                                               individual = FALSE,
                                               justified = TRUE,
                                               checkIcon = list(yes = icon("ok", lib = "glyphicon"),
                                                                no = icon("remove", lib = "glyphicon"))) # END checkboxGroupButtonInput
                          
                        ), # END trout sidebarPanel
                        
                        # trout mainPanel ----
                        mainPanel(
                          
                          plotOutput(outputId = "trout_scatterplot") |>
                            withSpinner(type = 1, color = "blue")
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel
             
             # penguin tab ----
             tabPanel(title = "Penguins",
                      
                      #penguin sidebarLayout ----
                      sidebarLayout(
                        
                        #penguin sidebarPanel ----
                        sidebarPanel(
                          
                          "penguin inputs here"
                          
                        ), # END penguin sidebarPanel
                        
                        # penguin mainPanel ----
                        mainPanel(
                          
                          "penguin outputs here"
                          
                        ) # END penguin mainPanel
                        
                      ) # END penguin sidebarLayout
                      
             ) # END penguin tabPanel
             
           ) # END tabsetPanel
           
  ) # END page 2 tabPanel
  
) # END navbarPage

