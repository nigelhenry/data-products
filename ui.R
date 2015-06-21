library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Public Opinion Poll Simulation"),
    
    sidebarPanel(
      h3('Simulated Population'),
      p('Here is where you enter details of the simulated population (specify the "right answer"): '),
      textInput(inputId='option1', 'Response 1 : ', 'DEM'),
      textInput(inputId='option2', 'Response 2 : ', 'REP'),
      sliderInput('opt1', 'Public Opinion:', value=50, min=0, max=100, step=1),
      p('Poll respondents will be selected a population with these stats:'),
      verbatimTextOutput('pop_desc')
    ),
    mainPanel(
      p('The general public is often sceptical of public opinion polls.
      One the reasons for scepticism is that it is difficult to believe that a
      small sample of 1,000 persons can estimate the opinions of millions.'),
      p('This application allows you to simulate picking a random sample from a
        population, and examining for yourself how close the poll result is from
        the population.'),
      tags$ol(
        tags$li('(Optional)Decide what the responses to your poll question are'),
        tags$li('(Optional)Decide what the frequency of each response is'),
        tags$li('Decide how many people of the 1,000,000 you would like to poll'),
        tags$li('Click "POLL!" to see the result')
      ),
      p('Every time you press "Poll" a random sample will be drawn from the population'),
      hr(),
      h3('Simulated Sample'),
      p('Here is where you can draw your sample, and see your poll result '),
      fluidRow(
        column(3,
            numericInput('N', 'Enter sample size: ', 1000, min=100, max=10000, step=50),
            actionButton('poll','POLL!'),
            p('People Sampled:'),
            verbatimTextOutput('sample')
        ),
        column(4,
            p('Poll result is '),
            verbatimTextOutput('result')
          )
      ),
      p('Try polling a few times with the same sample size.'),
      br(),
      p('You will likely get a different answer each time because of sampling error.
        The science of public opinion polling is that the sampling error is quantifiable.
        In other words, we know that we are "off" by a little bit, but we always know how much we are "off" by.')
    )
  )
)