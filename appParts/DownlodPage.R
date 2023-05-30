Downlodpage <- function() {
    fluidRow(
        div(
            class = "container",
            h1("Data Downlod", class = "text-center fit-h1"),
            tags$br(),
            tags$br(),
            box(title = h3("dicot", class = "text-center fit-h3"),
                status = "info",
                width = NULL,
                solidHeader = TRUE,
                collapsible = TRUE,
                fluidRow(
                    column(3,
                            box(title = "A. thaliana",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Athaliana',"RNAseq",class="butt", href = "www/data/Athaliana/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "A. thaliana",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Athaliana',"GRN",class="butt", href = "www/data/Athaliana/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "A. thaliana",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Rgene: ",
                                    downloadButton('Rgene_Download_Athaliana',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Athaliana/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "A. thaliana",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Athaliana',"network",class="butt", href = "www/data/Network_all/Athaliana/Athaliana.zip"))
                                )
                            ),
                    column(3,
                            box(title = "B. napus",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Bnapus',"RNAseq",class="butt", href = "www/data/Bnapus/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "B. napus",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Bnapus',"GRN",class="butt", href = "www/data/Bnapus/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "B. napus",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("R gene: ",
                                    downloadButton('Rgene_Download_Bnapus',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Bnapus/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "B. napus",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Bnapus',"network",class="butt", href = "www/data/Network_all/Bnapus/Bnapus.zip"))
                                )
                            ),
                    column(3,
                            box(title = "G. hirsutum",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Ghirsutum',"RNAseq",class="butt", href = "www/data/Ghirsutum/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "G. hirsutum",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Ghirsutum',"GRN",class="butt", href = "www/data/Ghirsutum/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "G. hirsutum",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("R gene: ",
                                    downloadButton('Rgene_Download_Ghirsutum',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Ghirsutum/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "G. hirsutum",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Ghirsutum',"network",class="butt", href = "www/data/Network_all/Ghirsutum/Ghirsutum.zip"))
                                )
                            ),
                    column(3,
                            box(title = "G. max",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Gmax',"RNAseq",class="butt", href = "www/data/Gmax/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "G. max",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Gmax',"GRN",class="butt", href = "www/data/Gmax/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "G. max",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("R gene: ",
                                    downloadButton('Rgene_Download_Gmax',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Gmax/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "G. max",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Gmax',"network",class="butt", href = "www/data/Network_all/Gmax/Gmax.zip"))
                                )
                            ),
                    column(3,
                            box(title = "M. truncatula",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Mtruncatula',"RNAseq",class="butt", href = "www/data/Mtruncatula/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "M. truncatula",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Mtruncatula',"GRN",class="butt", href = "www/data/Mtruncatula/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "M. truncatula",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("R gene: ",
                                    downloadButton('Rgene_Download_Mtruncatula',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Mtruncatula/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "M. truncatula",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Mtruncatula',"network",class="butt", href = "www/data/Network_all/Mtruncatula/Mtruncatula.zip"))
                                )
                            ),
                    column(3,
                            box(title = "S. tuberosum",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Stuberosum',"RNAseq",class="butt", href = "www/data/Stuberosum/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "S. tuberosum",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Stuberosum',"GRN",class="butt", href = "www/data/Stuberosum/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "S. tuberosum",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("R gene: ",
                                    downloadButton('Rgene_Download_Stuberosum',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Stuberosum/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "S. tuberosum",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Stuberosum',"network",class="butt", href = "www/data/Network_all/Stuberosum/Stuberosum.zip"))
                                )
                            ),
                    column(3,
                            box(title = "S. lycopersicum",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Slycopersicum',"RNAseq",class="butt", href = "www/data/Slycopersicum/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "S. lycopersicum",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Slycopersicum',"GRN",class="butt", href = "www/data/Slycopersicum/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "S. lycopersicum",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("R gene: ",
                                    downloadButton('Rgene_Download_Slycopersicum',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Slycopersicum/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "S. lycopersicum",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Slycopersicum',"network",class="butt", href = "www/data/Network_all/Slycopersicum/Slycopersicum.zip"))
                                )
                            ),
                    column(3,
                            box(title = "N. tabacum",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Ntabacum',"RNAseq",class="butt", href = "www/data/Ntabacum/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "N. tabacum",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Ntabacum',"GRN",class="butt", href = "www/data/Ntabacum/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "N. tabacum",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("R gene: ",
                                    downloadButton('Rgene_Download_Ntabacum',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Ntabacum/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "N. tabacum",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Ntabacum',"network",class="butt", href = "www/data/Network_all/Ntabacum/Ntabacum.zip"))
                                )
                            )
                    )
                ),
            box(title = h3("monocots", class = "text-center fit-h3"),
                status = "info",
                width = NULL,
                solidHeader = TRUE,
                collapsible = TRUE,
                fluidRow(
                    column(3,
                            box(title = "H. vulgare",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Hvulgare',"RNAseq",class="butt", href = "www/data/Hvulgare/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "H. vulgare",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Hvulgare',"GRN",class="butt", href = "www/data/Hvulgare/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "H. vulgare",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("R gene: ",
                                    downloadButton('Rgene_Download_Hvulgare',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Hvulgare/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "H. vulgare",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Hvulgare',"network",class="butt", href = "www/data/Network_all/Hvulgare/Hvulgare.zip"))
                                )
                            ),
                    column(3,
                            box(title = "T. aestivum",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Taestivum',"RNAseq",class="butt", href = "www/data/Taestivum/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "T. aestivum",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Taestivum',"GRN",class="butt", href = "www/data/Taestivum/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "T. aestivum",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("R gene: ",
                                    downloadButton('Rgene_Download_Taestivum',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Taestivum/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "T. aestivum",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Taestivum',"network",class="butt", href = "www/data/Network_all/Taestivum/Taestivum.zip"))
                                )
                            ),
                    column(3,
                            box(title = "B. distachyon",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Bdistachyon',"RNAseq",class="butt", href = "www/data/Bdistachyon/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "B. distachyon",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Bdistachyon',"GRN",class="butt", href = "www/data/Bdistachyon/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "B. distachyon",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("R gene: ",
                                    downloadButton('Rgene_Download_Bdistachyon',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Bdistachyon/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "B. distachyon",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Bdistachyon',"network",class="butt", href = "www/data/Network_all/Bdistachyon/Bdistachyon.zip"))
                                )
                            ),
                    column(3,
                            box(title = "O. sativa",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Osativa',"RNAseq",class="butt", href = "www/data/Osativa/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "O. sativa",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Osativa',"GRN",class="butt", href = "www/data/Osativa/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "O. sativa",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("R gene: ",
                                    downloadButton('Rgene_Download_Osativa',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Osativa/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "O. sativa",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Osativa',"network",class="butt", href = "www/data/Network_all/Osativa/Osativa.zip"))
                                )
                            ),
                    column(3,
                            box(title = "S. bicolor",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Sbicolor',"RNAseq",class="butt", href = "www/data/Sbicolor/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "S. bicolor",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Sbicolor',"GRN",class="butt", href = "www/data/Sbicolor/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "S. bicolor",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("R gene: ",
                                    downloadButton('Rgene_Download_Sbicolor',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Sbicolor/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "S. bicolor",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Sbicolor',"network",class="butt", href = "www/data/Network_all/Sbicolor/Sbicolor.zip"))
                                )
                            ),
                    column(3,
                            box(title = "Z. mays",
                                status = "primary",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("RNAseq: ",
                                    downloadButton('RNAseq_Download_Zmays',"RNAseq",class="butt", href = "www/data/Zmays/RNAseq.zip"))
                                )
                            ),
                    column(3,
                            box(title = "Z. mays",
                                status = "success",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("GRN: ",
                                    downloadButton('GRN_Download_Zmays',"GRN",class="butt", href = "www/data/Zmays/GRN.zip"))
                                )
                            ),
                    column(3,
                            box(title = "Z. mays",
                                status = "warning",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("R gene: ",
                                    downloadButton('Rgene_Download_Zmays',"Rgene",class="butt", href = "www/data/Rgene_NBS_LRR_ann/Zmays/Rgene_NBS_LRR_DEG.txt"))
                                )
                            ),
                    column(3,
                            box(title = "Z. mays",
                                status = "danger",
                                width = NULL,
                                solidHeader = F,
                                collapsible = F,
                                h4("Co-expression ",
                                    downloadButton('network_Download_Zmays',"network",class="butt", href = "www/data/Network_all/Zmays/Zmays.zip"))
                                )
                            )
                    )
                )
            )
        )
}
