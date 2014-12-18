library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Annual Rainfall by Station (2001-2012)"),
  sidebarPanel(
    p("This little application explores the detail of annual rainfall from the year 2001 to 2012 
        recorded in various stations in Nepal. The data was obtained from the Open Nepal website.
    (http://data.opennepal.net/content/annual-rainfall-station)"),
    p("Use the navigations below to select the station and the range of years to view the detail."),
    br(),
    selectInput("location",
                label = "Select a station:",
                choices = c("Bhairahawa","Kathmandu", "Biratnagar", 
                            "Pokhara", "Birendranagar"),
                selected = "Kathmandu"
                ),
    br(),
    sliderInput("year",
                label = "Year range:",
                min = 2001, max = 2012, value = c(2001, 2012),
                format = "####")
    ),
  mainPanel(
      plotOutput("graph")
    )
  ))