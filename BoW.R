library(tm) #load text mining library
file_list = list.files("/Rprog/myTexts") #location of files 
obj_list = lapply("/Rprog/myTexts/random.txt", readLines) #read text lines from files
obj_vec <- as.vector(obj_list) #storing text data as vectors
a <- Corpus(VectorSource(obj_vec), readerControl = list(language="lat")) #converting vector into corpus
a <- tm_map(a, removeNumbers) #remove numbers from text
a <- tm_map(a, removePunctuation) #remove punctuation from text
a <- tm_map(a, stripWhitespace) #remove whitespaces from text
a <- tm_map(a, tolower) #convert all text to lowercase
a <- tm_map(a, removeWords, stopwords("english")) #remove stopwords 
a <- tm_map(a, PlainTextDocument) #settting document type to make convertible to matrix
adtm <-TermDocumentMatrix(a) #making document term matrix (BoW)
adtm <- removeSparseTerms(adtm, 0.75) #removing sparse terms below 75% sparcity
findFreqTerms(adtm, 10) #find words with frequency 10
inspect(adtm)
