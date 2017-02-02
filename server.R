library(ggplot2)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$ddistPlot <- renderPlot({
    df <- input$df
    k <- 1000
    xvals <- seq(-5, 5, length = k)
    d <- data.frame(y = c(dnorm(xvals), dt(xvals, df)),
                    x = xvals,
                    dist = factor(rep(c("Normal", "T"), c(k, k))))
    g <- ggplot(d, aes(x = x, y = y))
    g <- g + geom_line(size = 2, aes(colour = dist))
    g <- g + ggtitle(paste("df=", df, ", dnorm(0) - dt(0, df)="
                           , round(dnorm(0) - dt(0, df), 3)))
    g
  })

  output$qdistPlot <- renderPlot({
    df <- input$df
    pvals <- seq(.5, .99, by = .01)
    d <- data.frame(n = qnorm(pvals),
                    t = qt(pvals, df),
                    p = pvals)
    g <- ggplot(d, aes(x = n, y = t))
    g <- g + geom_abline(size = 2, col = "lightblue")
    g <- g + geom_line(size = 2, col = "black")
    g <- g + geom_vline(xintercept = qnorm(0.975))
    g <- g + geom_hline(yintercept = qt(0.975, df))
    g <- g + ggtitle(paste("df=", df, ", qt(0.975, df) - qnorm(0.975)="
                           , round(qt(0.975, df) - qnorm(0.975), 3)))
    g
  })
})
