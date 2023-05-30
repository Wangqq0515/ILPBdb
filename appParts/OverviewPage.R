#Overview
OverviewPage <- function() {
    fluidRow(
        div(
            class = "container",
            h1("Overview", class = "text-center fit-h1"),
            h2("description", class = "text-center fit-h2"),
            h3("Treatment of biological stress was integrated for 14 species",
                class = "text-center fit-h3"),
            box(title = "Treatment Number",
                status = "success",
                solidHeader=TRUE,
                collapsible = TRUE,
                width = NULL,
                echarts4rOutput(outputId = "summary_bar")),
            hr(),
            h3("The transcriptome data were re-analyzed", class = "text-center fit-h3"),
            fluidRow(box(title = "Data Size",
                    status = "info",
                    width = NULL,
                    solidHeader=TRUE,
                    collapsible = TRUE,
                    column(4, echarts4rOutput(outputId = "BioProject")),
                    column(4, echarts4rOutput(outputId = "BioSample")),
                    column(4, echarts4rOutput(outputId = "laboratory"))
                    )
            ),
            hr(),
            h3("Types of the biotic stress ", class = "text-center fit-h3"),
            box(title = "Detailed Table",
                status = "primary",
                width = NULL,
                solidHeader=TRUE,
                collapsible = TRUE,
                fluidRow(column(2),
                         column(3,
                             box(title = "species",
                                 status = "success",
                                 width = NULL,
                                 solidHeader=TRUE,
                                 collapsible = TRUE,
                                 shinyWidgets::pickerInput(
                                     inputId = "species",
                                     label = "Please select a species:",
                                     choices = species_ann_df$fullname,
                                     multiple = TRUE,
                                     options = list(`actions-box` = TRUE),
                                     selected = "Arabidopsis thaliana",
                                     width = "100%"
                                 )
                             )
                         ),
                         column(1),
                         column(4,
                             box(title = "type",
                                 status = "warning",
                                 width = NULL,
                                 solidHeader=TRUE,
                                 collapsible = TRUE,
                                 shinyWidgets::pickerInput(
                                     inputId = "Biotic",
                                     label = "Please select a type of biotic stress:",
                                     choices = c("bacteria", "fungus", "insect", "mites", "nematode", "virus"),
                                     multiple = TRUE,
                                     options = list(`actions-box` = TRUE),
                                     selected = "fungus",
                                     width = "100%"
                                 )
                             )
                         ),
                         column(2)),
                fluidRow(column(12, DTOutput("summary_speciesVShsot_Type_spe")))
            )
        )
    )
}
