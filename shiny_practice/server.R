library(shiny)

#Execute once, when app is launched

##Read data
demographics <- demographicmovement_bremen <- read.csv("C:/Users/Yuen/Dropbox/Development/Programming/LITG/LITG/shiny_practice/data/demographicmovement_bremen.csv", sep=";",na.strings=c("x")) #skip=7,  #na.strings indicate which strings should be seen as missing values NA
##Clean data such that it doesn't have the pointless first column and cut off the values that are the total values for Bremen and Bremerhaven, leaving only the data for Bremen per district
clean_data <- data.frame(demographicmovement_bremen[2:115,-1])
##Area names
area_names <- clean_data[,1]

##Too much work to rename Every column in this data set, just pick a few we're interested in
cols_oi <- list()
cols_names <- c("Total foreigners influx", "Total foreigners outflux", "Total foreigners net change", "EU foreigners influx", "EU foreigners outflux", "EU foreigners net change")
cols_indexes <- c(3,4,5,6,7,8)
for(i in seq(length(cols_names)))
{
  cols_oi[[cols_names[i]]]=cols_indexes[i]
}


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # Expression that generates the barplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$migrationPlot <- renderPlot({
    y <- clean_data[,cols_oi[[input$oiname]]] #height of plot. Must force read-in data (=dataframe) to be matrix
    names(y) <- area_names
    title <- input$oiname #title of plot
    
    ##Increase margins to fit the x-axis labels
    par(mar=c(15.1,4.1,4.1,2.1))
    
    #render barplot
    barplot(y,
            main=title,
            ylab="Number of people", 
            xlab="Region",
            las=2)
    
  })
})