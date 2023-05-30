#DEGpage
DEGpage <- function() {
    fluidRow(
        div(
            class = "container",
            h1("Differentially Expressed Genes(DEGs) Expression", class = "text-center fit-h1"),
            hr(),
            fluidRow(
                column(4,box(
                           title = "CPPs",
                           status = "success",
                           width = NULL,
                           solidHeader = TRUE,
                           collapsible = TRUE,
                           selectInput(
                               inputId = "Type",
                               label = "Please select a CPPs:",
                               choices = c(""),
                               multiple = F,
                               width = "100%"
                           )
                       )),
                # column(2),
                column(3,box(title = "Down-regulation",
                           status = "info",
                           width = NULL,
                           solidHeader = TRUE,
                           collapsible = TRUE,
                           sliderTextInput(
                               inputId = "Down",
                               label = "Choose down range:", 
                               choices = seq(0,-15),
                               selected = c(-1, -5)
                           )
                       )),
                column(3,box(title = "Up-regulation",
                           status = "info",
                           width = NULL,
                           solidHeader = TRUE,
                           collapsible = TRUE,
                           sliderTextInput(
                               inputId = "Up",
                               label = "Choose up range:", 
                               choices = seq(0,20),
                               selected = c(1, 5)
                           ))),
                column(2,box(
                    title = "DEG",
                    status = "success",
                    width = NULL,
                    height = 200,
                    solidHeader = TRUE,
                    collapsible = TRUE,
                    materialSwitch(
                        inputId = "ShowDEG",
                        label = "Displayable DEG", 
                        value = T,
                        status = "primary"
                    )
                ))
                ),
            fluidRow(
                column(12,box(title = "Expression",
                            status = "warning",
                            width = NULL,
                            # filter_slider("logFC", "logFC", ShareDEGfile, ~logFC, round = TRUE),
                            shinycssloaders::withSpinner(reactableOutput(outputId = "table"))
                ))),
            hr(),
            fluidRow(
              h1("Functional enrichment annotation", class = "text-center fit-h1"),
              hr(),
              column(7,box(title = "GO Enrichment",
                           status = "warning",
                           width = NULL,
                     shinycssloaders::withSpinner(echarts4rOutput(outputId = "GOAnn",
                                                             width = "100%")))),
              column(5,box(title = "GO Enrichment",
                            status = "warning",
                            width = NULL,
                            shinycssloaders::withSpinner(reactableOutput(outputId = "GOtable"))
              ))),
              hr(),
            fluidRow(
              column(7,box(title = "KEGG Enrichment",
                           status = "primary",
                           width = NULL,
                           shinycssloaders::withSpinner(echarts4rOutput(outputId = "KEGGAnn",
                                                                   width = "100%")))),
              column(5,box(title = "KEGG Enrichment",
                           status = "primary",
                           width = NULL,
                           shinycssloaders::withSpinner(reactableOutput(outputId = "KEGGtable"))
              )))
        )
    )
}
