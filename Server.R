# server.R
library(shiny)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output, session) {
  
  # Reactive expression to filter and summarize sales data by date
  filtered_sales <- reactive({
    req(input$dateRange)
    book_sales %>%
      mutate(date = as.Date(date)) %>%
      filter(date >= input$dateRange[1] & date <= input$dateRange[2]) %>%
      group_by(date) %>%
      summarize(total_sales = sum(sales, na.rm = TRUE))
  })
  
  # Reactive expression to filter and summarize quantity by date
  filtered_quantity <- reactive({
    req(input$dateRange)
    sales %>%
      mutate(date = as.Date(date)) %>%
      filter(date >= input$dateRange[1] & date <= input$dateRange[2]) %>%
      group_by(date) %>%
      summarize(total_quantity = sum(quantity, na.rm = TRUE))
  })
  
  # Render the line plot for total sales over the selected date range
  output$salesPlot <- renderPlot({
    ggplot(filtered_sales(), aes(x = date, y = total_sales)) +
      geom_line(color = "#1f77b4", linewidth = 1) +    # Professional blue for the sales line
      labs(
        title = "Total Sales Over Selected Date Range",
        x = "Date",
        y = "Total Sales ($)"
      ) +
      theme_minimal(base_size = 15) +
      theme(
        plot.title = element_text(hjust = 0.5, face = "bold"),
        axis.text.x = element_text(angle = 45, hjust = 1)
      )
  })
  
  # Render the bar plot for total quantity over the selected date range
  output$quantityPlot <- renderPlot({
    ggplot(filtered_quantity(), aes(x = date, y = total_quantity)) +
      geom_bar(stat = "identity", fill = "#4c72b0", color = "#2a3d5e") +  # Subtle blue-gray bar colors
      labs(
        title = "Total Quantity per Date Over Selected Date Range",
        x = "Date",
        y = "Total Quantity"
      ) +
      theme_minimal(base_size = 15) +
      theme(
        plot.title = element_text(hjust = 0.5, face = "bold"),
        axis.text.x = element_text(angle = 45, hjust = 1)
      )
  })
})
