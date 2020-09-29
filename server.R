library(shiny)
library(dplyr)
library(data.table)
library(qdap)
library(ngram)
library(tm)
library(RWeka)
library(stringr)
library(stringi)
library(NLP)

#set source file for NLP and next word prediction
source("WordPred_file.R")

shinyServer(
    function(input, output, session) {
        output$inputValue <- renderPrint({input$text})
        output$prediction <- renderPrint({wordpred(input$text)})
    }
)
