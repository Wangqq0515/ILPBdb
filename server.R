#   ____________________________________________________________________________
#   Server                                                                  ####

shinyServer(function(input, output, session) {
    ##################################################################################
    #################################### Updated Day #################################
    ##################################################################################
    output$footerModifiedDay <- renderText(paste0("Updated ", modifiedDay))
    output$aboutModifiedDay <- renderText(paste0("Last modified at ", modifiedDay))


    #######################################summary####################################
    summary_speciesVShsotdf <- summary_speciesVShsot
    output$summary_speciesVShsotout <- function(){
        summary_speciesVShsotdf %>% kable() %>% kable_styling(bootstrap_option=c("striped", "hover"),full_width = F)
    }

    summary_speciesVShsot_Typedf <- summary_speciesVShsot_Type
    output$summary_speciesVShsot_TypedfOut <- function(){
        summary_speciesVShsot_Typedf %>% kable() %>% kable_styling(bootstrap_option=c("striped", "hover"),full_width = F)
    }


    ##################################################################################
    ################################### species_DEG_idfc ###########################
    ##################################################################################

    #Athaliana
    output$Athaliana_DEG_idfcDT <- renderDT({
        Athaliana_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Athaliana_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Athaliana_DEG_idfc$gene_id, "</a>")
        Athaliana_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })
    #Bnapus
    output$Bnapus_DEG_idfcDT <- renderDT({
        Bnapus_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Bnapus_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Bnapus_DEG_idfc$gene_id, "</a>")
        Bnapus_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })
    #Ghirsutum
    output$Ghirsutum_DEG_idfcDT <- renderDT({
        Ghirsutum_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Ghirsutum_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Ghirsutum_DEG_idfc$gene_id, "</a>")
        Ghirsutum_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })
    #Gmax
    output$Gmax_DEG_idfcDT <- renderDT({
        Gmax_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Gmax_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Gmax_DEG_idfc$gene_id, "</a>")
        Gmax_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })
    #Mtruncatula
    output$Mtruncatula_DEG_idfcDT <- renderDT({
        Mtruncatula_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Mtruncatula_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Mtruncatula_DEG_idfc$gene_id, "</a>")
        Mtruncatula_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })
    #Stuberosum
    output$Stuberosum_DEG_idfcDT <- renderDT({
        Stuberosum_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Stuberosum_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Stuberosum_DEG_idfc$gene_id, "</a>")
        Stuberosum_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })
    #Slycopersicum
    output$Slycopersicum_DEG_idfcDT <- renderDT({
        Slycopersicum_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Slycopersicum_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Slycopersicum_DEG_idfc$gene_id, "</a>")
        Slycopersicum_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })
    #Ntabacum
    output$Ntabacum_DEG_idfcDT <- renderDT({
        Ntabacum_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Ntabacum_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Ntabacum_DEG_idfc$gene_id, "</a>")
        Ntabacum_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })
    #Hvulgare
    output$Hvulgare_DEG_idfcDT <- renderDT({
        Hvulgare_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Hvulgare_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Hvulgare_DEG_idfc$gene_id, "</a>")
        Hvulgare_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })
    #Taestivum
    output$Taestivum_DEG_idfcDT <- renderDT({
        Taestivum_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Taestivum_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Taestivum_DEG_idfc$gene_id, "</a>")
        Taestivum_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })
    #Bdistachyon
    output$Bdistachyon_DEG_idfcDT <- renderDT({
        Bdistachyon_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Bdistachyon_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Bdistachyon_DEG_idfc$gene_id, "</a>")
        Bdistachyon_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })
    #Osativa
    output$Osativa_DEG_idfcDT <- renderDT({
        Osativa_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Osativa_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Osativa_DEG_idfc$gene_id, "</a>")
        Osativa_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })
    #Sbicolor
    output$Sbicolor_DEG_idfcDT <- renderDT({
        Sbicolor_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Sbicolor_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Sbicolor_DEG_idfc$gene_id, "</a>")
        Sbicolor_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })
    #Zmays
    output$Zmays_DEG_idfcDT <- renderDT({
        Zmays_DEG_idfc$GeneIdUrl <- paste0("<a href=\"https://www.arabidopsis.org/servlets/TairObject?name=", Zmays_DEG_idfc$gene_id, "&type=locus\" target=\"_blank\">", Zmays_DEG_idfc$gene_id, "</a>")
        Zmays_DEG_idfc %>% dplyr::select(species, GeneIdUrl, logFC, host, treat) %>% dplyr::arrange(GeneIdUrl) %>% DT::datatable(escape = FALSE, options = list(pageLength = 50, autoWidth = TRUE))
    })


    ##################################################################################
    ##################all_pathogen_class_DEG_uniqOG_string_edges######################
    ##################################################################################
    gene_edges <- reactive({
        gene_edges <- rbind(all_pathogen_class_DEG_uniqOG_string_edges %>% dplyr::filter(grepl(input$networkid, fromAltName)),all_pathogen_class_DEG_uniqOG_string_edges %>% dplyr::filter(grepl(input$networkid, toAltName)))
        return(gene_edges)
    })

    output$igraphDT <- renderDT({
        gene_edges() %>% dplyr::select(fromAltName, toAltName) %>% DT::datatable(width="100%", height="500px")
    })

    output$igraphPlot <- renderEcharts4r({
        gene_edgesDf <- gene_edges()
        gene_nodes <- c(as.character(gene_edgesDf$fromAltName),as.character(gene_edgesDf$toAltName))
        gene_nodes <- all_pathogen_class_DEG_uniqOG_string_node[which(all_pathogen_class_DEG_uniqOG_string_node$Orthogroup %in% gene_nodes),]
        
        gene_edges_df_igraph <- e_charts() |>
            e_graph(
                layout = "circular",
                circular = list(rotateLabel = F),
                roam = T,
                lineStyle = list(color = "source",
                                 curveness = 0.3),
                label = list(position = "right",
                             formatter = "{b}")
            ) |>
            e_graph_nodes(
                nodes = gene_nodes,
                names = Orthogroup,
                value = logFC,
                size = logFC,
                category = pathogen_class_type
            ) |>
            e_graph_edges(edges = gene_edgesDf,
                          source = fromAltName,
                          target = toAltName) |>
            e_labels(fontSize = 8) |>
            e_modularity() |>
            e_tooltip()
        #gene_edges_df_igraph <- igraph::graph_from_data_frame(gene_edgesDf, directed = FALSE)
        #plot(gene_edges_df_igraph, vertex.size=3, vertex.label.cex=0.5)
    })

    ##################################################################################
    ###################################### Submit ####################################
    ##################################################################################
    observe({
        if (is.null(input$attachmentsPath)) return()
        file.copy(from = input$attachmentsPath$datapath, to = paste0("F:/Dash/PlantSingleCellDataBase/www/data/Submit/", input$attachmentsPath$name), recursive = TRUE)
        print(input$attachmentsPath$name)
    })
    
    output$uploadFiles <- renderText({
        HTML(paste0("The upload files have save to <a href=\"data/Submit/", input$attachmentsPath$name,"\" >",input$attachmentsPath$name,"</a>."))
    })
    ##################################################################################
    ###################################### About #####################################
    ##################################################################################
    output$contactUs <- renderText({
        HTML(paste0("Just <i class=\"far fa-envelope\"></i> <a href=\"mailto:", adminEmail, "?subject=?????ʼ???????&body=?????ʼ???????\" rel=\"nofollow\">send Email (", adminEmail, ")</a> to us."))
    })
    ##################################################################################
    ####################################### END ######################################
    ##################################################################################
})