library(shiny)

cols_names <- c("Total foreigners influx", "Total foreigners outflux", "Total foreigners net change", "EU foreigners influx", "EU foreigners outflux", "EU foreigners net change")

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(

    # Application title
    titlePanel("Shiny practice - Migration in Bremen 2014"),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("migrationPlot", width="100%")
    ),
    
    #Show y-axis selection beneath the plot to give the plot more space
    fluidRow(
          selectInput("oiname", "Y variable:",
                      choices=cols_names),
          hr()
    )
  )
)