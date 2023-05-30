#Overview
home <- function() {
    fluidRow(
        setBackgroundColor("#FFFFFF"),
        div(
            class = "container",
            column(12,
                box(width = NULL,
                    img(src="images/network_home.png", alt="1",width="1100px",height="500px",align="center"))),
            hr(),
            h1("Species", class = "text-center fit-h1"),
            h1("dicot", class = "text-center fit-h3"),
            column(6,
                   column(3,
                          img(src="images/Arabidopsis thaliana.png", width="50%", alt="evaluator", height="100%",align="center"),
                          h1("A. thaliana", class = "text-center fit-h4")))
            ))
}
