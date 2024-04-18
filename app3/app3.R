library(shiny)

# Define UI for quiz app
quiz_ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      h3("Instructions"),
      p("Select your answer for each question and click 'Submit' to check your answer.")
    ),
    mainPanel(
      # Question 1
      h4("Question 1"),
      radioButtons("q1", "How can age-specific strategies be used to prevent drug use among 18-24-year-olds?",
                   choices = c("Implement targeted education campaigns",
                               "Increase availability of drugs",
                               "Promote drug use in universities",
                               "Ignore the issue")),
      # Submit button for question 1
      actionButton("submit_q1", "Submit"),
      # Output to display result for question 1
      verbatimTextOutput("result_q1"),
      
      # Question 2
      h4("Question 2"),
      radioButtons("q2", "What role can educational institutions play in drug prevention, given the link between education levels and drug use?",
                   choices = c("Ignore the issue",
                               "Integrate drug awareness and prevention into curricula",
                               "Promote drug use among students",
                               "Provide free drugs to students")),
      # Submit button for question 2
      actionButton("submit_q2", "Submit"),
      # Output to display result for question 2
      verbatimTextOutput("result_q2"),
      
      # Question 3
      h4("Question 3"),
      radioButtons("q3", "Considering the UK's lower drug consumption rates, what preventative measures could other countries learn from this?",
                   choices = c("Analyze and adapt public health strategies",
                               "Ignore the issue",
                               "Increase drug availability",
                               "Encourage drug use")),
      # Submit button for question 3
      actionButton("submit_q3", "Submit"),
      # Output to display result for question 3
      verbatimTextOutput("result_q3"),
      
      # Question 4
      h4("Question 4"),
      radioButtons("q4", "How can we address the lower Conscientiousness found in drug users through prevention strategies?",
                   choices = c("Offer workshops focusing on goal setting and self-discipline",
                               "Ignore the issue",
                               "Promote drug use",
                               "Provide drugs to users")),
      # Submit button for question 4
      actionButton("submit_q4", "Submit"),
      # Output to display result for question 4
      verbatimTextOutput("result_q4"),
      
      # Question 5
      h4("Question 5"),
      radioButtons("q5", "How can we use the trait of Openness to Experience in developing drug prevention programs?",
                   choices = c("Channel into positive outlets like travel and arts",
                               "Ignore the issue",
                               "Promote drug use",
                               "Encourage drug experimentation")),
      # Submit button for question 5
      actionButton("submit_q5", "Submit"),
      # Output to display result for question 5
      verbatimTextOutput("result_q5")
    )
  )
)

# Define server logic for quiz app
quiz_server <- function(input, output) {
  # Define correct answers
  correct_answers <- c("Implement targeted education campaigns",
                       "Integrate drug awareness and prevention into curricula",
                       "Analyze and adapt public health strategies",
                       "Offer workshops focusing on goal setting and self-discipline",
                       "Channel into positive outlets like travel and arts")
  
  # Function to check answer
  check_answer <- function(user_answer, correct_answer) {
    if (user_answer == correct_answer) {
      return("Correct!")
    } else {
      return("Incorrect. Try again!")
    }
  }
  
  # Define reactive expressions to check answer when submit button is clicked
  output$result_q1 <- renderPrint({
    req(input$submit_q1)
    check_answer(input$q1, correct_answers[1])
  })
  
  output$result_q2 <- renderPrint({
    req(input$submit_q2)
    check_answer(input$q2, correct_answers[2])
  })
  
  output$result_q3 <- renderPrint({
    req(input$submit_q3)
    check_answer(input$q3, correct_answers[3])
  })
  
  output$result_q4 <- renderPrint({
    req(input$submit_q4)
    check_answer(input$q4, correct_answers[4])
  })
  
  output$result_q5 <- renderPrint({
    req(input$submit_q5)
    check_answer(input$q5, correct_answers[5])
  })
}

# Run the Shiny app
shinyApp(ui = quiz_ui, server = quiz_server)