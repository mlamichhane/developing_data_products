library(shiny)

rain <- read.csv("annual_rainfall_by_station.csv", sep=",", stringsAsFactors = FALSE, na.strings = "NA")
#rain$Rainfall.mm. <- as.integer(as.character(rain$Rainfall..mm.))

shinyServer(
    function(input, output) {
      
      output$graph <- renderPlot({
        loc <- switch(input$location,
                      "Kathmandu" = "Kathmandu, Airport",
                      "Pokhara" = "Kaski, Pokhara  Airport",
                      "Biratnagar" = "Morang,Biratnagar Airport",
                      "Bhairahawa" = "Rupandehi,Bhairahawa",
                      "Birendranagar" = "Surkhet, Birendranagar")
        yearfrom = input$year[1]
        yearto = input$year[2]
        srain <- rain[which(gsub("^\\s+|\\s+$", "", rain$Station) == loc & (rain$Year >= yearfrom & rain$Year <= yearto)),]
        plot(srain$Year, srain$Rainfall..mm.,
             type = "b",
             main = "Annual Rainfall\n(from 2001-2012)",
             xlab = "Year",
             ylab = "Rainfall (in mm)")
      })
    }
  )