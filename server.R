library(shiny)

shinyServer(function(input, output, session) {
  observeEvent(input$submit, {
    output$distPlot <- renderPlot({
      col_main <- "#002B5C" 
      col_border <- "#FF6F00" 
      
      switch(input$distType,
             "norm" = {
               distData <- rnorm(1000, mean = input$param1, sd = input$param2)
               hist(distData, main = "Normal Distribution", xlab = "Value", ylab = "Frequency", col = col_main, border = col_border)
             },
             "binom" = {
               if (input$param1 <= 0 || input$param2 <= 0 || input$param2 > 1) {
                 session$sendCustomMessage(type = 'alert', message = 'For Binomial distribution: number of trials must be positive, and probability must be between 0 and 1.')
                 return(NULL)
               }
               distData <- rbinom(1000, size = input$param1, prob = input$param2)
               barplot(table(factor(distData, levels = 0:max(distData))),
                       main = "Binomial Distribution", xlab = "Successes", ylab = "Frequency", col = col_main, border = col_border)
             },
             "pois" = {
               if (input$param1 <= 0) {
                 session$sendCustomMessage(type = 'alert', message = 'Lambda must be a positive number for Poisson distribution.')
                 return(NULL)
               }
               distData <- rpois(1000, lambda = input$param1)
               hist(distData, main = "Poisson Distribution", xlab = "Occurrences", ylab = "Frequency", col = col_main, border = col_border)
             }
      )
    })
  }, ignoreNULL = FALSE)
})
