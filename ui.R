library(shiny)
library(shinythemes) 
library(shinyjs) 

shinyUI(fluidPage(
  theme = shinytheme("united"), 
  titlePanel("Distribution Visualizer", windowTitle = "APMA 3150 APP"),
  sidebarLayout(
    sidebarPanel(
      tags$h3("Settings", class = "text-primary", style = "color: #002B5C;"), 
      selectInput("distType", "Select Distribution Type:",
                  choices = c("Normal" = "norm",
                              "Binomial" = "binom",
                              "Poisson" = "pois"),
                  selected = "norm"),
      conditionalPanel(
        condition = "input.distType == 'norm'",
        numericInput("param1", "Mean:", 0),
        numericInput("param2", "Standard Deviation:", 1)
      ),
      conditionalPanel(
        condition = "input.distType == 'binom'",
        numericInput("param1", "Number of Trials:", 1),
        numericInput("param2", "Probability of Success:", 0.5)
      ),
      conditionalPanel(
        condition = "input.distType == 'pois'",
        numericInput("param1", "Lambda (Rate of Occurrence):", 1)
      ),
      helpText("Adjust parameters based on the selected distribution type."),
      actionButton("submit", "Update Distribution", class = "btn-primary btn-lg"),
      tags$footer(style = "margin-top: 20px; color: #999;", "App created by Waseem Benamor and Mouad Elmellouki")
    ),
    mainPanel(
      tags$h3("Distribution Plot", class = "text-primary", style = "color: #002B5C;"), 
      plotOutput("distPlot"),
      helpText("Visualize the selected distribution with the parameters provided.")
    )
  ),
  tags$style(HTML("
    .shiny-output-error { 
      color: #D9534F; 
      font-weight: bold;
    }
    .text-primary { 
      color: #FF6F00;
    }
    .btn-primary {
      background-color: #FF6F00;
      border-color: #002B5C;
    }
    .btn-primary:hover {
      background-color: #FF6F00;
      border-color: #FF6F00;
    }
    .btn-lg {
      font-size: 18px;
      padding: 10px 16px;
    }
    .sidebar .well {
      background-color: #FFF3E0;
      border-color: #FF6F00;
    }
    .footer {
      font-size: 0.8em;
    }
    ")) 
))

