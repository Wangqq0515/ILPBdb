#Orthogroup
orthogroup_fun <- function() {
    fluidRow(
        div(
            class = "container",
            h1("Orthogroup", class = "text-center fit-h1"),
            h2("description", class = "text-center fit-h2"),
            h3("We constructed orthogroup of species to deepen the evolutionary links between species", class = "text-center fit-h3"),
            hr(),
            hr(),
            hr(),
            box(title = "Search Orthogroup",
                status = "primary",
                solidHeader=TRUE,
                collapsible = TRUE,
                width = NULL,
                fluidRow(column(12,
                                align="center",
                                actionBttn(
                                        inputId = "SO",
                                        label = "Search gene", 
                                        style = "bordered",
                                        color = "success",
                                        icon = icon("magnifying-glass")
                                        )
                                ),
                        column(12,
                                align="center",
                                uiOutput('pfam_name', container=h1),
                                DTOutput('pfam')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speAthalianaOut', container=h1),
                                textOutput('spe_AthalianaNo_out', container=h3),
                                DTOutput('spe_Athaliana_out')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speBdistachyonOut', container=h1),
                                textOutput('spe_BdistachyonNo_out', container=h3),
                                DTOutput('spe_Bdistachyon_out')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speBnapusOut', container=h1),
                                textOutput('spe_BnapusNo_out', container=h3),
                                DTOutput('spe_Bnapus_out')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speGhirsutumOut', container=h1),
                                textOutput('spe_GhirsutumNo_out', container=h3),
                                DTOutput('spe_Ghirsutum_out')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speGmaxOut', container=h1),
                                textOutput('spe_GmaxNo_out', container=h3),
                                DTOutput('spe_Gmax_out')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speHvulgareOut', container=h1),
                                textOutput('spe_HvulgareNo_out', container=h3),
                                DTOutput('spe_Hvulgare_out')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speMtruncatulaOut', container=h1),
                                textOutput('spe_MtruncatulaNo_out', container=h3),
                                DTOutput('spe_Mtruncatula_out')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speNtabacumOut', container=h1),
                                textOutput('spe_NtabacumNo_out', container=h3),
                                DTOutput('spe_Ntabacum_out')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speOsativaOut', container=h1),
                                textOutput('spe_OsativaNo_out', container=h3),
                                DTOutput('spe_Osativa_out')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speSbicolorOut', container=h1),
                                textOutput('spe_SbicolorNo_out', container=h3),
                                DTOutput('spe_Sbicolor_out')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speSlycopersicumOut', container=h1),
                                textOutput('spe_SlycopersicumNo_out', container=h3),
                                DTOutput('spe_Slycopersicum_out')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speStuberosumOut', container=h1),
                                textOutput('spe_StuberosumNo_out', container=h3),
                                DTOutput('spe_Stuberosum_out')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speTaestivumOut', container=h1),
                                textOutput('spe_TaestivumNo_out', container=h3),
                                DTOutput('spe_Taestivum_out')),
                        column(12,
                                align="center",
                                # h2("Athaliana", class = "text-center fit-h1"),
                                uiOutput('speZmaysOut', container=h1),
                                textOutput('spe_ZmaysNo_out', container=h3),
                                DTOutput('spe_Zmays_out'))
                        )
                ),
            box(title = "Orthogroup",
                status = "success",
                solidHeader=TRUE,
                collapsible = TRUE,
                width = NULL,
                shinycssloaders::withSpinner(DT::dataTableOutput("orthogroup_counts")))
            )
        )
}

