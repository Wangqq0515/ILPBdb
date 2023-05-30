#############RgenePage#####################
RgenePage <- function() {
    fluidRow(
        div(
            class = "container",
            h1("defense-related gene", class = "text-center fit-h1"),
            hr(),
            fluidRow(
                column(12,box(
                    title = "Rgene type",
                    status = "success",
                    width = NULL,
                    solidHeader = TRUE,
                    collapsible = TRUE,
                    shinyWidgets::pickerInput(
                        inputId = "Rgenetype",
                        label = "Please select a tpye:",
                        choices = c("CNL", "NL", "TNL"),
                        multiple = T,
                        options = list(`actions-box` = TRUE),
                        selected = c("CNL", "NL", "TNL"),
                        width = "100%"
                    )
                )
                )
            ),
            fluidRow(
                column(12,
                       box(
                           title = "Rgene",
                           status = "warning",
                           width = NULL,
                           shinycssloaders::withSpinner(reactableOutput(outputId = "Rgene"))
                       ))

            )
        )
    )
}
