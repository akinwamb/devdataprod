library(shiny)

shinyServer(function(input, output) {
  
  output$speedPlot <- renderPlot({

    # plot car stopping distace function of car speed
    plot(cars, main = "Car stopping distance", 
         xlab = "Speed (mph)", ylab = "Stopping distance (ft)", 
         xlim = c(0, 50), ylim = (c(0, 200)), pch = 19)
    m <- lm(dist ~ speed, data = cars)
    y <- predict(m, data.frame(speed = input$speed))
    y[y < 0] <- 0
    points(input$speed, y, col = "red", pch = 19)
    legend("topright", col = c("black", "red"), c("recorded distance", "estimated distance"), pch=19)
  
    output$text1 <- renderText({
      paste0("Car speed is: ", input$speed, " (mph)")
    })
    
    output$text2 <- renderText({
      paste0("Stopping distance is: ", y, " (ft)")
    })
  })

  
  
})
