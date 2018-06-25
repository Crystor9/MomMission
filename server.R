library(dplyr)
library(plotly)
library(shiny)
library(rsconnect)

# server
server <- function(input, output) {
  # 多选
  output$多选  <- renderPrint({
    selected_choice <- data %>%
      filter(题目  == input$multiple) %>%
      select(选项) %>%
      unlist()
    selected_choice
  })
  output$多选答案  <- renderPrint({
    selected_answer <- data %>%
      filter(题目  == input$multiple) %>%
      select(答案)
    if (input$yourAnswer == selected_answer) {
      print("你对啦")
    } else {
      print(paste0("你错了，正确答案是", selected_answer$答案))
    }
  })
  
  # 单选
  output$单选  <- renderPrint({
    selected_choice <- data2 %>%
      filter(题目  == input$single) %>%
      select(选项) %>%
      unlist()
    selected_choice
  })
  output$单选答案  <- renderPrint({
    selected_answer_single <- data2 %>%
      filter(题目  == input$single) %>%
      select(答案) 
    if (input$answer1 == selected_answer_single) {
      print("你对啦")
    } else {
      print(paste0("你错了，正确答案是", selected_answer_single$答案))
    }
  })
  
  #判断
  output$判断答案  <- renderPrint({
    selected_answer <- data3 %>%
      filter(question == input$judge) %>%
      select(answer)
    if (input$answer == selected_answer) {
      print("你对啦")
    } else {
      print("你错了")
    }
  })
}
