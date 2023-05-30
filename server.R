shinyServer(function(input, output, session) {
    #Updated Day 
    output$footerModifiedDay <-
        renderText(paste0("Updated ", modifiedDay))
    output$aboutModifiedDay <-
        renderText(paste0("Last modified at ", modifiedDay))
    
    #overview
    output$summary_bar <- renderEcharts4r({
        spe_host_count %>% 
            echarts4r::group_by(Species_Class) %>%
            echarts4r::e_chart(species_name2) %>% 
            echarts4r::e_bar(total) %>% 
            echarts4r::e_color(c("#1B998B", "#ED217C")) %>% 
            e_x_axis(axisLabel = list(interval = 0, rotate = 40, fontStyle="italic", fontWeight="bolder",fontSize=12),
                     nameTextStyle = list(fontSize=20),
                     name = "species",
                     formatter = '{value}') %>%
            e_y_axis(axisLabel = list(fontWeight="bolder",fontSize=12),
                     nameTextStyle = list(fontSize=20),
                     name = "treatment number",
                     formatter = '{value}') %>%
            e_toolbox_feature(feature = "dataView") %>% 
            e_toolbox_feature(feature = "dataZoom") %>% 
            e_labels(fontSize = 15) %>% 
            e_tooltip(trigger = "axis")
    })
    
    #总的BioProject
    output$BioProject <- renderEcharts4r({
        e_charts() %>%
            echarts4r::e_gauge(
                BioProject,
                "BioProject",
                min = 1,
                max = 200,
                progress = list(show = T),
                detail = list(color = "#04E762"),
                itemStyle = list(color = "#04E762")
            )
    })
    
    output$BioSample <- renderEcharts4r({
        e_charts() %>%
            echarts4r::e_gauge(
                BioSample,
                "BioSample",
                max = 5000,
                min = 10,
                progress = list(show = T),
                detail = list(color = "#F5B700"),
                itemStyle = list(color = "#F5B700")
            )
    })
    
    output$laboratory <- renderEcharts4r({
        e_charts() %>%
            echarts4r::e_gauge(
                laboratory,
                "Laboratory",
                max = 300,
                min = 1,
                progress = list(show = T),
                detail = list(color = "#C200FB"),
                itemStyle = list(color = "#C200FB")
            )
    })
    
    #查询各个物种的处理
    output$summary_speciesVShsot_Type_spe <- renderDT(
        summary_speciesVShsot_Type[which(summary_speciesVShsot_Type$species %in% input$species),][which(summary_speciesVShsot_Type[which(summary_speciesVShsot_Type$species %in% input$species),]$class %in% input$Biotic),]
    )
    
    ######查询orthogroup相关
    orthogroup_counts <- formattable(orthogroup_counts %>% head(n=10),
                list(
                    # area(col = A.th:Z.ma) ~color_tile("Grey", "orange"),
                    A.th=color_tile("white", "orange"),## 白色到橘色渐变
                    B.di=color_tile("white", "orange"),
                    B.na=color_tile("white", "orange"),
                    G.hi=color_tile("white", "orange"),
                    G.max=color_tile("white", "orange"),
                    H.vu=color_tile("white", "orange"),
                    M.tr=color_tile("white", "orange"),
                    N.ta=color_tile("white", "orange"),
                    O.sa=color_tile("white", "orange"),
                    S.bi=color_tile("white", "orange"),
                    S.ly=color_tile("white", "orange"),
                    S.tu=color_tile("white", "orange"),
                    T.ae=color_tile("white", "orange"),
                    Z.ma=color_tile("white", "orange"),
                    Type = formatter("span", style = x ~ ifelse(x == "variable", 
                                                                formattable::style(color = "green", font.weight = "bold"),
                                                                ifelse(x == "core",formattable::style(color = "red", font.weight = "bold"),
                                                                       formattable::style(color = "orange", font.weight = "bold"))
                    ))
                ))
    output$orthogroup_counts <- DT::renderDataTable({
        return(as.datatable(orthogroup_counts))
    })
    
    
    # Return the UI for a modal dialog with data selection input. If 'failed' is
    # TRUE, then display a message that the previous value was invalid.
    dataModal <- function(failed = FALSE) {
        modalDialog(
            textInput("SO_geneid", "Please input gene id:",
                      placeholder = 'Try "AT1G29420" or "LOC_Os09g37350"'
            ),
            span(div("You can enter the gene ID of the species:",
                            p("The following display example: "),
                            html("<table>
                                        <tr>
                                            <th>Species</th>
                                            <th>Gene id</th>
                                        </tr>
                                        <tr>
                                            <td>A.thaliana:</td>
                                            <td>AT1G29420</td>
                                        <tr>
                                            <td>B.distachyon:</td>
                                            <td>Bradi3g42240</td>
                                        <tr>
                                            <td>B.napus:</td>
                                            <td>BnaA08T0208700ZS</td>
                                        <tr>
                                            <td>G.hirsutum:</td>
                                            <td>Ghir_A01G016510</td>
                                        <tr>
                                            <td>G.max:</td>
                                            <td>Glyma.11G096800</td>
                                        <tr>
                                            <td>H.vulgare:</td>
                                            <td>HORVU5Hr1G017100</td>
                                        <tr>
                                            <td>M.truncatula:</td>
                                            <td>Medtr4g075760</td>
                                        <tr>
                                            <td>N.tabacum:</td>
                                            <td>mRNA_101044_cds</td>
                                        <tr>
                                            <td>O.sativa:</td>
                                            <td>LOC_Os09g37350</td>
                                        <tr>
                                            <td>S.bicolor:</td>
                                            <td>Sobic.001G184650</td>
                                        <tr>
                                            <td>S.lycopersicum:</td>
                                            <td>Solyc04g052910</td>
                                        <tr>
                                            <td>S.tuberosum:</td>
                                            <td>Soltu.DM.04G023120</td>
                                        <tr>
                                            <td>T.aestivum:</td>
                                            <td>TraesCS5A03G0821800</td>
                                        <tr>
                                            <td>Z.mays:</td>
                                            <td>Zm00001d006276</td>"),
                            style = "color: red;")),
            if (failed)
                div(tags$b("Invalid name of gene id", style = "color: red;")),
            footer = tagList(
                modalButton("Cancel"),
                actionButton("ok", "OK")
            )
        )
    }
    # Show modal when button is clicked.
    observeEvent(input$SO, {
        showModal(dataModal())
    })
    # When OK button is pressed, attempt to load the data set. If successful,
    # remove the modal. If not show another modal, but this time with a failure
    # message.
    observeEvent(input$ok, {
        # Check that data object exists and is data frame.
        if (!is.null(input$SO_geneid) && nzchar(input$SO_geneid) && nrow(dplyr::filter_all(orthogroup, any_vars(grepl(input$SO_geneid, .)))) > 0) {
            # SO_geneid="Bradi1g09160"
            selected_geneid_df <- orthogroup %>% filter_all(any_vars(grepl(input$SO_geneid, .))) %>% as.data.frame()
            selectedOGid <- selected_geneid_df$orthogroup
            selectedOGid_pfam <- Orthogroups_pfam[which(Orthogroups_pfam$orthogroup %in% selectedOGid),]
            output$pfam_name <- renderText({
                HTML("Pfam Database Annotation")
            })
            output$pfam = renderDT(
                selectedOGid_pfam, rownames = FALSE, options = list(lengthChange = FALSE,dom = 't')
            )
            # Athaliana
            spe_Athaliana<- selected_geneid_df[,"Athaliana"]
            output$speAthalianaOut <- renderText({
                HTML(paste0("<i>","<b>","A.thaliana","</b>","</i>"))
            })
            if (spe_Athaliana==0) {
                        output$spe_AthalianaNo_out <- renderText({
                            "No data"
                        })
            } else {
                spe_Athaliana_V <- strsplit(spe_Athaliana, ";")[[1]]
                spe_Athaliana_V <- c(spe_Athaliana_V, rep(NA, each=5-length(spe_Athaliana_V)%%5))
                spe_Athaliana_M <- matrix(spe_Athaliana_V,ncol=5, byrow=T)
                output$spe_Athaliana_out = renderDT(
                                as.data.frame(spe_Athaliana_M), rownames = FALSE, options = list(lengthChange = FALSE,dom = 't',ordering=F)
                            )
            }
            # Bdistachyon
            spe_Bdistachyon<- selected_geneid_df[,"Bdistachyon"]
            output$speBdistachyonOut <- renderText({
                HTML(paste0("<i>","<b>","B.distachyon","</b>","</i>"))
            })
            if (spe_Bdistachyon==0) {
                output$spe_BdistachyonNo_out <- renderText({
                    "No data"
                })
            } else {
                spe_Bdistachyon_V <- strsplit(spe_Bdistachyon, ";")[[1]]
                spe_Bdistachyon_V <- c(spe_Bdistachyon_V, rep(NA, each=5-length(spe_Bdistachyon_V)%%5))
                spe_Bdistachyon_M <- matrix(spe_Bdistachyon_V,ncol=5, byrow=T)
                output$spe_Bdistachyon_out = renderDT(
                    as.data.frame(spe_Bdistachyon_M), rownames = FALSE,  options = list(lengthChange = FALSE,dom = 't',ordering=F)
                )
            }
            # Bnapus
            spe_Bnapus<- selected_geneid_df[,"Bnapus"]
            output$speBnapusOut <- renderText({
                HTML(paste0("<i>","<b>","B.napus","</b>","</i>"))
            })
            if (spe_Bnapus==0) {
                output$spe_BnapusNo_out <- renderText({
                    "No data"
                })
            } else {
                spe_Bnapus_V <- strsplit(spe_Bnapus, ";")[[1]]
                spe_Bnapus_V <- c(spe_Bnapus_V, rep(NA, each=5-length(spe_Bnapus_V)%%5))
                spe_Bnapus_M <- matrix(spe_Bnapus_V,ncol=5, byrow=T)
                output$spe_Bnapus_out = renderDT(
                    as.data.frame(spe_Bnapus_M), rownames = FALSE,  options = list(lengthChange = FALSE,dom = 't',ordering=F)
                )
            }
            # Ghirsutum
            spe_Ghirsutum<- selected_geneid_df[,"Ghirsutum"]
            output$speGhirsutumOut <- renderText({
                HTML(paste0("<i>","<b>","G.hirsutum","</b>","</i>"))
            })
            if (spe_Ghirsutum==0) {
                output$spe_GhirsutumNo_out <- renderText({
                    "No data"
                })
            } else {
                spe_Ghirsutum_V <- strsplit(spe_Ghirsutum, ";")[[1]]
                spe_Ghirsutum_V <- c(spe_Ghirsutum_V, rep(NA, each=5-length(spe_Ghirsutum_V)%%5))
                spe_Ghirsutum_M <- matrix(spe_Ghirsutum_V,ncol=5, byrow=T)
                output$spe_Ghirsutum_out = renderDT(
                    as.data.frame(spe_Ghirsutum_M), rownames = FALSE,  options = list(lengthChange = FALSE,dom = 't',ordering=F)
                )
            }
            # Gmax
            spe_Gmax<- selected_geneid_df[,"Gmax"]
            output$speGmaxOut <- renderText({
                HTML(paste0("<i>","<b>","G.max","</b>","</i>"))
            })
            if (spe_Gmax==0) {
                output$spe_GmaxNo_out <- renderText({
                    "No data"
                })
            } else {
                spe_Gmax_V <- strsplit(spe_Gmax, ";")[[1]]
                spe_Gmax_V <- c(spe_Gmax_V, rep(NA, each=5-length(spe_Gmax_V)%%5))
                spe_Gmax_M <- matrix(spe_Gmax_V,ncol=5, byrow=T)
                output$spe_Gmax_out = renderDT(
                    as.data.frame(spe_Gmax_M), rownames = FALSE,  options = list(lengthChange = FALSE,dom = 't',ordering=F)
                )
            }
            # Hvulgare
            spe_Hvulgare<- selected_geneid_df[,"Hvulgare"]
            output$speHvulgareOut <- renderText({
                HTML(paste0("<i>","<b>","H.vulgare","</b>","</i>"))
            })
            if (spe_Hvulgare==0) {
                output$spe_HvulgareNo_out <- renderText({
                    "No data"
                })
            } else {
                spe_Hvulgare_V <- strsplit(spe_Hvulgare, ";")[[1]]
                spe_Hvulgare_V <- c(spe_Hvulgare_V, rep(NA, each=5-length(spe_Hvulgare_V)%%5))
                spe_Hvulgare_M <- matrix(spe_Hvulgare_V,ncol=5, byrow=T)
                output$spe_Hvulgare_out = renderDT(
                    as.data.frame(spe_Hvulgare_M), rownames = FALSE,  options = list(lengthChange = FALSE,dom = 't',ordering=F)
                )
            }
            # Mtruncatula
            spe_Mtruncatula<- selected_geneid_df[,"Mtruncatula"]
            output$speMtruncatulaOut <- renderText({
                HTML(paste0("<i>","<b>","M.truncatula","</b>","</i>"))
            })
            if (spe_Mtruncatula==0) {
                output$spe_MtruncatulaNo_out <- renderText({
                    "No data"
                })
            } else {
                spe_Mtruncatula_V <- strsplit(spe_Mtruncatula, ";")[[1]]
                spe_Mtruncatula_V <- c(spe_Mtruncatula_V, rep(NA, each=5-length(spe_Mtruncatula_V)%%5))
                spe_Mtruncatula_M <- matrix(spe_Mtruncatula_V,ncol=5, byrow=T)
                output$spe_Mtruncatula_out = renderDT(
                    as.data.frame(spe_Mtruncatula_M), rownames = FALSE,  options = list(lengthChange = FALSE,dom = 't',ordering=F)
                )
            }
            # Ntabacum
            spe_Ntabacum<- selected_geneid_df[,"Ntabacum"]
            output$speNtabacumOut <- renderText({
                HTML(paste0("<i>","<b>","N.tabacum","</b>","</i>"))
            })
            if (spe_Ntabacum==0) {
                output$spe_NtabacumNo_out <- renderText({
                    "No data"
                })
            } else {
                spe_Ntabacum_V <- strsplit(spe_Ntabacum, ";")[[1]]
                spe_Ntabacum_V <- c(spe_Ntabacum_V, rep(NA, each=5-length(spe_Ntabacum_V)%%5))
                spe_Ntabacum_M <- matrix(spe_Ntabacum_V,ncol=5, byrow=T)
                output$spe_Ntabacum_out = renderDT(
                    as.data.frame(spe_Ntabacum_M), rownames = FALSE,  options = list(lengthChange = FALSE,dom = 't',ordering=F)
                )
            }
            # Osativa
            spe_Osativa<- selected_geneid_df[,"Osativa"]
            output$speOsativaOut <- renderText({
                HTML(paste0("<i>","<b>","O.sativa","</b>","</i>"))
            })
            if (spe_Osativa==0) {
                output$spe_OsativaNo_out <- renderText({
                    "No data"
                })
            } else {
                spe_Osativa_V <- strsplit(spe_Osativa, ";")[[1]]
                spe_Osativa_V <- c(spe_Osativa_V, rep(NA, each=5-length(spe_Osativa_V)%%5))
                spe_Osativa_M <- matrix(spe_Osativa_V,ncol=5, byrow=T)
                output$spe_Osativa_out = renderDT(
                    as.data.frame(spe_Osativa_M), rownames = FALSE,  options = list(lengthChange = FALSE,dom = 't',ordering=F)
                )
            }
            # Sbicolor
            spe_Sbicolor<- selected_geneid_df[,"Sbicolor"]
            output$speSbicolorOut <- renderText({
                HTML(paste0("<i>","<b>","S.bicolor","</b>","</i>"))
            })
            if (spe_Sbicolor==0) {
                output$spe_SbicolorNo_out <- renderText({
                    "No data"
                })
            } else {
                spe_Sbicolor_V <- strsplit(spe_Sbicolor, ";")[[1]]
                spe_Sbicolor_V <- c(spe_Sbicolor_V, rep(NA, each=5-length(spe_Sbicolor_V)%%5))
                spe_Sbicolor_M <- matrix(spe_Sbicolor_V,ncol=5, byrow=T)
                output$spe_Sbicolor_out = renderDT(
                    as.data.frame(spe_Sbicolor_M), rownames = FALSE,  options = list(lengthChange = FALSE,dom = 't',ordering=F)
                )
            }
            # Slycopersicum
            spe_Slycopersicum<- selected_geneid_df[,"Slycopersicum"]
            output$speSlycopersicumOut <- renderText({
                HTML(paste0("<i>","<b>","S.lycopersicum","</b>","</i>"))
            })
            if (spe_Slycopersicum==0) {
                output$spe_SlycopersicumNo_out <- renderText({
                    "No data"
                })
            } else {
                spe_Slycopersicum_V <- strsplit(spe_Slycopersicum, ";")[[1]]
                spe_Slycopersicum_V <- c(spe_Slycopersicum_V, rep(NA, each=5-length(spe_Slycopersicum_V)%%5))
                spe_Slycopersicum_M <- matrix(spe_Slycopersicum_V,ncol=5, byrow=T)
                output$spe_Slycopersicum_out = renderDT(
                    as.data.frame(spe_Slycopersicum_M), rownames = FALSE,  options = list(lengthChange = FALSE,dom = 't',ordering=F)
                )
            }
            # Stuberosum
            spe_Stuberosum<- selected_geneid_df[,"Stuberosum"]
            output$speStuberosumOut <- renderText({
                HTML(paste0("<i>","<b>","S.tuberosum","</b>","</i>"))
            })
            if (spe_Stuberosum==0) {
                output$spe_StuberosumNo_out <- renderText({
                    "No data"
                })
            } else {
                spe_Stuberosum_V <- strsplit(spe_Stuberosum, ";")[[1]]
                spe_Stuberosum_V <- c(spe_Stuberosum_V, rep(NA, each=5-length(spe_Stuberosum_V)%%5))
                spe_Stuberosum_M <- matrix(spe_Stuberosum_V,ncol=5, byrow=T)
                output$spe_Stuberosum_out = renderDT(
                    as.data.frame(spe_Stuberosum_M), rownames = FALSE,  options = list(lengthChange = FALSE,dom = 't',ordering=F)
                )
            }
            # Taestivum
            spe_Taestivum<- selected_geneid_df[,"Taestivum"]
            output$speTaestivumOut <- renderText({
                HTML(paste0("<i>","<b>","T.aestivum","</b>","</i>"))
            })
            if (spe_Taestivum==0) {
                output$spe_TaestivumNo_out <- renderText({
                    "No data"
                })
            } else {
                spe_Taestivum_V <- strsplit(spe_Taestivum, ";")[[1]]
                spe_Taestivum_V <- c(spe_Taestivum_V, rep(NA, each=5-length(spe_Taestivum_V)%%5))
                spe_Taestivum_M <- matrix(spe_Taestivum_V,ncol=5, byrow=T)
                output$spe_Taestivum_out = renderDT(
                    as.data.frame(spe_Taestivum_M), rownames = FALSE,  options = list(lengthChange = FALSE,dom = 't',ordering=F)
                )
            }
            # Zmays
            spe_Zmays<- selected_geneid_df[,"Zmays"]
            output$speZmaysOut <- renderText({
                HTML(paste0("<i>","<b>","Z.mays","</b>","</i>"))
            })
            if (spe_Zmays==0) {
                output$spe_ZmaysNo_out <- renderText({
                    "No data"
                })
            } else {
                spe_Zmays_V <- strsplit(spe_Zmays, ";")[[1]]
                spe_Zmays_V <- c(spe_Zmays_V, rep(NA, each=5-length(spe_Zmays_V)%%5))
                spe_Zmays_M <- matrix(spe_Zmays_V,ncol=5, byrow=T)
                output$spe_Zmays_out = renderDT(
                    as.data.frame(spe_Zmays_M), rownames = FALSE,  options = list(lengthChange = FALSE,dom = 't',ordering=F)
                )
            }
            removeModal()
        } else {
            showModal(dataModal(failed = TRUE))
        }
    })
    # output$dataInfo <- renderPrint({
    #     if (is.null(input$SO_geneid))
    #         "No data selected"
    #     else
    #         
    # })

    
    #每个物种的的host和treat, 创造联动选择框
    ######更新Type
    observe({
        spec <- input$species_name
        host <- unique(all_spe_host_treat[which(all_spe_host_treat$species %in% spec)]$host)
        shiny::updateSelectInput(session, "Type",
                          choices = host,
                          selected = host[1])
    })
    
    ######更新Treat
    observe({
        spec <- input$species_name
        Type <- input$Type
        treat_df <- all_spe_host_treat %>% dplyr::filter(species == spec, host == Type)
        treat <- treat_df$treat
        updatePickerInput(session, "Treat",
                                 choices = treat,
                                 selected = treat)
    })
    
    #读入每个物种的差异倍数表格
    Sharefile <- reactive({
        Allgenefilename <- paste0("www/data/",input$species_name,"/RNAseq/", input$Type, "/DEG/all_genes_GO.txt")
        # Allgenefilename <- paste0("www/data/","Athaliana","/RNAseq/", "A.brassicicola", "/DEG/all_genes_GO.txt")
        Allgene <- data.table::fread(Allgenefilename, header = T, sep = "\t") %>%  dplyr::mutate(logFC_cols = dplyr::case_when(
            logFC <= -1 & logFC >= -2 ~ "#9DA0FB",
            logFC < -2 & logFC >= -3 ~ "#767AF9",
            logFC < -3 & logFC >= -4 ~ "#4F54F8",
            logFC < -4 & logFC >= -5 ~ "#282EF6",
            logFC < -5 & logFC >= -6 ~ "#0A11EB",
            logFC < -6  ~ "#0910D7",
            logFC >= 1 & logFC <= 2 ~ "#FF8585",
            logFC > 2 & logFC <= 3 ~ "#FF7070",
            logFC > 3 & logFC <= 4 ~ "#FF5C5C",
            logFC > 4 & logFC <= 5 ~ "#FF4747",
            logFC > 5 & logFC <= 6 ~ "#FF3333",
            logFC > 6 & logFC <= 7 ~ "#FF1F1F",
            logFC > 7 & logFC <= 8 ~ "#FF0A0A",
            logFC > 8 & logFC <= 9 ~ "#F50000",
            logFC > 9 & logFC <= 10 ~ "#E00000",
            logFC > 10  ~ "#CC0000",
            TRUE ~ 'grey'
        ),
        FDR_cols = dplyr::case_when(
            FDR <= 0.05 ~ "#38A2BC",
            TRUE ~ '#FFFFFF'
        ))
        # DEGfilename <- paste0("www/data/","Athaliana","/RNAseq/", "S.melonis", "/DEG/all_genes_Ann.txt")
        if (input$ShowDEG) {
            Allgene <- Allgene %>% dplyr::filter(logFC <= input$Down[1] & logFC >= input$Down[2] | logFC <= input$Up[2] & logFC >= input$Up[1])
            Sharefile <- SharedData$new(Allgene)
            return(Sharefile)
        } else {
            DEGgene <- Allgene %>% dplyr::filter(abs(logFC) >=1 & FDR <= 0.05)
            Sharefile <- SharedData$new(DEGgene)
            return(Sharefile)
        }
    })
    
    output$table <- renderReactable({
        # bscols(
        #     widths = c(3, 9),
        #     list(filter_checkbox("treat", "treat", data, ~treat, inline = TRUE),
        #         filter_slider("logFC", "logFC", data, ~logFC, round = TRUE)),
            Sharefile2 <- Sharefile()
            reactable(
                Sharefile2,
                compact = F,
                #使表格更加紧凑
                #pageSizeOptions = 25,
                # defaultPageSize = 15,#表的大小
                #pageSizeOptions = c(25, 25, 50, 100),
                showSortIcon = T,
                searchable = T,
                #不显示表的信息
                theme = reactableTheme(
                            borderColor = "#dfe2e5",
                            stripedColor = "#f6f8fa",
                            highlightColor = "#f0f5f9",
                            # cellPadding = "8px 12px",
                            style = list(
                            fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Times New Roman, sans-serif"
                                ),
                        searchInputStyle = list(width = "100%")
                        ),
                filterable = F,
                width = "auto",
                columns = list(
                    Orthogroup = colDef(maxWidth = 90,name = 'Orthogroup'),
                    gene_id = colDef(maxWidth = 100,name = 'gene id'),
                    gene_uniprotid = colDef(maxWidth = 100, name = 'uniprot id'),
                    uniprot_gene_name = colDef(maxWidth = 350,name = 'gene name'),
                    treat = colDef(maxWidth = 250,name = "treat"),
                    # logFC = colDef(maxWidth = 350,name = "logFC",align = 'center',
                    #                cell = data_bars(data = Sharefile2,
                    #                                 text_position = 'inside-base',
                    #                                 box_shadow = TRUE,
                    #                                 fill_color_ref = "logFC_cols",
                    #                                 animation = 'width 0.4s linear'
                    #                                 )
                    #                 ),
                    # logFC = colDef(maxWidth = 100,name = "logFC",
                    #                 format=colFormat(digits=4)),
                    # FDR = colDef(name = "q.value",
                    #              format=colFormat(digits=4),
                    #              cell = reactablefmtr::pill_buttons(data = dataSharefile,
                    #                                  color_ref = "FDR_cols"
                    #                                  )
                    #              ),
                    # FDR = colDef(maxWidth = 100,name = "q.value",
                    #             format=colFormat(digits=6)),
                    FDR = colDef(show = FALSE),
                    logFC_cols = colDef(show = FALSE),
                    FDR_cols = colDef(show = FALSE)
                    )
                )
        # )
    })
    
    #读入KEGG和GO注释文件
    GOAnnfile <- reactive({
        GOAnnfilename <- paste0("www/data/",input$species_name,"/RNAseq/", input$Type, "/DEG/go_rich.txt")
        # GOAnnfilename <- paste0("www/data/","Athaliana","/RNAseq/", "S.melonis", "/DEG/go_rich.txt")
        GOAnnfile <- data.table::fread(GOAnnfilename, header = T, sep = "\t")
        GOAnnfile$GeneRatio2 <- apply(GOAnnfile %>% dplyr::select(GeneRatio),1,function(x) eval(parse(text=x)))
        GOAnnfile$logQvalue <- -log10(GOAnnfile$qvalue)
        GOAnnfile$Description <- factor(GOAnnfile$Description, levels = GOAnnfile$Description)
        return(GOAnnfile)
    })
    my_scale <- function(x) scales::rescale(x, to = c(2, 20))
    output$GOAnn <- renderEcharts4r({
        GOAnnfile <- GOAnnfile()
        GOAnnfile %>% 
            e_charts(ID) %>% 
            e_effect_scatter(GeneRatio2, Count) %>%
            e_visual_map(serie = logQvalue,scale = my_scale,inRange = list(color = c("#f6efa6", "#d88273", "#bf444c"))) %>%
            e_datazoom(type = "slider") %>%
            e_legend(FALSE) %>%
            e_x_axis(name = "GO ID") %>%
            e_y_axis(name = "GeneRatio") %>%
            e_title("GO enrichment",left='center') %>%
            e_tooltip(trigger = "item", 
                      formatter = htmlwidgets::JS(
                          "function(params){
                  return('Count:'+ params.value[2])}"))
        # ggplot(head(GOAnnfile,n = 10),aes(x=GeneRatio2,y=Description)) +
        #     labs(x="GeneRatio",y="GO description") + labs(title="") +
        #     geom_point(aes(size=Count,color=logQvalue)) +
        #     scale_color_gradient(low = c("green","red")[1],high=c("green","red")[2],name="-log10(qvalue)") +
        #     theme_classic() +
        #     theme(text=element_text(family="serif",face = "bold"),axis.text = element_text(size = 15),axis.title = element_text(size = 20),legend.text = element_text(size = 15),legend.title = element_text(size = 15)) +
        #     scale_y_discrete(labels=function(x) str_wrap(x,width = 30),limits=rev)
    })
    
    output$GOtable <- renderReactable({
        GOAnnfile <- GOAnnfile()
        reactable(
            GOAnnfile,
            compact = T,
            #使表格更加紧凑
            #pageSizeOptions = 25,
            defaultPageSize = 15,#表的大小
            #pageSizeOptions = c(25, 25, 50, 100),
            showSortIcon = T,
            searchable = T,
            #不显示表的信息
            theme = fivethirtyeight(),
            filterable = F,
            width = "auto",
            columns = list(
                ID = colDef(maxWidth = 100,name = 'GO ID'),
                Description = colDef(name = 'Description'),
                qvalue = colDef(show = FALSE),
                Count = colDef(maxWidth = 55,name = 'Count'),
                # geneID = colDef(name = 'geneID',
                #                 format=colFormat(digits=6)),
                geneID = colDef(show = FALSE),
                GeneRatio = colDef(show = FALSE),
                BgRatio = colDef(show = FALSE),
                pvalue = colDef(show = FALSE),
                p.adjust = colDef(show = FALSE),
                logQvalue = colDef(show = FALSE),
                GeneRatio2 = colDef(show = FALSE)
            )
        )
        # )
    })
    
    KEGGAnnfile <- reactive({
        KEGGAnnfilename <- paste0("www/data/",input$species_name,"/RNAseq/", input$Type, "/DEG/kegg_rich.txt")
        # GOAnnfilename <- paste0("www/data/","Athaliana","/RNAseq/", "S.melonis", "/DEG/go_rich.txt")
        KEGGAnnfile <- data.table::fread(KEGGAnnfilename, header = T, sep = "\t")
        KEGGAnnfile$GeneRatio2 <- apply(KEGGAnnfile %>% dplyr::select(GeneRatio),1,function(x) eval(parse(text=x)))
        KEGGAnnfile$logQvalue <- -log10(KEGGAnnfile$qvalue)
        KEGGAnnfile$Description <- factor(KEGGAnnfile$Description, levels = KEGGAnnfile$Description)
        return(KEGGAnnfile)
    })
    
    output$KEGGAnn <- renderEcharts4r({
        KEGGAnnfile <- KEGGAnnfile()
        KEGGAnnfile %>% 
            e_charts(ID) %>% 
            e_effect_scatter(GeneRatio2, Count) %>%
            e_visual_map(serie = logQvalue,scale = my_scale,inRange = list(color = c("#f6efa6", "#82ff0f", "#0fff1e"))) %>%
            e_datazoom(type = "slider") %>%
            e_legend(FALSE) %>%
            e_x_axis(name = "GO ID") %>%
            e_y_axis(name = "GeneRatio") %>%
            e_title("KEGG enrichment",left='center') %>%
            e_tooltip(trigger = "item", 
                      formatter = htmlwidgets::JS(
                          "function(params){
                  return('Count:'+ params.value[2])}"))
        # ggplot(head(KEGGAnnfile,n = 20),aes(x=GeneRatio2,y=Description)) +
        #     labs(x="GeneRatio",y="KEGG description") + labs(title="") +
        #     geom_point(aes(size=Count,color=logQvalue)) +
        #     scale_color_gradient(low = c("green","red")[1],high=c("green","red")[2],name="-log10(qvalue)") +
        #     theme_classic() +
        #     theme(text=element_text(family="serif",face = "bold"),axis.text = element_text(size = 15),axis.title = element_text(size = 20),legend.text = element_text(size = 15),legend.title = element_text(size = 15)) +
        #     scale_y_discrete(labels=function(x) str_wrap(x,width = 50),limits=rev)
    })
    
    output$KEGGtable <- renderReactable({
        KEGGAnnfile <- KEGGAnnfile()
        reactable(
            KEGGAnnfile,
            compact = T,
            #使表格更加紧凑
            #pageSizeOptions = 25,
            defaultPageSize = 15,#表的大小
            #pageSizeOptions = c(25, 25, 50, 100),
            showSortIcon = T,
            searchable = T,
            #不显示表的信息
            theme = fivethirtyeight(),
            filterable = F,
            width = "auto",
            columns = list(
                ID = colDef(maxWidth = 100,name = 'KEGG ID'),
                Description = colDef(name = 'Description'),
                qvalue = colDef(show = FALSE),
                Count = colDef(maxWidth = 55,name = 'Count'),
                # geneID = colDef(name = 'geneID',
                #                 format=colFormat(digits=6)),
                geneID = colDef(show = FALSE),
                GeneRatio = colDef(show = FALSE),
                BgRatio = colDef(show = FALSE),
                pvalue = colDef(show = FALSE),
                p.adjust = colDef(show = FALSE),
                logQvalue = colDef(show = FALSE),
                GeneRatio2 = colDef(show = FALSE)
            )
        )
        # )
    })
    
    
    
    ##############TF#########################
    ######更新TFfamily
    observe({
        speci <- input$species_name
        # speci <- "Athaliana"
        family <- unique(TFselectlist[which(TFselectlist$species %in% speci)]$family)
        shiny::updateSelectInput(session, "TFfamily",
                                 choices = family,
                                 selected = "AP2")
    })
    
    TFinf <- reactive({
        speci <- input$species_name
        TFfamily <- input$TFfamily
        # speci <- "Athaliana"
        # TFfamily <- "AP2"
        GRNnetwork <- read.table(paste0("www/data/",speci, "/GRN/",TFfamily ,"/GRNs_DEG.txt"), sep = "\t", header = T)
        TFinf <- GRNnetwork %>% dplyr::select(TF_geneid, TF_Family, TF_geneid_logFC,TF_geneid_FDR) %>% dplyr::distinct() %>% dplyr::mutate(logFC_cols = dplyr::case_when(
            TF_geneid_logFC <= -1 & TF_geneid_logFC >= -2 ~ "#9DA0FB",
            TF_geneid_logFC < -2 & TF_geneid_logFC >= -3 ~ "#767AF9",
            TF_geneid_logFC < -3 & TF_geneid_logFC >= -4 ~ "#4F54F8",
            TF_geneid_logFC < -4 & TF_geneid_logFC >= -5 ~ "#282EF6",
            TF_geneid_logFC < -5 & TF_geneid_logFC >= -6 ~ "#0A11EB",
            TF_geneid_logFC < -6  ~ "#0910D7",
            TF_geneid_logFC >= 1 & TF_geneid_logFC <= 2 ~ "#FF8585",
            TF_geneid_logFC > 2 & TF_geneid_logFC <= 3 ~ "#FF7070",
            TF_geneid_logFC > 3 & TF_geneid_logFC <= 4 ~ "#FF5C5C",
            TF_geneid_logFC > 4 & TF_geneid_logFC <= 5 ~ "#FF4747",
            TF_geneid_logFC > 5 & TF_geneid_logFC <= 6 ~ "#FF3333",
            TF_geneid_logFC > 6 & TF_geneid_logFC <= 7 ~ "#FF1F1F",
            TF_geneid_logFC > 7 & TF_geneid_logFC <= 8 ~ "#FF0A0A",
            TF_geneid_logFC > 8 & TF_geneid_logFC <= 9 ~ "#F50000",
            TF_geneid_logFC > 9 & TF_geneid_logFC <= 10 ~ "#E00000",
            TF_geneid_logFC > 10  ~ "#CC0000",
            TRUE ~ 'grey'
        ),FDR_cols = dplyr::case_when(
            TF_geneid_FDR <= 0.05 ~ "#38A2BC",
            TRUE ~ '#FFFFFF'
        ))
        return(TFinf)
    })
    output$TFtable <- renderReactable({
        TFinformation <- TFinf()
        reactable(
            TFinformation,
            compact = T,
            defaultPageSize = 10,
            showSortIcon = T,
            searchable = T,
            # theme = superhero(),
            filterable = F,
            width = "auto",
            columns = list(
                TF_geneid = colDef(maxWidth = 100,name = 'TF gene id'),
                TF_Family = colDef(name = 'TF Family'),
                TF_geneid_logFC = colDef(name = "logFC",
                                         maxWidth = 450,
                                         align = 'center',
                                         # format=colFormat(digits=2),
                                         cell = data_bars(
                                             data = TFinformation,
                                             text_position = 'outside-end',
                                             number_fmt = scales::label_number(accuracy = 0.01),
                                             box_shadow = TRUE,
                                             fill_color_ref = "logFC_cols",
                                             animation = 'width 0.4s linear'
                                         )),
                TF_geneid_FDR = colDef(name = "q.value",
                                       # format=colFormat(digits=4),
                                       cell = pill_buttons(data = TFinformation,
                                                           number_fmt = scales::label_number(accuracy = 0.0001),
                                                           color_ref = "FDR_cols")),
                logFC_cols = colDef(show = FALSE),
                FDR_cols = colDef(show = FALSE)
            )
        )
    })
    
    GRNnetwork <- reactive({
        speci <- input$species_name
        TFfamily <- input$TFfamily
        TF_geneid <- input$TFgeneid
        # speci <- "Athaliana"
        # TFfamily <- "AP2"
        # TF_geneid <- "AT2G28550"
        GRNnetwork <- read.table(paste0("www/data/",speci, "/GRN/",TFfamily ,"/GRNs_DEG.txt"), sep = "\t", header = T)
        GRNnetworkID <- GRNnetwork[GRNnetwork$TF_geneid == TF_geneid,]
        GRNnetworkID_edge <- GRNnetworkID %>% dplyr::select(TF_geneid, Method, TargetGene)
        colname <- c("geneid", "genename", "logFC", "FDR")
        source <- GRNnetworkID %>% dplyr::select(TF_geneid, TF_Family, TF_geneid_logFC, TF_geneid_FDR) %>% unique()
        colnames(source) <- colname
        target <- GRNnetworkID %>% dplyr::select(TargetGene, gene_uniprotid, TargetGene_logFC, TargetGene_FDR) %>% unique()
        colnames(target) <- colname
        GRNnetworkID_node <- rbind(source, target)
        GRNnetworkID_node$Size <- abs(GRNnetworkID_node$logFC)*3
        GRNnetworkID_node <- GRNnetworkID_node %>% dplyr::mutate(FDR=case_when( FDR > 0 ~ "DEG",is.na(FDR) ~ "noDEG"))

        if (nrow(GRNnetworkID_node) <=  30) {
            zoom = 3
            fontSize = 8
        } else if ( nrow(GRNnetworkID_node) > 30 & nrow(GRNnetworkID_node) <= 50) {
            zoom = 2
            fontSize = 6
        } else if ( nrow(GRNnetworkID_node) > 50 & nrow(GRNnetworkID_node) <= 200){
            zoom = 1
            fontSize = 0
        } else if ( nrow(GRNnetworkID_node) > 200 & nrow(GRNnetworkID_node) <= 400){
            zoom = 0.7
            fontSize = 0
        } else {
            zoom = 0.3
            fontSize = 0
        }
        
        GRNnetWorkList <- list(gene_nodes = GRNnetworkID_node,
                               gene_edges = GRNnetworkID_edge,
                               zoom = zoom, 
                               fontSize = fontSize)
        return(GRNnetWorkList)
    })

    
    output$GRNnetwork <- renderEcharts4r({
        GRNnetwork <- GRNnetwork()
        e_charts() %>%
            e_graph(
                name = "Coexpression Network",
                legendHoverLink = F,
                zoom = GRNnetwork$zoom,
                layout = "force",
                force = list(
                    repulsion = 100, #节点之间的斥力因子
                    gravity = 0.5,
                    edgeLength = c(50, 100),
                    friction = 0.05
                ),
                roam = T, #是否开启鼠标缩放和平移漫游
                draggable = T,
                circular = list(rotateLabel = F),
                symbol = "circle",
                lineStyle = list(
                    color = "black",
                    curveness = 0.05,
                    type = "dashed",
                    cap = "square"
                ),
                itemStyle = list(
                    borderCap = "square",
                    #borderColor = "black",
                    #borderType = "dashed",
                    shadowBlur = 10,
                    shadowColor = "#B5F8E2",
                    shadowOffsetX = 2,
                    shadowOffsetY = 2
                ),
                emphasis = list(
                    disabled = F,
                    scale = 1.5,
                    focus = "adjacency",
                    lineStyle = list(width = 5)
                ),
                label = list(position = "inside",
                             formatter = "{c}"),
                
            ) %>%
            e_graph_nodes(GRNnetwork$gene_nodes, geneid, logFC, Size, FDR) %>%
            e_graph_edges(edges = GRNnetwork$gene_edges,
                          source = TF_geneid,
                          target = TargetGene) %>%
            e_labels(fontSize = GRNnetwork$fontSize,
                     position = "inside",
                     formatter = "{b}") %>%
            e_tooltip() #%>%
            #e_theme("royal") # %>%
            # e_color("#91D1C2CC","#7E6148CC")
    })
    
    output$GRNtable <- renderReactable({
        GRNnetwork <- GRNnetwork()
        GRNnetwork_node <- GRNnetwork$gene_nodes[-1,] %>% dplyr::mutate(logFC_cols = dplyr::case_when(
            logFC <= -1 & logFC >= -2 ~ "#9DA0FB",
            logFC < -2 & logFC >= -3 ~ "#767AF9",
            logFC < -3 & logFC >= -4 ~ "#4F54F8",
            logFC < -4 & logFC >= -5 ~ "#282EF6",
            logFC < -5 & logFC >= -6 ~ "#0A11EB",
            logFC < -6  ~ "#0910D7",
            logFC >= 1 & logFC <= 2 ~ "#FF8585",
            logFC > 2 & logFC <= 3 ~ "#FF7070",
            logFC > 3 & logFC <= 4 ~ "#FF5C5C",
            logFC > 4 & logFC <= 5 ~ "#FF4747",
            logFC > 5 & logFC <= 6 ~ "#FF3333",
            logFC > 6 & logFC <= 7 ~ "#FF1F1F",
            logFC > 7 & logFC <= 8 ~ "#FF0A0A",
            logFC > 8 & logFC <= 9 ~ "#F50000",
            logFC > 9 & logFC <= 10 ~ "#E00000",
            logFC > 10  ~ "#CC0000",
            TRUE ~ 'grey'
        ))
        rownames(GRNnetwork_node) <- 1:nrow(GRNnetwork_node)
        reactable(
            GRNnetwork_node,
            compact = T,
            defaultPageSize = 10,
            showSortIcon = T,
            searchable = T,
            # theme = superhero(),
            filterable = F,
            width = "auto",
            columns = list(
                geneid = colDef(maxWidth = 150,name = 'Target gene id'),
                genename = colDef(name = 'gene name'),
                logFC = colDef(name = "logFC",
                                         maxWidth = 450,
                                         align = 'center',
                                         # format=colFormat(digits=2),
                                         cell = data_bars(
                                             data = GRNnetwork_node,
                                             text_position = 'outside-end',
                                             number_fmt = scales::label_number(accuracy = 0.01),
                                             box_shadow = TRUE,
                                             fill_color_ref = "logFC_cols",
                                             animation = 'width 0.4s linear'
                                         )),
                FDR = colDef(name = "DEG"),
                Size = colDef(show = FALSE),
                logFC_cols = colDef(show = FALSE)
            )
        )
    })
    
    
    #############Rgene##########################
    Rgene <- reactive({
        spec <- input$species_name
        Rgenetype <- input$Rgenetype
        # Rgenetype <- c("CNL", "NL", "TNL")
        # spec <- "Athaliana"
        Rgene_NBS_LRR_DEG <- read.table(paste0("www/data/", spec, "/Rgene/OG_Rgene_NBS_LRR_DEG.txt"), sep = "\t", header = T)
        Rgene_NBS_LRR_DEG_type2 <- Rgene_NBS_LRR_DEG[which(Rgene_NBS_LRR_DEG$R_type %in% Rgenetype),]
        Rgene_NBS_LRR_DEG_type2_col <- Rgene_NBS_LRR_DEG_type2 %>% dplyr::mutate(logFC_cols = dplyr::case_when(
            logFC <= -1 & logFC >= -2 ~ "#9DA0FB",
            logFC < -2 & logFC >= -3 ~ "#767AF9",
            logFC < -3 & logFC >= -4 ~ "#4F54F8",
            logFC < -4 & logFC >= -5 ~ "#282EF6",
            logFC < -5 & logFC >= -6 ~ "#0A11EB",
            logFC < -6  ~ "#0910D7",
            logFC >= 1 & logFC <= 2 ~ "#FF8585",
            logFC > 2 & logFC <= 3 ~ "#FF7070",
            logFC > 3 & logFC <= 4 ~ "#FF5C5C",
            logFC > 4 & logFC <= 5 ~ "#FF4747",
            logFC > 5 & logFC <= 6 ~ "#FF3333",
            logFC > 6 & logFC <= 7 ~ "#FF1F1F",
            logFC > 7 & logFC <= 8 ~ "#FF0A0A",
            logFC > 8 & logFC <= 9 ~ "#F50000",
            logFC > 9 & logFC <= 10 ~ "#E00000",
            logFC > 10  ~ "#CC0000",
            TRUE ~ 'grey'
        ))
        return(Rgene_NBS_LRR_DEG_type2_col)
    })

    output$Rgene <- renderReactable({
        Rgene2 <- Rgene()
        reactable(
            Rgene2,
            compact = F,
            #使表格更加紧凑
            #pageSizeOptions = 25,
            #defaultPageSize = 25,#表的大小
            #pageSizeOptions = c(25, 25, 50, 100),
            showSortIcon = T,
            searchable = T,
            #不显示表的信息
            theme = reactableTheme(
                            borderColor = "#dfe2e5",
                            stripedColor = "#f6f8fa",
                            highlightColor = "#f0f5f9",
                            # cellPadding = "8px 12px",
                            style = list(
                            fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Times New Roman, sans-serif"
                                ),
                        searchInputStyle = list(width = "100%")
                        ),
            width = "auto",
            columns = list(
                Orthogroup = colDef(maxWidth = 95,name = 'Orthogroup'),
                gene_id = colDef(maxWidth = 100, name = 'gene id'),
                R_Class = colDef(maxWidth = 70, name = "R Class"),
                R_type = colDef(maxWidth = 70, name = 'R type'),
                Domain_types = colDef(maxWidth = 100, name = 'Domain'),
                gene_uniprotid = colDef(maxWidth = 100, name = 'gene uniprotid'),
                uniprot_gene_name = colDef(maxWidth = 250, name = 'gene name'),
                # uniprot_gene_name = colDef(maxWidth = 150, name = 'gene name',style = cell_style(Rgene2,font_size =10)),
                logFC_cols = colDef(show = FALSE),
                logFC = colDef(
                    maxWidth = 200,
                    name = 'Fold Change',
                    align = 'center',
                    cell = data_bars(
                        data = Rgene2,
                        text_position = 'inside-base',
                        box_shadow = TRUE,
                        fill_color_ref = "logFC_cols",
                        animation = 'width 0.4s linear'
                    )),
                FDR = colDef(show = FALSE),
                # FDR = colDef(maxWidth = 75, name = 'FDR', format=colFormat(digits=4)),
                PValue = colDef(show = FALSE),
                CPPs = colDef(maxWidth = 75, name = 'CCPs', cell = function() htmltools::tags$button("Detail"))
                ),
                onClick = htmlwidgets::JS(
                        "function(rowInfo, colInfo) {
                            if (colInfo.id !== 'CPPs') {
                                return 'select'
                                }
                        window.alert('Details for row message ' + rowInfo.index + ':\\n' + JSON.stringify(rowInfo.row, null, 2))
                         if (window.Shiny) {
                        Shiny.setInputValue('Detail', { index: rowInfo.index + 1 }, { priority: 'event' })
                                }
                        }"
                        )
        )
    })
    
    
    #################co-expression########################
    ######更新CPPs
    observe({
        specie <- input$species_name
        CPPs <- unique(NetworkList[which(NetworkList$species %in% specie)]$CPPs)
        shiny::updateSelectInput(session, "CPPs",
                                 choices = CPPs,
                                 selected = CPPs[1])
    })
    
    All_hubgene_col <- reactive({
        speciesCO <- input$species_name
        CPPs <- input$CPPs
        # CPPs <- "S.litura"
        # speciesCO <- "Ghirsutum"
        All_hubgene <- read.table(paste0("www/data/", speciesCO, "/Network/", CPPs, "/All_hubgene.txt"), sep = "\t", header = T,quote = "")
        All_hubgene_col <- All_hubgene %>% dplyr::mutate(logFC_cols = dplyr::case_when(
            logFC <= -1 & logFC >= -2 ~ "#9DA0FB",
            logFC < -2 & logFC >= -3 ~ "#767AF9",
            logFC < -3 & logFC >= -4 ~ "#4F54F8",
            logFC < -4 & logFC >= -5 ~ "#282EF6",
            logFC < -5 & logFC >= -6 ~ "#0A11EB",
            logFC < -6  ~ "#0910D7",
            logFC >= 1 & logFC <= 2 ~ "#FF8585",
            logFC > 2 & logFC <= 3 ~ "#FF7070",
            logFC > 3 & logFC <= 4 ~ "#FF5C5C",
            logFC > 4 & logFC <= 5 ~ "#FF4747",
            logFC > 5 & logFC <= 6 ~ "#FF3333",
            logFC > 6 & logFC <= 7 ~ "#FF1F1F",
            logFC > 7 & logFC <= 8 ~ "#FF0A0A",
            logFC > 8 & logFC <= 9 ~ "#F50000",
            logFC > 9 & logFC <= 10 ~ "#E00000",
            logFC > 10  ~ "#CC0000",
            TRUE ~ 'grey'
        ))
        return(All_hubgene_col)
    })
    
    output$hubgene <- renderReactable({
        All_hubgene_col <- All_hubgene_col()
        reactable(
            All_hubgene_col,
            compact = F,
            #使表格更加紧凑
            #pageSizeOptions = 25,
            #defaultPageSize = 25,#表的大小
            #pageSizeOptions = c(25, 25, 50, 100),
            showSortIcon = T,
            searchable = T,
            #不显示表的信息
            #theme = clean(),
            width = "auto",
            columns = list(
                gene_id = colDef(maxWidth = 150, name = 'gene id'),
                gene_uniprotid= colDef(show = FALSE),
                uniprot_gene_name= colDef(maxWidth = 300, name = 'gene name'),
                logFC = colDef(
                    maxWidth = 200,
                    name = 'Fold Change',
                    align = 'center',
                    cell = data_bars(
                        data = All_hubgene_col,
                        text_position = 'inside-base',
                        box_shadow = TRUE,
                        fill_color_ref = "logFC_cols",
                        animation = 'width 0.4s linear'
                    )),
                FDR = colDef(maxWidth = 75, name = 'FDR', format=colFormat(digits=4)),
                logFC_cols=colDef(show = FALSE)
                )
            )
    })
    
    GRNnet <- reactive({
        speciesCO <- input$species_name
        CPPs <- input$CPPs
        netgeneid <- input$netgeneid
        # CPPs <- "S.melonis"
        # speciesCO <- "Athaliana"
        if (netgeneid==""){
            All_edge <- read.table(paste0("www/data/", speciesCO, "/Network/", CPPs, "/All_edge.txt"), sep = "\t", header = T,quote = "") %>% dplyr::select(fromNode, toNode)
            All_nodes <- read.table(paste0("www/data/", speciesCO, "/Network/", CPPs, "/All_nodes.txt"), sep = "\t", header = T,quote = "")
        } else {
            All_edge <- read.table(paste0("www/data/", speciesCO, "/Network/", CPPs, "/All_edge.txt"), sep = "\t", header = T,quote = "") %>% dplyr::select(fromNode, toNode) %>% dplyr::filter(fromNode==netgeneid |toNode==netgeneid)
            selected=unique(c(All_edge$fromNode, All_edge$toNode))
            All_nodes_raw <- read.table(paste0("www/data/", speciesCO, "/Network/", CPPs, "/All_nodes.txt"), sep = "\t", header = T,quote = "")
            All_nodes <- All_nodes_raw[which(All_nodes_raw$nodeName %in% selected),]
        }
        
        All_nodes$Size <- abs(All_nodes$logFC)*5
        All_nodes <- All_nodes %>% dplyr::mutate(
                                FDR=case_when(FDR > 0 ~ "DEG",
                                              is.na(FDR) ~ "noDEG"))
        if (nrow(All_nodes) <=  30) {
            zoom = 3
            fontSize = 8
        } else if ( nrow(All_nodes) > 30 & nrow(All_nodes) <= 50) {
            zoom = 2
            fontSize = 6
        } else if ( nrow(All_nodes) > 50 & nrow(All_nodes) <= 200){
            zoom = 1
            fontSize = 0
        } else {
            zoom = 0.6
            fontSize = 0
        }
        GRNnet <- list(gene_nodes= All_nodes,
                               gene_edges= All_edge,
                               zoom =zoom, 
                               fontSize = fontSize)
        return(GRNnet)
    })
    
    output$igraphPlot <- renderEcharts4r({
        GRNnet <- GRNnet()
        e_charts() %>%
            e_graph(
                name = "Coexpression Network",
                legendHoverLink = F,
                zoom = GRNnet$zoom,
                layout = "force",
                force = list(
                    repulsion = 100,
                    gravity = 0.5,
                    edgeLength = c(50, 100),
                    friction = 0.05
                ),
                roam = F,
                draggable = T,
                circular = list(rotateLabel = F),
                symbol = "circle",
                lineStyle = list(
                    color = "black",
                    curveness = 0.05,
                    type = "dashed",
                    cap = "square"
                ),
                itemStyle = list(
                    borderCap = "square",
                    #borderColor = "black",
                    #borderType = "dashed",
                    shadowBlur = 10,
                    shadowColor = "#B5F8E2",
                    shadowOffsetX = 2,
                    shadowOffsetY = 2
                ),
                emphasis = list(
                    disabled = F,
                    scale = 1.5,
                    focus = "adjacency",
                    lineStyle = list(width = 5)
                ),
                label = list(position = "inside",
                             formatter = "{c}"),
                
            ) %>%
            e_graph_nodes(GRNnet$gene_node, nodeName, logFC, Size, FDR) %>%
            e_graph_edges(edges = GRNnet$gene_edges,
                          source = fromNode,
                          target = toNode) %>%
            e_labels(fontSize = GRNnet$fontSize,
                     position = "inside",
                     formatter = "{b}") %>%
            e_tooltip() %>%
            # e_theme("dark-digerati") %>%
            e_color(pal_npg(alpha = 0.6)(10))
    })
    
    output$igraphPlotDF <- renderReactable({
        GRNnet <- GRNnet()
        nodes <- GRNnet$gene_nodes
        nodes_col <- nodes %>% dplyr::mutate(logFC_cols = dplyr::case_when(
            logFC <= -1 & logFC >= -2 ~ "#9DA0FB",
            logFC < -2 & logFC >= -3 ~ "#767AF9",
            logFC < -3 & logFC >= -4 ~ "#4F54F8",
            logFC < -4 & logFC >= -5 ~ "#282EF6",
            logFC < -5 & logFC >= -6 ~ "#0A11EB",
            logFC < -6  ~ "#0910D7",
            logFC >= 1 & logFC <= 2 ~ "#FF8585",
            logFC > 2 & logFC <= 3 ~ "#FF7070",
            logFC > 3 & logFC <= 4 ~ "#FF5C5C",
            logFC > 4 & logFC <= 5 ~ "#FF4747",
            logFC > 5 & logFC <= 6 ~ "#FF3333",
            logFC > 6 & logFC <= 7 ~ "#FF1F1F",
            logFC > 7 & logFC <= 8 ~ "#FF0A0A",
            logFC > 8 & logFC <= 9 ~ "#F50000",
            logFC > 9 & logFC <= 10 ~ "#E00000",
            logFC > 10  ~ "#CC0000",
            TRUE ~ 'grey'
        ),
        FDR_col = dplyr::case_when(FDR=="DEG" ~ "#FF6347",
                                   FDR=="noDEG" ~ "#00FFFF"))
        reactable(
            nodes_col,
            compact = F,
            #使表格更加紧凑
            #pageSizeOptions = 25,
            #defaultPageSize = 25,#表的大小
            #pageSizeOptions = c(25, 25, 50, 100),
            showSortIcon = F,
            #不显示表的信息
            #theme = clean(),
            width = "auto",
            columns = list(
                nodeName = colDef(maxWidth = 100, name = 'gene id'),
                gene_uniprotid= colDef(show = FALSE),
                uniprot_gene_name= colDef(maxWidth = 500, name = 'gene name'),
                # logFC = colDef(
                #     maxWidth = 200,
                #     name = 'Fold Change',
                #     align = 'center',
                #     cell = data_bars(
                #         data = nodes_col,
                #         text_position = 'inside-base',
                #         box_shadow = TRUE,
                #         fill_color_ref = "logFC_cols",
                #         animation = 'width 0.4s linear'
                #     )),
                # FDR = colDef(maxWidth = 75, name = 'DEG', cell = pill_buttons(data = nodes_col, color_ref = "FDR_col")),
                FDR_col=colDef(show = FALSE),
                logFC_cols=colDef(show = FALSE),
                Size = colDef(show = FALSE)
            )
        )
    })
    
})
            