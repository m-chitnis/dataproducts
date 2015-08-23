library(shiny)

shinyUI(
  ## Create tabs UI
  navbarPage("mtcars Shiny App",
             tabPanel("User Application",
                      fluidPage(
                        ## Sidebarpanel for getting input
                        titlePanel("The relationship between key variables and miles per gallon (MPG)"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",               
                                          "Transmission" = "am",
                                          "Gears" = "gear",
                                          "Carburetors" = "carb"
                                        )),
                            submitButton("Submit")
                          ),
                          
                          ## Mainpanel for output
                          mainPanel(
                            h3(textOutput("caption")),
                            h4("BoxPlot"),
                            plotOutput("mpgBoxPlot"),
                            h4("Linear Regression Model Summary"),
                            verbatimTextOutput("fit")
                          )
                        )
                      )
             ),
             
             ## Documentation on using the app
             tabPanel("User Documentation",    
                      h4("Steps to run the application"),
                      p("On the 'User Application' tab, select the varibale first and then click 'Submit'."),
                      p("The BoxPlot Linear Regression Model Summary are displayed in the Main Panel.")
             ),                  
            
             ## Technical and Data
             tabPanel("Technical & Data Details",
                      h2("All the Source code can be find in GITHUB"),
                      a("https://github.com/m-chitnis/dataproducts"),
                      hr(),
                      h2("Motor Trend Car Road Tests"),
                      h3("Description"),
                      helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                               " and comprises fuel consumption and 10 aspects of automobile design and performance",
                               " for 32 automobiles (1973–74 models)."),
                      h3("Format"),
                      p("A data frame with 32 observations on 11 variables."),
                      p("  [, 1]   mpg         Miles/(US) gallon"),
                      p("  [, 2]   cyl   Number of cylinders"),
                      p("  [, 3]	 disp	 Displacement (cu.in.)"),
                      p("  [, 4]	 hp	 Gross horsepower"),
                      p("  [, 5]	 drat	 Rear axle ratio"),
                      p("  [, 6]	 wt	 Weight (lb/1000)"),
                      p("  [, 7]	 qsec	 1/4 mile time"),
                      p("  [, 8]	 vs	 V/S"),
                      p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                      p("  [,10]	 gear	 Number of forward gears"),
                      p("  [,11]	 carb	 Number of carburetors"),
                      h3("Source"),
                      p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411.")
                      
             )
  )
)