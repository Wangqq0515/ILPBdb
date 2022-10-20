#   ____________________________________________________________________________
#   UI                                                                      ####

library(shiny)
library(openxlsx)
library(plotly)
library(shinyjs)
library(DT)
library(echarts4r)
library(igraph)
#library(shinyWidgets)
library(shinyBS)
library(dplyr)
library(tidyr)
#library(kableExtra)
#library(shinyAce)
#library(rgl)
library(emayili)
library(magrittr)
library(readr)


source("appParts.R")
source("readData.R")

fluidPage(
  navbarPage(
    title = div(tags$a(
      img(src = "images/host.png", height = 35), onclick = "$('li:eq(0) a').tab('show');"
    ),
    style = "position: relative; top: -5px;"),
    # Navigation bar
    windowTitle = "Plant Single Cell Hub",
    #title for browser tab
    theme = "style/style.css",
    id = 'menus',
    footer = htmlTemplate("html/footer.html"),
    fluid = TRUE,
    
    collapsible = TRUE,
    
    # ----------------------------------
    # tab panel 1 - Home
    
    tabPanel(
      title = "Home",
      icon = icon("home"),
      htmlTemplate("html/home.html"),
      tags$script(src = "plugins/scripts.js"),
      tags$head(
        tags$link(rel = "stylesheet",
                  type = "text/css",
                  href = "plugins/font-awesome-4.7.0/css/font-awesome.min.css"),
        tags$link(rel = "icon",
                  type = "image/png",
                  href = "images/logo_icon.png"),
        tags$style(type = "text/css",
                   "body {padding-top: 70px;}")
      )
    ),
    
    # ----------------------------------
    # tab panel 2 - summary
    tabPanel("summary",
             icon = icon("tasks"),
             fluidPage(
               div(
                 class = "container",
                 h1("Summary", class = "title fit-h1"),
                 h3("description: "),
                 p(
                   "We collected 14 common species and 6 host interaction transcriptoms, as shown in the table below "
                 ),
                 br(),
                 tableOutput("summary_speciesVShsotout"),
                 br(),
                 h1("detailed", class = "title fit-h1"),
                 tableOutput("summary_speciesVShsot_TypedfOut")
               ),
             )
             ), 
    # ----------------------------------
    # tab panel 3 - MarkerGeneDB
    navbarMenu(
      "DEG Expression",
      icon = icon("database"),
      tabPanel(
        "Arabidopsis thaliana",
        htmlTemplate("html/Athaliana.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
      tabPanel(
        "Brassica napus",
        htmlTemplate("html/Bnapus.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
      tabPanel(
        "Gossypium hirsutum",
        htmlTemplate("html/Ghirsutum.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
      tabPanel(
        "Glycine max",
        htmlTemplate("html/Gmax.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
      tabPanel(
        "Medicago truncatula",
        htmlTemplate("html/Mtruncatula.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
      tabPanel(
        "Solanum tuberosum",
        htmlTemplate("html/Stuberosum.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
      tabPanel(
        "Solanum lycopersicum",
        htmlTemplate("html/Slycopersicum.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
      tabPanel(
        "Nicotiana tabacum",
        htmlTemplate("html/Ntabacum.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
      tabPanel(
        "Hordeum vulgare",
        htmlTemplate("html/Hvulgare.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
      tabPanel(
        "Triticum aestivum",
        htmlTemplate("html/Taestivum.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
      tabPanel(
        "Brachypodium distachyon",
        htmlTemplate("html/Bdistachyon.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
      tabPanel(
        "Oryza sativa",
        htmlTemplate("html/Osativa.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
      tabPanel(
        "Sorghum bicolor",
        htmlTemplate("html/Sbicolor.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
      tabPanel(
        "Zea mays",
        htmlTemplate("html/Zmays.html"),
        icon = icon("pagelines", lib = "font-awesome")
      ),
    ),
    
    # ----------------------------------
    # tab panel 4 - SingleCellDB
    tabPanel(
      "coexpression network",
      icon = icon("globe",  lib = "font-awesome"),
      NetWork()
    ), 

    # ----------------------------------
    # tab panel 7 - Downlod
    tabPanel("Downlod", icon = icon("download"),
             downloadMenu()),
    
    
    # ----------------------------------
    # tab panel 6 - Submit
    #tabPanel("Submit", icon=icon("upload"), submitMenu()),
    
    # https://www.geeksforgeeks.org/how-to-send-an-email-from-javascript/
    tabPanel(
      "Submit",
      htmlTemplate("html/email.html", filedd = fluidRow(column(
        12,
        fileInput(
          "attachmentsPath",
          "Attachments Path",
          multiple = FALSE,
          width = "100%"
        )
      ))),
      icon = icon("upload"),
      tags$head(
        tags$link(rel = "stylesheet",
                  type = "text/css",
                  href = "plugins/email_page.css"),
        tags$script(src = "plugins/my_email_info.js")
      )
    ),
    
  
    # ----------------------------------
    # tab panel 8 - About
    tabPanel(
      "About",
      icon = icon("question-circle"),
      htmlTemplate("html/about.html"),
      shinyjs::useShinyjs(),
      tags$head(
        tags$link(rel = "stylesheet",
                  type = "text/css",
                  href = "plugins/carousel.css"),
        tags$script(src = "plugins/holder.js")
      ),
      tags$style(
        type = "text/css",
        ".shiny-output-error { visibility: hidden; }",
        ".shiny-output-error:before { visibility: hidden; }"
      )
    )
    
  ),
  # https://stackoverflow.com/questions/35584644/r-shiny-navbarpage-right-aligned-tabs
  HTML(
    "<script>var parent = document.getElementsByClassName('navbar-nav');
                   parent[0].insertAdjacentHTML( 'afterend', '<ul class=\"nav navbar-nav navbar-right\"><li class=\"twitter\"><a href=\"https://twitter.com/hopetogy\" target=\"_blank\"><i class=\"fa fa-twitter\"></i></a></li><li class=\"weixin\"><a href=\"images/xzp_Wechat.jpg\" target=\"_blank\"><i class=\"fa fa-weixin\"></i></a></li></ul>' );
                  </script>"
  )
)