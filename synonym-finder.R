#First step is to install the following packages in RStudio.
install.packages("wordnet")
install.packages("tm")
install.packages("ngram")

#Once they are installed, load them.
library(wordnet)
library(tm)
library(ngram)

#a stores the text user inputs.
a = readline(prompt = "Enter a line : ")

#b store the number of words in a.
b = wordcount(a)

x = y = z = 1

#Perform a while loop.
while(x <= b) {
	if(x == 1) {
		while(y <= length(stopwords("en"))) {
			if(word(a,x) == stopwords("en")[y]) {
				l = list(word(a,x))
			}
			else {
				filter = getTermFilter("ExactMatchFilter", word(a,x), TRUE)
				terms = getIndexTerms("NOUN", 1, filter)
				new_word = getSynonyms(terms[[1]])[1]
				l = list(new_word)
			}
		}		
	}
	else {
		while(z <= length(stopwords("en"))) {
			if(word(a,x) == stopwords("en")[z]) {
				l = list(word(a,x))
			}
			else {
				filter = getTermFilter("ExactMatchFilter", word(a,x), TRUE)
				terms = getIndexTerms("NOUN", 1, filter)
				new_word = getSynonyms(terms[[1]])[1]
				l[x] = new_word
			}
		}	
	}
	x = x + 1
}
last = unlist(l)
toString(last)