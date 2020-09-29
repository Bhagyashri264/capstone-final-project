#Ngram file
library(dplyr)
library(data.table)
library(qdap)
library(ngram)
library(tm)
library(RWeka)
library(stringr)
library(stringi)
library(NLP)
library(wordcloud)
library(ggplot2)

#setwd("C:/Users/tljon/datasciencecoursera/FinalProject")

blogs <- readLines("en_US.blogs.txt",skipNul = TRUE, warn = TRUE)
news <- readLines("en_US.news.txt",skipNul = TRUE, warn = TRUE)
twitter <- readLines("en_US.twitter.txt",skipNul = TRUE, warn = TRUE)

#generate sample_set
set.seed(12345)
sample_size = 1500

s_blogs <- blogs[sample(1:length(blogs),sample_size)]
s_news <- news[sample(1:length(news),sample_size)]
s_twitter <- twitter[sample(1:length(twitter),sample_size)]

sample_set<-rbind(s_blogs,s_news,s_twitter)
rm(blogs,news,twitter)

#clean the sample_set, create corpus
corpus<-VCorpus(VectorSource(sample_set))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, PlainTextDocument)
changetospace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
corpus <- tm_map(corpus, changetospace, "/|@|\\|")

#process NGram Tokenizer
ugt <- function(x) NGramTokenizer(x, Weka_control(min = 1, max = 1))
bgt <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
tgt <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))
qgt <- function(x) NGramTokenizer(x, Weka_control(min = 4, max = 4))

#process Term Document Matrix
uniTDM <- TermDocumentMatrix(corpus, control = list(tokenize = ugt))
biTDM <- TermDocumentMatrix(corpus, control = list(tokenize = bgt))
triTDM <- TermDocumentMatrix(corpus, control = list(tokenize = tgt))
quadTDM <- TermDocumentMatrix(corpus, control = list(tokenize = qgt))

#find frequency terms

#unigram frequency
ft1 <- findFreqTerms(uniTDM, lowfreq = 4)
tFreq1 <- rowSums(as.matrix(uniTDM[ft1,]))
tFreq1 <- data.frame(unigram=names(tFreq1), frequency=tFreq1)
tFreq1 <- tFreq1[order(-tFreq1$frequency),]
u_list <- setDT(tFreq1)
save(u_list,file="unigram.Rda")

#bigram frequency
ft2 <- findFreqTerms(biTDM, lowfreq = 3)
tFreq2 <- rowSums(as.matrix(biTDM[ft2,]))
tFreq2 <- data.frame(bigram=names(tFreq2), frequency=tFreq2)
tFreq2 <- tFreq2[order(-tFreq2$frequency),]
b_list <- setDT(tFreq2)
save(b_list,file="bigram.Rda")

#trigram frequency
ft3 <- findFreqTerms(triTDM, lowfreq = 3)
tFreq3 <- rowSums(as.matrix(triTDM[ft3,]))
tFreq3 <- data.frame(trigram=names(tFreq3), frequency=tFreq3)
tFreq3 <- tFreq3[order(-tFreq3$frequency),]
t_list <- setDT(tFreq3)
save(t_list,file="trigram.Rda")

#quadgram frequency
ft4 <- findFreqTerms(quadTDM, lowfreq = 2)
tFreq4 <- rowSums(as.matrix(quadTDM[ft4,]))
tFreq4 <- data.frame(quadgram=names(tFreq4), frequency=tFreq4)
q_list <- setDT(tFreq4)
save(q_list,file="quadgram.Rda")
© 2020 GitHub, Inc.
