library(shiny)
library(randomForest)
library(dplyr)
library(ggplot2)
library(plotly)
library(readr)


# ============================================================
# PROJECT PATH
# ============================================================

project_path <- "C:/Users/dheep/OneDrive/Desktop/Airline_Flight_Delay_Analytics"


# ============================================================
# LOAD MODEL AND DATA
# ============================================================

rf_model <- readRDS(
  file.path(
    project_path,
    "models",
    "airline_delay_rf_model.rds"
  )
)

airline_delay <- read_csv(
  file.path(
    project_path,
    "data",
    "processed",
    "airline_delay.csv"
  ),
  show_col_types = FALSE
)

monthly_delay <- read_csv(
  file.path(
    project_path,
    "data",
    "processed",
    "monthly_delay.csv"
  ),
  show_col_types = FALSE
)

day_delay <- read_csv(
  file.path(
    project_path,
    "data",
    "processed",
    "day_delay.csv"
  ),
  show_col_types = FALSE
)

hourly_delay <- read_csv(
  file.path(
    project_path,
    "data",
    "processed",
    "hourly_delay.csv"
  ),
  show_col_types = FALSE
)

distance_delay <- read_csv(
  file.path(
    project_path,
    "data",
    "processed",
    "distance_delay.csv"
  ),
  show_col_types = FALSE
)


# ============================================================
# USER INTERFACE
# ============================================================

