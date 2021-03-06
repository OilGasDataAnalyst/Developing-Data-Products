#preventing shiny from running calcs all the time
shinyUI(pageWithSidebar(
  headerPanel("Calculate your BMR (Basal Metabolic Rate)"),
  fluidRow(
    column(3, wellPanel(
      numericInput(inputId="Weight", label = "Please enter your weight and 
                   select the units:", value = 100, min = 0, max = 1000),
      radioButtons("WeightChoose", "Kg or Pounds?",
                 choices = c("Kg" = "KG",
                             "Pounds" = "LBS"))
    )),
    
    column(3, wellPanel(
      numericInput(inputId="Height", label = "Please enter your height and 
                   select the units:",value = 72, min = 0, max = 500),
      radioButtons("HeightChoose", "Inches or CM?",
                 choices = c("Inches" = "INCH",
                             "CM" = "CM")),
      numericInput(inputId="Age", label = "Enter your age in years:",value = 25, min = 1, max = 130)
    )),
    
    column(3, wellPanel(
      radioButtons("SexChoose", "Male or Female?",
                 choices = c("Male" = "M",
                             "Female" = "F"))
    ))
  ),
  mainPanel(
    p('Weight entered in Kg:'),
    textOutput('Weight'),
    p('Height entered in CM:'),
    textOutput('Height'),
    p('Your BMR value is:'),
    textOutput('BMRValue')
  )
))