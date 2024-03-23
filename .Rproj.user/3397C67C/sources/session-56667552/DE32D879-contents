library(shiny)
library(ggplot2)

# Load dataset
drug_data <- read.csv("Drug_Consumption.csv")

# Define the desired order of education levels
education_order <- c(
  "Doctorate degree",
  "Masters degree",
  "University degree",
  "Professional certificate/ diploma",
  "Some college or university, no certificate or degree",
  "Left school at 18 years",
  "Left school at 17 years",
  "Left school at 16 years",
  "Left school before 16 years"
)

# Reorder the Education column in the dataset
drug_data$Education <- factor(drug_data$Education, levels = education_order)

# Define UI for application
ui <- fluidPage(
  includeCSS("www/styles.css"),  # Link to your CSS file
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "Select Variable:",
                  choices = c("Age", "Gender", "Education", "Country"))),
    mainPanel(
      plotOutput("countPlot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  # Render count plot based on selected variable
  output$countPlot <- renderPlot({
    # Get selected variable
    selected_var <- input$variable
    
    # Define color palette
    color_palette <- c("#aed0ee",  "#a3bbdb", "#88abda", "#8aabcc","#6f94cd", "#5976ba","#106898","#12507b", "#003460", "#12264f")
    
    # Create count plot with color, legend, and no x-axis text
    if (selected_var == "Age") {
      ggplot(data = drug_data, aes(x = Age, fill = Age)) +
        geom_bar(show.legend = TRUE) +
        geom_text(stat = "count", aes(label = stat(count)), vjust = -0.5) +
        scale_fill_manual(values = color_palette) +
        labs(x = "", y = "Count", title = "Count of Age") +
        theme(axis.text.x = element_blank())
    } else if (selected_var == "Gender") {
      ggplot(data = drug_data, aes(x = Gender, fill = Gender)) +
        geom_bar(show.legend = TRUE) +
        geom_text(stat = "count", aes(label = stat(count)), vjust = -0.5) +
        scale_fill_manual(values = color_palette) +
        labs(x = "", y = "Count", title = "Count of Gender") +
        theme(axis.text.x = element_blank())
    } else if (selected_var == "Education") {
      ggplot(data = drug_data, aes(x = Education, fill = Education)) +
        geom_bar(show.legend = TRUE) +
        geom_text(stat = "count", aes(label = stat(count)), vjust = -0.5) +
        scale_fill_manual(values = color_palette) +
        labs(x = "", y = "Count", title = "Count of Education") +
        theme(axis.text.x = element_blank())
    } else if (selected_var == "Country") {
      ggplot(data = drug_data, aes(x = Country, fill = Country)) +
        geom_bar(show.legend = TRUE) +
        geom_text(stat = "count", aes(label = stat(count)), vjust = -0.5) +
        scale_fill_manual(values = color_palette) +
        labs(x = "", y = "Count", title = "Count of Country") +
        theme(axis.text.x = element_blank())
    }
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
