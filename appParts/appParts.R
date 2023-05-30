library(shiny)
library(openxlsx)
library(plotly)
# library(shinyjs)
library(DT)
library(echarts4r)
library(shinydashboard)
library(shinydashboardPlus)
library(shinycssloaders)
# library(igraph)
# library(shinythemes)
library(htmltools)
# library(shinyBS)
library(dplyr)
# library(tidyr)
# library(kableExtra)
library(emayili)
# library(magrittr)
library(readr)
library(reactablefmtr)
library(shinyWidgets)
library(ggsci)
library(crosstalk)

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

#DEGpage
DEGpage <- function() {
    fluidRow(
        div(
            class = "container",
            h1("Differentially Expressed Genes(DEGs) Expression", class = "text-center fit-h1"),
            hr(),
            fluidRow(
                column(5,box(
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
                column(2),
                column(3,box(
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
                )),
                column(2)),
            fluidRow(
                column(6,box(title = "Down-regulation",
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
                column(6,box(title = "Up-regulation",
                           status = "info",
                           width = NULL,
                           solidHeader = TRUE,
                           collapsible = TRUE,
                           sliderTextInput(
                               inputId = "Up",
                               label = "Choose up range:", 
                               choices = seq(0,20),
                               selected = c(1, 5)
                           )))),
            fluidRow(
                column(12,box(title = "Expression",
                            status = "warning",
                            width = NULL,
                            # filter_slider("logFC", "logFC", ShareDEGfile, ~logFC, round = TRUE),
                            shinycssloaders::withSpinner(reactableOutput(outputId = "table"))
                ))
            )
        )
    )
}


################TFpage#######################
TFpage <- function(){
    fluidRow(
        div(
            class = "container",
            h1("Transcription Factor(TF) builds the GRN", class = "text-center fit-h1"),
            hr(),
            fluidRow(
                column(6,
                       box(
                           title = "TF",
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
                column(12,
                       box(
                           title = "GRN",
                           status = "warning",
                           width = NULL,
                           shinycssloaders::withSpinner(echarts4rOutput(outputId = "GRNnetwork"))
                       ))
                
            )
        )
    )
}

#############Rgene#####################
Rgene <- function() {
    fluidRow(
        div(
            class = "container",
            h1("defense-related gene", class = "text-center fit-h1"),
            hr(),
            fluidRow(
                column(6,
                      box(
                          title = "species",
                          status = "success",
                          width = NULL,
                          solidHeader = TRUE,
                          collapsible = TRUE,
                          selectInput(
                              inputId = "species2",
                              label = "Please select a species:",
                              choices = species_ann_df$species_name,
                              multiple = F,
                              #options = list(`actions-box` = TRUE),
                              selected = "Athaliana",
                              width = "100%"
                          )
                      )),
                column(6,box(
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

#Interact network

NetWorkpage <- function() {
    fluidRow(
        div(class = "container",
            h1("Co-expression Network", class = "text-center fit-h1"),
            hr(),
            h2("You can do searches of plant single cell literature using keywords by submitting your query in the search box ...", class = "text-center fit-h2"),
            column(6,
                   box(title = "Species",
                       status = "success",
                       width = NULL,
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       selectInput(
                           inputId = "speciesCO",
                           label = "Please select a species:",
                           choices = species_ann_df$species_name,
                           multiple = F,
                           #options = list(`actions-box` = TRUE),
                           selected = "Athaliana",
                           width = "100%"
                       )
                       )),
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
            h3("Hub gene", class = "text-center fit-h3"),
            column(12,
                   box(title = "CPPs",
                       status = "primary",
                       width = NULL,
                       solidHeader = TRUE,
                       collapsible = TRUE,
                       shinycssloaders::withSpinner(reactableOutput(outputId = "hubgene")))
                   ),
            h3("Co-Expression", class = "text-center fit-h3"),
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
                ),
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
