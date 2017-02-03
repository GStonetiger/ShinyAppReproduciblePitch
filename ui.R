library(ggplot2)
library(shiny)

shinyUI(fluidPage(
  titlePanel("t vs Z Distribution"),

  sidebarLayout(
    sidebarPanel(
      "The t distribution, invented by William Gosset in 1908, has thicker tails than the normal. Also, instead of having two parameters, mean and variance, as the normal does, the t distribution has only one - the number of degrees of freedom (df).",
      "As df increases, the t distribution gets more like a standard normal, so it's centered around 0.",
      sliderInput(
        "df",
        label = "degree of freedom (df)",
        min = 1,
        max = 50,
        value = 3
      )
    ),
    mainPanel(plotOutput("ddistPlot"),
              plotOutput("qdistPlot"))
  )
))
