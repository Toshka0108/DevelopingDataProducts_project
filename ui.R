shinyUI(pageWithSidebar(
    headerPanel("Predictions: train/test proportions"),
    sidebarPanel(
        numericInput("seed", "Set seed of randomization", min = 1, max = 100, value = 1,
                    step = 1),
        sliderInput("proportion", "Proportion of train data to all data.",
                    min = 12/32, max = 28/32, valu = 16/32, step = 4/32)
    ),
    mainPanel(
        plotOutput("plot")
    )
))