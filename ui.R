library(dplyr)
library(plotly)
library(shiny)

#多选数据
data <- read.csv("multiplechoices.csv")
data$选项  <- as.character(data$选项) %>%
  strsplit("[|]")

#单选数据
data2 <- read.csv("singlechoice.csv")
data2$choice <- as.character(data2$choice) %>%
  strsplit("[|]")
data2 <- unique(data2)
names(data2) <- c("题目", "选项", "答案")

#判断题
data3 <- read.csv("judge.csv") %>%
  unique()
ui <- navbarPage(
  headerPanel(h1("复习")),
  
  #多选
  tabPanel(h3("多项选择"),
           sidebarLayout(
             sidebarPanel(
               selectInput("multiple", "选一题", choices = data$题目),
               textInput("yourAnswer", "输入你的答案"),
               submitButton("提交", icon = NULL)
             ),
             mainPanel(verbatimTextOutput("多选"),
                       verbatimTextOutput("多选答案"))
           )),
  
  #单选
  tabPanel(h3("单项选择"),
           sidebarLayout(
             sidebarPanel(
               selectInput("single", "选一题", choices = data2$题目),
               radioButtons("answer1", "选一个答案", choices = c("A", "B", "C", "D", "E", "F")),
               submitButton("提交", icon = NULL)
             ),
             mainPanel(verbatimTextOutput("单选"),
                       verbatimTextOutput("单选答案"))
           )),
  
  #判断
  tabPanel(h3("判断"),
           sidebarLayout(
             sidebarPanel(
               selectInput("judge", "选一题", choices = data3$question),
               radioButtons("answer", "正确或错误", choices = c("正确", "错误")),
               submitButton("提交", icon = NULL)
             ),
             mainPanel(verbatimTextOutput("判断答案"))
           ))
)
