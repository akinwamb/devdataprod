library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Car stopping distance function of speed"),
  
  h5("Description"),
  
  p('This app uses the cars dataset.',
    'The data give the speed of cars and the distances taken to stop.',
    'Note that the data were recorded in the 1920s.'),
  p('The plot shows the 50 observations recorded in the dataset, ', 
    'and the estimated stopping distance function of speed.'),
  
  tags$br(),
  
  # Sidebar
  sidebarLayout(
    sidebarPanel(
      sliderInput("speed", "Car Speed (mph)", 1, 50, 10),
      tags$hr(),
      p('Please use the slider to set the car speed.',
        'The car stopping distance will be computed in the next plot.')
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("speedPlot"),
      verbatimTextOutput("text1"),
      verbatimTextOutput("text2")
    )
  )
))
