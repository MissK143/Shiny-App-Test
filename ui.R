# ui.R
library(shiny)

# Define UI for the Shiny app
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Sales and Quantity Dashboard"),
  
  # Sidebar layout with sidebar panel and main panel
  sidebarLayout(
    
    # Sidebar panel for inputs
    sidebarPanel(
      # Date range input for selecting a date range
      dateRangeInput("dateRange", 
                     label = "Select Date Range",
                     start = "2020-01-01", 
                     end = "2020-01-31")
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      plotOutput("salesPlot"),       # Output for sales plot
      plotOutput("quantityPlot")     # Output for quantity plot
    )
  )
))