ui <- fluidPage(
  
  tags$head(
    tags$link(
      rel = "stylesheet",
      type = "text/css",
      href = "style.css"
    )
  ),
  
  
  # ==========================================================
  # TITLE
  # ==========================================================
  
  div(
    class = "dashboard-header",
    
    div(
      class = "logo-mark",
      span("✈")
    ),
    
    div(
      class = "logo-text",
      h1("Airline Flight Delay Analytics"),
      p("Prediction & Interactive Data Analytics")
    )
  ),
  
  div(
    class = "project-subtitle",
    "Historical Flight Data • R Analytics • Random Forest Prediction • Interactive Dashboard"
  ),
  
  
  # ==========================================================
  # FLIGHT PREDICTION PANEL
  # ==========================================================
  
  div(
    class = "prediction-panel",
    
    h3("✈ Flight Prediction"),
    
    p(
      class = "prediction-description",
      "Enter the flight details below to estimate the probability of a departure delay."
    ),
    
    
    # --------------------------------------------------------
    # INPUT ROW 1
    # --------------------------------------------------------
    
    fluidRow(
      
      column(
        3,
        
        numericInput(
          "month",
          "Month:",
          value = 6,
          min = 1,
          max = 12
        )
      ),
      
      column(
        3,
        
        numericInput(
          "day",
          "Day:",
          value = 15,
          min = 1,
          max = 31
        )
      ),
      
      column(
        3,
        
        numericInput(
          "day_of_week",
          "Day of Week:",
          value = 1,
          min = 1,
          max = 7
        )
      ),
      
      column(
        3,
        
        selectInput(
          "airline",
          "Airline:",
          
          choices = c(
            "AA",
            "AS",
            "B6",
            "DL",
            "EV",
            "F9",
            "HA",
            "MQ",
            "NK",
            "OO",
            "UA",
            "US",
            "VX",
            "WN"
          ),
          
          selected = "AA"
        )
      )
    ),
    
    
    # --------------------------------------------------------
    # INPUT ROW 2
    # --------------------------------------------------------
    
    fluidRow(
      
      column(
        3,
        
        numericInput(
          "departure_hour",
          "Departure Hour:",
          value = 8,
          min = 0,
          max = 23
        )
      ),
      
      column(
        3,
        
        numericInput(
          "distance",
          "Distance (miles):",
          value = 1000,
          min = 1
        )
      ),
      
      column(
        3,
        
        numericInput(
          "origin_delay_rate",
          "Origin Airport Delay Rate:",
          value = 0.18,
          min = 0,
          max = 1,
          step = 0.01
        )
      ),
      
      column(
        3,
        
        numericInput(
          "destination_delay_rate",
          "Destination Airport Delay Rate:",
          value = 0.20,
          min = 0,
          max = 1,
          step = 0.01
        )
      )
    ),
    
    
    # --------------------------------------------------------
    # PREDICT BUTTON
    # --------------------------------------------------------
    
    actionButton(
      "predict",
      "Predict Flight Delay",
      class = "btn-primary"
    ),
    
    
    # --------------------------------------------------------
    # MODEL INFORMATION
    # --------------------------------------------------------
    
    div(
      class = "model-info",
      
      h4("Model Information"),
      
      p("Algorithm: Random Forest"),
      
      p("Classification Threshold: 0.30"),
      
      p("ROC-AUC: 0.6693")
    )
  ),
  
  
  # ==========================================================
  # KPI CARDS
  # ==========================================================
  
  fluidRow(
    
    column(
      3,
      
      div(
        class = "kpi-card",
        
        h4("Total Flights"),
        
        h2("5,729,195")
      )
    ),
    
    column(
      3,
      
      div(
        class = "kpi-card",
        
        h4("Delayed Flights"),
        
        h2("1,016,536")
      )
    ),
    
    column(
      3,
      
      div(
        class = "kpi-card",
        
        h4("Delay Rate"),
        
        h2("17.75%")
      )
    ),
    
    column(
      3,
      
      div(
        class = "kpi-card",
        
        h4("Model ROC-AUC"),
        
        h2("0.6693")
      )
    )
  ),
  
  
  # ==========================================================
  # ANALYTICS PIPELINE
  # ==========================================================
  
  div(
    class = "pipeline-card",
    
    h3("Analytics Pipeline"),
    
    div(
      class = "pipeline-step",
      "Cloud Data Storage"
    ),
    
    div(
      class = "pipeline-arrow",
      "↓"
    ),
    
    div(
      class = "pipeline-step",
      "Data Preprocessing"
    ),
    
    div(
      class = "pipeline-arrow",
      "↓"
    ),
    
    div(
      class = "pipeline-step",
      "R Data Analytics"
    ),
    
    div(
      class = "pipeline-arrow",
      "↓"
    ),
    
    div(
      class = "pipeline-step",
      "Random Forest Prediction"
    ),
    
    div(
      class = "pipeline-arrow",
      "↓"
    ),
    
    div(
      class = "pipeline-step",
      "Interactive Dashboard"
    )
  ),
  
  
  # ==========================================================
  # PREDICTION RESULT + PROBABILITY
  # ==========================================================
  
  fluidRow(
    
    column(
      5,
      
      h2("Prediction Result"),
      
      div(
        class = "prediction-card",
        
        verbatimTextOutput(
          "prediction"
        )
      )
    ),
    
    column(
      7,
      
      h2("Delay Probability"),
      
      plotlyOutput(
        "probability_plot",
        height = "350px"
      )
    )
  ),
  
  
  # ==========================================================
  # MONTHLY + AIRLINE
  # ==========================================================
  
  fluidRow(
    
    column(
      6,
      
      h2("Monthly Delay Analysis"),
      
      plotlyOutput(
        "monthly_plot",
        height = "400px"
      )
    ),
    
    column(
      6,
      
      h2("Airline Delay Analysis"),
      
      plotlyOutput(
        "airline_plot",
        height = "400px"
      )
    )
  ),
  
  
  # ==========================================================
  # HOURLY + DISTANCE
  # ==========================================================
  
  fluidRow(
    
    column(
      6,
      
      h2("Hourly Delay Analysis"),
      
      plotlyOutput(
        "hourly_plot",
        height = "400px"
      )
    ),
    
    column(
      6,
      
      h2("Distance-Based Delay Analysis"),
      
      plotlyOutput(
        "distance_plot",
        height = "400px"
      )
    )
  ),
  
  
  # ==========================================================
  # DAY OF WEEK
  # ==========================================================
  
  h2(
    "Day-of-Week Delay Analysis"
  ),
  
  plotlyOutput(
    "day_plot",
    height = "400px"
  )
)


# ============================================================
# SERVER
# ============================================================

