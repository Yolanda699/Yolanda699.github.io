library(shiny)

# Define UI for feedback submission
feedback_ui <- fluidPage(
  fluidRow(
    column(12,
           textAreaInput("feedback", label = "Feedback:", placeholder = "Enter your feedback and suggestion here...")
    )
  ),
  fluidRow(
    column(12,
           actionButton("submit", "Submit Feedback")
    )
  )
)

# Define server logic
feedback_server <- function(input, output) {
  observeEvent(input$submit, {
    # Get feedback input
    feedback_text <- isolate(input$feedback)
    
    # Do something with the feedback (e.g., store in a file or database)
    # For demonstration, we'll print it here
    print(feedback_text)
    
    # Display a confirmation message
    showModal(modalDialog(
      title = "Feedback Submitted",
      "Thank you for your feedback!",
      footer = NULL
    ))
  })
}

# Create Shiny app object
feedback_app <- shinyApp(ui = feedback_ui, server = feedback_server)