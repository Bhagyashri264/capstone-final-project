Data Science Capstone Project - Word Predictor
========================================================
author: TLJones
date: 11/23/2018
autosize: true

project backGround
========================================================
The goal of this was to create a product to highlight the prediction algorithm
that you have built and to provide an interface that can be accessed by others. 

- The primary product is the Shiny app that takes as input, one to more words,
and provides a predicted response for the next word.
- The project was completed using R scripts, Shinyapp.io, and R presentation,
and a over 60 hours worth of researching and testing to find the best approach 
to complete the app.

Note:  the data set was retrieved from: 
https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip

Three datasets:
en_US.blogs.txt
en_US.news.txt
en_US.twitter.txt

developing the project code
========================================================
Retrieved the data, checked the data size, and due to size, took a sample of the data to build a new corpus.  The corpus was then cleansed.  

Next, developed the Ngrams -- unigrams, bigrams, trigrams, and quadgrams -- to develop more efficient data processing for predicting outcomes.  

Develop the Word Prediction algorithms. 

The last step was to build the Shinyapp.io product. 

how to use
========================================================
Step one, enter one or more words in the space provided to receive the next predicted word
Step two, click the "submit" button
Step three, the predicted word is presented to the right

Note:  I researched online to determine the most commonly used english word and found it was the word "the".  I set that as a default value rather than to have and empty value returned.  The app definitely has limitations due primarily to available memory.  

accessing the app
========================================================
![plot of chunk unnamed-chunk-1](DSCapstoneProj-figure/unnamed-chunk-1-1.png)
