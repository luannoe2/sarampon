library(shiny)

ano <- c(2010,2011,2012,2013,2014,2015)
quantidade <- c(10,20,30,40,50)
dados <- cbind(ano,quantidade)
dados <- as.data.frame(dados)

ui <- fluidPage(
    
    # App title ----
    titlePanel("Sliders"),
    
    sidebarLayout(
        
        sidebarPanel(
            
            # Input: Simple integer interval ----
            sliderInput("integer", "Integer:",
                        min = 2000, max = 2020,
                        value = 1)
        ), 
        # Main panel for displaying outputs ----
        mainPanel(
            
            # Output: Table summarizing the values entered ----
            actionButton("do", "Soma"),
            tableOutput("values")
            
        )
    )
)


server <- function(input, output) {
    
    observeEvent(input$do, {
        anoInput <- input$integer
        valorAno <- dados[dados$ano == anoInput, ]
        
        print(valorAno$quantidade)
        
        intervalo <- anoInput - 2009 #esse 2009 eh o seu menor ano menos 1 (2010-1)
        soma <- sum(dados[1:intervalo,2])
        print(soma)
        
    })
    
}

shinyApp(ui,server)