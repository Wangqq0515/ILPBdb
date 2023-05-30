################TFpage#######################
TFpage <- function(){
    fluidRow(
        div(
            class = "container",
            h1("Transcription Factor (TF) builds the GRN", class = "text-center fit-h1"),
            hr(),
            fluidRow(
                column(6,box(title = "TF",
                           status = "success",
                           width = NULL,
                           solidHeader = TRUE,
                           collapsible = TRUE,
                           selectInput(
                               inputId = "TFfamily",
                               label = "Please select a TF family:",
                               choices = c(""),
                               multiple = F,
                               #options = list(`actions-box` = TRUE),
                               # selected = "",
                               width = "100%"
                           )
                       )),
                column(6,box(title = "TF",
                             status = "success",
                             width = NULL,
                             solidHeader = TRUE,
                             collapsible = TRUE,
                             shinycssloaders::withSpinner(reactableOutput(outputId = "TFtable"))
                )),
                column(12,
                       box(
                           title = "TF gene",
                           status = "success",
                           width = NULL,
                           solidHeader = TRUE,
                           collapsible = TRUE,
                           shinyWidgets::searchInput(
                               inputId = "TFgeneid",
                               label = "Enter your TF gene: ",
                               value = "AT2G28550",
                               placeholder = "e.g: AT2G28550",
                               btnSearch = icon("search"),
                               btnReset = icon("remove"),
                               width = '100%')
                       ))
            ),
            fluidRow(
                column(6,
                       box(
                           title = "GRN",
                           status = "warning",
                           solidHeader = TRUE,
                           collapsible = TRUE,
                           background = "gray",
                           width = NULL,
                           shinycssloaders::withSpinner(echarts4rOutput(outputId = "GRNnetwork"))
                       )),
                column(6,
                       box(
                         title = "GRN data",
                         status = "warning",
                         solidHeader = TRUE,
                         collapsible = TRUE,
                         width = NULL,
                         shinycssloaders::withSpinner(reactableOutput(outputId = "GRNtable"))
                       )),
                
            )
        )
    )
}
