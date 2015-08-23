library(shiny)
library(datasets)

## Load mtcars dataset in R for performing analysis
mpgData <- mtcars
## Use Automatic and Manual as the factor for transmisson in place of O and 1 
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
  ## Create the reactive text that will be used for plotting
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  ## Create reactive text that will be used for Regression model
  formulaTextModel <- reactive({
    paste("mpg ~", "as.integer(", input$variable, ")")
  })
  
  ## Fit liner model for teh variables selected
  fit <- reactive({
    lm(as.formula(formulaTextModel()), data=mpgData)
  })
  
  ## Caption to be displayed
  output$caption <- renderText({
    formulaText()
  })
  
  ## Liner model output
  output$fit <- renderPrint({
    summary(fit())
  })
  
  ## Liner model plot
  output$mpgPlot <- renderPlot({
    with(mpgData, {
      plot(as.formula(formulaTextModel()))
      abline(fit(), col='red')
    })
  })
})