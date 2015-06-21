library(shiny)

opt1_share <- 0.5

shinyServer(
  function(input, output, session) {
    opt1_share <- reactive({input$opt1/100})
    poll <- eventReactive(input$poll, {
      sample(population(), input$N, replace=F)
    })
    
    pollResult <- reactive({
          print(100*prop.table(table(poll())))
          cat(paste("+/- ", round(98/sqrt(input$N),0),"%", sep=""))
     })
    population <- reactive({
        sample(c(input$option1, input$option2),
             1000000, replace=T,
             prob = c(opt1_share(), 1-opt1_share()))
    })    

    output$pop_desc <- renderPrint({table(population())})
    output$result<- renderPrint({pollResult()})
    output$sample<- renderPrint({table(poll())})
  }
)