server <- function(input, output, session) {
  
  
  # ==========================================================
  # FLIGHT DELAY PREDICTION
  # ==========================================================
  
  prediction_result <- eventReactive(
    input$predict,
    
    {
      
      new_flight <- data.frame(
        
        MONTH = input$month,
        
        DAY = input$day,
        
        DAY_OF_WEEK = input$day_of_week,
        
        AIRLINE = factor(
          input$airline,
          levels = rf_model$forest$xlevels$AIRLINE
        ),
        
        Departure_Hour = input$departure_hour,
        
        DISTANCE = input$distance,
        
        Origin_Delay_Rate =
          input$origin_delay_rate,
        
        Destination_Delay_Rate =
          input$destination_delay_rate
      )
      
      
      # ------------------------------------------------------
      # PREDICT DELAY PROBABILITY
      # ------------------------------------------------------
      
      probability <- predict(
        rf_model,
        newdata = new_flight,
        type = "prob"
      )[, "1"]
      
      
      # ------------------------------------------------------
      # APPLY PROJECT THRESHOLD
      # ------------------------------------------------------
      
      prediction <- ifelse(
        probability >= 0.30,
        "Delayed",
        "Not Delayed"
      )
      
      
      list(
        
        prediction = prediction,
        
        probability = probability
      )
    }
  )
  
  
  # ==========================================================
  # DISPLAY PREDICTION
  # ==========================================================
  
  output$prediction <- renderText({
    
    req(
      prediction_result()
    )
    
    result <- prediction_result()
    
    paste0(
      
      "Prediction: ",
      
      result$prediction,
      
      "\n\n",
      
      "Delay Probability: ",
      
      round(
        result$probability * 100,
        2
      ),
      
      "%"
    )
  })
  
  
  # ==========================================================
  # DELAY PROBABILITY PIE CHART
  # ==========================================================
  
  output$probability_plot <- renderPlotly({
    
    req(
      prediction_result()
    )
    
    result <- prediction_result()
    
    
    probability_data <- data.frame(
      
      Status = c(
        "Delay Probability",
        "Remaining Probability"
      ),
      
      Probability = c(
        result$probability,
        1 - result$probability
      )
    )
    
    
    plot_ly(
      
      probability_data,
      
      labels = ~Status,
      
      values = ~Probability,
      
      type = "pie",
      
      textinfo = "label+percent"
      
    ) %>%
      
      layout(
        
        title = "Predicted Delay Probability"
      )
  })
  
  
  # ==========================================================
  # MONTHLY DELAY CHART
  # ==========================================================
  
  output$monthly_plot <- renderPlotly({
    
    plot_ly(
      
      monthly_delay,
      
      x = ~MONTH,
      
      y = ~Delay_Percentage,
      
      type = "scatter",
      
      mode = "lines+markers"
      
    ) %>%
      
      layout(
        
        title = "Monthly Flight Delay Percentage",
        
        xaxis = list(
          title = "Month"
        ),
        
        yaxis = list(
          title = "Delay Percentage (%)"
        )
      )
  })
  
  
  # ==========================================================
  # AIRLINE DELAY CHART
  # ==========================================================
  
  output$airline_plot <- renderPlotly({
    
    plot_ly(
      
      airline_delay,
      
      x = ~AIRLINE,
      
      y = ~Delay_Percentage,
      
      type = "bar"
      
    ) %>%
      
      layout(
        
        title = "Airline Delay Percentage",
        
        xaxis = list(
          title = "Airline"
        ),
        
        yaxis = list(
          title = "Delay Percentage (%)"
        )
      )
  })
  
  
  # ==========================================================
  # HOURLY DELAY CHART
  # ==========================================================
  
  output$hourly_plot <- renderPlotly({
    
    plot_ly(
      
      hourly_delay,
      
      x = ~Departure_Hour,
      
      y = ~Delay_Percentage,
      
      type = "scatter",
      
      mode = "lines+markers"
      
    ) %>%
      
      layout(
        
        title = "Delay Percentage by Departure Hour",
        
        xaxis = list(
          title = "Departure Hour"
        ),
        
        yaxis = list(
          title = "Delay Percentage (%)"
        )
      )
  })
  
  
  # ==========================================================
  # DISTANCE DELAY CHART
  # ==========================================================
  
  output$distance_plot <- renderPlotly({
    
    plot_ly(
      
      distance_delay,
      
      x = ~Distance_Group,
      
      y = ~Delay_Percentage,
      
      type = "bar"
      
    ) %>%
      
      layout(
        
        title = "Delay Percentage by Flight Distance",
        
        xaxis = list(
          title = "Distance Group"
        ),
        
        yaxis = list(
          title = "Delay Percentage (%)"
        )
      )
  })
  
  
  # ==========================================================
  # DAY OF WEEK DELAY CHART
  # ==========================================================
  
  output$day_plot <- renderPlotly({
    
    plot_ly(
      
      day_delay,
      
      x = ~DAY_OF_WEEK,
      
      y = ~Delay_Percentage,
      
      type = "bar"
      
    ) %>%
      
      layout(
        
        title = "Delay Percentage by Day of Week",
        
        xaxis = list(
          title = "Day of Week"
        ),
        
        yaxis = list(
          title = "Delay Percentage (%)"
        )
      )
  })
  
}


# ============================================================
# RUN SHINY APPLICATION
# ============================================================

shinyApp(
  ui = ui,
  server = server
)