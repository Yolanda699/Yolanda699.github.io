library(shiny)

# Define UI for application that draws stacked bar charts
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("drug", "Select Drug:",
                  choices = c("Alcohol", "Caffeine", "Nicotine", "Cannabis", "Heroin", "Cocaine"))),
    mainPanel(
      plotOutput("drugPlot")
    )
  )
)

# Define server logic required to draw stacked bar charts
server <- function(input, output) {
  # Load your dataset here
  drug_data <- read.csv("/Users/yolandaliu/Desktop/NUS/NUS Y2S2/NM2207/NM2207 Project/Yolanda699.github.io/app1/Drug_Consumption.csv")
  
  output$drugPlot <- renderPlot({
    drug <- switch(input$drug,
                   "Alcohol" = drug_data$Alcohol,
                   "Caffeine" = drug_data$Caff,
                   "Nicotine" = drug_data$Nicotine,
                   "Cannabis" = drug_data$Cannabis,
                   "Cocaine" = drug_data$Coke,
                   "Heroin" = drug_data$Heroin)
    
    # Filter out NA values for the selected drug
    drug <- na.omit(drug)
    
    # Create stacked bar plot
    drug_table <- table(drug_data$Gender, drug)
    barplot(drug_table,
            col = c("#a4abd6", "#615ea8"),
            legend.text = FALSE,
            args.legend = list(title = input$drug, bty = "n", cex = 1.2),
            xlab = "Gender", ylab = "Frequency",
            main = paste("Distribution of", input$drug, "Consumption by Gender"),
            beside = TRUE)
    
    # Add legend manually at the top right of the plot
    legend("top", legend = c("Female", "Male"), fill = c("#a4abd6", "#615ea8"), bty = "n", cex = 1.2)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
