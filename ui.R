source("appParts/library.R")
source("readData.R")
source("appParts/home.R")
source("appParts/OverviewPage.R")
source("appParts/orthogroup.R")
source("appParts/DEGpage.R")
source("appParts/TFpage.R")
source("appParts/RgenePage.R")
source("appParts/NetWorkpage.R")
source("appParts/DownlodPage.R")


shinydashboardPlus::dashboardPage(
  skin = "purple",
  title = "Immunity Landscape of Plant & Biotic stress database",
  header = shinydashboardPlus::dashboardHeader(
    title = tagList(div(
      img(
        src = "images/host.png",
        height = 30,
        align = "absmiddle"
      ),
      "ILPBs"
    )),
    # titleWidth = "130px",
    leftUi = tagList(
      dropdownBlock(
        id = "Myspcies",
        title = "Spcies",
        icon = icon("pagelines"),
        awesomeRadio(
          inputId = "species_name",
          label = "Please select a species:",
          choices = species_ann_df$species_name,
          # multiple = F,
          #options = list(`actions-box` = TRUE),
          selected = "Athaliana",
          status = "info"
        )
      )
    )
  ),
  sidebar = shinydashboardPlus::dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Overview", tabName = "overview", icon = icon("tasks")),
      menuItem("Orthogroup", tabName = "orthogroup", icon = icon("code-branch")),
      menuItem("Expression", tabName = "DEG",icon = icon("th")),
      # menuItem("Function", tabName = "Ann", icon = icon("filter")),
      menuItem(
        "TF",
        tabName = "TF",
        icon = icon("dna", lib = "font-awesome")
      ),
      menuItem(
        "Rgene",
        tabName = "Rgene",
        icon = icon("shield", lib = "font-awesome")
      ),
      menuItem(
        "Co-expression",
        tabName = "Co-expression",
        icon = icon("dharmachakra", lib = "font-awesome")
      ),
      menuItem("Downlod", tabName = "Downlod", icon = icon("download")),
      menuItem(
        "About",
        tabName = "About",
        icon = icon("question-circle")
      )
    ),
    collapsed=F,
    width = 200,
    minified=T
  ),
  body = dashboardBody(
    tags$head(
      tags$style(HTML(".main-sidebar { font-size: 18px; }"))
    ),
    tabItems(
      tabItem(tabName = "home",
              htmlTemplate("html/home.html")
              ),
      tabItem(tabName = "overview",
              OverviewPage()
      ),
      tabItem(tabName = "orthogroup",
              orthogroup_fun()
      ),
      tabItem(tabName = "DEG",
              DEGpage()
      ),
      tabItem(tabName = "TF",
              TFpage()
      ),
      tabItem(tabName = "Rgene",
              RgenePage()
      ),
      tabItem(tabName = "Co-expression",
              NetWorkpage()
      ),
      tabItem(tabName = "Downlod",
              Downlodpage()
      )
    )
  ),
  footer = dashboardFooter(
    left = htmlTemplate("html/footer.html"),
    right = NULL
  )
)
