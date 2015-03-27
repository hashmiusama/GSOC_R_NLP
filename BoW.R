library(tm) #load text mining library
#library(qdap) #load bag of words library
file_list = list.files("/Rprog/myTexts") #location of files 
obj_list = lapply("/Rprog/myTexts/random.txt", readLines) #read text lines from files
obj_vec <- as.vector(obj_list) #storing text data as vectors
a  <-Corpus(VectorSource(obj_vec), readerControl = list(language="lat")) #converting vector into corpus
#summary(a)  #for testing purpose
a <- tm_map(a, removeNumbers) #remove numbers from text
a <- tm_map(a, removePunctuation) #remove punctuation from text
a <- tm_map(a , stripWhitespace) #remove whitespaces from text
a <- tm_map(a, tolower) #convert all text to lowercase
a <- tm_map(a, removeWords, stopwords("english")) #remove stopwords 
# a <- tm_map(a, stemDocument, language = "english")  #setting document type
# for(i in seq(1:1)){
#  writeLines(a[[i]])  #for testing purpose
# }
a <- tm_map(a, PlainTextDocument) #settting document type to make convertible to matrix
adtm <-DocumentTermMatrix(a) #making document term matrix (BoW)
#inspect(adtm[1,1:500]) #testing words from 1 to 500 less stopwords
adtm <- removeSparseTerms(adtm, 0.5) #removing sparse terms below 50% sparcity
findFreqTerms(adtm, 10) #find words with frequency 10
inspect(adtm)
