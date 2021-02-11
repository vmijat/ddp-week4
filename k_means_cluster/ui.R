#
# This app should predict Iris clusters 
#
# The idea is as follows
#
#  1. user inputs number of clusters for k-means prediction

# 2. server will calculate clusters and their centers
#
# 3. cluster centers are drawn on the graph


library(shiny)

# Define UI for application that draws a k-means clustering
shinyUI(fluidPage(

    # Application title
    titlePanel("How k-means clusters work (Iris dataset)"),

    # Sidebar with a slider input for number of clusters
    # default value is 3
    # min = 1, max = 5
    
    sidebarLayout(
        sidebarPanel(
            sliderInput("clusters",
                        "number of clusters:",
                        min = 1,
                        max = 5,
                        value = 3,
                        step = 1,
                        ticks = FALSE)  # no need to see ticks, as we are using integers
        ),

        # Show a plot of clusterized data points
        mainPanel(
            h2("the result of clusterization depending of the number of clusters:"),
            plotOutput("cluster_plot2"),
       
        # for reference, here is the standard Iris dataset visualized
            h2("For the reference, here are original dataset clusters:"),
            plotOutput("cluster_plot")
        )
    )
))
