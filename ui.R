## ui.R
library(shiny)
library(shinydashboard)
library(proxy)
library(recommenderlab)
library(reshape2)
library(plyr)
library(dplyr)
library(DT)
library(RCurl)


d <- file.path("C:","Users", "ellen", "shinytest1")
movies <- read.csv("movies0929.csv", header = TRUE, stringsAsFactors=FALSE)
ratings <- read.csv("ratings0929.csv", header = TRUE)


ui <- shinyUI(dashboardPage(skin="blue",
                            dashboardHeader(title = "電影推薦"),
                            dashboardSidebar(
                              sidebarMenu( 
                                menuItem(
                                  list( 
                                    selectInput("select", label = h5("選擇3部你喜歡的電影"),
                                                choices = as.character(movies$title[1:length(unique(movies$movieId))]),
                                                selectize = TRUE,
                                                selected = "Jumanji (1995)"),
                                    selectInput("select2", label = NA,
                                                choices = as.character(movies$title[1:length(unique(movies$movieId))]),
                                                selectize = TRUE,
                                                selected = "Toy Story (1995)"),
                                    selectInput("select3", label = NA,
                                                choices = as.character(movies$title[1:length(unique(movies$movieId))]),
                                                selectize = TRUE,
                                                selected = "Heat (1995)"),
                                    submitButton("完成")
                                  )
                                )
                              )
                            ),
                            
                            
                            dashboardBody(
                              # tags$head(
                              #   tags$style(type="text/css", "select { max-width: 360px; }"),
                              #   tags$style(type="text/css", ".span4 { max-width: 360px; }"),
                              #   tags$style(type="text/css",  ".well { max-width: 360px; }")
                              # ),

                             
                                        fluidRow(
                                          box(
                                            width = 5, 
                                            status = "info", 
                                            #solidHead = FALSE,
                                            title = "你可能也會喜歡這些電影!",
                                            tableOutput("table")),
                                          valueBoxOutput("tableRatings1"),
                                          valueBoxOutput("tableRatings2"),
                                          valueBoxOutput("tableRatings3")
                                          #HTML('<br/>')
                                          #box(DT::dataTableOutput("myTable"), title = "Table of All Movies", width=12, collapsible = TRUE)
                                        )
                               
                            )
                            
)
)   
