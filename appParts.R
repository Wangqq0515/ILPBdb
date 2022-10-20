#   ____________________________________________________________________________
#   Interact network                                                   ####

NetWork <- function() {
    tagList(
        div(class = "container",
            h1("query OG ID", class = "title fit-h1"),
            p("You can do searches of plant single cell literature using keywords by submitting your query in the search box ..."),
            p("A text mining was performed that allow us to highlight the most important keywords in searched plant scRNA literature and illustrated them as a word cloud."),
            fluidRow(column(12, textInput("networkid", "", "OG0033433", width = '100%', placeholder = "please input OG ID"))),
            fluidRow(column(5, br()),
                     column(2, submitButton("Search", icon("search"))),
                     column(5, br())
            ),
            hr(),
            hr(),
            fluidRow(column(6, echarts4rOutput(outputId = "igraphPlot", height = "500px", width = "100%")),
                    column(6, DT::DTOutput("igraphDT"))
                    ),
            hr()
        )
    )
}

#   ____________________________________________________________________________
#   Submit                                                                  ####
# https://stackoverflow.com/questions/20857068/sending-email-from-shiny
# https://github.com/senthilthyagarajan/shinyemail/blob/master/app.R
# https://www.geeksforgeeks.org/how-to-send-an-email-from-javascript/

submitMenu <- function() {
    tagList(
        div(class = "container",
            h1("Submit Data To Our Database or Facrback Question With Us", class = "title fit-h1"),
            pageWithSidebar(
                titlePanel(""),
                sidebarPanel(
                    textInput("fromEmail", "From:", value = "from@gmail.com"),
                    selectInput("emailType", "Contact Us For", c("Submit Data" = "SubmitData", "Faceback Question" = "FacebackQuestion")),
                    textInput("emailSubject", "Subject:", placeholder = "A subject"),
                    actionButton("sendEmail", icon = icon("envelope", lib = "font-awesome"), "Send mail"),
                    a(actionButton(inputId = "email1", label = "Contact Admin", 
                                   icon = icon("envelope", lib = "font-awesome")),
                      href="mailto:my_awesome_email_address.com")
                ),
                mainPanel(aceEditor("emailMessage", placeholder = "write message here",  height = "374px"))
            )
        )
    )
}

#   ____________________________________________________________________________
#   Download                                                                ####

downloadMenu <- function() {
    tagList(
        div(class = "container",
            h1("Download Data", class = "title fit-h1"),
            h2("Plant scRNA-seq Analysis Workflow Environment", class = "h2"),
            fluidRow(
                column(6, wellPanel(
                    h2("Environment", class = "h2"),
                    p(code("SingleCellCondaEnvironment.yml"), " file used to create a single cell analysis environment and ", code("RsessionInfo.txt"), " used to check the R packages version."),
                    fluidRow(
                        column(6, downloadButton('dn1',"SingleCellCondaEnvironment.yml",class="butt", href = "data/SingleCellCondaEnvironment.yml"),
                            br(), 
                            tags$head(tags$style(".butt{background-color:#230682;} .butt{color: #e6ebef;}"))),
                        column(6, downloadButton('dn2',"RsessionInfo.txt",class="butt", href = "data/RsessionInfo.txt"),
                            br(), 
                            tags$head(tags$style(".butt{background-color:#230682;} .butt{color: #e6ebef;}")))
                ))),
                column(6, wellPanel(
                    h2("Test Data", class = "h2"),
                    p("Include: Samples Metadata, Genes Annotation File, Mitochondria Genes, Chloroplast Genes, Marker Genes Of Known Cell-Type and filtered_feature_bc_matrix."),
                    fluidRow(
                        column(6, downloadButton('dn3',"TestData.tar.gz",class="butt", href = "data/TestData.tar.gz"),
                            br(), 
                            tags$head(tags$style(".butt{background-color:#230682;} .butt{color: #e6ebef;}")))
                )))
            ),
            hr(),
            h2("Reviewed Marker Genes", class = "h2"),
            fluidRow(
                column(12, wellPanel(
                    p("All markers have been evidenced via RNA in situ hybridization and GFP reporter. Besides, all results were verified manually."),
                    fluidRow(
                        column(12, downloadButton('dn4',"ReviewedMarkerGeneDatabase.csv",class="butt", href = "data/ReviewedMarkerGeneDatabase.csv"),
                            br(), 
                            tags$head(tags$style(".butt{background-color:#230682;} .butt{color: #e6ebef;}")))
                )))
            )
        )
    )
}
