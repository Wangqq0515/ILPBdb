#Interact network
NetWorkpage <- function() {
    fluidRow(
        div(class = "container",
            h1("Co-expression Network", class = "text-center fit-h1"),
            hr(),
            h2("You can do searches of plant single cell literature using keywords by submitting your query in the search box ...", class = "text-center fit-h2"),
            fluidRow(
            column(3),
            column(6,
                   box(title = "CPPs",
                       status = "success",
                       width = NULL,
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       selectInput(
                           inputId = "CPPs",
                           label = "Please select a CPPs:",
                           choices = c(""),
                           multiple = F,
                           #options = list(`actions-box` = TRUE),
                           selected = "Athaliana",
                           width = "100%"
                       )
                   )),
            column(3)),
            fluidRow(
            hr(),
            div(h3("Hub gene", class = "text-center fit-h3")),
            column(12,
                   box(title = "CPPs",
                       status = "primary",
                       width = NULL,
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       shinycssloaders::withSpinner(reactableOutput(outputId = "hubgene")))
                   )),
            fluidRow(
            hr(),
            div(h3("Co-Expression", class = "text-center fit-h3")),
            fluidRow(column(3),
                     column(6,
                            box(title = "GENE",
                                status = "success",
                                width = NULL,
                                solidHeader = TRUE,
                                collapsible = TRUE,
                                shinyWidgets::searchInput(
                                    inputId = "netgeneid",
                                    label = "Enter your gene id: ",
                                    value = "",
                                    placeholder = "e.g: AT1G13820",
                                    btnSearch = icon("search"),
                                    btnReset = icon("remove"),
                                    width = '100%'))

                            ),
                     column(3)
                )),
            fluidRow(
                column(12,
                       box(
                           title = "NetWorks",
                           status = "danger",
                           width = NULL,
                           solidHeader = TRUE,
                           collapsible = TRUE,
                           echarts4rOutput(outputId = "igraphPlot", height = "500px", width = "100%")
                       )),
                column(12,
                       box(
                           title = "NetWorksData",
                           status = "danger",
                           width = NULL,
                           solidHeader = TRUE,
                           collapsible = TRUE,
                           shinycssloaders::withSpinner(reactableOutput(outputId = "igraphPlotDF"))
                       ))
            )
        )
    )
}
