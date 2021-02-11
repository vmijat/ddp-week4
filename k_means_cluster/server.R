#
# Server logic of clusterization
#

#

library(shiny)
library(ggplot2)
library(cluster)

data(iris)

shinyServer(function(input, output) {
    
    

    # standard plot of Iris dataset
    # color is based on species (Setosa, Virginica, Petosa)
    output$cluster_plot <- renderPlot({
        
        df <- iris
        
        ggplot(df, aes(Petal.Length, Petal.Width)) + 
            geom_point(aes(col = Species), size = 4)

    })

    
    # Show a clusterized plot
        
    output$cluster_plot2 <- renderPlot({
        set.seed(1001)
        
        # taking input from the client
        # input is coming from the "clusters" slider
        cluster_num <- input$clusters
        df <- iris
        
        # calculate k-means values for given cluster number
        irisCluster <- kmeans(df[,1:4], center=cluster_num, nstart=20)
       
        # Show a plot of clusterized values
        clusplot(iris, irisCluster$cluster, color=T, shade=T, labels=0, lines=0)
        
    })
    
})
