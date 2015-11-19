#the below are functions used in the code
#male & female formula for BMR
MaleFormula <- function(w,h,a) (10 * w + 6.25 * h - 5 * a + 5)
FemaleFormula <- function(w,h,a) (10 * w + 6.25 * h - 5 * a - 161)
#these check which units user has choosen & then converts value if needed
WeightChecker <- function(w,c) if (c == "KG") w else w / 2.2046
HeightChecker <- function(w,c) if (c == "CM") w else w / 0.39370

shinyServer(
  function(input, output) {
    output$Weight <- renderText({WeightChecker(input$Weight,input$WeightChoose)})
    output$Height <- renderText({HeightChecker(input$Height,input$HeightChoose)})
    output$BMRValue <- renderText({
      if (input$SexChoose == "M") MaleFormula(WeightChecker(input$Weight,input$WeightChoose),HeightChecker(input$Height,input$HeightChoose),input$Age)
      else FemaleFormula(WeightChecker(input$Weight,input$WeightChoose),HeightChecker(input$Height,input$HeightChoose),input$Age)
    })
  }
)